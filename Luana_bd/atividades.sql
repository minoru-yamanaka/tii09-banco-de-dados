-- Criar o banco de dados:
CREATE DATABASE escola;
USE escola;
-- Criar a tabela alunos:
CREATE TABLE alunos (
 id INT AUTO_INCREMENT PRIMARY KEY,
 nome VARCHAR(100) NOT NULL,
 idade INT NOT NULL,
 serie VARCHAR(20),
 cidade VARCHAR(50)
);
-- Criar a tabela matriculas:
CREATE TABLE matriculas (
 id_matricula INT AUTO_INCREMENT PRIMARY KEY,
 id_aluno INT,
 curso VARCHAR(50),
 data_matricula DATE,
 FOREIGN KEY (id_aluno) REFERENCES alunos(id)
);
-- Inserir dados nas tabelas:
INSERT INTO alunos (nome, idade, serie, cidade) VALUES
('Ana Souza', 15, '9º Ano', 'São Paulo'),
('Bruno Lima', 17, '3º Ano', 'Rio de Janeiro'),
('Amanda Rocha', 14, '8º Ano', 'São Paulo'),
('Carlos Silva', 16, '2º Ano', 'Belo Horizonte'),
('Alice Nunes', 13, '7º Ano', 'Curitiba');
 
INSERT INTO matriculas (id_aluno, curso, data_matricula) VALUES
(1, 'Matemática', '2024-02-01'),
(1, 'Física', '2024-02-10'),
(2, 'História', '2024-01-20'),
(3, 'Geografia', '2024-02-15'),
(4, 'Química', '2024-01-25');

-- Após a criação a cima realize as seguintes consultas:
 
-- 1. Exibir todos os alunos cadastrados.
USE escola;
SELECT NOME FROM alunos;

-- 2. Mostrar apenas os nomes e a cidade dos alunos.
USE escola;
SELECT nome, cidade FROM alunos;

-- 3. Listar os alunos com idade maior ou igual a 15 anos.
USE escola;
SELECT nome FROM alunos where idade >= 15;

-- 4. Exibir os alunos que moram em São Paulo.
USE escola;
SELECT nome, cidade FROM alunos where cidade = "São Paulo";

-- 5. Ordenar os alunos em ordem crescente de idade.
USE escola;
SELECT nome, idade FROM alunos order by idade asc;

-- 6. Selecionar os alunos cujo nome começa com "A".
USE escola;
SELECT nome FROM alunos WHERE nome LIKE 'A%';

-- 7. Exibir os alunos que NÃO são de São Paulo.
USE escola;
SELECT nome, cidade FROM alunos WHERE cidade > 'São Paulo' AND cidade < 'São Paulo';

-- 8. Contar quantos alunos estão cadastrados.
SELECT count(nome) FROM alunos AS total_alunos;

-- 9. Exibir a média de idade dos alunos.
SELECT nome, AVG(idade) AS media_idade FROM alunos;

-- 10. Listar os alunos matriculados entre 1º e 3º Ano.
SELECT nome, cidade, serie FROM alunos WHERE serie BETWEEN '1ºAno' AND '3ºAno';