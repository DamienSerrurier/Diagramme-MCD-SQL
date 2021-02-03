-- Partie 1 : Vente de maisons

--     Les besoins

-- L'agence immobilière La Manu doit gérer les ventes de son parc immobilier. 
-- Vous êtes donc en charge de créer une base de données permettant de faciliter cette gestion. 

--     Les contraintes

-- L'agence souhaiterait pouvoir enregistrer ses biens immobiliers, ses clients et les rendez-vous des visites des biens immobiliers. 

--         Les biens immobiliers sont définis par leur nom, leur type, leur code postal et leur prix.
--         Les clients sont définis par leur nom et prénom, leur date de naissance, leur mail, leur budget et le type de bien qu'ils recherchent. 
--         Les rendez-vous sont définis par le nom du bien à visiter, le nom et le prénom du client qui souhaite visiter le bien, la date et le créneau horaire de la visite. 


--     Les choses à savoir

-- L'agence possède dans son parc 3 types de biens : 

--         Maison 
--         Appartement 
--         Terrain 


-- L'agence immobilière La Manu organise les rendez-vous pour les visites des biens sur 6 créneaux horaires. 

--      Les pré-requis de votre base de données

-- L'agence La Manu possède un parc immobiliers de 30 biens et 20 clients. Elle a aussi 10 rendez-vous de prévus. 

--     Fonctionnalités
--        1 Il faudra pouvoir afficher tous les biens par ordre de prix (nom du bien, son type, son code postal, son prix)
--        2 Il faudra pouvoir afficher les rendez-vous par ordre chronologique (date et créneau horaire du rendez-vous, nom du bien, son type, son code postal, son prix, nom et prénom du client)
--        3 Il faudra pouvoir afficher les clients par type de bien qu'ils recherchent (nom et prénom du client, type de bien, budget)

-- 1 Il faudra pouvoir afficher tous les biens par ordre de prix (nom du bien, son type, son code postal, son prix)
SELECT `estate_type_name`, `estate_name`, `estate_zipcode`, `prix`
FROM `estate`
INNER JOIN `estet_type` 
ON `estet_type`.`id` = `estate`.`id_estet_type`
ORDER BY `prix`;

-- 2 Il faudra pouvoir afficher les rendez-vous par ordre chronologique (date et créneau horaire du rendez-vous, nom du bien, son type, son code postal, son prix, nom et prénom du client)
SELECT `estate_type_name`, `estate_name`, `estate_zipcode`, `prix`, `client_lastname`, `client_firstname`,`time_slot`, `appointment`
FROM estate
INNER JOIN `estet_type` ON `estet_type`.`id` = `estate`.`id_estet_type`
INNER JOIN `appointment` ON `estate`.`id` = `appointment`.`id_estate`
INNER JOIN `appointments_timeslot` on `appointment`.`id_appointments_timeslot` = `appointments_timeslot`.`id`
INNER JOIN `clients` on `appointment`.`id_Clients` = `clients`.`id`
ORDER BY `appointment`.`appointment`;

-- 3 Il faudra pouvoir afficher les clients par type de bien qu'ils recherchent (nom et prénom du client, type de bien, budget)
SELECT `client_lastname`, `client_firstname`, `client_budget`, `estate_type_name`
FROM `clients`
INNER JOIN `client_search` ON `client_search`.`id` = `clients`.`id`
INNER JOIN `estet_type` ON `estet_type`.`id` = `client_search`.`id_estet_type`;