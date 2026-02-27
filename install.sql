-- ══════════════════════════════════════════════════════════════════
--  HM Handling — install.sql
--  Einmalig in der Datenbank ausführen
-- ══════════════════════════════════════════════════════════════════

CREATE TABLE IF NOT EXISTS `hm_handling_profiles` (
    `id`          INT          NOT NULL AUTO_INCREMENT,
    `vehicle`     VARCHAR(64)  NOT NULL,
    `name`        VARCHAR(64)  NOT NULL,
    `data`        LONGTEXT     NOT NULL,
    `created_at`  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `idx_vehicle` (`vehicle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
