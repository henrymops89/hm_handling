-- ══════════════════════════════════════════════════════════════════
--  HM Handling — Client Main
--  MopsScripts | QBox
-- ══════════════════════════════════════════════════════════════════

local isOpen     = false
local curVehicle = 0

local function Log(msg)
    if Config.Debug then print(('[HM-Handling] [CL] %s'):format(msg)) end
end

-- ── Notify ────────────────────────────────────────────────────────
local function Notify(ntype, msg)
    if Config.NotifySystem == 'ox_lib' then
        lib.notify({ title = 'HM Handling', description = msg, type = ntype })
    else
        exports['qb-core']:ShowNotify(msg, ntype)
    end
end

-- ── Handling Keys ─────────────────────────────────────────────────
local FLOAT_KEYS = {
    'fMass', 'fInitialDragCoeff', 'fDownforceModifier', 'fDriveBiasFront',
    'fInitialDriveForce', 'fDriveInertia', 'fInitialDriveMaxFlatVel',
    'fClutchChangeRateScaleUpShift', 'fClutchChangeRateScaleDownShift',
    'fLowSpeedTractionLossMult', 'fTractionCurveLateral', 'fTractionSpringDeltaMax',
    'fTractionBiasFront', 'fSuspensionForce', 'fSuspensionCompDamp',
    'fSuspensionReboundDamp', 'fSuspensionUpperLimit', 'fSuspensionLowerLimit',
    'fSuspensionRaise', 'fSuspensionBiasFront', 'fAntiRollBarForce',
    'fAntiRollBarBiasFront', 'fRollCentreHeightFront', 'fRollCentreHeightRear',
    'fTractionCurveMax', 'fTractionCurveMin', 'fTractionLossMult',
    'fSteeringLock', 'fCamberStiffnesss', 'fBrakeForce', 'fBrakeBiasFront',
    'fHandBrakeForce', 'fCollisionDamageMult', 'fWeaponDamageMult',
    'fDeformationDamageMult', 'fEngineDamageMult', 'fPetrolTankVolume',
    'fOilVolume', 'fSeatOffsetDistX', 'fSeatOffsetDistY', 'fSeatOffsetDistZ',
    'fPopUpLightRotation', 'fPercentSubmerged',
}
local INT_KEYS = { 'nInitialDriveGears', 'nMonetaryValue' }

local function ReadHandling(veh)
    local data = {}
    for _, k in ipairs(FLOAT_KEYS) do
        data[k] = GetVehicleHandlingFloat(veh, 'CHandlingData', k)
    end
    for _, k in ipairs(INT_KEYS) do
        data[k] = GetVehicleHandlingInt(veh, 'CHandlingData', k)
    end
    return data
end

local function ApplyHandling(veh, data)
    for _, k in ipairs(FLOAT_KEYS) do
        if data[k] ~= nil then
            SetVehicleHandlingFloat(veh, 'CHandlingData', k, data[k] + 0.0)
        end
    end
    for _, k in ipairs(INT_KEYS) do
        if data[k] ~= nil then
            SetVehicleHandlingInt(veh, 'CHandlingData', k, math.floor(data[k]))
        end
    end
end

local function GetVehicleName(veh)
    local model = GetEntityModel(veh)
    local name  = GetDisplayNameFromVehicleModel(model)
    return (name ~= 'CARNOTFOUND' and name ~= '') and name or 'Unbekannt'
end

-- ── Editor öffnen ─────────────────────────────────────────────────
local function TryOpen()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)

    if veh == 0 then
        Notify('error', 'Du musst in einem Fahrzeug sitzen')
        return
    end
    if GetPedInVehicleSeat(veh, -1) ~= ped then
        Notify('error', 'Du musst der Fahrer sein')
        return
    end

    curVehicle = veh
    TriggerServerEvent('hm-handling:server:RequestOpen', GetVehicleName(veh))
end

-- ── Command & Keybind ─────────────────────────────────────────────
RegisterCommand(Config.Command, function()
    if isOpen then
        SendNUIMessage({ action = 'closeMenu' })
        SetNuiFocus(false, false)
        isOpen = false
    else
        TryOpen()
    end
end, false)

if Config.Keybind then
    RegisterKeyMapping(Config.Command, 'HM Handling Editor', 'keyboard', Config.Keybind)
end

-- ── Server → Client ───────────────────────────────────────────────
RegisterNetEvent('hm-handling:client:OpenMenu', function(payload)
    if isOpen then return end
    if not DoesEntityExist(curVehicle) then
        Notify('error', 'Fahrzeug nicht mehr verfügbar')
        return
    end

    isOpen = true
    SetNuiFocus(true, true)

    SendNUIMessage({
        action      = 'openMenu',
        vehicleName = GetVehicleName(curVehicle),
        handling    = ReadHandling(curVehicle),
        profiles    = payload.profiles,
        config      = payload.config,
    })
    Log(('Editor geöffnet: %s'):format(GetVehicleName(curVehicle)))
end)

RegisterNetEvent('hm-handling:client:PermissionDenied', function()
    Notify('error', 'Keine Berechtigung für den Handling Editor')
end)

RegisterNetEvent('hm-handling:client:Notify', function(ntype, msg)
    Notify(ntype, msg)
end)

RegisterNetEvent('hm-handling:client:UpdateProfiles', function(profiles)
    SendNUIMessage({ action = 'updateProfiles', profiles = profiles })
end)

-- ── NUI Callbacks ─────────────────────────────────────────────────

-- Menü schließen
RegisterNUICallback('closeMenu', function(_, cb)
    isOpen     = false
    curVehicle = 0
    SetNuiFocus(false, false)
    cb('ok')
end)

-- Live-Vorschau: einzelnen Wert sofort setzen
RegisterNUICallback('liveUpdate', function(data, cb)
    if not DoesEntityExist(curVehicle) then cb('no_vehicle') return end
    local key = data.key
    local val = tonumber(data.value)
    if not key or not val then cb('invalid') return end

    -- Float oder Int?
    local isInt = (key == 'nInitialDriveGears' or key == 'nMonetaryValue')
    if isInt then
        SetVehicleHandlingInt(curVehicle, 'CHandlingData', key, math.floor(val))
    else
        SetVehicleHandlingFloat(curVehicle, 'CHandlingData', key, val + 0.0)
    end
    cb('ok')
end)

-- Alle Werte auf einmal anwenden
RegisterNUICallback('applyAll', function(data, cb)
    if not DoesEntityExist(curVehicle) then cb('no_vehicle') return end
    ApplyHandling(curVehicle, data.handling)
    TriggerServerEvent('hm-handling:server:ApplyHandling', NetworkGetNetworkIdFromEntity(curVehicle), data.handling)
    cb('ok')
end)

-- Profil speichern
RegisterNUICallback('saveProfile', function(data, cb)
    if not DoesEntityExist(curVehicle) then cb('no_vehicle') return end
    TriggerServerEvent(
        'hm-handling:server:SaveProfile',
        data.name,
        GetVehicleName(curVehicle),
        data.handling
    )
    cb('ok')
end)

-- Profil löschen
RegisterNUICallback('deleteProfile', function(data, cb)
    if not DoesEntityExist(curVehicle) then cb('no_vehicle') return end
    TriggerServerEvent('hm-handling:server:DeleteProfile', tonumber(data.id), GetVehicleName(curVehicle))
    cb('ok')
end)

-- Profil laden → Handling anwenden + zurück an NUI melden
RegisterNUICallback('loadProfile', function(data, cb)
    if not DoesEntityExist(curVehicle) then cb('no_vehicle') return end
    ApplyHandling(curVehicle, data.handling)
    cb('ok')
end)

-- ESC-Thread
CreateThread(function()
    while true do
        Wait(isOpen and 0 or 500)
        if isOpen and IsControlJustPressed(0, 177) then
            SendNUIMessage({ action = 'closeMenu' })
            SetNuiFocus(false, false)
            isOpen = false
        end
    end
end)

Log('Client gestartet')
