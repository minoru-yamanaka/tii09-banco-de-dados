-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 20/05/2025 às 00:29
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `gestao_hospitalar`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `gh_tblexames`
--

CREATE TABLE `gh_tblexames` (
  `id` int(11) NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `id_medico` int(11) NOT NULL,
  `diagnostico` text NOT NULL,
  `data_exame` datetime DEFAULT NULL,
  `data_cadastro` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `gh_tblexames`
--

INSERT INTO `gh_tblexames` (`id`, `id_paciente`, `id_medico`, `diagnostico`, `data_exame`, `data_cadastro`) VALUES
(1, 1, 2, 'febre', '2020-05-01 00:00:00', '2025-05-12 19:31:41'),
(2, 3, 1, 'pressão alta', '2015-07-06 00:00:00', '2025-05-12 21:13:21'),
(3, 5, 2, 'pressão baixa', '2018-09-19 00:00:00', '2025-05-12 21:13:21'),
(4, 4, 3, 'asmatico', '0000-00-00 00:00:00', '2025-05-12 21:13:21');

-- --------------------------------------------------------

--
-- Estrutura para tabela `gh_tblgeneros`
--

CREATE TABLE `gh_tblgeneros` (
  `id_genero` int(11) NOT NULL,
  `descricao` varchar(30) NOT NULL,
  `data_cadastro` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `gh_tblgeneros`
--

INSERT INTO `gh_tblgeneros` (`id_genero`, `descricao`, `data_cadastro`) VALUES
(1, 'Masculino', '2025-05-05 20:47:26'),
(2, 'Feminino', '2025-05-05 20:47:26');

-- --------------------------------------------------------

--
-- Estrutura para tabela `gh_tblmedicos`
--

CREATE TABLE `gh_tblmedicos` (
  `id_medico` int(11) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `sobrenome` varchar(30) NOT NULL,
  `crm` int(2) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL,
  `data_cadastro` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `gh_tblmedicos`
--

INSERT INTO `gh_tblmedicos` (`id_medico`, `nome`, `sobrenome`, `crm`, `uf`, `data_cadastro`) VALUES
(1, 'Carlos', 'Carvalho', 30120, 'sp', '2025-05-05 21:22:23'),
(2, 'Marcos', 'Silva', 11478, 'rj', '2025-05-05 21:22:23'),
(3, 'Lilian', 'Castro', 21897, 'sp', '2025-05-05 21:22:23'),
(4, 'Julio', 'Calixto', 45632, 'mg', '2025-05-05 21:22:23'),
(5, 'Jane', 'Rosa', 65741, 'ce', '2025-05-05 21:22:23'),
(6, 'Ana Maria', 'Santos', 47899, 'mg', '2025-05-12 21:31:36'),
(7, 'Roseli', 'Cardoso', 47899, 'mg', '2025-05-12 21:31:36'),
(8, 'João', 'Silva', 75894, 'rj', '2025-05-12 21:33:19');

-- --------------------------------------------------------

--
-- Estrutura para tabela `gh_tblpacientes`
--

CREATE TABLE `gh_tblpacientes` (
  `id` int(11) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `sobrenome` varchar(30) NOT NULL,
  `data_nascimento` date NOT NULL,
  `id_genero` int(11) NOT NULL,
  `data_cadastro` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `gh_tblpacientes`
--

INSERT INTO `gh_tblpacientes` (`id`, `nome`, `sobrenome`, `data_nascimento`, `id_genero`, `data_cadastro`) VALUES
(2, 'Ana Maria', 'Silva', '2012-07-02', 2, '2025-05-05 21:12:32'),
(3, 'Manoel Messias', 'Ribeiro', '1990-05-01', 1, '2025-05-05 21:12:32'),
(4, 'Gabriela Jacinto', 'Santos', '1978-06-07', 2, '2025-05-05 21:12:32'),
(5, 'José ', 'Silveira', '0000-00-00', 1, '2025-05-05 21:12:32'),
(6, ' Maria de Fatima', 'Silva', '2021-05-01', 2, '2025-05-05 21:12:32'),
(7, 'Regina', 'Teixeira', '1985-10-16', 2, '2025-05-12 20:04:33'),
(8, 'Armando', 'Seixas', '2000-12-01', 1, '2025-05-12 20:04:33'),
(9, 'Carmen', 'Mortaes', '1978-01-10', 2, '2025-05-12 20:04:33');

-- --------------------------------------------------------

--
-- Estrutura para tabela `gh_tblprontuarios`
--

CREATE TABLE `gh_tblprontuarios` (
  `id_prontuario` int(11) NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `descricao` text NOT NULL,
  `data_cadastro` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `gh_tblprontuarios`
--

INSERT INTO `gh_tblprontuarios` (`id_prontuario`, `id_paciente`, `descricao`, `data_cadastro`) VALUES
(1, 1, 'febre alta', '2025-05-05 21:31:06'),
(2, 2, 'dengue', '2025-05-05 21:31:06'),
(3, 3, 'dor de cabeça', '2025-05-05 21:31:06'),
(4, 4, 'dor muscular', '2025-05-05 21:31:06'),
(5, 5, 'tosse', '2025-05-05 21:31:06'),
(6, 1, 'tosse forte', '2025-05-12 21:03:46'),
(7, 2, 'dengue', '2025-05-12 21:03:46'),
(8, 4, 'garganta inframada', '2025-05-12 21:03:46');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `gh_tblexames`
--
ALTER TABLE `gh_tblexames`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `gh_tblgeneros`
--
ALTER TABLE `gh_tblgeneros`
  ADD PRIMARY KEY (`id_genero`);

--
-- Índices de tabela `gh_tblmedicos`
--
ALTER TABLE `gh_tblmedicos`
  ADD PRIMARY KEY (`id_medico`);

--
-- Índices de tabela `gh_tblpacientes`
--
ALTER TABLE `gh_tblpacientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_genero` (`id_genero`);

--
-- Índices de tabela `gh_tblprontuarios`
--
ALTER TABLE `gh_tblprontuarios`
  ADD PRIMARY KEY (`id_prontuario`),
  ADD KEY `id_paciente` (`id_paciente`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `gh_tblexames`
--
ALTER TABLE `gh_tblexames`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `gh_tblgeneros`
--
ALTER TABLE `gh_tblgeneros`
  MODIFY `id_genero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `gh_tblmedicos`
--
ALTER TABLE `gh_tblmedicos`
  MODIFY `id_medico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `gh_tblpacientes`
--
ALTER TABLE `gh_tblpacientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `gh_tblprontuarios`
--
ALTER TABLE `gh_tblprontuarios`
  MODIFY `id_prontuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
