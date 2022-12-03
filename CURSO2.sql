AlTER TABLE aluno
ADD column data_nascimento DATE NOT NULL,
DROP column data_dascimento;

CREATE TABLE aluno(
	id SERIAL PRIMARY KEY,
	primeiro_nome VARCHAR(255) NOT NULL,
	ultimo_nome VARCHAR(255) NOT NULL,
	data_dascimento DATE NOT NULL
);

CREATE TABLE curso(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	categoria_id INTEGER NOT NULL REFERENCES categoria(id)
);

CREATE table categoria(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL
);

CREATE TABLE aluno_curso(
	aluno_id INTEGER NOT NULL REFERENCES aluno(id),
	curso_id INTEGER NOT NULL REFERENCES curso(id),
	PRIMARY KEY (aluno_id, curso_id)
);

INSERT INTO categoria(nome) VALUES('backend');
INSERT INTO categoria(nome) VALUES('frontend');
INSERT INTO categoria(nome) VALUES('fullstack');
INSERT INTO categoria(nome) VALUES('UX');

INSERT INTO curso(nome, categoria_id) VALUES('Python',1);
INSERT INTO curso(nome, categoria_id) VALUES('Java',1);
INSERT INTO curso(nome, categoria_id) VALUES('JavaScript',5);
INSERT INTO curso(nome, categoria_id) VALUES('User Experience',7);
INSERT INTO curso(nome, categoria_id) VALUES('Mobile',6);

INSERT INTO aluno(primeiro_nome, ultimo_nome, data_nascimento)
VALUES('Magno', 'Junior','03/11/1994');

INSERT INTO aluno(primeiro_nome, ultimo_nome, data_nascimento)
VALUES('Junior', 'Brito','02/11/1994');

INSERT INTO aluno(primeiro_nome, ultimo_nome, data_nascimento)
VALUES('Hugo', 'Veia','01/11/1994');

INSERT INTO aluno(primeiro_nome, ultimo_nome, data_nascimento)
VALUES('Renan', 'Ribeiro','04/11/1994');

INSERT INTO aluno_curso VALUES(1,1),(2,2),(3,3),(4,4);

SELECT * 
	FROM categoria;
	
SELECT  curso.nome,
		COUNT(aluno_curso.aluno_id) AS numero_alunos
	FROM curso
	JOIN aluno_curso ON aluno_curso.curso_id = curso.id
	GROUP BY curso.nome;
	
	

SELECT  aluno.primeiro_nome, 
		aluno.ultimo_nome,
		COUNT(curso.id) AS numero_cursos
	FROM aluno
	JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
	JOIN curso ON curso.id = aluno_curso.curso_id
	GROUP BY aluno.primeiro_nome, aluno.ultimo_nome
	ORDER BY numero_cursos DESC;

SELECT *FROM aluno_curso;

