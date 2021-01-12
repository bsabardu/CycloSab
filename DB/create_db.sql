-- Figurine

DROP TABLE IF EXISTS "review";
DROP TABLE IF EXISTS "product";

CREATE TABLE IF NOT EXISTS "product" (
  "id" SERIAL PRIMARY KEY,
  "name" TEXT,
  "description" TEXT,
  "size" REAL, -- REAL correspond à "nombre à virgule"
  "price" REAL NOT NULL,
  "category" TEXT
);

INSERT INTO "product"("id","name", "description", "size", "price", "category") VALUES
(1,'Triban', 'VÉLO DE ROUTE TRIBAN RC120 SHIMANO MICROSHIFT 8V 2020 GRIS',54,450,'Vélo'),
(2,'Cannondale', 'VÉLO DE ROUTE CANNONDALE SUPERSIX EVO HI-MOD DISC ULTEGRA SHIMANO ULTEGRA 11V 2021 ROUGE',58,4999,'Vélo'),
(3,'BMC', 'VÉLO DE ROUTE BMC TEAMMACHINE SLR01 FOUR SHIMANO ULTEGRA DI2 11V 2021 BLEU',56,6799,'Vélo'),
(4,'Giro', 'CASQUE GIRO AETHER MIPS BLEU',40,239,'Casque'),
(5,'Oakley', 'CASQUE AERO OAKLEY ARO 5 MIPS JASMINE BLEU CIEL',42,94,'Casque'),
(6,'Mavic', 'PAIRE DE CHAUSSURES ROUTE MAVIC COSMIC ELITE SL NOIR',43,190,'Chaussures');


-- Review

CREATE TABLE IF NOT EXISTS "review" (
  "id" SERIAL PRIMARY KEY,
  "author" TEXT NOT NULL,
  "note" REAL NOT NULL,
  "title" TEXT,
  "message" TEXT,
  "product_id" INT,
  FOREIGN KEY("product_id") REFERENCES "product"("id")
);

INSERT INTO "review" ("id", "author", "note", "title", "message", "product_id") VALUES
(1,'Couleg',4, 'Bon rapport qualité prix', 'Satisfaisant pour montage sur home trainer Tacx flow' ,1),
(2,'KingJames',1, 'Pneus collés à la jante!!!', 'Dans l’ensemble le vélo est conforme aux attentes mais pour une raison inconnue les ingénieurs ont décidé de coller à la super glue les pneus à la jante' ,1),
(3,'Monsieur Preskovitch',5, 'Juste parfait', 'J''ai acheté ce vélo à sa sortie, c''est à dire fin d''été 2019. Ce vélo est parfaitement équipé, les freins hydro-mécaniques ont un très bon mordant, le groupe fait le café, le vélo est très rigide ce qui est super agréable sur les chemins tout comme sur la route. Les défauts que je lui trouve sont la peinture (belle mais très fragile) et le poids de la partie arrière du vélo (roue arriere/cassette). C''est un très bon vélo, je recommande !' ,1),

(4,'Amex_82',1, 'Craque énormément', 'J ai reçu ce vélo au mois de Mai et la tige de selle s est mise à craquer dans le cadre des la première utilisation. Malgré 5 passages en atelier, le problème n a pas été résolu. Finalement, le cadre à été pris en garantie et remplacé. 1 semaine après le remplacement, la tige de selle s est remise à craquer dans le cadre. Cette fois ci, j ai en plus le boîtier de pedalier qui craque. Bref, matériel pas au point. Dommage, le comportement n est pas si mal.' ,2),
(5,'Charly68971',5, 'Une vraie bête de course','Ça fait 2 semaines que je l''ai reçu et c''est un vrai bonheur. Ce vélo a un rendement exceptionnel associé à un confort remarquable. il est très bien équilibré et réagit au moindre coup de pédale. Extrêmement stable à grande vitesse, et le freinage hydraulique à disques est très sécurisant. Les roues Hollowgram en carbone sont de très bonne qualité et contribuent au comportement du vélo. Le seul point négatif est le montage de disques d''entrée de gamme et d''une cassette 105 alors que les autres composants Shimano sont en Ultegra. le prix du vélo aurait mérité d''avoir du 100% Ultegra.' ,2),
(6,'Robin',4, 'Mon premier vélo', 'Ce vélo est mon premier - essentiellement pour suppléer ma pratique du running puis me lancer dans le triathlon. J''ai dépensé un peu plus que le budget que je m''étais alloué mais j''ai eu un coup de coeur visuel' ,2),

(7,'Guillaume',3, 'Très bon mais ...', 'Léger, centre de gravité bien centré, très joueur pour un VAE, utilisé quotidiennement pour aller bosser les trajets sont des vrais plaisirs ! Par contre à ce prix on peut s''attendre à un vélo complet, le mien est arrivé sans contacteur d''assistance Shimano, du coup je ne peux rien régler sur mon compteur, même pas l''heure ni le Bluetooth ... A 3000€ ça fait mal ...' ,3),
(8,'Tientien',5, 'Excellent compromis', 'Ce vélo répond à tous mes besoins : très beau, bien équipé, un niveau de finition exceptionnel, une grande autonomie, un montage typé “Gravel”, confortable mais assez vif, pas trop cher. Je ne lui trouve que des qualités.' ,3),
(9,'Marc',5, 'Excellent produit !', 'Livré monté et emballage très propre et adapté. Seul point à savoir, il n''y a pas de commande de passage de mode rapide séparé de l''écran principal.' ,3),

(10,'Coursverte',5, 'Bluffant', 'Avec 3 mois de recul, ce casque est tout simplement bluffant. Très belle finition, très léger, parfaitement adapté à la tête, ce casque se fait oublier.' ,4),
(11,'Gégé',5,'Rapport qualité prix moyen','Le Ionos que je possédais avant était mieux fini et plus aéré' ,4),

(12,'Timo0826',5, 'Bon produit.', 'Satisfait de mon achat même s''il y a quelque petite imperfection sur le casque (polystyrène légèrement enfoncé à certain endroit et la couleur du logo Oakley qui n''est pas uniforme).' ,5),
(13,'Pierre Cycling',5, 'Le casque révolutionnaire !!!!', 'Ce casque est vraiment génial avec le BOA qui assure un serrage optimal et le MIPS qui garantie le sécurité et ce look purement du OAKLEY !!!!!!!!!!!!!! L''aération est super et le support de lunette c''est top !!!!!!!!!!!!! Pour moi c''est l''un des meilleurs casque au monde !!!!!!!!!!!!!!!' ,5),
(14,'Blupy',5, 'Casque haut-de-gamme', 'Je suis très content du produit et de la rapidité pour la livraison' ,5),

(15,'Chris21',5, 'Orange is à new Black !!!', 'Ces chaussures ont un super rapport qualité prix, elles sont confortables j''ai pris une taille au dessus de ma pointure comme d''habitude, elles ont une bonne tenue du coup de pied et du talon avec un serrage efficace. J''avais un doute à l''achat sur la rigidité des semelles et c''est une bonne surprise pour des semelles composites elles sont assez rigides pour ne pas sentir les pédales. Seul petit bémol la molette BOA ne se desserre pas cran par cran il faut débrayer entièrement pour desserrer un peu le pied ....' ,6),
(16,'Raph',4, 'Bon rapport qualité prix', 'Système de serrage efficace et précis mais attention ca taille très petit... Je fais du 44 et avec du 44 2\3 j''étais au bout !!! Alors que mes ancienne mavic sont du 44 2/3....Je n''ai pas tenté une autre paire.... Pas assez précis pour les tailles.. Alltriks toujours au top.!! Retour nickel..' ,6),
(17,'Carlos',3, 'Correcte', 'Le système boa est bien mais la chaussure semble très fragile, notamment au passage du fil par les œillets en tissu. A mon avis ça va vite lâcher!' ,6);
