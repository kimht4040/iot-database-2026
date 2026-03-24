
-- PA_IES DB생성
create database PAIES;

-- 사용자 생성
create user 'ies_user'@'%' identified by 'my123456';

-- 권한
grant all privileges on PAIES.* to 'ies_user'@'%';
flush privileges;


-- ERD로 만든 테이블 생성
CREATE TABLE `student` (
                           `std_no`	int	NOT NULL,
                           `std_name`	varchar(10)	NOT NULL,
                           `std_tel`	varchar(20)	NULL
);

CREATE TABLE `Untitled4` (
                             `lec_cd`	char(4)	NOT NULL,
                             `lec_name`	varchar(30)	NOT NULL,
                             `ins_no`	int	NOT NULL
);

CREATE TABLE `Untitled3` (
                             `std_no`	int	NOT NULL,
                             `lec_cd`	char(4)	NOT NULL,
                             `enr_dt`	date	NULL,
                             `grade`	varchar(5)	NULL
);

CREATE TABLE `instructor` (
                              `ins_no`	int	NOT NULL,
                              `ins_name`	varchar(10)	NOT NULL,
                              `ins_tel`	varchar(20)	NULL
);

ALTER TABLE `student` ADD CONSTRAINT `PK_STUDENT` PRIMARY KEY (
                                                               `std_no`
    );

ALTER TABLE `Untitled4` ADD CONSTRAINT `PK_UNTITLED4` PRIMARY KEY (
                                                                   `lec_cd`
    );

ALTER TABLE `Untitled3` ADD CONSTRAINT `PK_UNTITLED3` PRIMARY KEY (
                                                                   `std_no`,
                                                                   `lec_cd`
    );

ALTER TABLE `instructor` ADD CONSTRAINT `PK_INSTRUCTOR` PRIMARY KEY (
                                                                     `ins_no`
    );

ALTER TABLE `Untitled4` ADD CONSTRAINT `FK_instructor_TO_Untitled4_1` FOREIGN KEY (
                                                                                   `ins_no`
    )
    REFERENCES `instructor` (
                             `ins_no`
        );

ALTER TABLE `Untitled3` ADD CONSTRAINT `FK_student_TO_Untitled3_1` FOREIGN KEY (
                                                                                `std_no`
    )
    REFERENCES `student` (
                          `std_no`
        );

ALTER TABLE `Untitled3` ADD CONSTRAINT `FK_Untitled4_TO_Untitled3_1` FOREIGN KEY (
                                                                                  `lec_cd`
    )
    REFERENCES `Untitled4` (
                            `lec_cd`
        );



