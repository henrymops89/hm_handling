-- ══════════════════════════════════════════════════════════════════
--  HM Handling — Config
--  MopsScripts | Editierbar
-- ══════════════════════════════════════════════════════════════════

Config = {}

-- ── Sprache der NUI ──────────────────────────────────────────────
-- 'de' = Deutsch  |  'en' = Englisch
Config.Language = 'de'

-- ── Label-Modus der NUI ──────────────────────────────────────────
-- 'simple'    = Alltagssprache  |  'technical' = Rohe Keys (fBrakeForce)
Config.LabelMode = 'simple'

-- ── Berechtigungen ───────────────────────────────────────────────
-- 'job' | 'ace' | 'both'
Config.PermissionMode = 'job'

-- Format: jobName = minGrade (0 = alle Grades erlaubt)
Config.AllowedJobs = {
    ['mechanic'] = 0,
    ['tuner']    = 0,
    ['police']   = 3,
    ['admin']    = 0,
}

-- ACE Permission (nur wenn PermissionMode = 'ace' oder 'both')
Config.AcePermission = 'hm.handling'

-- ── Nur eigenes Fahrzeug ──────────────────────────────────────────
Config.OwnVehicleOnly = false

-- ── Maximale Profile pro Spieler ─────────────────────────────────
Config.MaxProfiles = 20

-- ── Command ──────────────────────────────────────────────────────
Config.Command = 'handling'

-- ── Keybind (nil = kein Keybind) ─────────────────────────────────
Config.Keybind = nil  -- z.B. 'F6'

-- ── Notify-System ────────────────────────────────────────────────
-- 'ox_lib' | 'qb'
Config.NotifySystem = 'ox_lib'

-- ── Debug ────────────────────────────────────────────────────────
Config.Debug = false
