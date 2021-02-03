-- Partie 2 : Bibliothèque

--     Les besoins

--     La bibliothèque La Manu vient d'ouvrir et elle ne dispose pas de logiciel pour suivre ses livres. 
--     Vous êtes donc en charge de créer une base de données permettant de faciliter cette gestion. 

--     Les contraintes
--         La bibliothèque souhaiterait pouvoir enregistrer ses clients, enregistrer tous ses livres et surtout, suivre ses livres empruntés.
--             Les clients sont définis par leur nom et prénom, leur date de naissance, leur mail, leur genre de livre qu'ils préfèrent.
--             Les livres sont définis par leur titre, leur genre, le nom et prénom de leur auteur.
--             Le registre d'emprunts contient le titre du livre, la date d'emprunt et la date de retour, le nom et prénom du client.
--     Les choses à savoir

--     La bibliothèque La Manu ne possède que 4 genres de livre : 
--         Horreur
--         Science Fiction
--         Roman
--         Jeunesse
--     Les pré-requis de votre base de données

--     La bibliothèque La Manu possède 70 livres et 25 clients. 
--     Elle possède un registre de 40 lignes avec 14 livres qui ne sont pas encore rendus. 
--     Dans ce registre, il faut également retrouver des livres populaires (Empruntés plusieurs fois).
--     Fonctionnalités
--         Il faudra pouvoir afficher les lignes du registre (titre, nom et prénom du client, date d'emprunt et de retour du livre)
--         Il faudra pouvoir lister tous les livres (titre, genre, nom et prénom de l'auteur, disponibilité)
--         Il faudra pouvoir afficher le nombre total de livres par genre (nom du genre, total de livres correspondants)

-- Il faudra pouvoir afficher les lignes du registre (titre, nom et prénom du client, date d'emprunt et de retour du livre)
SELECT `library_books`.`book_title`, `library_clients`.`client_lastname`, `library_clients`.`client_firstname`, `library_register`.`date_of_the_imprint`, `library_register`.`return_date`
FROM `library_books`
INNER JOIN `library_register` ON `library_register`.`id` = `library_books`.`id`
INNER JOIN `library_clients` ON `library_clients`.`id` = `library_register`.`id_library_clients`;

-- Il faudra pouvoir lister tous les livres (titre, genre, nom et prénom de l'auteur, disponibilité)
SELECT `library_books`.`book_title`, `library_book_kind`.`book_kind_name`, `library_book_author`.`book_author_lastname`, `library_book_author`.`book_author_firstname`
FROM `library_books`
INNER JOIN `contain` ON `library_books`.`id` = `contain`.`id_library_books`
INNER JOIN `library_book_kind` ON `contain`.`id` = `library_book_kind`.`id`
INNER JOIN `library_book_author` ON `library_book_author`.`id` = `library_books`.`id_library_book_author`
LEFT JOIN `library_register` ON `library_books`.`id` = `library_register`.`id_library_books`
WHERE `library_register`.`return_date` < NOW() OR `library_register`.`date_of_the_imprint` IS NULL;

-- Il faudra pouvoir afficher le nombre total de livres par genre (nom du genre, total de livres correspondants)
SELECT COUNT(*) AS `number_books`, `library_book_kind`.`book_kind_name`
FROM `library_book_kind`
INNER JOIN `contain` ON `contain`.id = `library_book_kind`.id
INNER JOIN `library_books` ON `library_books`.id = `contain`.`id_library_books`
GROUP BY `library_books`.`book_title`;
