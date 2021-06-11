DROP DATABASE IF EXISTS yb;
CREATE DATABASE yb;
USE yb;
CREATE TABLE users
		(
		`id` INT(3) NOT NULL AUTO_INCREMENT,
		`username` VARCHAR(20) NOT NULL,
		`password` VARCHAR(20) NOT NULL,
		`sex` VARCHAR(4) NOT NULL,
		`imgurl` VARCHAR(255),
		`signature` VARCHAR(255),
		PRIMARY KEY (id)
		);

INSERT INTO yb.users (`username`, `password`,`sex`,`imgurl`,`signature`)
VALUES 
('admin', 'admin', '男','./img/weidenglu.png','这个人很勤快，但是也没有个性签名~~'),
('cjq', 'cjq', '男','./img/weidenglu.png','这个人很勤快，但是也没有个性签名~~'),
('qsy', 'qsy', '男','./img/weidenglu.png','这个人很勤快，但是也没有个性签名~~'),
('xiaohong', 'xiaohong', '男','./img/weidenglu.png','这个人很勤快，但是也没有个性签名~~')