CREATE TABLE aluno2(
	
	id SERIAL,
	nome VARCHAR(255)  		 NOT NULL,
	cpf CHAR(11)       		 NOT NULL,
	observacao TEXT    		 NOT NULL,
	idade INTEGER 			 NOT NULL,
	dinheiro NUMERIC(10,2)	 NOT NULL,
	altura REAL				 NOT NULL,
	ativo BOOLEAN			 NOT NULL,
	data_nascimento DATE	 NOT NULL,
	hora_aula TIME			 NOT NULL,
	matriculado_em TIMESTAMP NOT NULL
);

SELECT * FROM aluno;

INSERT INTO aluno(
	nome, 
	cpf, 
	observacao, 
	idade, 
	dinheiro, 
	altura, 
	ativo, 
	data_nascimento, 
	hora_aula,
	matriculado_em
) VALUES(
	'Magno',
	'14094094733',
	'primeiro insert',
	'27',
	100.00,
	1.70,
	'TRUE',
	'1994-11-03',
	'15:34:00',
	'2022-11-02 15:34:00'
);

SELECT nome FROM aluno;

SELECT * FROM aluno
	WHERE id = 1
	
UPDATE aluno
	SET nome = 'Juca',
	idade = 28
	WHERE id = 1;



DELETE FROM aluno
	WHERE nome = 'Magno';
	
SELECT idade AS "Idade do aluno", 
	nome  AS "Nome do aluno",
	matriculado_em "Quando foi matriculado"
	FROM aluno;


