-- Partie 3 : Cabinet médical

--     Les besoins

--     Le cabinet médical La Manu doit gérer les rendez-vous de ses patients et de ses médecins. 
--     Vous êtes donc en charge de créer une base de données permettant de faciliter cette gestion.
--     Les contraintes
--         Le cabinet médical souhaiterait pouvoir enregistrer ses médecins, ses patients et leurs rendez-vous.
--         Les médecins sont définis par leur nom, prénom, mail et leur spécialité
--         Les patients sont définis par leur nom et prénom, leur date de naissance et leur médecin traitant
--         Les rendez-vous sont définis par le nom et le prénom du patient, le nom du médecin, sa spécialité,la date et le créneau horaire du rendez-vous. 

--     Les choses à savoir
--         Les médecins du cabinet médical sont répartis dans 3 spécialités :
--             Généraliste
--             Neurologue
--             Oncologue
--         Le cabinet médical La Manu prend les rendez-vous médicaux sur 8 créneaux horaires.


--     Les pré-requis de votre base de données
--         Il y a 5 médecins qui travaillent pour le cabinet médical "La Manu"
--         20 patients fréquentent le cabinet.
--         Il y a aussi 30 rendez-vous médicaux de prévus.

--     Fonctionnalités
--         Il faudra pouvoir afficher tous les rendez-vous du cabinet médical (date et créneau horaire du rendez-vous, nom et prénom du patient, nom et spécialité du médecin).
--         Il faudra pouvoir afficher tous les rendez-vous d'un médecin (nom du médecin, date et créneau horaire du rendez-vous, nom et prénom du patient).
--         Il faudra pouvoir afficher le rendez-vous d'un patient (nom et prénom du patient, spécialité du médecin, nom et prénom du médecin, date et créneau horaire du rendez-vous).

-- Il faudra pouvoir afficher tous les rendez-vous du cabinet médical (date et créneau horaire du rendez-vous, nom et prénom du patient, nom et spécialité du médecin).
SELECT `medical_office_appointment`.`appointment_date`, `medical_office_time_slot`.`appointment_time_slot`, `medical_office_patient`.`patient_lastname`, `medical_office_patient`.
`patient_firstname`, `medical_office_doctor`.`doctor_lastname`, `medical_office_speciality`.`speciality_doctor`
FROM `medical_office_appointment`
INNER JOIN `medical_office_time_slot` ON `medical_office_time_slot`.`id` = `medical_office_appointment`.`id_medical_office_time_slot`
INNER JOIN `medical_office_patient` ON `medical_office_patient`.`id` = `medical_office_time_slot`.`id`
INNER JOIN `medical_office_doctor` ON `medical_office_doctor`.`id` = `medical_office_patient`.`id_medical_office_doctor`
INNER JOIN `medical_office_speciality` ON `medical_office_speciality`.`id` = `medical_office_doctor`.`id_medical_office_speciality`;

-- Il faudra pouvoir afficher tous les rendez-vous d'un médecin (nom du médecin, date et créneau horaire du rendez-vous, nom et prénom du patient).
SELECT `medical_office_doctor`.`doctor_lastname`, `medical_office_appointment`.`appointment_date`, `medical_office_time_slot`.`appointment_time_slot`, `medical_office_patient`.`patient_lastname`, 
`medical_office_patient`.`patient_firstname`
FROM `medical_office_doctor`
INNER JOIN `medical_office_appointment` ON `medical_office_appointment`.`id` = `medical_office_doctor`.`id`
INNER JOIN `medical_office_time_slot` ON `medical_office_time_slot`.`id` = `medical_office_appointment`.`id_medical_office_time_slot`
INNER JOIN `medical_office_patient` ON `medical_office_patient`.`id` = `medical_office_time_slot`.`id`
WHERE `medical_office_doctor`.`doctor_lastname` = 'Ducobu';

-- Il faudra pouvoir afficher le rendez-vous d'un patient (nom et prénom du patient, spécialité du médecin, nom et prénom du médecin, date et créneau horaire du rendez-vous).
SELECT `medical_office_patient`.`patient_lastname`, `medical_office_patient`.`patient_firstname`, `medical_office_speciality`.`speciality_doctor`, `medical_office_doctor`.`doctor_lastname`,
 `medical_office_doctor`.`doctor_firstname`, `medical_office_appointment`.`appointment_date`, `medical_office_time_slot`.`appointment_time_slot`
FROM `medical_office_patient`
INNER JOIN `medical_office_speciality` ON `medical_office_speciality`.`id` = `medical_office_patient`.`id`
INNER JOIN `medical_office_doctor` ON `medical_office_doctor`.`id_medical_office_speciality` = `medical_office_speciality`.`id`
INNER JOIN `medical_office_appointment` ON `medical_office_appointment`.`id` = `medical_office_doctor`.`id`
INNER JOIN `medical_office_time_slot` ON `medical_office_time_slot`.`id` = `medical_office_appointment`.`id_medical_office_time_slot`
WHERE `medical_office_patient`.`patient_lastname` = 'Lamouette';