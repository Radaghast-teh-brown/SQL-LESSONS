-- This is the database for a course managment system



CREATE TABLE student(
	id INTEGER,
	name_studant VARCHAR(50),
	code_studant NUMERIC(50),
	CONSTRAINT studante
		PRIMARY KEY (code_studant)
);
CREATE TABLE course(
	name_course VARCHAR(50),
	credits INTEGER,
	code_course NUMERIC(50),
	CONSTRAINT course_1
		PRIMARY KEY (code_course, name_course)
	
);
	
CREATE TABLE instructor(
	id INTEGER,
	name_instructor VARCHAR(50),
	code_instructor NUMERIC(50),
	code_course NUMERIC(50),
	CONSTRAINT pk_instructor
		PRIMARY KEY (code_instructor),
	CONSTRAINT fk_instrutor
		FOREIGN KEY (code_course) REFERENCES  course(code_course)
);





