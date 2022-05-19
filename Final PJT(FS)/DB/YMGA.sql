DROP DATABASE IF EXISTS ymga_board;
CREATE DATABASE ymga_board DEFAULT CHARACTER SET utf8mb4;

USE ymga_board;

CREATE TABLE user_info (
	seq		INT				AUTO_INCREMENT,
	id 				VARCHAR(20) 	UNIQUE NOT NULL,
    pw				VARCHAR(20) 	NOT NULL,
	nickname 		VARCHAR(20) 	NOT NULL,
    email_adress 	VARCHAR(40)		NOT NULL,
    PRIMARY KEY (seq)
);

CREATE TABLE user_mypage(
    user_seq		INT,
    height			INT,
    weight			INT,
    goal			VARCHAR(40),
    profile_img		VARCHAR(500),
    FOREIGN KEY (`user_seq`) REFERENCES `user_info` (`seq`)
);

CREATE TABLE zzim_recipe(
	id				INT		auto_increment,
	user_seq		INT,
    recipe_id		INT,
    primary key (id),
    FOREIGN KEY (`user_seq`) REFERENCES `user_info` (`seq`)
);

CREATE TABLE zzim_recipe_video(
	id				INT		auto_increment,
	user_seq		INT,
    uri				VARCHAR(100),
    PRIMARY KEY (id),
    FOREIGN KEY (`user_seq`) REFERENCES `user_info` (`seq`)
);

CREATE TABLE zzim_exercise(
	id				INT		auto_increment,
	user_seq		INT,
    exercise_id		INT,
    PRIMARY KEY (id),
    FOREIGN KEY (`user_seq`) REFERENCES `user_info` (`seq`)
);

CREATE TABLE zzim_exercise_video(
	id				INT		auto_increment,
	user_seq		INT,
    uri				VARCHAR(100),
    PRIMARY KEY (id),
    FOREIGN KEY (`user_seq`) REFERENCES `user_info` (`seq`)
);
	
CREATE TABLE post_free(
	id 				INT 			AUTO_INCREMENT,
    title 			VARCHAR(100) 	NOT NULL,
    writer 			VARCHAR(20) 	NOT NULL,
    content 		TEXT,
    view_cnt 		INT 			DEFAULT 0,
    reg_date 		TIMESTAMP 		DEFAULT now(),
    PRIMARY KEY (`id`),
    FOREIGN KEY (`writer`) REFERENCES `user_info` (`nickname`)
);

CREATE TABLE post_comment_free(
	id				INT				AUTO_INCREMENT,
	post_id 		INT 			,
	writer 			VARCHAR(20) 	NOT NULL,
	content 		TEXT,
    reg_date 		TIMESTAMP 		DEFAULT now(),
	PRIMARY KEY (`id`),
    FOREIGN KEY (`post_id`) REFERENCES `post_free`(`id`),
    FOREIGN KEY (`writer`) REFERENCES `user_info` (`nickname`)
);

CREATE TABLE post_inform(
	id 				INT 			AUTO_INCREMENT,
    title 			VARCHAR(100) 	NOT NULL,
    writer 			VARCHAR(20) 	NOT NULL,
    content 		TEXT,
    view_cnt 		INT 			DEFAULT 0,
    reg_date 		TIMESTAMP 		DEFAULT now(),
    PRIMARY KEY (`id`),
    FOREIGN KEY (`writer`) REFERENCES `user_info` (`nickname`)
);

CREATE TABLE post_comment_inform(
	id				INT				AUTO_INCREMENT,
	post_id 		INT 			,
	writer 			VARCHAR(20) 	NOT NULL,
	content 		TEXT,
    reg_date 		TIMESTAMP 		DEFAULT now(),
	PRIMARY KEY (`id`),
    FOREIGN KEY (`post_id`) REFERENCES `post_inform`(`id`),
    FOREIGN KEY (`writer`) REFERENCES `user_info` (`nickname`)
);
    
CREATE TABLE post_ad(
	id 				INT 			AUTO_INCREMENT,
    title 			VARCHAR(100) 	NOT NULL,
    writer 			VARCHAR(20) 	NOT NULL,
    content 		TEXT			NOT NULL,
    view_cnt 		INT 			DEFAULT 0,
    reg_date 		TIMESTAMP 		DEFAULT now(),
    PRIMARY KEY (`id`),
    FOREIGN KEY (`writer`) REFERENCES `user_info` (`nickname`)
);

CREATE TABLE post_comment_ad(
	id				INT				AUTO_INCREMENT,
	post_id 		INT 			,
	writer 			VARCHAR(20) 	NOT NULL,
	content 		TEXT,
    reg_date 		TIMESTAMP 		DEFAULT now(),
	PRIMARY KEY (`id`),
    FOREIGN KEY (`post_id`) REFERENCES `post_ad`(`id`),
    FOREIGN KEY (`writer`) REFERENCES `user_info` (`nickname`)
);
    
CREATE TABLE timeline_exercise(
	`id`			INT			AUTO_INCREMENT,
	`user_seq`		INT,
    `date`			TIMESTAMP,
    `type`			VARCHAR(20),
    `amount`		VARCHAR(20),
    `publicity`		BOOLEAN,
    PRIMARY KEY(`id`),
    FOREIGN KEY (`user_seq`) REFERENCES `user_info` (`seq`)
);
    
CREATE TABLE timeline_diet(
	`id`			INT			AUTO_INCREMENT,
	`user_seq`		INT,
    `date`			TIMESTAMP,
    `type`			VARCHAR(20),
    `amount`		VARCHAR(20),
    `publicity`		BOOLEAN,
    PRIMARY KEY(`id`),
    FOREIGN KEY (`user_seq`) REFERENCES `user_info` (`seq`)
);
    
CREATE TABLE club_info(
	`id`			INT				AUTO_INCREMENT,
    `name`			VARCHAR(30)		UNIQUE NOT NULL,
    `persons`		INT				DEFAULT 0,
	PRIMARY KEY(`id`)
);

CREATE TABLE club_member(
	`id`				INT			AUTO_INCREMENT,
	`club_id`			INT,
    `user_seq`			INT,
	`rank`				VARCHAR(20)		DEFAULT '일반 회원',
	PRIMARY KEY (`id`),
	FOREIGN KEY (`user_seq`) REFERENCES `user_info` (`seq`),
    FOREIGN KEY (`club_id`) REFERENCES `club_info` (`id`)
);

CREATE TABLE post_club(
	id 				INT 			AUTO_INCREMENT,
    club_id			INT,
    title 			VARCHAR(100) 	NOT NULL,
    writer 			VARCHAR(20) 	NOT NULL,
    content 		TEXT,
    view_cnt 		INT 			DEFAULT 0,
    reg_date 		TIMESTAMP 		DEFAULT now(),
    PRIMARY KEY (`id`),
    FOREIGN KEY (`club_id`) REFERENCES `club_info` (`id`),
    FOREIGN KEY (`writer`) REFERENCES `user_info` (`nickname`)
);

CREATE TABLE post_comment_club(
	id				INT				AUTO_INCREMENT,
	post_id 		INT,
	writer 			VARCHAR(20) 	NOT NULL,
	content 		TEXT,
    reg_date 		TIMESTAMP 		DEFAULT now(),
	PRIMARY KEY (`id`),
    FOREIGN KEY (`post_id`) REFERENCES `post_club`(`id`),
    FOREIGN KEY (`writer`) REFERENCES `user_info` (`nickname`)
);
    
    
    
    
    
    
    
    
    