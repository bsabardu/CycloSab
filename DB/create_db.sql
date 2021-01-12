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

INSERT INTO "review" ("id", "author", "note", "title", "message", "figurine_id") VALUES
(1,'Jean Claude Dus',4, 'Une belle figurine', 'La finition est bien, le rose est vraiment rose. Seul bémol, le livreur a abimé la main droite.' ,1),
(2,'Thérèse de Monsou',2, 'Bof Bof...', 'La figurine ne tient pas debout seule. Certains détails sont mal finis, comme les bracelets.' ,1),
(3,'Monsieur Preskovitch',5, 'Juste parfait', 'C''est tellement parfait, on dirait que c''est roulé à la main sous les aisselles.' ,1),

(4,'Barbapapix',5, 'Parfait', 'Un niveau de détail bluffant. A se procurer absolument si vous êtes collectionneurs.' ,2),
(5,'Fabrice',4, 'Très bien', 'Le rapport qualité prix est plus que bien, le prix est vraiment bas pour cette figurine de qualité.' ,2),
(6,'Thomas',1, 'Déçu', 'Trop de défaut de peintures... A éviter' ,2),

(7,'Guillaume',3, 'Très bon mais ...', 'Léger, centre de gravité bien centré, très joueur pour un VAE, utilisé quotidiennement pour aller bosser les trajets sont des vrais plaisirs ! Par contre à ce prix on peut s''attendre à un vélo complet, le mien est arrivé sans contacteur d''assistance Shimano, du coup je ne peux rien régler sur mon compteur, même pas l''heure ni le Bluetooth ... A 3000€ ça fait mal ...' ,3),
(8,'Tientien',5, 'Excellent compromis', 'Ce vélo répond à tous mes besoins : très beau, bien équipé, un niveau de finition exceptionnel, une grande autonomie, un montage typé “Gravel”, confortable mais assez vif, pas trop cher. Je ne lui trouve que des qualités.' ,3),
(9,'Marc',5, 'Excellent produit ! Livré monté et emballage très propre et adapté. Seul point à savoir, il n''y a pas de commande de passage de mode rapide séparé de l''écran principal.' ,3),

(10,'Coursverte',5, 'Bluffant', 'Avec 3 mois de recul, ce casque est tout simplement bluffant. Très belle finition, très léger, parfaitement adapté à la tête, ce casque se fait oublier.' ,4),
(11,'Gégé',5,'Rapport qualité prix moyen','Le Ionos que je possédais avant était mieux fini et plus aéré' ,4),

(12,'Timo0826',5, 'Bon produit.', 'Satisfait de mon achat même s''il y a quelque petite imperfection sur le casque (polystyrène légèrement enfoncé à certain endroit et la couleur du logo Oakley qui n''est pas uniforme).' ,5),
(13,'Pierre Cycling',5, 'Le casque révolutionnaire !!!!', 'Ce casque est vraiment génial avec le BOA qui assure un serrage optimal et le MIPS qui garantie le sécurité et ce look purement du OAKLEY !!!!!!!!!!!!!! L''aération est super et le support de lunette c''est top !!!!!!!!!!!!! Pour moi c''est l''un des meilleurs casque au monde !!!!!!!!!!!!!!!' ,5),
(14,'Blupy',5, 'Casque haut-de-gamme', 'Je suis très content du produit et de la rapidité pour la livraison' ,5),

(15,'Chris21',5, 'Orange is à new Black !!!', 'Ces chaussures ont un super rapport qualité prix, elles sont confortables j''ai pris une taille au dessus de ma pointure comme d''habitude, elles ont une bonne tenue du coup de pied et du talon avec un serrage efficace. J''avais un doute à l''achat sur la rigidité des semelles et c''est une bonne surprise pour des semelles composites elles sont assez rigides pour ne pas sentir les pédales. Seul petit bémol la molette BOA ne se desserre pas cran par cran il faut débrayer entièrement pour desserrer un peu le pied ....' ,6),
(16,'Raph',4, 'Bon rapport qualité prix', 'Système de serrage efficace et précis mais attention ca taille très petit... Je fais du 44 et avec du 44 2\3 j''étais au bout !!! Alors que mes ancienne mavic sont du 44 2/3....Je n''ai pas tenté une autre paire.... Pas assez précis pour les tailles.. Alltriks toujours au top.!! Retour nickel..' ,6),
(17,'Carlos',3, 'Correcte', 'Le système boa est bien mais la chaussure semble très fragile, notamment au passage du fil par les œillets en tissu. A mon avis ça va vite lâcher!' ,6);
