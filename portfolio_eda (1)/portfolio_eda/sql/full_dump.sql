BEGIN TRANSACTION;
CREATE TABLE "posts" (
"post_id" INTEGER,
  "data" TEXT,
  "hora" TEXT,
  "conta" TEXT,
  "tipo_post" TEXT,
  "tema" TEXT,
  "visualizacoes" INTEGER,
  "alcance" REAL,
  "curtida" INTEGER,
  "comentarios" INTEGER,
  "compartilhamentos" INTEGER,
  "salvamentos" INTEGER,
  "seguidores" REAL,
  "engajamento" INTEGER,
  "taxa_engajamento" REAL
);
INSERT INTO "posts" VALUES(1,'2026-01-12','09:49','conta_B','imagem','evento',1081,NULL,40,9,0,0,NULL,49,NULL);
INSERT INTO "posts" VALUES(2,'2026-02-13','12:34','conta_A','reels','institucional',848,481.0,24,3,4,0,1.0,31,0.0644490644490644);
INSERT INTO "posts" VALUES(3,'2026-03-06','13:00','conta_A','carrossel','institucional',534,211.0,25,1,4,2,0.0,32,1.51658767772511804e-01);
INSERT INTO "posts" VALUES(4,'2026-03-24','15:00','conta_A','carrossel','institucional',411,161.0,14,0,4,0,0.0,18,1.11801242236024805e-01);
INSERT INTO "posts" VALUES(5,'2026-03-25','12:00','conta_A','carrossel','educacional',373,179.0,15,0,3,2,1.0,20,1.11731843575418904e-01);
INSERT INTO "posts" VALUES(6,'2026-03-27','08:30','conta_A','carrossel','educacional',285,164.0,10,0,1,0,0.0,11,0.0670731707317073);
INSERT INTO "posts" VALUES(7,'2026-03-31','05:30','conta_A','carrossel','educacional',339,161.0,12,0,1,0,0.0,13,0.0807453416149068);
INSERT INTO "posts" VALUES(8,'2026-04-10','12:01','conta_A','carrossel','educacional',320,130.0,9,0,0,0,0.0,9,0.0692307692307692);
INSERT INTO "posts" VALUES(9,'2026-05-11','11:08','conta_A','carrossel','comercial',689,250.0,10,0,8,0,0.0,18,0.072);
INSERT INTO "posts" VALUES(10,'2026-06-12','10:00','conta_A','carrossel','reforma tributaria',503,301.0,9,0,1,0,0.0,10,0.0332225913621262);
INSERT INTO "posts" VALUES(11,'2026-06-30','09:56','conta_C','reels','comercial',583,NULL,22,1,4,0,NULL,27,NULL);
INSERT INTO "posts" VALUES(12,'2026-07-03','09:00','conta_A','imagem','educacional',191,97.0,3,0,1,1,0.0,5,0.0515463917525773);
INSERT INTO "posts" VALUES(13,'2026-07-09','05:00','conta_A','imagem','educacional',211,114.0,10,0,1,0,0.0,11,0.0964912280701754);
INSERT INTO "posts" VALUES(14,'2026-07-29','05:00','conta_A','carrossel','evento',933,403.0,13,0,2,0,0.0,15,0.0372208436724565);
INSERT INTO "posts" VALUES(15,'2026-08-05','14:05','conta_B','carrossel','evento',799,NULL,31,5,1,0,NULL,37,NULL);
INSERT INTO "posts" VALUES(16,'2026-08-11','07:37','conta_A','reels','evento',330,208.0,20,1,3,0,0.0,24,1.15384615384615293e-01);
INSERT INTO "posts" VALUES(17,'2026-08-11','11:30','conta_A','imagem','jurídico',157,76.0,10,2,0,0,0.0,12,1.57894736842105198e-01);
INSERT INTO "posts" VALUES(18,'2026-08-14','07:16','conta_A','imagem','reforma tributaria',474,106.0,3,0,0,0,0.0,3,0.0283018867924528);
INSERT INTO "posts" VALUES(19,'2026-09-01','11:00','conta_A','carrossel','jurídico',185,79.0,7,0,0,1,0.0,8,1.01265822784810097e-01);
COMMIT;
