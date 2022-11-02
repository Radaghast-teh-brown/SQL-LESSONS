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

`
CREATE TABLE aluno(
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
`

