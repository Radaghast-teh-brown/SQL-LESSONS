# _SQL Lessons_

These are my notes of the class of Database I from my College Course Information System. 

![image](https://user-images.githubusercontent.com/84158231/202919667-e1accc6e-9a5f-48c3-8e05-aae029d00605.png)

## _Tools_

- Postegres
- Videos from Alura

## _Lesson 1_

###_Creating the table and their columns_

To create the table 
```
CREATE TABLE aluno()

```
Addind their columns with differents data types

```
CREATE TABLE aluno(
  	id SERIAL,
	nome VARCHAR(255)  		 NOT NULL,
	cpf CHAR(11)       		 NOT NULL,
	observacao TEXT    		 NOT NULL,
	idade INTEGER 			 NOT NULL,
	dinheiro NUMERIC(10,2)	 	 NOT NULL,
	altura REAL			 NOT NULL,
	ativo BOOLEAN			 NOT NULL,
	data_nascimento DATE	 	 NOT NULL,
	hora_aula TIME			 NOT NULL,
	matriculado_em TIMESTAMP  	 NOT NULL

);
```
The NOT NULL means that when que insert the datas we can leave theses columns empty. 


## _Lesson 2_

### _Insert values in the table_

To insert values. Each data has to be fill with the correct data type

```
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
	 27,
	100.00,
	1.70,
	'TRUE',
	'1994-11-03',
	'15:34:00',
	'2022-11-02 15:34:00'
);
```

## _Lesson 3_

### _Searching for information_


The SELECT statament is really important in this field. It seems to me that their functions is to search for different information in the databases.

To search for the row _nome_  in the table:

```
SELECT nome FROM aluno
```

To search for the hole table

```
SELECT * FROM aluno

```

## _Lesson 4_

### _Updating information_

The UPDATE statament updates the data in database. We use this command to make it

```
UPDATE aluno
	set nome = 'Juca',
	idade = 28
	WHERE id = 1;
	
```

### Selecting specific columns information

As a DataBase Administrator we have to search for specific information in our database.
We use the SELECT statament and AS to specify the data with extra comment

```
SELECT idade AS "Idade do aluno",
	nome AS "Nome do aluno",
	matriculado_em AS "Quando foi matriculado"
	FROM aluno;

```

## _Lesson 5_

### _Logical Operators_

To select some information or to change some data we need to put specific rules to do it. The logical operators help us do it. They are

- >=  		- greater than
- <=  		- less than
- <> or != 	- different
- AND
- OR
- IS
- NOT
- BETWEEN

Example:

```
SELECT idade
	FROM aluno
	WHERE aluno >= 10 
```

```
SELECT nome 
	FROM aluno
	WHERE nome <> 'Juca'
```

```
SELECT *
	FROM aluno
	WHERE idade BETWEEN 10 AND 50 AND OR nome = 'Jesus';
```


## _Lesson 6_

### _Primary Key and Foreign Key_
Every table in our database needs to be defined with a primary key or foreign key. These attributes are used to qualify our table UNIQUELY. The stataments PRIMARY KEY and FOREIGN KEY can be used like:

```
CREATE TABLE course(
	name_course VARCHAR(50),
	code_course NUMERIC(10),
	PRIMARY KEY (code_course)
)
```
Foreign keys are used to conect two tables from their primary key. Sometimes we need  to use some primary key from other table to make our current table consistent.

```
CREATE TABLE instructor(
	name_instructor VARCHAR(50),
	code_instructor NUMERIC(10),
	age_instructor INTEGER,
	code_course NUMERIC(10),
	FOREIGN KEY (code_course) REFERENCES course(code_course)
	
)

```

We also can have compost primary or foreign keys.

```
CREATE TABLE course(
	name_course VARCHAR(50),
	code_course NUMERIC(10),
	PRIMARY KEY (code_course, name_course)
)
```

```
CREATE TABLE instructor(
	name_instructor VARCHAR(50),
	code_instructor NUMERIC(10),
	age_instructor INTEGER,
	code_course NUMERIC(10),
	name_course VARCHAR(50),
	FOREIGN KEY (code_course, name_course) REFERENCES course(code_course, name_course)
	
)

```

## _Lesson 7_

### Join

Sometimes is necessary to access data from different tables that have some combination. We use JOIN statament and their variations to do it. This are the types of JOIN:
- INNER JOIN
- RIGHT JOIN
- LEFT JOIN
- OUTER JOIN

To show how this work I created two tables with commom information.

```

CREATE TABLE tabelaA(
	nome VARCHAR(50)
	
);

CREATE TABLE  tabelaB(
	nome VARCHAR(50)
)

INSERT INTO tabelaA(nome) VALUES('Magno');
INSERT INTO tabelaA(nome) VALUES('João Pedro');
INSERT INTO tabelaA(nome) VALUES('Maurício');
INSERT INTO tabelaA(nome) VALUES('Ricardo');

INSERT INTO tabelaB(nome) VALUES('Ana');
INSERT INTO tabelaB(nome) VALUES('Magno');
INSERT INTO tabelaB(nome) VALUES('Ricardo');
INSERT INTO tabelaB(nome) VALUES('Monica');

``` 

The inner join will return only datas that are in both tables

```
SELECT a.nome, b.nome
	FROM tabelaA as A
	INNER JOIN tabelaB as B
		ON a.nome = b.nome
```
The result are 'Magno' and 'Ricardo'.
The RIGHT JOIN will return only datas that are right (the second table) and are included in the first table. The LEFT JOIN does the opposite. 

```
SELECT a.nome, b.nome
	FROM tabelaA as a
	RIGHT JOIN tabelaB as B
		ON a.nome = b.nome;
```
The results are the names 'Magno', 'Ricardo', 'Ana' and 'Monica'
Doing the LEFT JOIN the results are 'Magno', 'Ricardo', 'Joao Pedro ' and 'Mauricio'.

```
SELECT a.nome, b.nome
	FROM tabelaA as a
	LEFT JOIN tabelaB as B
		ON a.nome = b.nome;
```

The OUTER JOIN returns all the datas in both table.

```
SELECT a.nome, b.nome
	FROM tabelaA as a
	FULL OUTER JOIN tabelaB as B
		ON a.nome = b.nome;

```

## _Lesson 8_

### _Altering tables_

Sometimes we make mistakes when we create tables or maybe we need to alter some column to make our database more consistent. To do this we can use the statemant ALTER. 
For exemple, suppose we need to drop one columnn and add another one. We could do something like this:

```
ALTER TABLE student
DROP column cpf,
ADD column CNPJ VARCHAR(14) NOT NULL;

```

## _Lesson 9_
### _Joins and reports_

We need to use JOIN when we have to make reports take connect differents columns from different tables. We can do this as shown below

```
SELECT  curso.nome,
		COUNT(aluno_curso.aluno_id) AS numero_alunos
	FROM curso
	JOIN aluno_curso ON aluno_curso.curso_id = curso.id
	GROUP BY curso.nome;
```
I was searching from information of the table curso, but I needed information of the table aluno_curso. So I used JOIN ... ON to specify which column I was needing. The report has information of both tables (curso and aluno_curso).
