CREATE DATABASE `hrms` /!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /!80016 DEFAULT ENCRYPTION='N' */;
CREATE TABLE `curriculum_vitae` (
                                    `id` int NOT NULL AUTO_INCREMENT,
                                    `job_seeker_id` int NOT NULL,
                                    `about` varchar(250) NOT NULL,
                                    `linkedin_link` varchar(100) DEFAULT NULL,
                                    `github_link` varchar(100) DEFAULT NULL,
                                    PRIMARY KEY (`id`),
                                    UNIQUE KEY `job_seeker_id` (`job_seeker_id`),
                                    CONSTRAINT `curriculum_vitae_ibfk_01` FOREIGN KEY (`job_seeker_id`) REFERENCES `job_seeker` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `employee` (
                            `id` int NOT NULL AUTO_INCREMENT,
                            `corporation_name` varchar(200) DEFAULT NULL,
                            `web_site_name` varchar(300) DEFAULT NULL,
                            `email` varchar(100) DEFAULT NULL,
                            `password` varchar(100) DEFAULT NULL,
                            PRIMARY KEY (`id`),
                            UNIQUE KEY `corporation_name` (`corporation_name`),
                            UNIQUE KEY `web_site_name` (`web_site_name`),
                            UNIQUE KEY `email` (`email`),
                            UNIQUE KEY `password` (`password`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `job_advertisement` (
                                     `id` int NOT NULL AUTO_INCREMENT,
                                     `job_position_id` int DEFAULT NULL,
                                     `employee_id` int DEFAULT NULL,
                                     `advertisement_title` varchar(50) DEFAULT NULL,
                                     `advertisement_context` text,
                                     `min_salary` double DEFAULT NULL,
                                     `max_salary` double DEFAULT NULL,
                                     `position_amount` int DEFAULT NULL,
                                     `is_active` tinyint(1) DEFAULT NULL,
                                     PRIMARY KEY (`id`),
                                     KEY `job_advertisement_ibfk_01` (`job_position_id`),
                                     KEY `job_advertisement_ibfk_02` (`employee_id`),
                                     CONSTRAINT `job_advertisement_ibfk_01` FOREIGN KEY (`job_position_id`) REFERENCES `job_position` (`id`),
                                     CONSTRAINT `job_advertisement_ibfk_02` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`),
                                     CONSTRAINT `job_advertisement_chk_1` CHECK ((`min_salary` >= 0)),
                                     CONSTRAINT `job_advertisement_chk_2` CHECK ((`max_salary` > 0)),
                                     CONSTRAINT `job_advertisement_chk_3` CHECK ((`position_amount` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `job_experiences` (
                                   `id` int NOT NULL AUTO_INCREMENT,
                                   `curriculum_vitae_id` int NOT NULL,
                                   `corporation_name` varchar(300) DEFAULT NULL,
                                   `position_id` int DEFAULT NULL,
                                   `beginning` varchar(8) DEFAULT NULL,
                                   `finish` varchar(8) DEFAULT NULL,
                                   PRIMARY KEY (`id`),
                                   UNIQUE KEY `curriculum_vitae_id` (`curriculum_vitae_id`),
                                   KEY `job_experiences_ibfk_02` (`position_id`),
                                   CONSTRAINT `job_experiences_ibfk_01` FOREIGN KEY (`curriculum_vitae_id`) REFERENCES `curriculum_vitae` (`id`),
                                   CONSTRAINT `job_experiences_ibfk_02` FOREIGN KEY (`position_id`) REFERENCES `job_position` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `job_position` (
                                `id` int NOT NULL AUTO_INCREMENT,
                                `job_name` varchar(100) DEFAULT NULL,
                                `job_explanation` text,
                                PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `job_seeker` (
                              `id` int NOT NULL AUTO_INCREMENT,
                              `job_position_id` int DEFAULT NULL,
                              `name` varchar(100) NOT NULL,
                              `surname` varchar(100) NOT NULL,
                              `email` varchar(100) DEFAULT NULL,
                              `password` varchar(100) DEFAULT NULL,
                              `birth_year` int NOT NULL,
                              `mail` varchar(255) DEFAULT NULL,
                              `tc_no` varchar(255) DEFAULT NULL,
                              PRIMARY KEY (`id`),
                              UNIQUE KEY `name` (`name`),
                              UNIQUE KEY `surname` (`surname`),
                              UNIQUE KEY `job_position_id` (`job_position_id`),
                              UNIQUE KEY `email` (`email`),
                              UNIQUE KEY `password` (`password`),
                              CONSTRAINT `job_seeker_ibfk_01` FOREIGN KEY (`job_position_id`) REFERENCES `job_position` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `language` (
                            `id` int NOT NULL AUTO_INCREMENT,
                            `curriculum_vitae_id` int NOT NULL,
                            `language_name` varchar(20) DEFAULT NULL,
                            `level` int DEFAULT NULL,
                            PRIMARY KEY (`id`),
                            UNIQUE KEY `curriculum_vitae_id` (`curriculum_vitae_id`),
                            CONSTRAINT `language_ibfk_01` FOREIGN KEY (`curriculum_vitae_id`) REFERENCES `curriculum_vitae` (`id`),
                            CONSTRAINT `language_chk_1` CHECK (((`level` >= 0) and (`level` <= 5)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `school` (
                          `id` int NOT NULL AUTO_INCREMENT,
                          `curriculum_vitae_id` int NOT NULL,
                          `school_name` varchar(100) DEFAULT NULL,
                          `section` varchar(75) DEFAULT NULL,
                          `graduation_year` int DEFAULT NULL,
                          `beginning` varchar(8) DEFAULT NULL,
                          `finish` varchar(8) DEFAULT NULL,
                          PRIMARY KEY (`id`),
                          UNIQUE KEY `curriculum_vitae_id` (`curriculum_vitae_id`),
                          CONSTRAINT `school_ibfk_01` FOREIGN KEY (`curriculum_vitae_id`) REFERENCES `curriculum_vitae` (`id`),
                          CONSTRAINT `school_chk_1` CHECK ((`graduation_year` > 1900))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tech_name` (
                             `id` int NOT NULL AUTO_INCREMENT,
                             `curriculum_vitae_id` int NOT NULL,
                             `tech_name` varchar(50) DEFAULT NULL,
                             PRIMARY KEY (`id`),
                             UNIQUE KEY `curriculum_vitae_id` (`curriculum_vitae_id`),
                             CONSTRAINT `tech_name_ibfk_01` FOREIGN KEY (`curriculum_vitae_id`) REFERENCES `curriculum_vitae` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;