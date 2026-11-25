BEGIN TRANSACTION;
CREATE TABLE "primary_lesson" (id TEXT PRIMARY KEY, district TEXT, title TEXT, row_pos INTEGER);
INSERT INTO "primary_lesson" VALUES('A1','east','车床',2);
INSERT INTO "primary_lesson" VALUES('N1','north','继电器',5);
CREATE TABLE "primary_reg" (id TEXT PRIMARY KEY, lesson TEXT, state TEXT, row_pos INTEGER);
INSERT INTO "primary_reg" VALUES('ra','A1','enrolled',3);
INSERT INTO "primary_reg" VALUES('rn','N1','waiting',5);
COMMIT;
