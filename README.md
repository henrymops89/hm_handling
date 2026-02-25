# HM Handling

Admin-Tool zum Einstellen der Fahrzeug-Handling-Werte direkt im Spiel. Profile werden pro Fahrzeugmodell in der Datenbank gespeichert.

## Abhängigkeiten

- [qbx_core](https://github.com/Qbox-project/qbx_core)
- [ox_lib](https://github.com/overextended/ox_lib)
- [oxmysql](https://github.com/overextended/oxmysql)

## Installation

1. Resource in den `resources`-Ordner kopieren
2. `ensure hm_handling` in die `server.cfg` eintragen
3. SQL in der Datenbank ausfuehren:

```sql
CREATE TABLE IF NOT EXISTS `hm_handling_profiles` (
    `id`          INT          NOT NULL AUTO_INCREMENT,
    `vehicle`     VARCHAR(64)  NOT NULL,
    `name`        VARCHAR(64)  NOT NULL,
    `data`        LONGTEXT     NOT NULL,
    `created_at`  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `idx_vehicle` (`vehicle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
```

## Berechtigung

Nur Spieler mit der ACE-Permission `admin` koennen den Editor nutzen.

```cfg
add_ace group.admin admin allow
add_principal identifier.fivem:DEINE_ID group.admin
```

## Nutzung

1. Als Admin in ein Fahrzeug einsteigen (Fahrersitz)
2. `/handling` eingeben
3. Werte per Slider oder Direkteingabe anpassen (Live-Vorschau)
4. Profile speichern, laden oder loeschen
5. Schliessen mit dem X-Button oder ESC

## Config

| Option | Standard | Beschreibung |
|---|---|---|
| `Language` | `'de'` | NUI-Sprache (`'de'` / `'en'`) |
| `LabelMode` | `'simple'` | `'simple'` = Klartext, `'technical'` = Rohe Keys |
| `MaxProfiles` | `20` | Max. Profile pro Fahrzeugmodell |
| `Command` | `'handling'` | Chat-Command zum Oeffnen |
| `Keybind` | `nil` | Optionaler Keybind (z.B. `'F6'`) |
| `NotifySystem` | `'ox_lib'` | `'ox_lib'` oder `'qb'` |
| `Debug` | `false` | Debug-Ausgaben in der Konsole |

## Features

- Live-Vorschau beim Verstellen der Werte
- Profile pro Fahrzeugmodell (z.B. alle Adder teilen sich die Profile)
- Import/Export von Handling-Daten als JSON
- Suche und Kategorien fuer alle Handling-Werte
- Deutsch und Englisch
