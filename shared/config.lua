-- ══════════════════════════════════════════════════════════════════
--  HM Handling — Config
--  MopsScripts | QBox
-- ══════════════════════════════════════════════════════════════════

Config = {}

-- ── Sprache der NUI ──────────────────────────────────────────────
-- 'de' = Deutsch  |  'en' = Englisch
Config.Language = 'de'

-- ── Label-Modus der NUI ──────────────────────────────────────────
-- 'simple'    = Alltagssprache  |  'technical' = Rohe Keys (fBrakeForce)
Config.LabelMode = 'simple'

-- ── Maximale Profile pro Fahrzeugmodell ─────────────────────────
Config.MaxProfiles = 20

-- ── Command ──────────────────────────────────────────────────────
Config.Command = 'handling'

-- ── Keybind (nil = kein Keybind) ─────────────────────────────────
Config.Keybind = nil -- z.B. 'F6'

-- ── Notify-System ────────────────────────────────────────────────
-- 'ox_lib' | 'qb'
Config.NotifySystem = 'ox_lib'

-- ── Debug ────────────────────────────────────────────────────────
Config.Debug = false
