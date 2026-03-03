-- ══════════════════════════════════════════════════════════════════
--  HM Handling — NUI Sprach-Config
--  MopsScripts | Editierbar: Texte, Labels, Wert-Beschreibungen
-- ══════════════════════════════════════════════════════════════════

Config.NUI = {}

-- ══════════════════════════════════════════════════════════════════
--  UI-Texte (Buttons, Tabs, Meldungen)
-- ══════════════════════════════════════════════════════════════════
Config.NUI.Translations = {
    de = {
        tab_engine        = 'Motor',
        tab_transmission  = 'Getriebe',
        tab_suspension    = 'Fahrwerk',
        tab_traction      = 'Traktion',
        tab_brakes        = 'Bremsen',
        tab_damage        = 'Schaden',
        tab_misc          = 'Sonstiges',
        tab_profiles      = 'Profile',
        tab_search        = 'Suche',
        section_handling  = 'Handling',
        section_manage    = 'Verwaltung',

        btn_label_simple    = '📖 Einfach',
        btn_label_technical = '🔬 fBrakeForce',
        btn_preset          = '📄 Preset',
        btn_close           = 'Schließen',
        btn_apply           = 'Anwenden',
        btn_save            = 'Speichern',
        btn_load            = 'Laden',
        btn_export          = 'JSON Export',
        btn_import          = 'JSON Import',
        search_placeholder  = 'Was willst du anpassen?',

        profiles_title      = 'Gespeicherte Profile',
        profiles_empty      = 'Keine Profile gespeichert',
        profiles_save_btn   = 'Speichern',
        modal_save_title    = 'Profil speichern',
        modal_save_name     = 'Profilname',
        modal_cancel        = 'Abbrechen',
        modal_import_title  = 'Handling importieren',
        modal_import_paste  = 'Handling JSON hier einfügen…',
        modal_import_btn    = 'Importieren',

        search_results      = 'Suchergebnisse',
        search_no_results   = 'Keine Ergebnisse gefunden',

        toast_applied       = '✓ Handling angewendet',
        toast_no_name       = '⚠ Bitte einen Namen eingeben',
        toast_imported      = '✓ JSON importiert',
        toast_import_error  = '⚠ Ungültiges JSON Format',
        toast_exported      = '↑ JSON exportiert',
        toast_reset_all     = '↺ Alle Werte zurückgesetzt',

        reset_title         = 'Zurücksetzen',
        no_vehicle          = 'Kein Fahrzeug',
    },
    en = {
        tab_engine        = 'Engine',
        tab_transmission  = 'Transmission',
        tab_suspension    = 'Suspension',
        tab_traction      = 'Traction',
        tab_brakes        = 'Brakes',
        tab_damage        = 'Damage',
        tab_misc          = 'Misc',
        tab_profiles      = 'Profiles',
        tab_search        = 'Search',
        section_handling  = 'Handling',
        section_manage    = 'Management',

        btn_label_simple    = '📖 Simple',
        btn_label_technical = '🔬 fBrakeForce',
        btn_preset          = '📄 Preset',
        btn_close           = 'Close',
        btn_apply           = 'Apply',
        btn_save            = 'Save',
        btn_load            = 'Load',
        btn_export          = 'JSON Export',
        btn_import          = 'JSON Import',
        search_placeholder  = 'What do you want to adjust?',

        profiles_title      = 'Saved Profiles',
        profiles_empty      = 'No profiles saved',
        profiles_save_btn   = 'Save',
        modal_save_title    = 'Save Profile',
        modal_save_name     = 'Profile name',
        modal_cancel        = 'Cancel',
        modal_import_title  = 'Import Handling',
        modal_import_paste  = 'Paste handling JSON here…',
        modal_import_btn    = 'Import',

        search_results      = 'Search Results',
        search_no_results   = 'No results found',

        toast_applied       = '✓ Handling applied',
        toast_no_name       = '⚠ Please enter a name',
        toast_imported      = '✓ JSON imported',
        toast_import_error  = '⚠ Invalid JSON format',
        toast_exported      = '↑ JSON exported',
        toast_reset_all     = '↺ All values reset',

        reset_title         = 'Reset',
        no_vehicle          = 'No vehicle',
    },
}

-- ══════════════════════════════════════════════════════════════════
--  Feld-Labels
--  de / en = Fachbegriff  |  simple / simpleEn = Alltagssprache
-- ══════════════════════════════════════════════════════════════════
Config.NUI.Labels = {
    fMass                           = { de = 'Fahrzeuggewicht (kg)',           en = 'Vehicle Weight (kg)',          simple = 'Wie schwer ist das Auto?',                                            simpleEn = 'How heavy is the car?' },
    fInitialDragCoeff               = { de = 'Luftwiderstand',                 en = 'Air Resistance',               simple = 'Wird das Auto bei hoher Geschwindigkeit ausgebremst?',                 simpleEn = 'Does the car slow down at high speed due to air?' },
    fDownforceModifier              = { de = 'Anpressdruck (Flügel)',          en = 'Downforce',                    simple = 'Wie stark drückt der Spoiler das Auto auf die Straße?',                simpleEn = 'How hard does the spoiler push the car onto the road?' },
    fDriveBiasFront                 = { de = 'Antriebsart (RWD/FWD/AWD)',      en = 'Drive Bias Front',             simple = 'Welche Räder werden angetrieben? (0 = hinten, 0.5 = alle, 1 = vorne)', simpleEn = 'Which wheels are driven? (0 = rear, 0.5 = all, 1 = front)' },
    nInitialDriveGears              = { de = 'Anzahl Gänge',                   en = 'Number of Gears',              simple = 'Wie viele Gänge hat das Getriebe?',                                   simpleEn = 'How many gears does the transmission have?' },
    fInitialDriveForce              = { de = 'Motorkraft (Beschleunigung)',     en = 'Acceleration / Drive Force',   simple = 'Wie stark beschleunigt das Auto?',                                    simpleEn = 'How strongly does the car accelerate?' },
    fDriveInertia                   = { de = 'Motorträgheit',                  en = 'Drive Inertia',                simple = 'Wie schnell reagiert der Motor aufs Gas? (1.0 = normal)',               simpleEn = 'How fast does the engine respond to throttle? (1.0 = normal)' },
    fInitialDriveMaxFlatVel         = { de = 'Höchstgeschwindigkeit',          en = 'Top Speed',                    simple = 'Wie schnell fährt das Auto maximal?',                                 simpleEn = 'What is the maximum speed of the car?' },
    fClutchChangeRateScaleUpShift   = { de = 'Schaltzeit (Hochschalten)',      en = 'Gear Upshift Time',            simple = 'Wie schnell schaltet das Auto einen Gang hoch?',                      simpleEn = 'How fast does the car shift up a gear?' },
    fClutchChangeRateScaleDownShift = { de = 'Schaltzeit (Runterschalten)',    en = 'Gear Downshift Time',          simple = 'Wie schnell schaltet das Auto einen Gang runter?',                     simpleEn = 'How fast does the car shift down a gear?' },
    fLowSpeedTractionLossMult       = { de = 'Durchdrehen bei Langsamfahrt',   en = 'Low Speed Burnout Mult',       simple = 'Drehen die Reifen beim Anfahren durch?',                              simpleEn = 'Do the tires spin when pulling away?' },
    fTractionCurveLateral           = { de = 'Seitengrip-Kurve',               en = 'Traction Curve Lateral',       simple = 'Ab welchem Winkel fängt das Auto an zu rutschen?',                     simpleEn = 'At what angle does the car start to slide?' },
    fTractionSpringDeltaMax         = { de = 'Reifenwand-Federweg (seitlich)', en = 'Traction Spring Delta Max',    simple = 'Wie weit können die Reifen seitlich wegknicken?',                      simpleEn = 'How far can the tires flex sideways?' },
    fTractionBiasFront              = { de = 'Gripverteilung Vorne/Hinten',    en = 'Traction Bias Front',          simple = 'Haben Vorder- und Hinterreifen gleich viel Grip?',                     simpleEn = 'Do front and rear tires have equal grip?' },
    fSuspensionForce                = { de = 'Federsteifigkeit',               en = 'Spring Strength',              simple = 'Wie hart oder weich sind die Federn?',                                simpleEn = 'How hard or soft are the springs?' },
    fSuspensionCompDamp             = { de = 'Dämpfung (Einfedern)',           en = 'Damping (Compression)',        simple = 'Wie schnell federt das Auto ein (z.B. bei Bodenwellen)?',              simpleEn = 'How fast does the car compress (e.g. over bumps)?' },
    fSuspensionReboundDamp          = { de = 'Dämpfung (Ausfedern)',           en = 'Damping (Rebound)',            simple = 'Wie schnell federt das Auto wieder aus? (Hüpfverhalten)',              simpleEn = 'How fast does the car bounce back? (bounciness)' },
    fSuspensionUpperLimit           = { de = 'Federweg oben (max.)',           en = 'Suspension Upper Limit',       simple = 'Wie weit können die Räder nach oben eintauchen?',                      simpleEn = 'How far can the wheels travel upward?' },
    fSuspensionLowerLimit           = { de = 'Federweg unten (max.)',          en = 'Suspension Lower Limit',       simple = 'Wie weit können die Räder nach unten hängen?',                         simpleEn = 'How far can the wheels hang downward?' },
    fSuspensionRaise                = { de = 'Fahrzeughöhe / Tieferlegung',    en = 'Ride Height / Stance',         simple = 'Wie hoch oder tief liegt das Auto? (Minus = tiefer)',                  simpleEn = 'How high or low does the car sit? (negative = lower)' },
    fSuspensionBiasFront            = { de = 'Federverteilung Vorne/Hinten',   en = 'Spring Bias Front',            simple = 'Sind Vorder- und Hinterfedern gleich stark?',                          simpleEn = 'Are front and rear springs equally strong?' },
    fAntiRollBarForce               = { de = 'Stabilisatorkraft (Wankschutz)', en = 'Anti-Roll Bar Force',          simple = 'Wie stark neigt sich das Auto in Kurven zur Seite?',                   simpleEn = 'How much does the car lean in corners?' },
    fAntiRollBarBiasFront           = { de = 'Stabilisatorverteilung',         en = 'Anti-Roll Bias Front',         simple = 'Wo wirkt der Wankschutz stärker — vorne oder hinten?',                 simpleEn = 'Where does the anti-roll bar act stronger — front or rear?' },
    fRollCentreHeightFront          = { de = 'Rollzentrum Höhe (vorne)',       en = 'Roll Centre Height Front',     simple = 'Wo liegt der Drehpunkt beim Kurvenneigen (vorne)?',                    simpleEn = 'Where is the pivot point when cornering (front)?' },
    fRollCentreHeightRear           = { de = 'Rollzentrum Höhe (hinten)',      en = 'Roll Centre Height Rear',      simple = 'Wo liegt der Drehpunkt beim Kurvenneigen (hinten)?',                   simpleEn = 'Where is the pivot point when cornering (rear)?' },
    fTractionCurveMax               = { de = 'Reifengrip (Maximum)',           en = 'Tire Grip (Max)',              simple = 'Wie viel Grip haben die Reifen maximal?',                             simpleEn = 'How much grip do the tires have at maximum?' },
    fTractionCurveMin               = { de = 'Reifengrip (beim Gleiten)',      en = 'Tire Grip (Min / Sliding)',    simple = 'Wie viel Grip bleibt noch beim Rutschen?',                            simpleEn = 'How much grip remains when sliding?' },
    fTractionLossMult               = { de = 'Traktion im Gelände',            en = 'Offroad Traction Loss',        simple = 'Wie gut kommt das Auto abseits der Straße voran?',                     simpleEn = 'How well does the car cope off-road?' },
    fSteeringLock                   = { de = 'Maximaler Lenkeinschlag',        en = 'Max Steering Angle',           simple = 'Wie eng kann das Auto einlenken / wenden?',                            simpleEn = 'How tight can the car steer / turn?' },
    fCamberStiffnesss               = { de = 'Sturzsteifigkeit',               en = 'Camber Stiffness',             simple = 'Wie stark beeinflusst die Radneigung den Grip?',                       simpleEn = 'How strongly does wheel camber affect grip?' },
    fBrakeForce                     = { de = 'Bremskraft',                     en = 'Brake Force',                  simple = 'Wie stark bremst das Auto?',                                          simpleEn = 'How strongly does the car brake?' },
    fBrakeBiasFront                 = { de = 'Bremsverteilung Vorne/Hinten',   en = 'Brake Bias Front',             simple = 'Bremsen Vorder- oder Hinterräder stärker?',                           simpleEn = 'Do front or rear wheels brake harder?' },
    fHandBrakeForce                 = { de = 'Handbremse (Driften)',           en = 'Handbrake Force',              simple = 'Wie stark zieht die Handbremse? (Wichtig fürs Driften)',               simpleEn = 'How strong is the handbrake? (important for drifting)' },
    fCollisionDamageMult            = { de = 'Kollisionsschaden (Faktor)',     en = 'Collision Damage Mult',        simple = 'Wie viel Schaden nimmt das Auto bei Zusammenstößen?',                  simpleEn = 'How much damage does the car take in collisions?' },
    fWeaponDamageMult               = { de = 'Waffenschaden (Faktor)',         en = 'Weapon Damage Mult',           simple = 'Wie viel Schaden machen Waffen am Auto? (0 = unzerstörbar)',           simpleEn = 'How much damage do weapons do to the car? (0 = indestructible)' },
    fDeformationDamageMult          = { de = 'Verformungsschaden (Faktor)',    en = 'Deformation Damage Mult',      simple = 'Wie stark verbeult das Auto bei Unfällen?',                            simpleEn = 'How much does the car dent in crashes?' },
    fEngineDamageMult               = { de = 'Motorschaden (Faktor)',          en = 'Engine Damage Mult',           simple = 'Wie leicht geht der Motor bei Schäden kaputt?',                       simpleEn = 'How easily does the engine break from damage?' },
    fPetrolTankVolume               = { de = 'Tankvolumen (Liter)',            en = 'Fuel Tank Volume',             simple = 'Wie viel Benzin fasst der Tank?',                                     simpleEn = 'How much fuel does the tank hold?' },
    fOilVolume                      = { de = 'Ölmenge (Liter)',               en = 'Oil Volume',                   simple = 'Wie viel Öl ist im Motor?',                                           simpleEn = 'How much oil is in the engine?' },
    fSeatOffsetDistX                = { de = 'Sitzposition Links/Rechts',      en = 'Seat Offset X',                simple = 'Ist der Fahrersitz zu weit links oder rechts?',                       simpleEn = 'Is the driver seat too far left or right?' },
    fSeatOffsetDistY                = { de = 'Sitzposition Vor/Zurück',        en = 'Seat Offset Y',                simple = 'Ist der Fahrersitz zu weit vorne oder hinten?',                       simpleEn = 'Is the driver seat too far forward or back?' },
    fSeatOffsetDistZ                = { de = 'Sitzposition Oben/Unten',        en = 'Seat Offset Z',                simple = 'Sitzt der Fahrer zu hoch oder zu tief?',                              simpleEn = 'Is the driver sitting too high or too low?' },
    nMonetaryValue                  = { de = 'Fahrzeugwert ($)',               en = 'Monetary Value',               simple = 'Wie viel ist das Fahrzeug wert?',                                     simpleEn = 'How much is the vehicle worth?' },
    fPopUpLightRotation             = { de = 'Klappscheinwerfer Winkel',       en = 'Popup Light Rotation',         simple = 'Winkel der ausfahrenden Scheinwerfer (nur Klapplichter)',              simpleEn = 'Angle of popup headlights (only for flip-up lights)' },
    fPercentSubmerged               = { de = 'Schwimmgrenze (% Eintauchen)',   en = 'Float at % Submerged',         simple = 'Wie tief muss das Auto ins Wasser bis es sinkt?',                      simpleEn = 'How deep must the car go into water before it sinks?' },
}

-- ══════════════════════════════════════════════════════════════════
--  Wert-Beschreibungen pro Regler
--  max = 99999 entspricht "kein Limit" (letzter Eintrag)
-- ══════════════════════════════════════════════════════════════════
Config.NUI.ValueLevels = {
    fMass = {
        { max = 600,   label = { de = 'Motorrad',          en = 'Motorcycle'        }, color = '#a78bfa' },
        { max = 1200,  label = { de = 'Kleinwagen',        en = 'Compact Car'       }, color = '#60a5fa' },
        { max = 1600,  label = { de = 'Sportwagen',        en = 'Sports Car'        }, color = '#22c55e' },
        { max = 2000,  label = { de = 'Mittelklasse',      en = 'Mid-size'          }, color = '#555'    },
        { max = 3000,  label = { de = 'SUV / Muscle',      en = 'SUV / Muscle'      }, color = '#f97316' },
        { max = 6000,  label = { de = 'Van / Transporter', en = 'Van / Transporter' }, color = '#ef4444' },
        { max = 99999, label = { de = 'LKW / Bus',         en = 'Truck / Bus'       }, color = '#7f1d1d' },
    },
    fInitialDragCoeff = {
        { max = 2,     label = { de = 'Kaum Widerstand',      en = 'Barely any drag'  }, color = '#0088cc' },
        { max = 5,     label = { de = 'Niedrig',              en = 'Low'              }, color = '#22c55e' },
        { max = 8,     label = { de = 'Normal',               en = 'Normal'           }, color = '#555'    },
        { max = 15,    label = { de = 'Spürbar',              en = 'Noticeable'       }, color = '#f97316' },
        { max = 99999, label = { de = 'Sehr viel Widerstand', en = 'Very high drag'   }, color = '#ef4444' },
    },
    fBrakeForce = {
        { max = 0.3,   label = { de = 'Sehr schwache Bremse', en = 'Very weak brakes' }, color = '#ef4444' },
        { max = 0.6,   label = { de = 'Schwach',              en = 'Weak'             }, color = '#f97316' },
        { max = 1.0,   label = { de = 'Normal',               en = 'Normal'           }, color = '#555'    },
        { max = 1.5,   label = { de = 'Stark',                en = 'Strong'           }, color = '#22c55e' },
        { max = 2.5,   label = { de = 'Sehr stark',           en = 'Very strong'      }, color = '#0088cc' },
        { max = 99999, label = { de = 'Race-Bremse',          en = 'Race brakes'      }, color = '#a78bfa' },
    },
    fHandBrakeForce = {
        { max = 0.15,  label = { de = 'Kaum wirkend',     en = 'Barely effective'  }, color = '#555'    },
        { max = 0.35,  label = { de = 'Schwach',          en = 'Weak'              }, color = '#f97316' },
        { max = 0.6,   label = { de = 'Normal',           en = 'Normal'            }, color = '#555'    },
        { max = 0.8,   label = { de = 'Gut fürs Driften', en = 'Good for drifting' }, color = '#22c55e' },
        { max = 99999, label = { de = 'Sehr stark',       en = 'Very strong'       }, color = '#0088cc' },
    },
    -- Weitere Felder nach Bedarf ergänzen...
}
