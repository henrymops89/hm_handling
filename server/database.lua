-- ══════════════════════════════════════════════════════════════════
--  HM Handling — Database Layer
--  MopsScripts | oxmysql
-- ══════════════════════════════════════════════════════════════════

--[[
  SQL — einmalig ausführen:

  CREATE TABLE IF NOT EXISTS `hm_handling_profiles` (
      `id`          INT          NOT NULL AUTO_INCREMENT,
      `vehicle`     VARCHAR(64)  NOT NULL,
      `name`        VARCHAR(64)  NOT NULL,
      `data`        LONGTEXT     NOT NULL,
      `created_at`  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
      PRIMARY KEY (`id`),
      KEY `idx_vehicle` (`vehicle`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
--]]

-- ── Profile laden (pro Fahrzeugmodell) ──────────────────────────
function DB_GetProfiles(vehicle, cb)
    MySQL.query(
        'SELECT id, name, vehicle, data, created_at FROM hm_handling_profiles WHERE vehicle = ? ORDER BY created_at DESC',
        { vehicle },
        function(rows)
            local profiles = {}
            for _, row in ipairs(rows or {}) do
                local ok, decoded = pcall(json.decode, row.data)
                if ok and decoded then
                    table.insert(profiles, {
                        id      = row.id,
                        name    = row.name,
                        vehicle = row.vehicle,
                        data    = decoded,
                        date    = tostring(row.created_at),
                    })
                end
            end
            cb(profiles)
        end
    )
end

-- ── Profil speichern / überschreiben (pro Fahrzeugmodell) ───────
function DB_SaveProfile(vehicle, name, data, cb)
    -- Limit prüfen (pro Fahrzeugmodell)
    MySQL.scalar(
        'SELECT COUNT(*) FROM hm_handling_profiles WHERE vehicle = ?',
        { vehicle },
        function(count)
            if (count or 0) >= Config.MaxProfiles then
                cb(false, 'limit')
                return
            end

            -- Gleicher Name + gleiches Fahrzeug → Update statt Insert
            MySQL.query(
                'SELECT id FROM hm_handling_profiles WHERE vehicle = ? AND name = ? LIMIT 1',
                { vehicle, name },
                function(existing)
                    if existing and #existing > 0 then
                        MySQL.update(
                            'UPDATE hm_handling_profiles SET data = ? WHERE id = ?',
                            { json.encode(data), existing[1].id },
                            function(affected)
                                cb(affected > 0, 'updated')
                            end
                        )
                    else
                        MySQL.insert(
                            'INSERT INTO hm_handling_profiles (vehicle, name, data) VALUES (?, ?, ?)',
                            { vehicle, name, json.encode(data) },
                            function(id)
                                cb(id ~= nil, 'created')
                            end
                        )
                    end
                end
            )
        end
    )
end

-- ── Profil löschen (pro Fahrzeugmodell) ─────────────────────────
function DB_DeleteProfile(vehicle, profileId, cb)
    MySQL.update(
        'DELETE FROM hm_handling_profiles WHERE id = ? AND vehicle = ?',
        { profileId, vehicle },
        function(affected)
            cb(affected > 0)
        end
    )
end
