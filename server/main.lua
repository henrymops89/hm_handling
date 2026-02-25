-- ══════════════════════════════════════════════════════════════════
--  HM Handling — Server Main
--  MopsScripts | QBox
-- ══════════════════════════════════════════════════════════════════

local function Log(msg)
    if Config.Debug then print(('[HM-Handling] [SV] %s'):format(msg)) end
end

-- ── Helpers ───────────────────────────────────────────────────────
local function HasPermission(src)
    return IsPlayerAceAllowed(tostring(src), 'admin')
        or IsPlayerAceAllowed(tostring(src), 'command')
end

local function Respond(src, type, msg)
    TriggerClientEvent('hm-handling:client:Notify', src, type, msg)
end

-- ── Editor öffnen ─────────────────────────────────────────────────
RegisterNetEvent('hm-handling:server:RequestOpen', function(vehicle)
    local src = source
    if not HasPermission(src) then
        TriggerClientEvent('hm-handling:client:PermissionDenied', src)
        Log(('Player %d — keine Berechtigung'):format(src))
        return
    end

    if type(vehicle) ~= 'string' or #vehicle < 1 then return end

    DB_GetProfiles(vehicle, function(profiles)
        TriggerClientEvent('hm-handling:client:OpenMenu', src, {
            profiles = profiles,
            config   = {
                language  = Config.Language,
                labelMode = Config.LabelMode,
            },
        })
        Log(('Player %d öffnet Editor für %s — %d Profile geladen'):format(src, vehicle, #profiles))
    end)
end)

-- ── Profil speichern ──────────────────────────────────────────────
RegisterNetEvent('hm-handling:server:SaveProfile', function(profileName, vehicle, handlingData)
    local src = source
    if not HasPermission(src) then return end

    -- Input-Validierung
    if type(profileName) ~= 'string' or #profileName < 1 or #profileName > 64 then
        Respond(src, 'error', 'Ungültiger Profilname (1–64 Zeichen)')
        return
    end
    if type(vehicle) ~= 'string' or #vehicle < 1 then
        Respond(src, 'error', 'Ungültiges Fahrzeug')
        return
    end
    if type(handlingData) ~= 'table' then
        Respond(src, 'error', 'Ungültige Handling-Daten')
        return
    end

    -- Nur erlaubte Keys durchlassen (Security)
    local ALLOWED_KEYS = {
        fMass = 1, fInitialDragCoeff = 1, fDownforceModifier = 1, fDriveBiasFront = 1,
        nInitialDriveGears = 1, fInitialDriveForce = 1, fDriveInertia = 1, fInitialDriveMaxFlatVel = 1,
        fClutchChangeRateScaleUpShift = 1, fClutchChangeRateScaleDownShift = 1,
        fLowSpeedTractionLossMult = 1, fTractionCurveLateral = 1, fTractionSpringDeltaMax = 1,
        fTractionBiasFront = 1, fSuspensionForce = 1, fSuspensionCompDamp = 1,
        fSuspensionReboundDamp = 1, fSuspensionUpperLimit = 1, fSuspensionLowerLimit = 1,
        fSuspensionRaise = 1, fSuspensionBiasFront = 1, fAntiRollBarForce = 1,
        fAntiRollBarBiasFront = 1, fRollCentreHeightFront = 1, fRollCentreHeightRear = 1,
        fTractionCurveMax = 1, fTractionCurveMin = 1, fTractionLossMult = 1,
        fSteeringLock = 1, fCamberStiffnesss = 1, fBrakeForce = 1, fBrakeBiasFront = 1,
        fHandBrakeForce = 1, fCollisionDamageMult = 1, fWeaponDamageMult = 1,
        fDeformationDamageMult = 1, fEngineDamageMult = 1, fPetrolTankVolume = 1,
        fOilVolume = 1, fSeatOffsetDistX = 1, fSeatOffsetDistY = 1, fSeatOffsetDistZ = 1,
        nMonetaryValue = 1, fPopUpLightRotation = 1, fPercentSubmerged = 1,
    }
    local sanitized = {}
    for k, v in pairs(handlingData) do
        if ALLOWED_KEYS[k] and (type(v) == 'number') then
            sanitized[k] = v
        end
    end

    DB_SaveProfile(vehicle, profileName, sanitized, function(success, reason)
        if success then
            local msg = reason == 'updated' and 'Profil aktualisiert' or 'Profil gespeichert'
            Respond(src, 'success', msg)
            DB_GetProfiles(vehicle, function(profiles)
                TriggerClientEvent('hm-handling:client:UpdateProfiles', src, profiles)
            end)
        elseif reason == 'limit' then
            Respond(src, 'error', ('Limit erreicht: max. %d Profile'):format(Config.MaxProfiles))
        else
            Respond(src, 'error', 'Fehler beim Speichern')
        end
    end)
end)

-- ── Profil löschen ────────────────────────────────────────────────
RegisterNetEvent('hm-handling:server:DeleteProfile', function(profileId, vehicle)
    local src = source
    if not HasPermission(src) then return end
    if type(profileId) ~= 'number' then return end
    if type(vehicle) ~= 'string' or #vehicle < 1 then return end

    DB_DeleteProfile(vehicle, profileId, function(success)
        if success then
            Respond(src, 'success', 'Profil gelöscht')
            DB_GetProfiles(vehicle, function(profiles)
                TriggerClientEvent('hm-handling:client:UpdateProfiles', src, profiles)
            end)
        else
            Respond(src, 'error', 'Profil nicht gefunden')
        end
    end)
end)

Log('Server gestartet')
