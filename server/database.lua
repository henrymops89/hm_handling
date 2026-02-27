-- ══════════════════════════════════════════════════════════════════
--  HM Handling — Database Layer
--  MopsScripts | oxmysql — Profile pro Fahrzeugtyp
-- ══════════════════════════════════════════════════════════════════

-- ── Profile laden ─────────────────────────────────────────────────
function DB_GetProfiles(vehicle, cb)
    MySQL.query(
        'SELECT id, name, data, created_at FROM hm_handling_profiles WHERE vehicle = ? ORDER BY created_at DESC',
        { vehicle },
        function(rows)
            local profiles = {}
            for _, row in ipairs(rows or {}) do
                local ok, decoded = pcall(json.decode, row.data)
                if ok and decoded then
                    table.insert(profiles, {
                        id   = row.id,
                        name = row.name,
                        data = decoded,
                        date = tostring(row.created_at),
                    })
                end
            end
            cb(profiles)
        end
    )
end

-- ── Profil speichern / überschreiben ──────────────────────────────
function DB_SaveProfile(vehicle, name, data, cb)
    -- Limit prüfen
    MySQL.scalar(
        'SELECT COUNT(*) FROM hm_handling_profiles WHERE vehicle = ?',
        { vehicle },
        function(count)
            if (count or 0) >= Config.MaxProfiles then
                cb(false, 'limit')
                return
            end

            -- Gleicher Name + Fahrzeug → Update statt Insert
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

-- ── Profil löschen ────────────────────────────────────────────────
function DB_DeleteProfile(vehicle, profileId, cb)
    MySQL.update(
        'DELETE FROM hm_handling_profiles WHERE id = ? AND vehicle = ?',
        { profileId, vehicle },
        function(affected)
            cb(affected > 0)
        end
    )
end
