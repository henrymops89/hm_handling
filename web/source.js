/* ════════════════════════════════════════════════════════════════════
   HM HANDLING — NUI Script
   Multi-Framework: Bridge via NUI messages
   ════════════════════════════════════════════════════════════════════ */

// ── Translations (UI-Texte) ───────────────────────────────────────────
const TRANSLATIONS = {
  de: {
    // Sidebar Tabs
    tab_engine:       'Motor',
    tab_transmission: 'Getriebe',
    tab_suspension:   'Fahrwerk',
    tab_traction:     'Traktion',
    tab_brakes:       'Bremsen',
    tab_damage:       'Schaden',
    tab_misc:         'Sonstiges',
    tab_profiles:     'Profile',
    tab_search:       'Suche',
    section_handling: 'Handling',
    section_manage:   'Verwaltung',

    // Header
    btn_label_simple:    '📖 Einfach',
    btn_label_technical: '🔬 fBrakeForce',
    btn_preset:          '📄 Preset',
    btn_close:           'Schließen',
    btn_apply:           'Anwenden',
    btn_save:            'Speichern',
    btn_load:            'Laden',
    btn_export:          'JSON Export',
    btn_import:          'JSON Import',
    search_placeholder:  'Was willst du anpassen?',

    // Profile
    profiles_title:      'Gespeicherte Profile',
    profiles_empty:      'Keine Profile gespeichert',
    profiles_save_btn:   'Speichern',
    modal_save_title:    'Profil speichern',
    modal_save_name:     'Profilname',
    modal_cancel:        'Abbrechen',
    modal_import_title:  'Handling importieren',
    modal_import_paste:  'Handling JSON hier einfügen…',
    modal_import_btn:    'Importieren',

    // Search
    search_results:      'Suchergebnisse',
    search_no_results:   'Keine Ergebnisse gefunden',
    search_result_count: (n) => `${n} Ergebnisse`,

    // Toasts
    toast_applied:       '✓ Handling angewendet',
    toast_saved:         (name) => `✓ Profil "${name}" gespeichert`,
    toast_loaded:        (name) => `↓ Profil "${name}" geladen`,
    toast_deleted:       (name) => `✗ Profil "${name}" wird gelöscht…`,
    toast_preset_loaded: (name) => `↓ ${name} geladen`,
    toast_no_name:       '⚠ Bitte einen Namen eingeben',
    toast_imported:      '✓ JSON importiert',
    toast_import_error:  '⚠ Ungültiges JSON Format',
    toast_exported:      '↑ JSON exportiert',
    toast_reset_all:     '↺ Alle Werte zurückgesetzt',

    // Misc
    reset_title:         'Zurücksetzen',
    no_vehicle:          'Kein Fahrzeug',
  },
  en: {
    // Sidebar Tabs
    tab_engine:       'Engine',
    tab_transmission: 'Transmission',
    tab_suspension:   'Suspension',
    tab_traction:     'Traction',
    tab_brakes:       'Brakes',
    tab_damage:       'Damage',
    tab_misc:         'Misc',
    tab_profiles:     'Profiles',
    tab_search:       'Search',
    section_handling: 'Handling',
    section_manage:   'Management',

    // Header
    btn_label_simple:    '📖 Simple',
    btn_label_technical: '🔬 fBrakeForce',
    btn_preset:          '📄 Preset',
    btn_close:           'Close',
    btn_apply:           'Apply',
    btn_save:            'Save',
    btn_load:            'Load',
    btn_export:          'JSON Export',
    btn_import:          'JSON Import',
    search_placeholder:  'What do you want to adjust?',

    // Profile
    profiles_title:      'Saved Profiles',
    profiles_empty:      'No profiles saved',
    profiles_save_btn:   'Save',
    modal_save_title:    'Save Profile',
    modal_save_name:     'Profile name',
    modal_cancel:        'Cancel',
    modal_import_title:  'Import Handling',
    modal_import_paste:  'Paste handling JSON here…',
    modal_import_btn:    'Import',

    // Search
    search_results:      'Search Results',
    search_no_results:   'No results found',
    search_result_count: (n) => `${n} results`,

    // Toasts
    toast_applied:       '✓ Handling applied',
    toast_saved:         (name) => `✓ Profile "${name}" saved`,
    toast_loaded:        (name) => `↓ Profile "${name}" loaded`,
    toast_deleted:       (name) => `✗ Deleting profile "${name}"…`,
    toast_preset_loaded: (name) => `↓ ${name} loaded`,
    toast_no_name:       '⚠ Please enter a name',
    toast_imported:      '✓ JSON imported',
    toast_import_error:  '⚠ Invalid JSON format',
    toast_exported:      '↑ JSON exported',
    toast_reset_all:     '↺ All values reset',

    // Misc
    reset_title:         'Reset',
    no_vehicle:          'No vehicle',
  },
};

function t(key, ...args) {
  const lang = CONFIG.language || 'de';
  const tr = TRANSLATIONS[lang] || TRANSLATIONS['de'];
  const val = tr[key] ?? TRANSLATIONS['de'][key] ?? key;
  return typeof val === 'function' ? val(...args) : val;
}

// ── Config ────────────────────────────────────────────────────────────
const CONFIG = {
  language: 'de',    // 'de' | 'en' — in config.lua einstellbar
  labelMode: 'simple', // 'simple' | 'technical' — live umschaltbar via Toggle
};

// ── Language Labels ───────────────────────────────────────────────────
// Jeder Eintrag: { de: Fachbegriff (DE), en: Fachbegriff (EN), simple: Alltagssprache (DE), simpleEn: Plain English }
const LABELS = {
  // Engine
  fMass:                          { de: 'Fahrzeuggewicht (kg)',           en: 'Vehicle Weight (kg)',          simple: 'Wie schwer ist das Auto?', simpleEn: 'How heavy is the car?' },
  fInitialDragCoeff:              { de: 'Luftwiderstand',                 en: 'Air Resistance',               simple: 'Wird das Auto bei hoher Geschwindigkeit ausgebremst?', simpleEn: 'Does the car slow down at high speed due to air?' },
  fDownforceModifier:             { de: 'Anpressdruck (Flügel)',          en: 'Downforce',                    simple: 'Wie stark drückt der Spoiler das Auto auf die Straße?', simpleEn: 'How hard does the spoiler push the car onto the road?' },
  fDriveBiasFront:                { de: 'Antriebsart (RWD/FWD/AWD)',      en: 'Drive Bias Front',             simple: 'Welche Räder werden angetrieben? (0 = hinten, 0.5 = alle, 1 = vorne)', simpleEn: 'Which wheels are driven? (0 = rear, 0.5 = all, 1 = front)' },
  nInitialDriveGears:             { de: 'Anzahl Gänge',                   en: 'Number of Gears',              simple: 'Wie viele Gänge hat das Getriebe?', simpleEn: 'How many gears does the transmission have?' },
  fInitialDriveForce:             { de: 'Motorkraft (Beschleunigung)',     en: 'Acceleration / Drive Force',   simple: 'Wie stark beschleunigt das Auto?', simpleEn: 'How strongly does the car accelerate?' },
  fDriveInertia:                  { de: 'Motorträgheit',                  en: 'Drive Inertia',                simple: 'Wie schnell reagiert der Motor aufs Gas? (1.0 = normal)', simpleEn: 'How fast does the engine respond to throttle? (1.0 = normal)' },
  fInitialDriveMaxFlatVel:        { de: 'Höchstgeschwindigkeit',          en: 'Top Speed',                    simple: 'Wie schnell fährt das Auto maximal?', simpleEn: 'What is the maximum speed of the car?' },
  // Transmission
  fClutchChangeRateScaleUpShift:  { de: 'Schaltzeit (Hochschalten)',      en: 'Gear Upshift Time',            simple: 'Wie schnell schaltet das Auto einen Gang hoch?', simpleEn: 'How fast does the car shift up a gear?' },
  fClutchChangeRateScaleDownShift:{ de: 'Schaltzeit (Runterschalten)',    en: 'Gear Downshift Time',          simple: 'Wie schnell schaltet das Auto einen Gang runter?', simpleEn: 'How fast does the car shift down a gear?' },
  fLowSpeedTractionLossMult:      { de: 'Durchdrehen bei Langsamfahrt',   en: 'Low Speed Burnout Mult',       simple: 'Drehen die Reifen beim Anfahren durch?', simpleEn: 'Do the tires spin when pulling away?' },
  fTractionCurveLateral:          { de: 'Seitengrip-Kurve',               en: 'Traction Curve Lateral',       simple: 'Ab welchem Winkel fängt das Auto an zu rutschen?', simpleEn: 'At what angle does the car start to slide?' },
  fTractionSpringDeltaMax:        { de: 'Reifenwand-Federweg (seitlich)', en: 'Traction Spring Delta Max',    simple: 'Wie weit können die Reifen seitlich wegknicken?', simpleEn: 'How far can the tires flex sideways?' },
  fTractionBiasFront:             { de: 'Gripverteilung Vorne/Hinten',    en: 'Traction Bias Front',          simple: 'Haben Vorder- und Hinterreifen gleich viel Grip?', simpleEn: 'Do front and rear tires have equal grip?' },
  // Suspension
  fSuspensionForce:               { de: 'Federsteifigkeit',               en: 'Spring Strength',              simple: 'Wie hart oder weich sind die Federn?', simpleEn: 'How hard or soft are the springs?' },
  fSuspensionCompDamp:            { de: 'Dämpfung (Einfedern)',           en: 'Damping (Compression)',        simple: 'Wie schnell federt das Auto ein (z.B. bei Bodenwellen)?', simpleEn: 'How fast does the car compress (e.g. over bumps)?' },
  fSuspensionReboundDamp:         { de: 'Dämpfung (Ausfedern)',           en: 'Damping (Rebound)',            simple: 'Wie schnell federt das Auto wieder aus? (Hüpfverhalten)', simpleEn: 'How fast does the car bounce back? (bounciness)' },
  fSuspensionUpperLimit:          { de: 'Federweg oben (max.)',           en: 'Suspension Upper Limit',       simple: 'Wie weit können die Räder nach oben eintauchen?', simpleEn: 'How far can the wheels travel upward?' },
  fSuspensionLowerLimit:          { de: 'Federweg unten (max.)',          en: 'Suspension Lower Limit',       simple: 'Wie weit können die Räder nach unten hängen?', simpleEn: 'How far can the wheels hang downward?' },
  fSuspensionRaise:               { de: 'Fahrzeughöhe / Tieferlegung',    en: 'Ride Height / Stance',         simple: 'Wie hoch oder tief liegt das Auto? (Minus = tiefer)', simpleEn: 'How high or low does the car sit? (negative = lower)' },
  fSuspensionBiasFront:           { de: 'Federverteilung Vorne/Hinten',   en: 'Spring Bias Front',            simple: 'Sind Vorder- und Hinterfedern gleich stark?', simpleEn: 'Are front and rear springs equally strong?' },
  fAntiRollBarForce:              { de: 'Stabilisatorkraft (Wankschutz)', en: 'Anti-Roll Bar Force',          simple: 'Wie stark neigt sich das Auto in Kurven zur Seite?', simpleEn: 'How much does the car lean in corners?' },
  fAntiRollBarBiasFront:          { de: 'Stabilisatorverteilung',         en: 'Anti-Roll Bias Front',         simple: 'Wo wirkt der Wankschutz stärker — vorne oder hinten?', simpleEn: 'Where does the anti-roll bar act stronger — front or rear?' },
  fRollCentreHeightFront:         { de: 'Rollzentrum Höhe (vorne)',       en: 'Roll Centre Height Front',     simple: 'Wo liegt der Drehpunkt beim Kurvenneigen (vorne)?', simpleEn: 'Where is the pivot point when cornering (front)?' },
  fRollCentreHeightRear:          { de: 'Rollzentrum Höhe (hinten)',      en: 'Roll Centre Height Rear',      simple: 'Wo liegt der Drehpunkt beim Kurvenneigen (hinten)?', simpleEn: 'Where is the pivot point when cornering (rear)?' },
  // Traction
  fTractionCurveMax:              { de: 'Reifengrip (Maximum)',           en: 'Tire Grip (Max)',              simple: 'Wie viel Grip haben die Reifen maximal?', simpleEn: 'How much grip do the tires have at maximum?' },
  fTractionCurveMin:              { de: 'Reifengrip (beim Gleiten)',      en: 'Tire Grip (Min / Sliding)',    simple: 'Wie viel Grip bleibt noch beim Rutschen?', simpleEn: 'How much grip remains when sliding?' },
  fTractionLossMult:              { de: 'Traktion im Gelände',            en: 'Offroad Traction Loss',        simple: 'Wie gut kommt das Auto abseits der Straße voran?', simpleEn: 'How well does the car cope off-road?' },
  fSteeringLock:                  { de: 'Maximaler Lenkeinschlag',        en: 'Max Steering Angle',           simple: 'Wie eng kann das Auto einlenken / wenden?', simpleEn: 'How tight can the car steer / turn?' },
  fCamberStiffnesss:              { de: 'Sturzsteifigkeit',               en: 'Camber Stiffness',             simple: 'Wie stark beeinflusst die Radneigung den Grip?', simpleEn: 'How strongly does wheel camber affect grip?' },
  // Brakes
  fBrakeForce:                    { de: 'Bremskraft',                     en: 'Brake Force',                  simple: 'Wie stark bremst das Auto?', simpleEn: 'How strongly does the car brake?' },
  fBrakeBiasFront:                { de: 'Bremsverteilung Vorne/Hinten',   en: 'Brake Bias Front',             simple: 'Bremsen Vorder- oder Hinterräder stärker?', simpleEn: 'Do front or rear wheels brake harder?' },
  fHandBrakeForce:                { de: 'Handbremse (Driften)',           en: 'Handbrake Force',              simple: 'Wie stark zieht die Handbremse? (Wichtig fürs Driften)', simpleEn: 'How strong is the handbrake? (important for drifting)' },
  // Damage
  fCollisionDamageMult:           { de: 'Kollisionsschaden (Faktor)',     en: 'Collision Damage Mult',        simple: 'Wie viel Schaden nimmt das Auto bei Zusammenstößen?', simpleEn: 'How much damage does the car take in collisions?' },
  fWeaponDamageMult:              { de: 'Waffenschaden (Faktor)',         en: 'Weapon Damage Mult',           simple: 'Wie viel Schaden machen Waffen am Auto? (0 = unzerstörbar)', simpleEn: 'How much damage do weapons do to the car? (0 = indestructible)' },
  fDeformationDamageMult:         { de: 'Verformungsschaden (Faktor)',    en: 'Deformation Damage Mult',      simple: 'Wie stark verbeult das Auto bei Unfällen?', simpleEn: 'How much does the car dent in crashes?' },
  fEngineDamageMult:              { de: 'Motorschaden (Faktor)',          en: 'Engine Damage Mult',           simple: 'Wie leicht geht der Motor bei Schäden kaputt?', simpleEn: 'How easily does the engine break from damage?' },
  fPetrolTankVolume:              { de: 'Tankvolumen (Liter)',            en: 'Fuel Tank Volume',             simple: 'Wie viel Benzin fasst der Tank?', simpleEn: 'How much fuel does the tank hold?' },
  fOilVolume:                     { de: 'Ölmenge (Liter)',               en: 'Oil Volume',                   simple: 'Wie viel Öl ist im Motor?', simpleEn: 'How much oil is in the engine?' },
  // Misc
  fSeatOffsetDistX:               { de: 'Sitzposition Links/Rechts',      en: 'Seat Offset X',                simple: 'Ist der Fahrersitz zu weit links oder rechts?', simpleEn: 'Is the driver seat too far left or right?' },
  fSeatOffsetDistY:               { de: 'Sitzposition Vor/Zurück',        en: 'Seat Offset Y',                simple: 'Ist der Fahrersitz zu weit vorne oder hinten?', simpleEn: 'Is the driver seat too far forward or back?' },
  fSeatOffsetDistZ:               { de: 'Sitzposition Oben/Unten',        en: 'Seat Offset Z',                simple: 'Sitzt der Fahrer zu hoch oder zu tief?', simpleEn: 'Is the driver sitting too high or too low?' },
  nMonetaryValue:                 { de: 'Fahrzeugwert ($)',               en: 'Monetary Value',               simple: 'Wie viel ist das Fahrzeug wert?', simpleEn: 'How much is the vehicle worth?' },
  fPopUpLightRotation:            { de: 'Klappscheinwerfer Winkel',       en: 'Popup Light Rotation',         simple: 'Winkel der ausfahrenden Scheinwerfer (nur Klapplichter)', simpleEn: 'Angle of popup headlights (only for flip-up lights)' },
  fPercentSubmerged:              { de: 'Schwimmgrenze (% Eintauchen)',   en: 'Float at % Submerged',         simple: 'Wie tief muss das Auto ins Wasser bis es sinkt?', simpleEn: 'How deep must the car go into water before it sinks?' },
};

function getLabel(key) {
  const lang = CONFIG.language || 'de';
  if (CONFIG.labelMode === 'simple') {
    return lang === 'de'
      ? (LABELS[key]?.simple    || LABELS[key]?.de  || LABELS[key]?.en || key)
      : (LABELS[key]?.simpleEn  || LABELS[key]?.en  || LABELS[key]?.de || key);
  }
  if (CONFIG.labelMode === 'technical') {
    return key;
  }
  return LABELS[key]?.[lang] || LABELS[key]?.en || key;
}

// ── Handling Field Definitions (ranges & defaults from JG-Handling) ──
const HANDLING_FIELDS = {
  engine: [
    { key: 'fMass',             label: 'Vehicle Weight (kg)',            min: 0,    max: 10000,  step: 100,  default: 1800,  tags: ['weight','mass','heavy','light','collision','schwer','leicht','gewicht'],
      desc: 'The weight of the vehicle in kilograms (kg). Only used when the vehicle collides with another vehicle or non-static object.' },
    { key: 'fInitialDragCoeff', label: 'Air Resistance',                 min: 0,    max: 100,    step: 0.5,  default: 10,    tags: ['drag','air','resistance','top speed','slow down','luftwiderstand','topspeed','geschwindigkeit'],
      desc: 'Controls the drag (air resistance) of the vehicle. Higher values = more drag = lower top speed.' },
    { key: 'fDownforceModifier',label: 'Downforce',                      min: 0,    max: 100,    step: 1,    default: 0,     tags: ['downforce','grip','cornering','aerodynamics','kurve','anpressdruck'],
      desc: 'Amount of downforce applied at speed. Higher = more grip at high speeds.' },
    { key: 'fDriveBiasFront',   label: 'Front Power Bias (RWD/FWD/AWD)', min: 0,    max: 1,      step: 0.01, default: 0,     tags: ['rwd','fwd','awd','drivetrain','antrieb','hinterrad','vorderrad','allrad','drift'],
      desc: '0.0 = Rear Wheel Drive, 1.0 = Front Wheel Drive, 0.5 = All Wheel Drive.' },
    { key: 'nInitialDriveGears',label: 'Number of Gears',                min: 1,    max: 8,      step: 1,    default: 6,     tags: ['gears','transmission','gänge','getriebe','shift'],
      desc: 'How many gears the transmission contains. Recommended max: 8.' },
    { key: 'fInitialDriveForce',label: 'Acceleration',                   min: 0.01, max: 0.7,    step: 0.01, default: 0.3,   tags: ['acceleration','power','fast','speed','torque','beschleunigung','schnell','kraft','motor'],
      desc: 'Multiplier of engine torque. Higher = faster acceleration. Does not affect top speed.' },
    { key: 'fDriveInertia',     label: 'Drive Inertia (recommended 1.0)', min: 0,   max: 3,      step: 0.01, default: 1.0,   tags: ['inertia','turbo lag','engine response','throttle','motor','träge'],
      desc: 'How fast the engine responds to throttle. Higher = slower response (turbo lag feel). Keep at 1.0.' },
    { key: 'fInitialDriveMaxFlatVel', label: 'Top Speed',                min: 1,    max: 500,    step: 0.1,  default: 150,   tags: ['top speed','max speed','fastest','velocity','topspeed','höchstgeschwindigkeit','schnell','tempo','geschwindigkeit'],
      desc: 'Maximum speed on a flat surface (km/h). Actual in-game top speed may differ slightly.' },
  ],
  transmission: [
    { key: 'fClutchChangeRateScaleUpShift',   label: 'Gear Upshift Time',         min: 0,   max: 10,  step: 0.1,  default: 2.0,  tags: ['gear','shift','upshift','transmission','getriebe','schalten','kupplung'],
      desc: 'How quickly the clutch engages when upshifting. Higher = faster upshift.' },
    { key: 'fClutchChangeRateScaleDownShift', label: 'Gear Downshift Time',       min: 0,   max: 10,  step: 0.1,  default: 2.0,  tags: ['gear','shift','downshift','transmission','getriebe','schalten','kupplung'],
      desc: 'How quickly the clutch engages when downshifting. Higher = faster downshift.' },
    { key: 'fLowSpeedTractionLossMult',       label: 'Low Speed Burnout Mult',    min: 0,   max: 2,   step: 0.01, default: 1.0,  tags: ['burnout','wheel spin','grip','launch','traction','wheelspin','durchdrehen','traktion'],
      desc: 'How exaggerated the burnout griploss is. 0.0 = normal traction, 1.0 = default.' },
    { key: 'fTractionCurveLateral',           label: 'Traction Curve Lateral',    min: 15,  max: 35,  step: 0.1,  default: 22.5, tags: ['corner','turn','lateral','slide','drift','oversteer','kurve','übersteuern','gleiten'],
      desc: 'Angle at which lateral slip begins. Smaller = slides more easily in corners.' },
    { key: 'fTractionSpringDeltaMax',         label: 'Traction Spring Delta Max', min: 0,   max: 1,   step: 0.01, default: 0,    tags: ['slide','drift','traction','lateral','gleiten'],
      desc: 'Max lateral sidewall travel (meters). Affects slide recovery behavior.' },
    { key: 'fTractionBiasFront',              label: 'Traction Bias Front',       min: 0,   max: 1,   step: 0.01, default: 0.5,  tags: ['traction','front','rear','grip','bias','traktion'],
      desc: 'Only change if front/rear axles have different tyre compounds or sizes. Otherwise 0.5.' },
  ],
  suspension: [
    { key: 'fSuspensionForce',       label: 'Spring Strength',                    min: 0,   max: 5,   step: 0.01, default: 3.0,    tags: ['suspension','stiff','soft','flip','roll','handling','fahrwerk','federn','hart','weich','kippen'],
      desc: 'Higher = stiffer suspension. Can help if car flips over when turning!' },
    { key: 'fSuspensionCompDamp',    label: 'Spring Dampen (Compression)',        min: 0,   max: 3,   step: 0.01, default: 1.4,    tags: ['suspension','bounce','damping','fahrwerk','dämpfer','hüpfen'],
      desc: 'Higher = suspension compresses faster (more direct but more bounce).' },
    { key: 'fSuspensionReboundDamp', label: 'Spring Dampen (Rebound)',            min: 0,   max: 3,   step: 0.01, default: 1.4,    tags: ['suspension','bounce','damping','rebound','fahrwerk','dämpfer','hüpfen'],
      desc: 'Higher = suspension extends slower (more stable, less bounce).' },
    { key: 'fSuspensionUpperLimit',  label: 'Suspension Upper Limit',             min: 0,   max: 1,   step: 0.001,default: 0.075,  tags: ['suspension','travel','wheel','fahrwerk','federweg'],
      desc: 'How far wheels can move up from original position (meters).' },
    { key: 'fSuspensionLowerLimit',  label: 'Suspension Lower Limit',             min: -1,  max: 0,   step: 0.001,default: -0.075, tags: ['suspension','travel','wheel','fahrwerk','federweg'],
      desc: 'How far wheels can move down from original position (meters).' },
    { key: 'fSuspensionRaise',       label: 'Suspension Raise / Stance Height',  min: -1,  max: 1,   step: 0.001,default: 0,      tags: ['stance','lowered','lifted','height','ride height','tieferlegung','tieferlegen','höhe','slammed'],
      desc: 'Raises or lowers the body. Negative = lower. -0.02 is noticeable on a low car.' },
    { key: 'fSuspensionBiasFront',   label: 'Spring Strength Bias Front',        min: 0,   max: 1,   step: 0.01, default: 0.5,    tags: ['suspension','front','rear','bias','fahrwerk'],
      desc: 'Spring strength distribution between axles. Leave at 0.5 unless specific reason.' },
    { key: 'fAntiRollBarForce',      label: 'Antiroll Strength',                 min: 0,   max: 2,   step: 0.01, default: 0.45,   tags: ['roll','lean','corner','stabilizer','antiroll','wanken','kurve','kippen','flip'],
      desc: 'Larger = less body roll. How strongly antiroll bars resist leaning.' },
    { key: 'fAntiRollBarBiasFront',  label: 'Antiroll Bias Front',               min: 0,   max: 1,   step: 0.01, default: 0.5,    tags: ['roll','antiroll','bias','front','rear'],
      desc: 'Antiroll strength distribution between axles. Leave at 0.5 unless specific reason.' },
    { key: 'fRollCentreHeightFront', label: 'Rollcentre Height Front',           min: -0.5,max: 0.5, step: 0.01, default: 0.35,   tags: ['roll','corner','handling','rollcenter'],
      desc: 'Roll centre height at front axle. Affects cornering and body roll.' },
    { key: 'fRollCentreHeightRear',  label: 'Rollcentre Height Rear',            min: -0.5,max: 0.5, step: 0.01, default: 0.35,   tags: ['roll','corner','handling','rollcenter'],
      desc: 'Roll centre height at rear axle. Affects cornering and body roll.' },
  ],
  traction: [
    { key: 'fTractionCurveMax',     label: 'Tire Grip (Max)',           min: 0,  max: 5,  step: 0.01, default: 2.1,  tags: ['grip','traction','tire','tyre','corner','handling','reifen','kurve','haftung'],
      desc: 'Maximum grip from the tire. Higher = more grip at peak before sliding.' },
    { key: 'fTractionCurveMin',     label: 'Tire Grip (Min)',           min: 0,  max: 5,  step: 0.01, default: 1.8,  tags: ['grip','traction','tire','slide','drift','reifen','haftung','gleiten'],
      desc: 'Minimum grip while sliding. Higher = more grip during slide, quicker recovery.' },
    { key: 'fTractionCurveLateral', label: 'Traction Curve (Lateral)',  min: 15, max: 35, step: 0.1,  default: 22.5, tags: ['grip','corner','lateral','steering','handling','kurve','lenkung'],
      desc: 'Angle for max lateral grip. Smaller = more responsive but slides easier.' },
    { key: 'fTractionLossMult',     label: 'Offroad Traction Loss',     min: 0,  max: 10, step: 0.1,  default: 1.0,  tags: ['offroad','dirt','mud','traction','grip','gelände','schlamm'],
      desc: 'Traction loss on non-road surfaces. Higher = harder to drive offroad.' },
    { key: 'fSteeringLock',         label: 'Max Steering Angle',        min: 0,  max: 90, step: 1,    default: 40,   tags: ['steering','turn','corner','radius','lenkung','einschlag','kurve','wenden','wendekreis'],
      desc: 'Maximum front wheel turn angle (degrees). Higher = tighter turning radius.' },
    { key: 'fCamberStiffnesss',     label: 'Camber Stiffness',          min: 0,  max: 1,  step: 0.01, default: 0,    tags: ['camber','tire','tyre','grip','sturz','reifen'],
      desc: 'How much wheel camber influences tire grip behavior.' },
  ],
  brakes: [
    { key: 'fBrakeForce',     label: 'Brake Strength',    min: 0.01, max: 4,  step: 0.01, default: 1.0,  tags: ['brake','stop','stopping','distance','bremsen','bremskraft','anhalten','bremsweg'],
      desc: 'Overall brake force. Higher = shorter braking distance.' },
    { key: 'fBrakeBiasFront', label: 'Front Brake Bias',  min: 0,    max: 1,  step: 0.01, default: 0.5,  tags: ['brake','front','rear','stability','bremsen','vorne','hinten'],
      desc: 'Braking force front/rear distribution. Higher front = more stable under braking.' },
    { key: 'fHandBrakeForce', label: 'Handbrake Strength',min: 0.01, max: 1,  step: 0.01, default: 0.7,  tags: ['handbrake','drift','spin','e-brake','handbremse','driften','slalom'],
      desc: 'Handbrake force. Higher = easier to initiate drifts/spins.' },
  ],
  damage: [
    { key: 'fCollisionDamageMult',   label: 'Collision Damage Multiplier',   min: 0, max: 10, step: 0.1, default: 1.0, tags: ['damage','crash','collision','invincible','no damage','unzerstörbar','schaden','kollision'],
      desc: 'Collision damage multiplier. 0.0 = no damage; 10.0 = 10x more damage.' },
    { key: 'fWeaponDamageMult',      label: 'Weapon Damage Multiplier',      min: 0, max: 10, step: 0.1, default: 1.0, tags: ['damage','weapon','bullet','invincible','no damage','schaden','waffe','schuss'],
      desc: 'Weapon damage multiplier. 0.0 = no damage; 10.0 = 10x more damage.' },
    { key: 'fDeformationDamageMult', label: 'Deformation Damage Multiplier', min: 0, max: 10, step: 0.1, default: 1.0, tags: ['damage','deform','dent','crash','schaden','verformung','beule'],
      desc: 'Deformation damage multiplier. 0.0 = no damage; 10.0 = 10x more damage.' },
    { key: 'fEngineDamageMult',      label: 'Engine Damage Multiplier',      min: 0, max: 10, step: 0.1, default: 1.0, tags: ['damage','engine','explosion','fire','motor','schaden','explosion','feuer'],
      desc: 'Engine damage multiplier. 0.0 = no damage; 10.0 = 10x more damage.' },
    { key: 'fPetrolTankVolume',      label: 'Petrol Tank Volume',            min: 1, max: 100,step: 1,   default: 65,  tags: ['fuel','petrol','gas','tank','benzin','kraftstoff','sprit'],
      desc: 'Petrol that leaks after tank is shot. Also used by fuel-usage scripts.' },
    { key: 'fOilVolume',             label: 'Oil Volume',                    min: 1, max: 20, step: 0.1, default: 3.5, tags: ['oil','engine','fluid','öl','motor','flüssigkeit'],
      desc: 'Oil volume. Used by some servicing scripts.' },
  ],
  misc: [
    { key: 'fSeatOffsetDistX',    label: 'Seat Offset X',          min: -0.5, max: 0.5, step: 0.01, default: 0,    tags: ['seat','camera','position','driver','sitz','kamera','fahrer'],
      desc: 'Horizontal offset of driver seat. Affects camera and IK positioning.' },
    { key: 'fSeatOffsetDistY',    label: 'Seat Offset Y',          min: -0.5, max: 0.5, step: 0.01, default: 0,    tags: ['seat','camera','position','driver','sitz','kamera','fahrer'],
      desc: 'Depth offset of driver seat. Affects camera and IK positioning.' },
    { key: 'fSeatOffsetDistZ',    label: 'Seat Offset Z',          min: -0.5, max: 0.5, step: 0.01, default: 0,    tags: ['seat','camera','position','driver','sitz','kamera','fahrer'],
      desc: 'Vertical offset of driver seat. Affects camera and IK positioning.' },
    { key: 'nMonetaryValue',      label: 'Vehicle Monetary Value', min: 0,    max: 999999, step: 100, default: 15000,tags: ['value','price','money','worth','wert','preis','geld'],
      desc: 'Monetary value used in certain game calculations.' },
    { key: 'fPopUpLightRotation', label: 'Popup Light Rotation',   min: -90,  max: 90,  step: 1,    default: 0,    tags: ['popup','headlight','light','retractable','klappscheinwerfer','licht'],
      desc: 'Rotation of popup headlights. Only relevant for retractable headlight vehicles.' },
    { key: 'fPercentSubmerged',   label: 'Float at % Submerged',   min: 0,    max: 1,   step: 0.01, default: 0.85, tags: ['water','float','sink','boat','wasser','schwimmen','sinken'],
      desc: 'At what % submerged the vehicle starts to float. 0.85 = floats at 85% depth.' },
  ],
};

// ── Vehicle Presets (GTA V Handling-Werte) ────────────────────────────
const VEHICLE_PRESETS = {
  'T20': {
    vehicle: 'Progen T20',
    fMass: 1400, fInitialDragCoeff: 5.5, fDownforceModifier: 40,
    fDriveBiasFront: 0.15, nInitialDriveGears: 7, fInitialDriveForce: 0.41,
    fDriveInertia: 1.0, fInitialDriveMaxFlatVel: 200,
    fClutchChangeRateScaleUpShift: 3.0, fClutchChangeRateScaleDownShift: 3.0,
    fLowSpeedTractionLossMult: 0.5, fTractionCurveLateral: 19.5,
    fTractionSpringDeltaMax: 0.14, fTractionBiasFront: 0.47,
    fSuspensionForce: 3.5, fSuspensionCompDamp: 1.8, fSuspensionReboundDamp: 2.0,
    fSuspensionUpperLimit: 0.06, fSuspensionLowerLimit: -0.06,
    fSuspensionRaise: 0.0, fSuspensionBiasFront: 0.5,
    fAntiRollBarForce: 0.8, fAntiRollBarBiasFront: 0.5,
    fRollCentreHeightFront: 0.35, fRollCentreHeightRear: 0.35,
    fTractionCurveMax: 2.55, fTractionCurveMin: 2.30,
    fTractionLossMult: 1.0, fSteeringLock: 33, fCamberStiffnesss: 0.0,
    fBrakeForce: 0.85, fBrakeBiasFront: 0.62, fHandBrakeForce: 0.5,
    fCollisionDamageMult: 1.0, fWeaponDamageMult: 1.0,
    fDeformationDamageMult: 1.0, fEngineDamageMult: 1.5,
    fPetrolTankVolume: 55, fOilVolume: 5.0, fPercentSubmerged: 0.85,
    nMonetaryValue: 2200000, fSeatOffsetDistX: 0, fSeatOffsetDistY: 0,
    fSeatOffsetDistZ: 0, fPopUpLightRotation: 0,
  },
};

function loadPreset(name) {
  const preset = VEHICLE_PRESETS[name];
  if (!preset) return;
  loadValues(preset);
  document.getElementById('vehicleName').innerHTML = `&#128663; ${preset.vehicle}`;
  showToast(t('toast_preset_loaded', preset.vehicle));
}

// ── State ─────────────────────────────────────────────────────────────
let currentValues = {};
let defaultValues = {};
let profiles = (() => { try { return JSON.parse(localStorage.getItem('hm_handling_profiles') || '[]'); } catch(e) { return []; } })();
let activeProfileName = null;

// ── Init: Felder rendern ─────────────────────────────────────────────
function initFields() {
  for (const [cat, fields] of Object.entries(HANDLING_FIELDS)) {
    const container = document.getElementById('rows-' + cat);
    if (!container) continue;
    container.innerHTML = '';
    fields.forEach(f => {
      defaultValues[f.key] = f.default;
      if (currentValues[f.key] === undefined) currentValues[f.key] = f.default;
      container.appendChild(buildRow(f));
    });
  }
}

// ── Value Labels pro Feld ────────────────────────────────────────────
// Jeder Eintrag: Array von { max, label, color }
// Das erste Element dessen .max >= val wird verwendet
const VALUE_LEVELS = {
  // ── Engine ───────────────────────────────────────────────────────
  fMass: [
    { max: 600,   label: { de: 'Motorrad', en: 'Motorcycle' },       color: '#a78bfa' },
    { max: 1200,  label: { de: 'Kleinwagen', en: 'Compact Car' },     color: '#60a5fa' },
    { max: 1600,  label: { de: 'Sportwagen', en: 'Sports Car' },     color: '#22c55e' },
    { max: 2000,  label: { de: 'Mittelklasse', en: 'Mid-size' },   color: '#555'    },
    { max: 3000,  label: { de: 'SUV / Muscle', en: 'SUV / Muscle' },   color: '#f97316' },
    { max: 6000,  label: { de: 'Van / Transporter', en: 'Van / Transporter' }, color: '#ef4444' },
    { max: Infinity, label: { de: 'LKW / Bus', en: 'Truck / Bus' },   color: '#7f1d1d' },
  ],
  fInitialDragCoeff: [
    { max: 2,    label: { de: 'Kaum Widerstand', en: 'Barely any drag' }, color: '#0088cc' },
    { max: 5,    label: { de: 'Niedrig', en: 'Low' },         color: '#22c55e' },
    { max: 8,    label: { de: 'Normal', en: 'Normal' },          color: '#555'    },
    { max: 15,   label: { de: 'Spürbar', en: 'Noticeable' },         color: '#f97316' },
    { max: Infinity, label: { de: 'Sehr viel Widerstand', en: 'Very high drag' }, color: '#ef4444' },
  ],
  fDownforceModifier: [
    { max: 5,    label: { de: 'Kein Downforce', en: 'No downforce' },  color: '#555'    },
    { max: 20,   label: { de: 'Leicht', en: 'Slight' },          color: '#22c55e' },
    { max: 50,   label: { de: 'Merklich', en: 'Noticeable' },        color: '#f97316' },
    { max: Infinity, label: { de: 'Rennwagen', en: 'Race car' },   color: '#0088cc' },
  ],
  fDriveBiasFront: [
    { max: 0.05, label: { de: 'Hinterradantrieb (RWD)', en: 'Rear-Wheel Drive (RWD)' }, color: '#0088cc' },
    { max: 0.25, label: { de: 'Leicht AWD (RWD-lastig)', en: 'Light AWD (RWD bias)' }, color: '#22c55e' },
    { max: 0.45, label: { de: 'AWD (RWD-Tendenz)', en: 'AWD (RWD tendency)' },       color: '#555'    },
    { max: 0.55, label: { de: 'Allrad (50/50)', en: 'All-Wheel (50/50)' },           color: '#555'    },
    { max: 0.75, label: { de: 'AWD (FWD-Tendenz)', en: 'AWD (FWD tendency)' },        color: '#555'    },
    { max: 0.95, label: { de: 'Leicht AWD (FWD-lastig)', en: 'Light AWD (FWD bias)' }, color: '#f97316' },
    { max: Infinity, label: { de: 'Frontantrieb (FWD)', en: 'Front-Wheel Drive (FWD)' },  color: '#ef4444' },
  ],
  nInitialDriveGears: [
    { max: 2,    label: { de: '1–2 Gänge (Spezial)', en: '1–2 Gears (Special)' },  color: '#a78bfa' },
    { max: 4,    label: { de: '3–4 Gänge', en: '3–4 Gears' },            color: '#60a5fa' },
    { max: 6,    label: { de: '5–6 Gänge (Standard)', en: '5–6 Gears (Standard)' }, color: '#22c55e' },
    { max: 7,    label: { de: '7 Gänge', en: '7 Gears' },              color: '#555'    },
    { max: Infinity, label: { de: '8 Gänge (Max)', en: '8 Gears (Max)' },    color: '#0088cc' },
  ],
  fInitialDriveForce: [
    { max: 0.15, label: { de: 'Schwach', en: 'Weak' },          color: '#ef4444' },
    { max: 0.25, label: { de: 'Mäßig', en: 'Moderate' },            color: '#f97316' },
    { max: 0.35, label: { de: 'Normal', en: 'Normal' },           color: '#555'    },
    { max: 0.45, label: { de: 'Stark', en: 'Strong' },            color: '#22c55e' },
    { max: 0.55, label: { de: 'Sehr stark', en: 'Very strong' },       color: '#0088cc' },
    { max: Infinity, label: { de: 'Extrem (Race)', en: 'Extreme (Race)' }, color: '#a78bfa' },
  ],
  fDriveInertia: [
    { max: 0.5,  label: { de: 'Sehr träge', en: 'Very sluggish' },       color: '#ef4444' },
    { max: 0.8,  label: { de: 'Träge', en: 'Sluggish' },            color: '#f97316' },
    { max: 1.1,  label: { de: 'Normal (empfohlen)', en: 'Normal (recommended)' }, color: '#22c55e' },
    { max: 1.5,  label: { de: 'Direkt', en: 'Responsive' },           color: '#0088cc' },
    { max: Infinity, label: { de: 'Sehr direkt', en: 'Very responsive' },  color: '#a78bfa' },
  ],
  fInitialDriveMaxFlatVel: [
    { max: 80,   label: { de: 'Sehr langsam', en: 'Very slow' },     color: '#ef4444' },
    { max: 120,  label: { de: 'Stadtverkehr', en: 'City traffic' },     color: '#f97316' },
    { max: 160,  label: { de: 'Normal', en: 'Normal' },           color: '#555'    },
    { max: 200,  label: { de: 'Sportlich', en: 'Sporty' },        color: '#22c55e' },
    { max: 250,  label: { de: 'Supersportwagen', en: 'Supercar' },  color: '#0088cc' },
    { max: Infinity, label: { de: 'Hypercar', en: 'Hypercar' },     color: '#a78bfa' },
  ],
  // ── Transmission ─────────────────────────────────────────────────
  fClutchChangeRateScaleUpShift: [
    { max: 0.8,  label: { de: 'Sehr langsam', en: 'Very slow' },     color: '#ef4444' },
    { max: 1.5,  label: { de: 'Langsam', en: 'Slow' },          color: '#f97316' },
    { max: 2.5,  label: { de: 'Normal', en: 'Normal' },           color: '#555'    },
    { max: 4,    label: { de: 'Schnell', en: 'Fast' },          color: '#22c55e' },
    { max: Infinity, label: { de: 'Renngetriebe', en: 'Race gearbox' }, color: '#0088cc' },
  ],
  fClutchChangeRateScaleDownShift: [
    { max: 0.8,  label: { de: 'Sehr langsam', en: 'Very slow' },     color: '#ef4444' },
    { max: 1.5,  label: { de: 'Langsam', en: 'Slow' },          color: '#f97316' },
    { max: 2.5,  label: { de: 'Normal', en: 'Normal' },           color: '#555'    },
    { max: 4,    label: { de: 'Schnell', en: 'Fast' },          color: '#22c55e' },
    { max: Infinity, label: { de: 'Renngetriebe', en: 'Race gearbox' }, color: '#0088cc' },
  ],
  fLowSpeedTractionLossMult: [
    { max: 0.2,  label: { de: 'Kein Durchdrehen', en: 'No wheelspin' }, color: '#22c55e' },
    { max: 0.6,  label: { de: 'Wenig', en: 'Little' },            color: '#555'    },
    { max: 1.1,  label: { de: 'Normal', en: 'Normal' },           color: '#555'    },
    { max: 1.5,  label: { de: 'Viel', en: 'A lot' },             color: '#f97316' },
    { max: Infinity, label: { de: 'Burnout-ready', en: 'Burnout-ready' }, color: '#ef4444' },
  ],
  fTractionCurveLateral: [
    { max: 18,   label: { de: 'Gleitet sehr leicht', en: 'Slides very easily' }, color: '#a78bfa' },
    { max: 21,   label: { de: 'Rutschig (Drift)', en: 'Slippery (Drift)' },    color: '#0088cc' },
    { max: 24,   label: { de: 'Normal', en: 'Normal' },              color: '#555'    },
    { max: 28,   label: { de: 'Griffig', en: 'Grippy' },             color: '#22c55e' },
    { max: Infinity, label: { de: 'Sehr griffig', en: 'Very grippy' },    color: '#22c55e' },
  ],
  fTractionSpringDeltaMax: [
    { max: 0.05, label: { de: 'Sofortige Rückkehr', en: 'Immediate return' }, color: '#0088cc' },
    { max: 0.12, label: { de: 'Normal', en: 'Normal' },             color: '#555'    },
    { max: 0.2,  label: { de: 'Etwas nachgiebig', en: 'Slightly flexible' },   color: '#f97316' },
    { max: Infinity, label: { de: 'Sehr nachgiebig', en: 'Very flexible' }, color: '#ef4444' },
  ],
  fTractionBiasFront: [
    { max: 0.35, label: { de: 'Hinten-lastig', en: 'Rear-biased' },      color: '#0088cc' },
    { max: 0.48, label: { de: 'Leicht hinten', en: 'Slightly rear' },      color: '#555'    },
    { max: 0.52, label: { de: 'Ausgeglichen (50/50)', en: 'Balanced (50/50)' }, color: '#22c55e' },
    { max: 0.65, label: { de: 'Leicht vorne', en: 'Slightly front' },       color: '#555'    },
    { max: Infinity, label: { de: 'Vorne-lastig', en: 'Front-biased' },   color: '#f97316' },
  ],
  // ── Suspension ───────────────────────────────────────────────────
  fSuspensionForce: [
    { max: 1,    label: { de: 'Sehr weich (Bus)', en: 'Very soft (Bus)' },    color: '#a78bfa' },
    { max: 2,    label: { de: 'Weich (Offroad)', en: 'Soft (Offroad)' },     color: '#60a5fa' },
    { max: 3.5,  label: { de: 'Normal', en: 'Normal' },             color: '#555'    },
    { max: 4.2,  label: { de: 'Straff (Sport)', en: 'Stiff (Sport)' },      color: '#22c55e' },
    { max: Infinity, label: { de: 'Sehr straff (Race)', en: 'Very stiff (Race)' }, color: '#0088cc' },
  ],
  fSuspensionCompDamp: [
    { max: 0.5,  label: { de: 'Kaum Dämpfung', en: 'Barely damped' },      color: '#ef4444' },
    { max: 1.0,  label: { de: 'Weich', en: 'Soft' },              color: '#f97316' },
    { max: 1.6,  label: { de: 'Normal', en: 'Normal' },             color: '#555'    },
    { max: 2.2,  label: { de: 'Direkt', en: 'Responsive' },             color: '#22c55e' },
    { max: Infinity, label: { de: 'Sehr direkt', en: 'Very responsive' },    color: '#0088cc' },
  ],
  fSuspensionReboundDamp: [
    { max: 0.5,  label: { de: 'Hüpft stark', en: 'Bounces a lot' },        color: '#ef4444' },
    { max: 1.0,  label: { de: 'Federt nach', en: 'Rebounds' },        color: '#f97316' },
    { max: 1.6,  label: { de: 'Normal', en: 'Normal' },             color: '#555'    },
    { max: 2.2,  label: { de: 'Stabil', en: 'Stable' },             color: '#22c55e' },
    { max: Infinity, label: { de: 'Sehr stabil', en: 'Very stable' },    color: '#0088cc' },
  ],
  fSuspensionUpperLimit: [
    { max: 0.03, label: { de: 'Fast kein Federweg', en: 'Almost no travel' }, color: '#ef4444' },
    { max: 0.06, label: { de: 'Wenig', en: 'Little' },              color: '#f97316' },
    { max: 0.09, label: { de: 'Normal', en: 'Normal' },             color: '#555'    },
    { max: 0.15, label: { de: 'Viel Federweg', en: 'Lots of travel' },      color: '#22c55e' },
    { max: Infinity, label: { de: 'Sehr viel (Offroad)', en: 'Very much (Offroad)' }, color: '#0088cc' },
  ],
  fSuspensionLowerLimit: [
    { max: -0.15, label: { de: 'Sehr tief hängend', en: 'Hanging very low' },  color: '#0088cc' },
    { max: -0.09, label: { de: 'Tief', en: 'Low' },               color: '#22c55e' },
    { max: -0.06, label: { de: 'Normal', en: 'Normal' },             color: '#555'    },
    { max: -0.02, label: { de: 'Wenig', en: 'Little' },              color: '#f97316' },
    { max: Infinity, label: { de: 'Kaum Federweg', en: 'Barely any travel' },   color: '#ef4444' },
  ],
  fSuspensionRaise: [
    { max: -0.05, label: { de: 'Tief (Stance)', en: 'Low (Stance)' },       color: '#a78bfa' },
    { max: -0.02, label: { de: 'Leicht tiefer', en: 'Slightly lower' },       color: '#0088cc' },
    { max: 0.01,  label: { de: 'Standard', en: 'Standard' },            color: '#555'    },
    { max: 0.05,  label: { de: 'Leicht angehoben', en: 'Slightly raised' },    color: '#22c55e' },
    { max: Infinity, label: { de: 'Hoch (Offroad)', en: 'High (Offroad)' },   color: '#f97316' },
  ],
  fSuspensionBiasFront: [
    { max: 0.35, label: { de: 'Hinten-lastig', en: 'Rear-biased' },        color: '#0088cc' },
    { max: 0.48, label: { de: 'Leicht hinten', en: 'Slightly rear' },        color: '#555'    },
    { max: 0.52, label: { de: 'Ausgeglichen', en: 'Balanced' },         color: '#22c55e' },
    { max: 0.65, label: { de: 'Leicht vorne', en: 'Slightly front' },         color: '#555'    },
    { max: Infinity, label: { de: 'Vorne-lastig', en: 'Front-biased' },     color: '#f97316' },
  ],
  fAntiRollBarForce: [
    { max: 0.2,  label: { de: 'Viel Körperneigung', en: 'Lots of body roll' },   color: '#ef4444' },
    { max: 0.5,  label: { de: 'Normal', en: 'Normal' },               color: '#555'    },
    { max: 0.9,  label: { de: 'Wenig Neigung', en: 'Little lean' },        color: '#22c55e' },
    { max: 1.4,  label: { de: 'Kaum Neigung', en: 'Barely any lean' },         color: '#0088cc' },
    { max: Infinity, label: { de: 'Kein Wanken', en: 'No body roll' },      color: '#a78bfa' },
  ],
  fAntiRollBarBiasFront: [
    { max: 0.35, label: { de: 'Stabilisator hinten', en: 'Stabilizer rear' },  color: '#0088cc' },
    { max: 0.48, label: { de: 'Leicht hinten', en: 'Slightly rear' },        color: '#555'    },
    { max: 0.52, label: { de: 'Ausgeglichen', en: 'Balanced' },         color: '#22c55e' },
    { max: 0.65, label: { de: 'Leicht vorne', en: 'Slightly front' },         color: '#555'    },
    { max: Infinity, label: { de: 'Stabilisator vorne', en: 'Stabilizer front' }, color: '#f97316' },
  ],
  fRollCentreHeightFront: [
    { max: -0.1, label: { de: 'Sehr tief', en: 'Very low' },            color: '#a78bfa' },
    { max: 0.1,  label: { de: 'Tief', en: 'Low' },                 color: '#0088cc' },
    { max: 0.3,  label: { de: 'Normal', en: 'Normal' },               color: '#555'    },
    { max: 0.4,  label: { de: 'Hoch', en: 'High' },                 color: '#22c55e' },
    { max: Infinity, label: { de: 'Sehr hoch', en: 'Very high' },        color: '#f97316' },
  ],
  fRollCentreHeightRear: [
    { max: -0.1, label: { de: 'Sehr tief', en: 'Very low' },            color: '#a78bfa' },
    { max: 0.1,  label: { de: 'Tief', en: 'Low' },                 color: '#0088cc' },
    { max: 0.3,  label: { de: 'Normal', en: 'Normal' },               color: '#555'    },
    { max: 0.4,  label: { de: 'Hoch', en: 'High' },                 color: '#22c55e' },
    { max: Infinity, label: { de: 'Sehr hoch', en: 'Very high' },        color: '#f97316' },
  ],
  // ── Traction ─────────────────────────────────────────────────────
  fTractionCurveMax: [
    { max: 1.2,  label: { de: 'Sehr wenig Grip', en: 'Very little grip' },      color: '#ef4444' },
    { max: 1.8,  label: { de: 'Wenig Grip', en: 'Little grip' },           color: '#f97316' },
    { max: 2.2,  label: { de: 'Normal', en: 'Normal' },               color: '#555'    },
    { max: 2.6,  label: { de: 'Viel Grip', en: 'Good grip' },            color: '#22c55e' },
    { max: 3.2,  label: { de: 'Sehr viel Grip', en: 'Lots of grip' },       color: '#0088cc' },
    { max: Infinity, label: { de: 'Slicks (Race)', en: 'Slicks (Race)' },    color: '#a78bfa' },
  ],
  fTractionCurveMin: [
    { max: 1.0,  label: { de: 'Kaum Restgrip', en: 'Barely any grip left' },        color: '#ef4444' },
    { max: 1.5,  label: { de: 'Wenig beim Gleiten', en: 'Little while sliding' },   color: '#f97316' },
    { max: 2.0,  label: { de: 'Normal', en: 'Normal' },               color: '#555'    },
    { max: 2.5,  label: { de: 'Greift beim Gleiten', en: 'Grips while sliding' },  color: '#22c55e' },
    { max: Infinity, label: { de: 'Kaum Übersteuern', en: 'Barely oversteers' }, color: '#0088cc' },
  ],
  fTractionLossMult: [
    { max: 0.3,  label: { de: 'Wie auf Asphalt', en: 'Like on asphalt' },      color: '#0088cc' },
    { max: 0.7,  label: { de: 'Gut im Gelände', en: 'Good offroad' },       color: '#22c55e' },
    { max: 1.1,  label: { de: 'Normal', en: 'Normal' },               color: '#555'    },
    { max: 2.0,  label: { de: 'Schlecht im Gelände', en: 'Poor offroad' },  color: '#f97316' },
    { max: Infinity, label: { de: 'Straßenfahrzeug', en: 'Road vehicle' },  color: '#ef4444' },
  ],
  fSteeringLock: [
    { max: 20,   label: { de: 'Sehr enger Einschlag', en: 'Very tight steering' }, color: '#ef4444' },
    { max: 30,   label: { de: 'Sportlich direkt', en: 'Sporty direct' },     color: '#0088cc' },
    { max: 40,   label: { de: 'Normal', en: 'Normal' },               color: '#555'    },
    { max: 50,   label: { de: 'Großer Einschlag', en: 'Wide steering' },     color: '#22c55e' },
    { max: Infinity, label: { de: 'Extrem (Bus/Van)', en: 'Extreme (Bus/Van)' }, color: '#a78bfa' },
  ],
  fCamberStiffnesss: [
    { max: 0.1,  label: { de: 'Kein Effekt', en: 'No effect' },          color: '#555'    },
    { max: 0.4,  label: { de: 'Leicht', en: 'Slight' },               color: '#22c55e' },
    { max: 0.7,  label: { de: 'Merklich', en: 'Noticeable' },             color: '#f97316' },
    { max: Infinity, label: { de: 'Stark', en: 'Strong' },            color: '#0088cc' },
  ],
  // ── Brakes ───────────────────────────────────────────────────────
  fBrakeForce: [
    { max: 0.3,  label: { de: 'Sehr schwache Bremse', en: 'Very weak brakes' }, color: '#ef4444' },
    { max: 0.6,  label: { de: 'Schwach', en: 'Weak' },              color: '#f97316' },
    { max: 1.0,  label: { de: 'Normal', en: 'Normal' },               color: '#555'    },
    { max: 1.5,  label: { de: 'Stark', en: 'Strong' },                color: '#22c55e' },
    { max: 2.5,  label: { de: 'Sehr stark', en: 'Very strong' },           color: '#0088cc' },
    { max: Infinity, label: { de: 'Race-Bremse', en: 'Race brakes' },      color: '#a78bfa' },
  ],
  fBrakeBiasFront: [
    { max: 0.35, label: { de: 'Hinten bremst mehr', en: 'Rear brakes more' },   color: '#ef4444' },
    { max: 0.48, label: { de: 'Leicht hinten-lastig', en: 'Slightly rear-biased' }, color: '#f97316' },
    { max: 0.55, label: { de: 'Ausgeglichen', en: 'Balanced' },         color: '#22c55e' },
    { max: 0.70, label: { de: 'Vorne bremst mehr', en: 'Front brakes more' },    color: '#555'    },
    { max: Infinity, label: { de: 'Stark vorne', en: 'Heavy front' },      color: '#0088cc' },
  ],
  fHandBrakeForce: [
    { max: 0.15, label: { de: 'Kaum wirkend', en: 'Barely effective' },         color: '#555'    },
    { max: 0.35, label: { de: 'Schwach', en: 'Weak' },              color: '#f97316' },
    { max: 0.6,  label: { de: 'Normal', en: 'Normal' },               color: '#555'    },
    { max: 0.8,  label: { de: 'Gut fürs Driften', en: 'Good for drifting' },     color: '#22c55e' },
    { max: Infinity, label: { de: 'Sehr stark', en: 'Very strong' },       color: '#0088cc' },
  ],
  // ── Damage ───────────────────────────────────────────────────────
  fCollisionDamageMult: [
    { max: 0.01, label: { de: 'Unzerstörbar', en: 'Indestructible' },         color: '#22c55e' },
    { max: 0.5,  label: { de: 'Wenig Schaden', en: 'Little damage' },        color: '#0088cc' },
    { max: 1.1,  label: { de: 'Normal', en: 'Normal' },               color: '#555'    },
    { max: 3,    label: { de: 'Empfindlich', en: 'Fragile' },          color: '#f97316' },
    { max: Infinity, label: { de: 'Sehr empfindlich', en: 'Very fragile' }, color: '#ef4444' },
  ],
  fWeaponDamageMult: [
    { max: 0.01, label: { de: 'Kugelsicher', en: 'Bulletproof' },          color: '#22c55e' },
    { max: 0.5,  label: { de: 'Robust', en: 'Robust' },               color: '#0088cc' },
    { max: 1.1,  label: { de: 'Normal', en: 'Normal' },               color: '#555'    },
    { max: 3,    label: { de: 'Empfindlich', en: 'Fragile' },          color: '#f97316' },
    { max: Infinity, label: { de: 'Sehr empfindlich', en: 'Very fragile' }, color: '#ef4444' },
  ],
  fDeformationDamageMult: [
    { max: 0.01, label: { de: 'Keine Beulen', en: 'No dents' },         color: '#22c55e' },
    { max: 0.5,  label: { de: 'Kaum verformbar', en: 'Barely dents' },      color: '#0088cc' },
    { max: 1.1,  label: { de: 'Normal', en: 'Normal' },               color: '#555'    },
    { max: 3,    label: { de: 'Verbeult leicht', en: 'Dents easily' },      color: '#f97316' },
    { max: Infinity, label: { de: 'Stark verformbar', en: 'Heavily deformable' }, color: '#ef4444' },
  ],
  fEngineDamageMult: [
    { max: 0.01, label: { de: 'Unzerstörbarer Motor', en: 'Indestructible engine' }, color: '#22c55e' },
    { max: 0.5,  label: { de: 'Robust', en: 'Robust' },               color: '#0088cc' },
    { max: 1.1,  label: { de: 'Normal', en: 'Normal' },               color: '#555'    },
    { max: 3,    label: { de: 'Empfindlich', en: 'Fragile' },          color: '#f97316' },
    { max: Infinity, label: { de: 'Sehr empfindlich', en: 'Very fragile' }, color: '#ef4444' },
  ],
  fPetrolTankVolume: [
    { max: 20,   label: { de: 'Sehr klein', en: 'Very small' },           color: '#ef4444' },
    { max: 45,   label: { de: 'Klein', en: 'Small' },                color: '#f97316' },
    { max: 70,   label: { de: 'Normal', en: 'Normal' },               color: '#555'    },
    { max: 100,  label: { de: 'Groß', en: 'Large' },                 color: '#22c55e' },
    { max: Infinity, label: { de: 'Sehr groß', en: 'Very large' },        color: '#0088cc' },
  ],
  fOilVolume: [
    { max: 2,    label: { de: 'Sehr wenig', en: 'Very little' },           color: '#ef4444' },
    { max: 4,    label: { de: 'Normal', en: 'Normal' },               color: '#555'    },
    { max: 8,    label: { de: 'Viel', en: 'A lot' },                 color: '#22c55e' },
    { max: Infinity, label: { de: 'Sehr viel', en: 'Sehr viel' },        color: '#0088cc' },
  ],
  // ── Misc ─────────────────────────────────────────────────────────
  fPercentSubmerged: [
    { max: 0.5,  label: { de: 'Sinkt sofort', en: 'Sinks immediately' },         color: '#ef4444' },
    { max: 0.75, label: { de: 'Sinkt schnell', en: 'Sinks quickly' },        color: '#f97316' },
    { max: 0.88, label: { de: 'Normal', en: 'Normal' },               color: '#555'    },
    { max: 0.95, label: { de: 'Schwimmt lange', en: 'Floats for a while' },       color: '#22c55e' },
    { max: Infinity, label: { de: 'Schwimmt sehr gut', en: 'Floats very well' }, color: '#0088cc' },
  ],
};

// Fallback: generisch wenn kein spezifischer Eintrag
function getValueLabel(f, val) {
  const lang = CONFIG.language || 'de';
  const levels = VALUE_LEVELS[f.key];
  if (levels) {
    const entry = levels.find(l => val <= l.max);
    if (entry) {
      const lbl = typeof entry.label === 'object' ? (entry.label[lang] || entry.label.en) : entry.label;
      return `<span style="color:${entry.color}">${lbl}</span>`;
    }
  }
  // Generischer Fallback
  if (f.max === f.min) return '';
  const pct = (val - f.min) / (f.max - f.min);
  const fb = lang === 'de'
    ? ['Sehr niedrig','Niedrig','Mittel','Hoch','Sehr hoch']
    : ['Very low','Low','Medium','High','Very high'];
  const colors = ['#ef4444','#f97316','#555','#22c55e','#0088cc'];
  const i = pct <= 0.15 ? 0 : pct <= 0.35 ? 1 : pct <= 0.60 ? 2 : pct <= 0.80 ? 3 : 4;
  return `<span style="color:${colors[i]}">${fb[i]}</span>`;
}

function buildRow(f) {
  const val = currentValues[f.key] ?? f.default;
  const isChanged = Math.abs(val - f.default) > 0.0001;
  const div = document.createElement('div');
  div.className = 'h-row' + (isChanged ? ' changed' : '');
  div.id = 'row_' + f.key;
  const displayLabel = getLabel(f.key);
  const enLabel = LABELS[f.key]?.en || f.label;
  const levels = VALUE_LEVELS[f.key];
  let initColor = '#888';
  if (levels) { const e = levels.find(l => val <= l.max); if (e) initColor = e.color; }

  div.innerHTML = `
    <div class="h-row-label">
      <span class="h-label-text">${displayLabel}</span>
    </div>
    <div class="h-row-controls">
      <input type="range" class="nui-range" id="range_${f.key}"
             min="${f.min}" max="${f.max}" step="${f.step}" value="${val}"
             style="--thumb-color:${initColor}"
             oninput="onSlider('${f.key}', this.value)" />
    </div>
    <div class="h-val-label" id="vallabel_${f.key}">${getValueLabel(f, val)}</div>
    <input type="text" class="h-row-val" id="val_${f.key}" value="${val}"
           onchange="onValInput('${f.key}', this.value)" onclick="this.select()" />
    ${f.desc ? `<button class="h-info-btn"
      data-key="${f.key}"
      data-label="${displayLabel}"
      data-en="${enLabel}"
      data-desc="${f.desc.replace(/"/g,'&quot;')}"
      onmouseenter="showTooltip(event, this)" onmouseleave="hideTooltip()">?</button>` : ''}
    <button class="h-reset-btn" onclick="resetField('${f.key}')" title="${t('reset_title')}">&#8635;</button>`;
  return div;
}

// ── Slider / Input Sync ──────────────────────────────────────────────
function onSlider(key, val) {
  const n = parseFloat(val);
  currentValues[key] = n;
  const inp = document.getElementById('val_' + key);
  if (inp) inp.value = n;
  updateRowState(key, n);
  sendLiveUpdate(key, n);
}

function onValInput(key, val) {
  let n = parseFloat(val);
  if (isNaN(n)) return;
  const field = findField(key);
  if (field) n = Math.min(field.max, Math.max(field.min, n));
  currentValues[key] = n;
  const rng = document.getElementById('range_' + key);
  if (rng) rng.value = n;
  const inp = document.getElementById('val_' + key);
  if (inp) inp.value = n;
  updateRowState(key, n);
  sendLiveUpdate(key, n);
}

function updateRowState(key, val) {
  const field = findField(key);
  if (!field) return;

  // Value label + color
  const lang = CONFIG.language || 'de';
  const levels = VALUE_LEVELS[field.key];
  let color = '#888';
  if (levels) {
    const entry = levels.find(l => val <= l.max);
    if (entry) color = entry.color;
  }

  const lbl = document.getElementById('vallabel_' + key);
  if (lbl) lbl.innerHTML = getValueLabel(field, val);

  // Slider thumb color via CSS custom property
  const rng = document.getElementById('range_' + key);
  if (rng) rng.style.setProperty('--thumb-color', color);

  // Changed highlight
  const row = document.getElementById('row_' + key);
  if (row) {
    const changed = Math.abs(val - field.default) > 0.0001;
    row.classList.toggle('changed', changed);
  }

  updateCategoryBadge(key);
}

function updateCategoryBadge(changedKey) {
  for (const [cat, fields] of Object.entries(HANDLING_FIELDS)) {
    const count = fields.filter(f => Math.abs((currentValues[f.key] ?? f.default) - f.default) > 0.0001).length;
    const badge = document.getElementById('badge-' + cat);
    if (!badge) continue;
    if (count > 0) { badge.textContent = count; badge.classList.add('visible'); }
    else { badge.textContent = ''; badge.classList.remove('visible'); }
  }
}

function findField(key) {
  for (const fields of Object.values(HANDLING_FIELDS)) {
    const f = fields.find(x => x.key === key);
    if (f) return f;
  }
  return null;
}

function resetField(key) {
  const def = defaultValues[key];
  if (def === undefined) return;
  currentValues[key] = def;
  const rng = document.getElementById('range_' + key);
  if (rng) rng.value = def;
  const inp = document.getElementById('val_' + key);
  if (inp) inp.value = def;
  updateRowState(key, def);
}

// ── Load values into UI ──────────────────────────────────────────────
function loadValues(data) {
  currentValues = { ...defaultValues, ...data };
  for (const key of Object.keys(currentValues)) {
    const rng = document.getElementById('range_' + key);
    const inp = document.getElementById('val_' + key);
    if (rng) rng.value = currentValues[key];
    if (inp) inp.value = currentValues[key];
    updateRowState(key, currentValues[key]);
  }
  updateCategoryBadge();
}

// ── NUI Communication ─────────────────────────────────────────────────
function nuiFetch(endpoint, data) {
  return fetch(`https://${_getResName()}/${endpoint}`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(data ?? {})
  }).catch(() => {});
}

function sendLiveUpdate(key, value) {
  nuiFetch('liveUpdate', { key, value });
}

function applyHandling() {
  nuiFetch('applyAll', { handling: currentValues });
  showToast(t('toast_applied'));
}

function closeMenu() {
  nuiFetch('closeMenu', {});
  document.getElementById('nuiMenu').style.display = 'none';
}

// GetParentResourceName — Native sichern, Fallback für Browser-Preview
const _getResName = typeof GetParentResourceName !== 'undefined' ? GetParentResourceName : () => 'hm-handling';

// ── NUI Message Listener ─────────────────────────────────────────────
window.addEventListener('message', function(e) {
  const d = e.data;
  if (!d || !d.action) return;

  switch (d.action) {
    case 'openMenu':
      document.getElementById('nuiMenu').style.display = 'flex';
      if (d.vehicleName) document.getElementById('vehicleName').innerHTML = `<i class="bi bi-car-front"></i> ${d.vehicleName}`;
      // Texte aus config_nui.lua überschreiben
      if (d.translations) Object.assign(TRANSLATIONS, d.translations);
      if (d.labels)        Object.assign(LABELS, d.labels);
      if (d.valueLevels) {
        // Lua schickt max=99999 statt Infinity — zurück konvertieren
        for (const [key, levels] of Object.entries(d.valueLevels)) {
          VALUE_LEVELS[key] = levels.map(l => ({ ...l, max: l.max >= 99999 ? Infinity : l.max }));
        }
      }
      if (d.config) {
        if (d.config.language)  CONFIG.language  = d.config.language;
        if (d.config.labelMode) CONFIG.labelMode = d.config.labelMode;
      }
      if (d.handling)    loadValues(d.handling);
      if (d.profiles)    renderProfiles(d.profiles);
      refreshAllLabels();
      break;
    case 'closeMenu':
      document.getElementById('nuiMenu').style.display = 'none';
      break;
    case 'updateProfiles':
      if (d.profiles) renderProfiles(d.profiles);
      break;
    case 'updateVehicle':
      if (d.vehicleName) document.getElementById('vehicleName').innerHTML = `<i class="bi bi-car-front"></i> ${d.vehicleName}`;
      if (d.handling)    loadValues(d.handling);
      break;
  }
});

// ── Search ────────────────────────────────────────────────────────────
const SEARCH_TAB_BTN = null; // dynamisch

function onSearch(query) {
  query = query.trim().toLowerCase();

  if (!query) {
    // Zurück zum letzten aktiven Tab oder Engine
    const lastActive = document.querySelector('.nui-tab[data-last="true"]');
    if (lastActive) {
      lastActive.click();
    } else {
      const firstTab = document.querySelector('.nui-tab[data-cat="engine"]');
      if (firstTab) firstTab.click();
    }
    return;
  }

  // Alle Felder über alle Kategorien durchsuchen
  const allFields = Object.values(HANDLING_FIELDS).flat();
  const results = allFields.filter(f => {
    const haystack = [
      f.label, f.key, f.desc,
      ...(f.tags || [])
    ].join(' ').toLowerCase();
    return query.split(' ').every(word => haystack.includes(word));
  });

  // Search-Tab aktivieren
  document.querySelectorAll('.nui-tab-pane').forEach(p => p.classList.remove('active'));
  document.querySelectorAll('.nui-tab').forEach(b => b.classList.remove('active'));
  document.getElementById('tab-search').classList.add('active');

  const container = document.getElementById('rows-search');
  const countEl   = document.getElementById('search-count');
  countEl.textContent = results.length + ' Ergebnis' + (results.length !== 1 ? 'se' : '');

  if (results.length === 0) {
    container.innerHTML = `<div style="text-align:center;color:#444;font-size:12px;padding:30px 0;">
      <div style="font-size:24px;margin-bottom:8px;">&#128269;</div>
      ${t('search_no_results')} "<strong style="color:#666;">${query}</strong>"
    </div>`;
    return;
  }

  container.innerHTML = '';
  results.forEach(f => {
    const row = buildRow(f);
    // Kategorie-Badge hinzufügen
    const cat = Object.entries(HANDLING_FIELDS).find(([, fields]) => fields.find(x => x.key === f.key))?.[0];
    if (cat) {
      const badge = document.createElement('span');
      badge.style.cssText = 'font-size:9px;font-weight:700;text-transform:uppercase;letter-spacing:0.08em;color:#0088cc;background:rgba(0,136,204,0.1);border:1px solid rgba(0,136,204,0.15);padding:1px 5px;border-radius:3px;margin-left:4px;flex-shrink:0;';
      badge.textContent = cat;
      row.querySelector('.h-row-label').appendChild(badge);
    }
    container.appendChild(row);
  });
}

// Merke welcher Tab zuletzt aktiv war (nicht Search)
function initTabTracking() {
  document.querySelectorAll('.nui-tab[data-cat]').forEach(btn => {
    btn.addEventListener('click', () => {
      document.querySelectorAll('.nui-tab[data-cat]').forEach(b => b.removeAttribute('data-last'));
      btn.setAttribute('data-last', 'true');
      const si = document.getElementById('searchInput');
      if (si) si.value = '';
    });
  });
}

// ── Tooltip ───────────────────────────────────────────────────────────
const tooltip = document.getElementById('nui-tooltip');

function showTooltip(e, btn) {
  if (!tooltip) return;
  if (!tooltip) tooltip = document.getElementById('nui-tooltip');
  const label = btn.dataset.label;
  const key   = btn.dataset.key;
  const en    = btn.dataset.en;
  const desc  = btn.dataset.desc;
  document.getElementById('tt-title').textContent = label;
  document.getElementById('tt-key').innerHTML = `<span style="color:#0088cc;font-family:monospace;">${key}</span>${en && en !== label ? `<span style="color:#444;margin-left:6px;">· ${en}</span>` : ''}`;
  document.getElementById('tt-desc').textContent  = desc;
  tooltip.style.display = 'block';
  positionTooltip(e);
}

function hideTooltip() {
  if (!tooltip) return;
  tooltip.style.display = 'none';
}

document.addEventListener('mousemove', e => {
  if (tooltip && tooltip.style.display === 'block') positionTooltip(e);
});

function positionTooltip(e) {
  const menu   = document.getElementById('nuiMenu').getBoundingClientRect();
  const tw     = 290;
  const margin = 12;
  let x = e.clientX - menu.left + margin;
  let y = e.clientY - menu.top  + margin;
  if (x + tw > menu.width  - 8) x = e.clientX - menu.left - tw - margin;
  if (y + 120 > menu.height - 8) y = e.clientY - menu.top  - 120;
  tooltip.style.left = x + 'px';
  tooltip.style.top  = y + 'px';
}

// ── Reset All ─────────────────────────────────────────────────────────
function resetAllValues() {
  loadValues({ ...defaultValues });
  showToast('↺ Alle Werte zurückgesetzt');
}

// ── Profile System ────────────────────────────────────────────────────
function openSaveModal() {
  document.getElementById('profileNameInput').value = '';
  document.getElementById('saveModal').style.display = 'flex';
  setTimeout(() => document.getElementById('profileNameInput').focus(), 50);
}

function closeSaveModal() {
  document.getElementById('saveModal').style.display = 'none';
}

function saveProfile() {
  const name = document.getElementById('profileNameInput').value.trim();
  if (!name) { showToast(t('toast_no_name')); return; }

  // Server speichert — Antwort kommt via updateProfiles Event
  nuiFetch('saveProfile', {
    name:     name,
    handling: { ...currentValues },
  });

  closeSaveModal();
}

function loadProfile(profileData) {
  // profileData ist das ganze Profil-Objekt aus dem Server
  if (!profileData || !profileData.data) return;
  loadValues(profileData.data);
  activeProfileName = profileData.name;
  // Auch ans Fahrzeug senden
  nuiFetch('loadProfile', { handling: profileData.data });
  renderProfiles(profiles);
  showToast(t('toast_loaded', profileData.name));
}

function deleteProfile(profileId, profileName) {
  nuiFetch('deleteProfile', { id: profileId });
  showToast(t('toast_deleted', profileName));
}

function renderProfiles(profileList) {
  if (profileList) profiles = profileList;
  const container = document.getElementById('profile-list');
  if (!profiles || profiles.length === 0) {
    container.innerHTML = `<div style="text-align:center;color:#444;font-size:12px;padding:30px 0;">
      <i class="bi bi-bookmark" style="font-size:24px;display:block;margin-bottom:8px;"></i>
      ${t('profiles_empty')}</div>`;
    return;
  }
  container.innerHTML = profiles.map(p => `
    <div class="profile-card ${p.name === activeProfileName ? 'active-profile' : ''}">
      <div>
        <div class="profile-name">${p.name}</div>
        <div class="profile-meta">${p.vehicle || ''} &bull; ${p.date || ''}</div>
      </div>
      <div class="d-flex gap-1">
        <button class="nui-btn sm primary" onclick='loadProfile(${JSON.stringify(p)})'><i class="bi bi-download"></i> Laden</button>
        <button class="nui-btn sm danger"  onclick="deleteProfile(${p.id}, '${p.name.replace(/'/g, "\\'")}')"><i class="bi bi-trash"></i></button>
      </div>
    </div>`).join('');
}

// ── Export / Import JSON ──────────────────────────────────────────────
function exportJSON() {
  const json = JSON.stringify(currentValues, null, 2);
  const blob = new Blob([json], { type: 'application/json' });
  const a = document.createElement('a');
  a.href = URL.createObjectURL(blob);
  a.download = 'handling.json';
  a.click();
  showToast(t('toast_exported'));
}

function openImportModal() {
  document.getElementById('importJSON').value = '';
  document.getElementById('importModal').style.display = 'flex';
}

function importJSON() {
  try {
    const data = JSON.parse(document.getElementById('importJSON').value);
    loadValues(data);
    document.getElementById('importModal').style.display = 'none';
    showToast(t('toast_imported'));
  } catch {
    showToast(t('toast_import_error'));
  }
}

function toggleLabelMode() {
  CONFIG.labelMode = CONFIG.labelMode === 'simple' ? 'technical' : 'simple';
  refreshAllLabels();
}

function applyTranslations() {
  // Alle data-i18n Elemente updaten
  document.querySelectorAll('[data-i18n]').forEach(el => {
    const key = el.dataset.i18n;
    const val = t(key);
    if (val && val !== key) el.textContent = val;
  });
  // Search placeholder
  const si = document.getElementById('searchInput');
  if (si) si.placeholder = t('search_placeholder');
  // Label-Mode Button
  const lmBtn = document.getElementById('labelModeBtn');
  if (lmBtn) {
    const span = lmBtn.querySelector('[data-i18n]');
    if (span) span.textContent = CONFIG.labelMode === 'simple' ? t('btn_label_simple') : t('btn_label_technical');
    lmBtn.style.color = CONFIG.labelMode === 'technical' ? '#0088cc' : '';
  }
  // Alle Value-Labels neu rendern (Sprache hat sich geändert)
  for (const fields of Object.values(HANDLING_FIELDS)) {
    for (const f of fields) {
      const val = currentValues[f.key] ?? f.default;
      const lbl = document.getElementById('vallabel_' + f.key);
      if (lbl) lbl.innerHTML = getValueLabel(f, val);
    }
  }
}

function refreshAllLabels() {
  // Alle gerenderten Zeilen updaten
  for (const fields of Object.values(HANDLING_FIELDS)) {
    for (const f of fields) {
      const labelEl = document.querySelector(`#row_${f.key} .h-label-text`);
      const infoBtn = document.querySelector(`#row_${f.key} .h-info-btn`);
      if (labelEl) labelEl.textContent = getLabel(f.key);
      if (infoBtn) infoBtn.dataset.label = getLabel(f.key);
    }
  }
  applyTranslations();
  // Search-Ergebnisse auch updaten falls aktiv
  const si = document.getElementById('searchInput');
  if (si && si.value.trim()) onSearch(si.value);
}

function togglePresetMenu() {
  const m = document.getElementById('presetMenu');
  m.style.display = m.style.display === 'none' ? 'block' : 'none';
}
document.addEventListener('click', e => {
  if (!e.target.closest('#presetBtn') && !e.target.closest('#presetMenu')) {
    const m = document.getElementById('presetMenu');
    if (m) m.style.display = 'none';
  }
});

// ── Tab Switch ────────────────────────────────────────────────────────
function switchTab(id, btn) {
  document.querySelectorAll('.nui-tab-pane').forEach(p => p.classList.remove('active'));
  document.querySelectorAll('.nui-tab').forEach(b => b.classList.remove('active'));
  document.getElementById(id).classList.add('active');
  btn.classList.add('active');
}

// ── Toast ─────────────────────────────────────────────────────────────
let toastTimer;
function showToast(msg) {
  const t = document.getElementById('nui-toast');
  t.textContent = msg;
  t.classList.add('show');
  clearTimeout(toastTimer);
  toastTimer = setTimeout(() => t.classList.remove('show'), 2000);
}

// ── ESC ───────────────────────────────────────────────────────────────
document.addEventListener('keydown', e => { if (e.key === 'Escape') closeMenu(); });

// ── Startup ───────────────────────────────────────────────────────────
initFields();
renderProfiles([]);
initTabTracking();
applyTranslations();
