-- ══════════════════════════════════════════════════════════════════
--  HM Handling — install.sql
--  Einmalig in der Datenbank ausführen
-- ══════════════════════════════════════════════════════════════════

CREATE TABLE IF NOT EXISTS `hm_handling_profiles` (
    `id`          INT          NOT NULL AUTO_INCREMENT,
    `citizenid`   VARCHAR(50)  NOT NULL,
    `name`        VARCHAR(64)  NOT NULL,
    `vehicle`     VARCHAR(64)  NOT NULL DEFAULT '',
    `data`        LONGTEXT     NOT NULL,
    `created_at`  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `idx_citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
