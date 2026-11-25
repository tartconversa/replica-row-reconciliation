BEGIN TRANSACTION;
CREATE TABLE "replica_lesson" (id TEXT PRIMARY KEY, dept TEXT, label TEXT, row_pos INTEGER);
INSERT INTO "replica_lesson" VALUES('N1','02','继电器',5);
CREATE TABLE "replica_reg" (id TEXT PRIMARY KEY, lesson TEXT, status INTEGER, row_pos INTEGER);
INSERT INTO "replica_reg" VALUES('rn','N1',2,5);
COMMIT;
