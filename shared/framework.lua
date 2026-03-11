-- ══════════════════════════════════════════════════════════════════
--  HM Handling — Framework Bridge
--  MopsScripts
-- ══════════════════════════════════════════════════════════════════

Framework = {}
local FWSettings = {
    Type = 'standalone',
    Object = nil
}

-- ── Initialisierung ───────────────────────────────────────────────
local function Init()
    if GetResourceState('es_extended') == 'started' then
        FWSettings.Type = 'esx'
        FWSettings.Object = exports['es_extended']:getSharedObject()
    elseif GetResourceState('qbx_core') == 'started' then
        FWSettings.Type = 'qbcore'
        FWSettings.Object = exports['qbx_core']
    elseif GetResourceState('qb-core') == 'started' then
        FWSettings.Type = 'qbcore'
        FWSettings.Object = exports['qb-core']:GetCoreObject()
    end

    if IsDuplicityVersion() then
        print(('[^2HM-Handling^0] Framework detected: ^3%s^0'):format(FWSettings.Type))
    end
end
Init()

-- ── Getters ───────────────────────────────────────────────────────
function Framework.GetType()
    return FWSettings.Type
end

function Framework.GetObject()
    return FWSettings.Object
end

-- ── Job Check ──────────────────────────────────────────────────────
function Framework.GetPlayerJob(source)
    if FWSettings.Type == 'esx' then
        local xPlayer = FWSettings.Object.GetPlayerFromId(source)
        if xPlayer then
            return { name = xPlayer.job.name, grade = xPlayer.job.grade }
        end
    elseif FWSettings.Type == 'qbcore' then
        local Player = FWSettings.Object.Functions.GetPlayer(source)
        if Player then
            return { name = Player.PlayerData.job.name, grade = Player.PlayerData.job.grade.level }
        end
    end
    return { name = 'unemployed', grade = 0 }
end

-- ── Permission Check ──────────────────────────────────────────────
function Framework.HasPermission(source)
    -- ACE Check (immer moeglich)
    if IsPlayerAceAllowed(tostring(source), Config.AcePermission) then
        return true
    end

    -- Job Check
    if Config.PermissionMode == 'job' or Config.PermissionMode == 'both' then
        local job = Framework.GetPlayerJob(source)
        if Config.AllowedJobs[job.name] then
            if job.grade >= Config.AllowedJobs[job.name] then
                return true
            end
        end
    end

    -- Fallback für Admins (Framework spezifisch)
    if FWSettings.Type == 'esx' then
        local xPlayer = FWSettings.Object.GetPlayerFromId(source)
        if xPlayer and (xPlayer.getGroup() == 'admin' or xPlayer.getGroup() == 'superadmin') then
            return true
        end
    elseif FWSettings.Type == 'qbcore' then
        if FWSettings.Object.Functions.HasPermission(source, 'admin') or FWSettings.Object.Functions.HasPermission(source, 'god') then
            return true
        end
    end

    return false
end
