-- Partie 4 : École primaire

--     Les besoins

-- L'école primaire La Manu souhaite centraliser les notes de tous ces élèves. 
-- Vous êtes donc en charge de créer une base de données permettant de faciliter cette gestion.


--     Les contraintes


--     Les élèves 
--     L'école souhaiterait pouvoir enregistrer les élèves avec les éléments suivant :
--         Nom
--         Prénom
--         Classe
--         Professeur principal


--     Les notes 
--     Les notes doivent être enregistrées avec les éléments suivants :
--         Nom de l'élève
--         Prénom de l'élèves
--         La note de l'élève
--         La matière dans laquelle l'élève a eu sa note


--     Les professeurs 
--     Les professeurs s'inscriront avec les éléments suivants :
--         Nom
--         Prénom
--         Adresse mail
--         Classe attitrée


--     Les choses à savoir
--         L'école a 5 classes : CP, CE1, CE2, CM1 et CM2
--         Les matières enseignées sont : Maths, Sport, Français, Anglais, Histoire, Géographie


--     Les pré-requis de votre base de données
--         30 élèves sont inscrits à l'école.
--         50 notes au minimum seront enregistrées.
--         4 Professeurs au minimum seront enregistrés.


--     Fonctionnalités
--         Il faudra pouvoir afficher toutes les notes des élèves (nom et prénom de l'élève, la note et la matière)
--         Il faudra pouvoir afficher la moyenne générale de chaque élève (nom et prénom de l'élève, la classe de l'élève, le nom du professeur principal, la moyenne)
--         Il faudra pouvoir afficher tous les élèves d'un professeur (nom et prénom du professeur, la classe du professeur, nom et prénom de l'élève)

-- Il faudra pouvoir afficher toutes les notes des élèves (nom et prénom de l'élève, la note et la matière)
SELECT `primary_school_students`.`student_lastname`, `primary_school_students`.`student_firstname`, `primary_school_notes`.`subject_note`, `primary_school_subjects`.`subject_name`
FROM `primary_school_students`
INNER JOIN `primary_school_notes` ON `primary_school_notes`.`id` = `primary_school_students`.`id_primary_school_notes`
INNER JOIN `primary_school_subjects` ON `primary_school_subjects`.`id` = `primary_school_notes`.`id_primary_school_subjects`;

-- Il faudra pouvoir afficher la moyenne générale de chaque élève (nom et prénom de l'élève, la classe de l'élève, le nom du professeur principal, la moyenne)
SELECT `primary_school_students`.`student_lastname`, `primary_school_students`.`student_firstname`, `primary_school_classes`.`classroom_name`, `primary_school_teachers`.`teacher_lastname`, AVG(`primary_school_notes`.subject_note) AS average_notes
FROM `primary_school_students`
INNER JOIN `primary_school_classes` ON `primary_school_classes`.`id` = `primary_school_students`.`id_primary_school_classes`
INNER JOIN `primary_school_teachers` ON `primary_school_teachers`.`id_primary_school_classes` = `primary_school_classes`.`id`
INNER JOIN `primary_school_notes` ON  `primary_school_notes`.`id` = `primary_school_students`.`id_primary_school_notes`
GROUP BY `primary_school_students`.`student_lastname`;

-- Il faudra pouvoir afficher tous les élèves d'un professeur (nom et prénom du professeur, la classe du professeur, nom et prénom de l'élève)
SELECT `primary_school_teachers`.`teacher_lastname`, `primary_school_teachers`.`teacher_firstname`, `primary_school_classes`.`classroom_name`, `primary_school_students`.`student_lastname`, `primary_school_students`.`student_firstname`
FROM `primary_school_teachers` 
INNER JOIN `primary_school_classes` ON `primary_school_classes`.`id` = `primary_school_teachers`.`id_primary_school_classes`
INNER JOIN `primary_school_students` ON `primary_school_students`.`id_primary_school_classes` = `primary_school_classes`.`id`
WHERE `primary_school_teachers`.`id` = 3;