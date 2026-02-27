-- ══════════════════════════════════════════════════════════════════
--  HM Handling — NUI Sprach-Config
--  MopsScripts | Editierbar: Texte, Labels, Wert-Beschreibungen
--  Die NUI (index.html) liest alle Texte aus dieser Datei.
--  Sprache einstellen in config.lua → Config.Language
-- ══════════════════════════════════════════════════════════════════

Config.NUI = {}

-- ══════════════════════════════════════════════════════════════════
--  UI-Texte (Buttons, Tabs, Meldungen)
-- ══════════════════════════════════════════════════════════════════
Config.NUI.Translations = {
    de = {
        -- Sidebar Tabs
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

        -- Header Buttons
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

        -- Profile
        profiles_title    = 'Gespeicherte Profile',
        profiles_empty    = 'Keine Profile gespeichert',
        profiles_save_btn = 'Speichern',
        modal_save_title  = 'Profil speichern',
        modal_save_name   = 'Profilname',
        modal_cancel      = 'Abbrechen',
        modal_import_title = 'Handling importieren',
        modal_import_paste = 'Handling JSON hier einfügen…',
        modal_import_btn   = 'Importieren',

        -- Suche
        search_results      = 'Suchergebnisse',
        search_no_results   = 'Keine Ergebnisse gefunden',

        -- Meldungen (Toasts)
        toast_applied       = '✓ Handling angewendet',
        toast_no_name       = '⚠ Bitte einen Namen eingeben',
        toast_imported      = '✓ JSON importiert',
        toast_import_error  = '⚠ Ungültiges JSON Format',
        toast_exported      = '↑ JSON exportiert',
        toast_reset_all     = '↺ Alle Werte zurückgesetzt',

        -- Sonstiges
        reset_title = 'Zurücksetzen',
        no_vehicle  = 'Kein Fahrzeug',
    },
    en = {
        -- Sidebar Tabs
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

        -- Header Buttons
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

        -- Profile
        profiles_title    = 'Saved Profiles',
        profiles_empty    = 'No profiles saved',
        profiles_save_btn = 'Save',
        modal_save_title  = 'Save Profile',
        modal_save_name   = 'Profile name',
        modal_cancel      = 'Cancel',
        modal_import_title = 'Import Handling',
        modal_import_paste = 'Paste handling JSON here…',
        modal_import_btn   = 'Import',

        -- Search
        search_results    = 'Search Results',
        search_no_results = 'No results found',

        -- Toasts
        toast_applied      = '✓ Handling applied',
        toast_no_name      = '⚠ Please enter a name',
        toast_imported     = '✓ JSON imported',
        toast_import_error = '⚠ Invalid JSON format',
        toast_exported     = '↑ JSON exported',
        toast_reset_all    = '↺ All values reset',

        -- Misc
        reset_title = 'Reset',
        no_vehicle  = 'No vehicle',
    },
}

-- ══════════════════════════════════════════════════════════════════
--  Feld-Labels
--  de        = Fachbegriff Deutsch
--  en        = Fachbegriff Englisch
--  simple    = Alltagssprache Deutsch
--  simpleEn  = Alltagssprache Englisch
-- ══════════════════════════════════════════════════════════════════
Config.NUI.Labels = {
    fMass                           = { de = 'Fahrzeuggewicht (kg)',           en = 'Vehicle Weight (kg)',          simple = 'Wie schwer ist das Auto?',                                         simpleEn = 'How heavy is the car?' },
    fInitialDragCoeff               = { de = 'Luftwiderstand',                 en = 'Air Resistance',               simple = 'Wird das Auto bei hoher Geschwindigkeit ausgebremst?',              simpleEn = 'Does the car slow down at high speed due to air?' },
    fDownforceModifier               = { de = 'Anpressdruck (Flügel)',          en = 'Downforce',                    simple = 'Wie stark drückt der Spoiler das Auto auf die Straße?',             simpleEn = 'How hard does the spoiler push the car onto the road?' },
    fDriveBiasFront                 = { de = 'Antriebsart (RWD/FWD/AWD)',      en = 'Drive Bias Front',             simple = 'Welche Räder werden angetrieben? (0 = hinten, 0.5 = alle, 1 = vorne)', simpleEn = 'Which wheels are driven? (0 = rear, 0.5 = all, 1 = front)' },
    nInitialDriveGears              = { de = 'Anzahl Gänge',                   en = 'Number of Gears',              simple = 'Wie viele Gänge hat das Getriebe?',                                simpleEn = 'How many gears does the transmission have?' },
    fInitialDriveForce              = { de = 'Motorkraft (Beschleunigung)',     en = 'Acceleration / Drive Force',   simple = 'Wie stark beschleunigt das Auto?',                                 simpleEn = 'How strongly does the car accelerate?' },
    fDriveInertia                   = { de = 'Motorträgheit',                  en = 'Drive Inertia',                simple = 'Wie schnell reagiert der Motor aufs Gas? (1.0 = normal)',            simpleEn = 'How fast does the engine respond to throttle? (1.0 = normal)' },
    fInitialDriveMaxFlatVel         = { de = 'Höchstgeschwindigkeit',          en = 'Top Speed',                    simple = 'Wie schnell fährt das Auto maximal?',                              simpleEn = 'What is the maximum speed of the car?' },
    fClutchChangeRateScaleUpShift   = { de = 'Schaltzeit (Hochschalten)',      en = 'Gear Upshift Time',            simple = 'Wie schnell schaltet das Auto einen Gang hoch?',                   simpleEn = 'How fast does the car shift up a gear?' },
    fClutchChangeRateScaleDownShift = { de = 'Schaltzeit (Runterschalten)',    en = 'Gear Downshift Time',          simple = 'Wie schnell schaltet das Auto einen Gang runter?',                  simpleEn = 'How fast does the car shift down a gear?' },
    fLowSpeedTractionLossMult       = { de = 'Durchdrehen bei Langsamfahrt',   en = 'Low Speed Burnout Mult',       simple = 'Drehen die Reifen beim Anfahren durch?',                           simpleEn = 'Do the tires spin when pulling away?' },
    fTractionCurveLateral           = { de = 'Seitengrip-Kurve',               en = 'Traction Curve Lateral',       simple = 'Ab welchem Winkel fängt das Auto an zu rutschen?',                  simpleEn = 'At what angle does the car start to slide?' },
    fTractionSpringDeltaMax         = { de = 'Reifenwand-Federweg (seitlich)', en = 'Traction Spring Delta Max',    simple = 'Wie weit können die Reifen seitlich wegknicken?',                   simpleEn = 'How far can the tires flex sideways?' },
    fTractionBiasFront              = { de = 'Gripverteilung Vorne/Hinten',    en = 'Traction Bias Front',          simple = 'Haben Vorder- und Hinterreifen gleich viel Grip?',                  simpleEn = 'Do front and rear tires have equal grip?' },
    fSuspensionForce                = { de = 'Federsteifigkeit',               en = 'Spring Strength',              simple = 'Wie hart oder weich sind die Federn?',                             simpleEn = 'How hard or soft are the springs?' },
    fSuspensionCompDamp             = { de = 'Dämpfung (Einfedern)',           en = 'Damping (Compression)',        simple = 'Wie schnell federt das Auto ein (z.B. bei Bodenwellen)?',           simpleEn = 'How fast does the car compress (e.g. over bumps)?' },
    fSuspensionReboundDamp          = { de = 'Dämpfung (Ausfedern)',           en = 'Damping (Rebound)',            simple = 'Wie schnell federt das Auto wieder aus? (Hüpfverhalten)',           simpleEn = 'How fast does the car bounce back? (bounciness)' },
    fSuspensionUpperLimit           = { de = 'Federweg oben (max.)',           en = 'Suspension Upper Limit',       simple = 'Wie weit können die Räder nach oben eintauchen?',                   simpleEn = 'How far can the wheels travel upward?' },
    fSuspensionLowerLimit           = { de = 'Federweg unten (max.)',          en = 'Suspension Lower Limit',       simple = 'Wie weit können die Räder nach unten hängen?',                      simpleEn = 'How far can the wheels hang downward?' },
    fSuspensionRaise                = { de = 'Fahrzeughöhe / Tieferlegung',    en = 'Ride Height / Stance',         simple = 'Wie hoch oder tief liegt das Auto? (Minus = tiefer)',               simpleEn = 'How high or low does the car sit? (negative = lower)' },
    fSuspensionBiasFront            = { de = 'Federverteilung Vorne/Hinten',   en = 'Spring Bias Front',            simple = 'Sind Vorder- und Hinterfedern gleich stark?',                       simpleEn = 'Are front and rear springs equally strong?' },
    fAntiRollBarForce               = { de = 'Stabilisatorkraft (Wankschutz)', en = 'Anti-Roll Bar Force',          simple = 'Wie stark neigt sich das Auto in Kurven zur Seite?',                simpleEn = 'How much does the car lean in corners?' },
    fAntiRollBarBiasFront           = { de = 'Stabilisatorverteilung',         en = 'Anti-Roll Bias Front',         simple = 'Wo wirkt der Wankschutz stärker — vorne oder hinten?',              simpleEn = 'Where does the anti-roll bar act stronger — front or rear?' },
    fRollCentreHeightFront          = { de = 'Rollzentrum Höhe (vorne)',       en = 'Roll Centre Height Front',     simple = 'Wo liegt der Drehpunkt beim Kurvenneigen (vorne)?',                 simpleEn = 'Where is the pivot point when cornering (front)?' },
    fRollCentreHeightRear           = { de = 'Rollzentrum Höhe (hinten)',      en = 'Roll Centre Height Rear',      simple = 'Wo liegt der Drehpunkt beim Kurvenneigen (hinten)?',                simpleEn = 'Where is the pivot point when cornering (rear)?' },
    fTractionCurveMax               = { de = 'Reifengrip (Maximum)',           en = 'Tire Grip (Max)',              simple = 'Wie viel Grip haben die Reifen maximal?',                          simpleEn = 'How much grip do the tires have at maximum?' },
    fTractionCurveMin               = { de = 'Reifengrip (beim Gleiten)',      en = 'Tire Grip (Min / Sliding)',    simple = 'Wie viel Grip bleibt noch beim Rutschen?',                         simpleEn = 'How much grip remains when sliding?' },
    fTractionLossMult               = { de = 'Traktion im Gelände',            en = 'Offroad Traction Loss',        simple = 'Wie gut kommt das Auto abseits der Straße voran?',                  simpleEn = 'How well does the car cope off-road?' },
    fSteeringLock                   = { de = 'Maximaler Lenkeinschlag',        en = 'Max Steering Angle',           simple = 'Wie eng kann das Auto einlenken / wenden?',                         simpleEn = 'How tight can the car steer / turn?' },
    fCamberStiffnesss               = { de = 'Sturzsteifigkeit',               en = 'Camber Stiffness',             simple = 'Wie stark beeinflusst die Radneigung den Grip?',                    simpleEn = 'How strongly does wheel camber affect grip?' },
    fBrakeForce                     = { de = 'Bremskraft',                     en = 'Brake Force',                  simple = 'Wie stark bremst das Auto?',                                       simpleEn = 'How strongly does the car brake?' },
    fBrakeBiasFront                 = { de = 'Bremsverteilung Vorne/Hinten',   en = 'Brake Bias Front',             simple = 'Bremsen Vorder- oder Hinterräder stärker?',                        simpleEn = 'Do front or rear wheels brake harder?' },
    fHandBrakeForce                 = { de = 'Handbremse (Driften)',           en = 'Handbrake Force',              simple = 'Wie stark zieht die Handbremse? (Wichtig fürs Driften)',            simpleEn = 'How strong is the handbrake? (important for drifting)' },
    fCollisionDamageMult            = { de = 'Kollisionsschaden (Faktor)',     en = 'Collision Damage Mult',        simple = 'Wie viel Schaden nimmt das Auto bei Zusammenstößen?',               simpleEn = 'How much damage does the car take in collisions?' },
    fWeaponDamageMult               = { de = 'Waffenschaden (Faktor)',         en = 'Weapon Damage Mult',           simple = 'Wie viel Schaden machen Waffen am Auto? (0 = unzerstörbar)',        simpleEn = 'How much damage do weapons do to the car? (0 = indestructible)' },
    fDeformationDamageMult          = { de = 'Verformungsschaden (Faktor)',    en = 'Deformation Damage Mult',      simple = 'Wie stark verbeult das Auto bei Unfällen?',                         simpleEn = 'How much does the car dent in crashes?' },
    fEngineDamageMult               = { de = 'Motorschaden (Faktor)',          en = 'Engine Damage Mult',           simple = 'Wie leicht geht der Motor bei Schäden kaputt?',                    simpleEn = 'How easily does the engine break from damage?' },
    fPetrolTankVolume               = { de = 'Tankvolumen (Liter)',            en = 'Fuel Tank Volume',             simple = 'Wie viel Benzin fasst der Tank?',                                  simpleEn = 'How much fuel does the tank hold?' },
    fOilVolume                      = { de = 'Ölmenge (Liter)',               en = 'Oil Volume',                   simple = 'Wie viel Öl ist im Motor?',                                        simpleEn = 'How much oil is in the engine?' },
    fSeatOffsetDistX                = { de = 'Sitzposition Links/Rechts',      en = 'Seat Offset X',                simple = 'Ist der Fahrersitz zu weit links oder rechts?',                    simpleEn = 'Is the driver seat too far left or right?' },
    fSeatOffsetDistY                = { de = 'Sitzposition Vor/Zurück',        en = 'Seat Offset Y',                simple = 'Ist der Fahrersitz zu weit vorne oder hinten?',                    simpleEn = 'Is the driver seat too far forward or back?' },
    fSeatOffsetDistZ                = { de = 'Sitzposition Oben/Unten',        en = 'Seat Offset Z',                simple = 'Sitzt der Fahrer zu hoch oder zu tief?',                           simpleEn = 'Is the driver sitting too high or too low?' },
    nMonetaryValue                  = { de = 'Fahrzeugwert ($)',               en = 'Monetary Value',               simple = 'Wie viel ist das Fahrzeug wert?',                                  simpleEn = 'How much is the vehicle worth?' },
    fPopUpLightRotation             = { de = 'Klappscheinwerfer Winkel',       en = 'Popup Light Rotation',         simple = 'Winkel der ausfahrenden Scheinwerfer (nur Klapplichter)',           simpleEn = 'Angle of popup headlights (only for flip-up lights)' },
    fPercentSubmerged               = { de = 'Schwimmgrenze (% Eintauchen)',   en = 'Float at % Submerged',         simple = 'Wie tief muss das Auto ins Wasser bis es sinkt?',                   simpleEn = 'How deep must the car go into water before it sinks?' },
}

-- ══════════════════════════════════════════════════════════════════
--  Wert-Beschreibungen pro Regler
--  Jeder Eintrag: { max = Zahl, label = { de = '...', en = '...' }, color = '#hex' }
--  Der erste Eintrag dessen max >= aktueller Wert wird angezeigt.
--  Infinity = kein Limit (letzter Eintrag)
-- ══════════════════════════════════════════════════════════════════
Config.NUI.ValueLevels = {
    fMass = {
        { max = 600,   label = { de = 'Motorrad',          en = 'Motorcycle'     }, color = '#a78bfa' },
        { max = 1200,  label = { de = 'Kleinwagen',        en = 'Compact Car'    }, color = '#60a5fa' },
        { max = 1600,  label = { de = 'Sportwagen',        en = 'Sports Car'     }, color = '#22c55e' },
        { max = 2000,  label = { de = 'Mittelklasse',      en = 'Mid-size'       }, color = '#555'    },
        { max = 3000,  label = { de = 'SUV / Muscle',      en = 'SUV / Muscle'   }, color = '#f97316' },
        { max = 6000,  label = { de = 'Van / Transporter', en = 'Van / Transporter' }, color = '#ef4444' },
        { max = 99999, label = { de = 'LKW / Bus',         en = 'Truck / Bus'    }, color = '#7f1d1d' },
    },
    fInitialDragCoeff = {
        { max = 2,     label = { de = 'Kaum Widerstand',         en = 'Barely any drag'       }, color = '#0088cc' },
        { max = 5,     label = { de = 'Niedrig',                 en = 'Low'                   }, color = '#22c55e' },
        { max = 8,     label = { de = 'Normal',                  en = 'Normal'                }, color = '#555'    },
        { max = 15,    label = { de = 'Spürbar',                 en = 'Noticeable'            }, color = '#f97316' },
        { max = 99999, label = { de = 'Sehr viel Widerstand',    en = 'Very high drag'        }, color = '#ef4444' },
    },
    fDownforceModifier = {
        { max = 5,     label = { de = 'Kein Downforce', en = 'No downforce' }, color = '#555'    },
        { max = 20,    label = { de = 'Leicht',         en = 'Slight'       }, color = '#22c55e' },
        { max = 50,    label = { de = 'Merklich',       en = 'Noticeable'   }, color = '#f97316' },
        { max = 99999, label = { de = 'Rennwagen',      en = 'Race car'     }, color = '#0088cc' },
    },
    fDriveBiasFront = {
        { max = 0.05,  label = { de = 'Hinterradantrieb (RWD)',      en = 'Rear-Wheel Drive (RWD)'    }, color = '#0088cc' },
        { max = 0.25,  label = { de = 'Leicht AWD (RWD-lastig)',     en = 'Light AWD (RWD bias)'      }, color = '#22c55e' },
        { max = 0.45,  label = { de = 'AWD (RWD-Tendenz)',           en = 'AWD (RWD tendency)'        }, color = '#555'    },
        { max = 0.55,  label = { de = 'Allrad (50/50)',              en = 'All-Wheel (50/50)'         }, color = '#555'    },
        { max = 0.75,  label = { de = 'AWD (FWD-Tendenz)',           en = 'AWD (FWD tendency)'        }, color = '#555'    },
        { max = 0.95,  label = { de = 'Leicht AWD (FWD-lastig)',     en = 'Light AWD (FWD bias)'      }, color = '#f97316' },
        { max = 99999, label = { de = 'Frontantrieb (FWD)',          en = 'Front-Wheel Drive (FWD)'   }, color = '#ef4444' },
    },
    nInitialDriveGears = {
        { max = 2,     label = { de = '1–2 Gänge (Spezial)',  en = '1–2 Gears (Special)'  }, color = '#a78bfa' },
        { max = 4,     label = { de = '3–4 Gänge',           en = '3–4 Gears'            }, color = '#60a5fa' },
        { max = 6,     label = { de = '5–6 Gänge (Standard)',en = '5–6 Gears (Standard)' }, color = '#22c55e' },
        { max = 7,     label = { de = '7 Gänge',             en = '7 Gears'              }, color = '#555'    },
        { max = 99999, label = { de = '8 Gänge (Max)',       en = '8 Gears (Max)'        }, color = '#0088cc' },
    },
    fInitialDriveForce = {
        { max = 0.15,  label = { de = 'Schwach',        en = 'Weak'          }, color = '#ef4444' },
        { max = 0.25,  label = { de = 'Mäßig',          en = 'Moderate'      }, color = '#f97316' },
        { max = 0.35,  label = { de = 'Normal',         en = 'Normal'        }, color = '#555'    },
        { max = 0.45,  label = { de = 'Stark',          en = 'Strong'        }, color = '#22c55e' },
        { max = 0.55,  label = { de = 'Sehr stark',     en = 'Very strong'   }, color = '#0088cc' },
        { max = 99999, label = { de = 'Extrem (Race)',  en = 'Extreme (Race)' }, color = '#a78bfa' },
    },
    fDriveInertia = {
        { max = 0.5,   label = { de = 'Sehr träge',           en = 'Very sluggish'        }, color = '#ef4444' },
        { max = 0.8,   label = { de = 'Träge',                en = 'Sluggish'             }, color = '#f97316' },
        { max = 1.1,   label = { de = 'Normal (empfohlen)',   en = 'Normal (recommended)' }, color = '#22c55e' },
        { max = 1.5,   label = { de = 'Direkt',               en = 'Responsive'           }, color = '#0088cc' },
        { max = 99999, label = { de = 'Sehr direkt',          en = 'Very responsive'      }, color = '#a78bfa' },
    },
    fInitialDriveMaxFlatVel = {
        { max = 80,    label = { de = 'Sehr langsam',    en = 'Very slow'     }, color = '#ef4444' },
        { max = 120,   label = { de = 'Stadtverkehr',    en = 'City traffic'  }, color = '#f97316' },
        { max = 160,   label = { de = 'Normal',          en = 'Normal'        }, color = '#555'    },
        { max = 200,   label = { de = 'Sportlich',       en = 'Sporty'        }, color = '#22c55e' },
        { max = 250,   label = { de = 'Supersportwagen', en = 'Supercar'      }, color = '#0088cc' },
        { max = 99999, label = { de = 'Hypercar',        en = 'Hypercar'      }, color = '#a78bfa' },
    },
    fClutchChangeRateScaleUpShift = {
        { max = 0.8,   label = { de = 'Sehr langsam', en = 'Very slow'    }, color = '#ef4444' },
        { max = 1.5,   label = { de = 'Langsam',      en = 'Slow'         }, color = '#f97316' },
        { max = 2.5,   label = { de = 'Normal',       en = 'Normal'       }, color = '#555'    },
        { max = 4,     label = { de = 'Schnell',      en = 'Fast'         }, color = '#22c55e' },
        { max = 99999, label = { de = 'Renngetriebe', en = 'Race gearbox' }, color = '#0088cc' },
    },
    fClutchChangeRateScaleDownShift = {
        { max = 0.8,   label = { de = 'Sehr langsam', en = 'Very slow'    }, color = '#ef4444' },
        { max = 1.5,   label = { de = 'Langsam',      en = 'Slow'         }, color = '#f97316' },
        { max = 2.5,   label = { de = 'Normal',       en = 'Normal'       }, color = '#555'    },
        { max = 4,     label = { de = 'Schnell',      en = 'Fast'         }, color = '#22c55e' },
        { max = 99999, label = { de = 'Renngetriebe', en = 'Race gearbox' }, color = '#0088cc' },
    },
    fLowSpeedTractionLossMult = {
        { max = 0.2,   label = { de = 'Kein Durchdrehen',  en = 'No wheelspin'    }, color = '#22c55e' },
        { max = 0.6,   label = { de = 'Wenig',             en = 'Little'          }, color = '#555'    },
        { max = 1.1,   label = { de = 'Normal',            en = 'Normal'          }, color = '#555'    },
        { max = 1.5,   label = { de = 'Viel',              en = 'A lot'           }, color = '#f97316' },
        { max = 99999, label = { de = 'Burnout-ready',     en = 'Burnout-ready'   }, color = '#ef4444' },
    },
    fTractionCurveLateral = {
        { max = 18,    label = { de = 'Gleitet sehr leicht', en = 'Slides very easily' }, color = '#a78bfa' },
        { max = 21,    label = { de = 'Rutschig (Drift)',    en = 'Slippery (Drift)'   }, color = '#0088cc' },
        { max = 24,    label = { de = 'Normal',              en = 'Normal'             }, color = '#555'    },
        { max = 28,    label = { de = 'Griffig',             en = 'Grippy'             }, color = '#22c55e' },
        { max = 99999, label = { de = 'Sehr griffig',        en = 'Very grippy'        }, color = '#22c55e' },
    },
    fTractionSpringDeltaMax = {
        { max = 0.05,  label = { de = 'Sofortige Rückkehr', en = 'Immediate return'   }, color = '#0088cc' },
        { max = 0.12,  label = { de = 'Normal',             en = 'Normal'             }, color = '#555'    },
        { max = 0.2,   label = { de = 'Etwas nachgiebig',   en = 'Slightly flexible'  }, color = '#f97316' },
        { max = 99999, label = { de = 'Sehr nachgiebig',    en = 'Very flexible'      }, color = '#ef4444' },
    },
    fTractionBiasFront = {
        { max = 0.35,  label = { de = 'Hinten-lastig',       en = 'Rear-biased'      }, color = '#0088cc' },
        { max = 0.48,  label = { de = 'Leicht hinten',       en = 'Slightly rear'    }, color = '#555'    },
        { max = 0.52,  label = { de = 'Ausgeglichen (50/50)',en = 'Balanced (50/50)' }, color = '#22c55e' },
        { max = 0.65,  label = { de = 'Leicht vorne',        en = 'Slightly front'   }, color = '#555'    },
        { max = 99999, label = { de = 'Vorne-lastig',        en = 'Front-biased'     }, color = '#f97316' },
    },
    fSuspensionForce = {
        { max = 1,     label = { de = 'Sehr weich (Bus)',     en = 'Very soft (Bus)'       }, color = '#a78bfa' },
        { max = 2,     label = { de = 'Weich (Offroad)',      en = 'Soft (Offroad)'        }, color = '#60a5fa' },
        { max = 3.5,   label = { de = 'Normal',               en = 'Normal'                }, color = '#555'    },
        { max = 4.2,   label = { de = 'Straff (Sport)',       en = 'Stiff (Sport)'         }, color = '#22c55e' },
        { max = 99999, label = { de = 'Sehr straff (Race)',   en = 'Very stiff (Race)'     }, color = '#0088cc' },
    },
    fSuspensionCompDamp = {
        { max = 0.5,   label = { de = 'Kaum Dämpfung', en = 'Barely damped'    }, color = '#ef4444' },
        { max = 1.0,   label = { de = 'Weich',         en = 'Soft'             }, color = '#f97316' },
        { max = 1.6,   label = { de = 'Normal',        en = 'Normal'           }, color = '#555'    },
        { max = 2.2,   label = { de = 'Direkt',        en = 'Responsive'       }, color = '#22c55e' },
        { max = 99999, label = { de = 'Sehr direkt',   en = 'Very responsive'  }, color = '#0088cc' },
    },
    fSuspensionReboundDamp = {
        { max = 0.5,   label = { de = 'Hüpft stark',  en = 'Bounces a lot' }, color = '#ef4444' },
        { max = 1.0,   label = { de = 'Federt nach',  en = 'Rebounds'      }, color = '#f97316' },
        { max = 1.6,   label = { de = 'Normal',       en = 'Normal'        }, color = '#555'    },
        { max = 2.2,   label = { de = 'Stabil',       en = 'Stable'        }, color = '#22c55e' },
        { max = 99999, label = { de = 'Sehr stabil',  en = 'Very stable'   }, color = '#0088cc' },
    },
    fSuspensionUpperLimit = {
        { max = 0.03,  label = { de = 'Fast kein Federweg',    en = 'Almost no travel'     }, color = '#ef4444' },
        { max = 0.06,  label = { de = 'Wenig',                 en = 'Little'               }, color = '#f97316' },
        { max = 0.09,  label = { de = 'Normal',                en = 'Normal'               }, color = '#555'    },
        { max = 0.15,  label = { de = 'Viel Federweg',         en = 'Lots of travel'       }, color = '#22c55e' },
        { max = 99999, label = { de = 'Sehr viel (Offroad)',   en = 'Very much (Offroad)'  }, color = '#0088cc' },
    },
    fSuspensionLowerLimit = {
        { max = -0.15, label = { de = 'Sehr tief hängend', en = 'Hanging very low'    }, color = '#0088cc' },
        { max = -0.09, label = { de = 'Tief',              en = 'Low'                 }, color = '#22c55e' },
        { max = -0.06, label = { de = 'Normal',            en = 'Normal'              }, color = '#555'    },
        { max = -0.02, label = { de = 'Wenig',             en = 'Little'              }, color = '#f97316' },
        { max = 99999, label = { de = 'Kaum Federweg',     en = 'Barely any travel'   }, color = '#ef4444' },
    },
    fSuspensionRaise = {
        { max = -0.05, label = { de = 'Tief (Stance)',       en = 'Low (Stance)'         }, color = '#a78bfa' },
        { max = -0.02, label = { de = 'Leicht tiefer',       en = 'Slightly lower'       }, color = '#0088cc' },
        { max = 0.01,  label = { de = 'Standard',            en = 'Standard'             }, color = '#555'    },
        { max = 0.05,  label = { de = 'Leicht angehoben',    en = 'Slightly raised'      }, color = '#22c55e' },
        { max = 99999, label = { de = 'Hoch (Offroad)',      en = 'High (Offroad)'       }, color = '#f97316' },
    },
    fSuspensionBiasFront = {
        { max = 0.35,  label = { de = 'Hinten-lastig',   en = 'Rear-biased'    }, color = '#0088cc' },
        { max = 0.48,  label = { de = 'Leicht hinten',   en = 'Slightly rear'  }, color = '#555'    },
        { max = 0.52,  label = { de = 'Ausgeglichen',    en = 'Balanced'       }, color = '#22c55e' },
        { max = 0.65,  label = { de = 'Leicht vorne',    en = 'Slightly front' }, color = '#555'    },
        { max = 99999, label = { de = 'Vorne-lastig',    en = 'Front-biased'   }, color = '#f97316' },
    },
    fAntiRollBarForce = {
        { max = 0.2,   label = { de = 'Viel Körperneigung', en = 'Lots of body roll' }, color = '#ef4444' },
        { max = 0.5,   label = { de = 'Normal',             en = 'Normal'            }, color = '#555'    },
        { max = 0.9,   label = { de = 'Wenig Neigung',      en = 'Little lean'       }, color = '#22c55e' },
        { max = 1.4,   label = { de = 'Kaum Neigung',       en = 'Barely any lean'   }, color = '#0088cc' },
        { max = 99999, label = { de = 'Kein Wanken',        en = 'No body roll'      }, color = '#a78bfa' },
    },
    fAntiRollBarBiasFront = {
        { max = 0.35,  label = { de = 'Stabilisator hinten', en = 'Stabilizer rear'  }, color = '#0088cc' },
        { max = 0.48,  label = { de = 'Leicht hinten',       en = 'Slightly rear'    }, color = '#555'    },
        { max = 0.52,  label = { de = 'Ausgeglichen',        en = 'Balanced'         }, color = '#22c55e' },
        { max = 0.65,  label = { de = 'Leicht vorne',        en = 'Slightly front'   }, color = '#555'    },
        { max = 99999, label = { de = 'Stabilisator vorne',  en = 'Stabilizer front' }, color = '#f97316' },
    },
    fRollCentreHeightFront = {
        { max = -0.1,  label = { de = 'Sehr tief', en = 'Very low'  }, color = '#a78bfa' },
        { max = 0.1,   label = { de = 'Tief',      en = 'Low'       }, color = '#0088cc' },
        { max = 0.3,   label = { de = 'Normal',    en = 'Normal'    }, color = '#555'    },
        { max = 0.4,   label = { de = 'Hoch',      en = 'High'      }, color = '#22c55e' },
        { max = 99999, label = { de = 'Sehr hoch', en = 'Very high' }, color = '#f97316' },
    },
    fRollCentreHeightRear = {
        { max = -0.1,  label = { de = 'Sehr tief', en = 'Very low'  }, color = '#a78bfa' },
        { max = 0.1,   label = { de = 'Tief',      en = 'Low'       }, color = '#0088cc' },
        { max = 0.3,   label = { de = 'Normal',    en = 'Normal'    }, color = '#555'    },
        { max = 0.4,   label = { de = 'Hoch',      en = 'High'      }, color = '#22c55e' },
        { max = 99999, label = { de = 'Sehr hoch', en = 'Very high' }, color = '#f97316' },
    },
    fTractionCurveMax = {
        { max = 1.2,   label = { de = 'Sehr wenig Grip',  en = 'Very little grip' }, color = '#ef4444' },
        { max = 1.8,   label = { de = 'Wenig Grip',       en = 'Little grip'      }, color = '#f97316' },
        { max = 2.2,   label = { de = 'Normal',           en = 'Normal'           }, color = '#555'    },
        { max = 2.6,   label = { de = 'Viel Grip',        en = 'Good grip'        }, color = '#22c55e' },
        { max = 3.2,   label = { de = 'Sehr viel Grip',   en = 'Lots of grip'     }, color = '#0088cc' },
        { max = 99999, label = { de = 'Slicks (Race)',    en = 'Slicks (Race)'    }, color = '#a78bfa' },
    },
    fTractionCurveMin = {
        { max = 1.0,   label = { de = 'Kaum Restgrip',        en = 'Barely any grip left'  }, color = '#ef4444' },
        { max = 1.5,   label = { de = 'Wenig beim Gleiten',   en = 'Little while sliding'  }, color = '#f97316' },
        { max = 2.0,   label = { de = 'Normal',               en = 'Normal'                }, color = '#555'    },
        { max = 2.5,   label = { de = 'Greift beim Gleiten',  en = 'Grips while sliding'   }, color = '#22c55e' },
        { max = 99999, label = { de = 'Kaum Übersteuern',     en = 'Barely oversteers'     }, color = '#0088cc' },
    },
    fTractionLossMult = {
        { max = 0.3,   label = { de = 'Wie auf Asphalt',      en = 'Like on asphalt'   }, color = '#0088cc' },
        { max = 0.7,   label = { de = 'Gut im Gelände',       en = 'Good offroad'      }, color = '#22c55e' },
        { max = 1.1,   label = { de = 'Normal',               en = 'Normal'            }, color = '#555'    },
        { max = 2.0,   label = { de = 'Schlecht im Gelände',  en = 'Poor offroad'      }, color = '#f97316' },
        { max = 99999, label = { de = 'Straßenfahrzeug',      en = 'Road vehicle'      }, color = '#ef4444' },
    },
    fSteeringLock = {
        { max = 20,    label = { de = 'Sehr enger Einschlag', en = 'Very tight steering' }, color = '#ef4444' },
        { max = 30,    label = { de = 'Sportlich direkt',     en = 'Sporty direct'       }, color = '#0088cc' },
        { max = 40,    label = { de = 'Normal',               en = 'Normal'              }, color = '#555'    },
        { max = 50,    label = { de = 'Großer Einschlag',     en = 'Wide steering'       }, color = '#22c55e' },
        { max = 99999, label = { de = 'Extrem (Bus/Van)',     en = 'Extreme (Bus/Van)'   }, color = '#a78bfa' },
    },
    fCamberStiffnesss = {
        { max = 0.1,   label = { de = 'Kein Effekt', en = 'No effect' }, color = '#555'    },
        { max = 0.4,   label = { de = 'Leicht',      en = 'Slight'    }, color = '#22c55e' },
        { max = 0.7,   label = { de = 'Merklich',    en = 'Noticeable'}, color = '#f97316' },
        { max = 99999, label = { de = 'Stark',       en = 'Strong'    }, color = '#0088cc' },
    },
    fBrakeForce = {
        { max = 0.3,   label = { de = 'Sehr schwache Bremse', en = 'Very weak brakes' }, color = '#ef4444' },
        { max = 0.6,   label = { de = 'Schwach',              en = 'Weak'             }, color = '#f97316' },
        { max = 1.0,   label = { de = 'Normal',               en = 'Normal'           }, color = '#555'    },
        { max = 1.5,   label = { de = 'Stark',                en = 'Strong'           }, color = '#22c55e' },
        { max = 2.5,   label = { de = 'Sehr stark',           en = 'Very strong'      }, color = '#0088cc' },
        { max = 99999, label = { de = 'Race-Bremse',          en = 'Race brakes'      }, color = '#a78bfa' },
    },
    fBrakeBiasFront = {
        { max = 0.35,  label = { de = 'Hinten bremst mehr',    en = 'Rear brakes more'       }, color = '#ef4444' },
        { max = 0.48,  label = { de = 'Leicht hinten-lastig',  en = 'Slightly rear-biased'   }, color = '#f97316' },
        { max = 0.55,  label = { de = 'Ausgeglichen',          en = 'Balanced'               }, color = '#22c55e' },
        { max = 0.70,  label = { de = 'Vorne bremst mehr',     en = 'Front brakes more'      }, color = '#555'    },
        { max = 99999, label = { de = 'Stark vorne',           en = 'Heavy front'            }, color = '#0088cc' },
    },
    fHandBrakeForce = {
        { max = 0.15,  label = { de = 'Kaum wirkend',      en = 'Barely effective'  }, color = '#555'    },
        { max = 0.35,  label = { de = 'Schwach',           en = 'Weak'              }, color = '#f97316' },
        { max = 0.6,   label = { de = 'Normal',            en = 'Normal'            }, color = '#555'    },
        { max = 0.8,   label = { de = 'Gut fürs Driften',  en = 'Good for drifting' }, color = '#22c55e' },
        { max = 99999, label = { de = 'Sehr stark',        en = 'Very strong'       }, color = '#0088cc' },
    },
    fCollisionDamageMult = {
        { max = 0.01,  label = { de = 'Unzerstörbar',        en = 'Indestructible'  }, color = '#22c55e' },
        { max = 0.5,   label = { de = 'Wenig Schaden',       en = 'Little damage'   }, color = '#0088cc' },
        { max = 1.1,   label = { de = 'Normal',              en = 'Normal'          }, color = '#555'    },
        { max = 3,     label = { de = 'Empfindlich',         en = 'Fragile'         }, color = '#f97316' },
        { max = 99999, label = { de = 'Sehr empfindlich',    en = 'Very fragile'    }, color = '#ef4444' },
    },
    fWeaponDamageMult = {
        { max = 0.01,  label = { de = 'Kugelsicher',      en = 'Bulletproof'    }, color = '#22c55e' },
        { max = 0.5,   label = { de = 'Robust',           en = 'Robust'         }, color = '#0088cc' },
        { max = 1.1,   label = { de = 'Normal',           en = 'Normal'         }, color = '#555'    },
        { max = 3,     label = { de = 'Empfindlich',      en = 'Fragile'        }, color = '#f97316' },
        { max = 99999, label = { de = 'Sehr empfindlich', en = 'Very fragile'   }, color = '#ef4444' },
    },
    fDeformationDamageMult = {
        { max = 0.01,  label = { de = 'Keine Beulen',        en = 'No dents'              }, color = '#22c55e' },
        { max = 0.5,   label = { de = 'Kaum verformbar',     en = 'Barely dents'          }, color = '#0088cc' },
        { max = 1.1,   label = { de = 'Normal',              en = 'Normal'                }, color = '#555'    },
        { max = 3,     label = { de = 'Verbeult leicht',     en = 'Dents easily'          }, color = '#f97316' },
        { max = 99999, label = { de = 'Stark verformbar',    en = 'Heavily deformable'    }, color = '#ef4444' },
    },
    fEngineDamageMult = {
        { max = 0.01,  label = { de = 'Unzerstörbarer Motor', en = 'Indestructible engine' }, color = '#22c55e' },
        { max = 0.5,   label = { de = 'Robust',               en = 'Robust'               }, color = '#0088cc' },
        { max = 1.1,   label = { de = 'Normal',               en = 'Normal'               }, color = '#555'    },
        { max = 3,     label = { de = 'Empfindlich',          en = 'Fragile'              }, color = '#f97316' },
        { max = 99999, label = { de = 'Sehr empfindlich',     en = 'Very fragile'         }, color = '#ef4444' },
    },
    fPetrolTankVolume = {
        { max = 20,    label = { de = 'Sehr klein', en = 'Very small' }, color = '#ef4444' },
        { max = 45,    label = { de = 'Klein',      en = 'Small'      }, color = '#f97316' },
        { max = 70,    label = { de = 'Normal',     en = 'Normal'     }, color = '#555'    },
        { max = 100,   label = { de = 'Groß',       en = 'Large'      }, color = '#22c55e' },
        { max = 99999, label = { de = 'Sehr groß',  en = 'Very large' }, color = '#0088cc' },
    },
    fOilVolume = {
        { max = 2,     label = { de = 'Sehr wenig', en = 'Very little' }, color = '#ef4444' },
        { max = 4,     label = { de = 'Normal',     en = 'Normal'      }, color = '#555'    },
        { max = 8,     label = { de = 'Viel',       en = 'A lot'       }, color = '#22c55e' },
        { max = 99999, label = { de = 'Sehr viel',  en = 'Very much'   }, color = '#0088cc' },
    },
    fPercentSubmerged = {
        { max = 0.5,   label = { de = 'Sinkt sofort',      en = 'Sinks immediately'    }, color = '#ef4444' },
        { max = 0.75,  label = { de = 'Sinkt schnell',     en = 'Sinks quickly'        }, color = '#f97316' },
        { max = 0.88,  label = { de = 'Normal',            en = 'Normal'               }, color = '#555'    },
        { max = 0.95,  label = { de = 'Schwimmt lange',    en = 'Floats for a while'   }, color = '#22c55e' },
        { max = 99999, label = { de = 'Schwimmt sehr gut', en = 'Floats very well'     }, color = '#0088cc' },
    },
}
