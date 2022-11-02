# _SQL Lessons_

These are my notes of the class of Database I from my College Course Information System. 

## _Tools_

- Postegres
- Videos from Alura

### _Creating the table and their columns_

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



