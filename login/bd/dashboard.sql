-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 27-Dez-2019 às 03:48
-- Versão do servidor: 10.4.8-MariaDB
-- versão do PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `dashboard`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `alugado`
--

CREATE TABLE `alugado` (
  `alugado_id` int(11) NOT NULL,
  `produtos_id` int(11) NOT NULL,
  `quantidade_alugado` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `alugado`
--

INSERT INTO `alugado` (`alugado_id`, `produtos_id`, `quantidade_alugado`, `cliente_id`) VALUES
(1, 14, 1, 1),
(2, 11, 1, 4),
(3, 6, 1, 5),
(4, 13, 1, 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `cliente_id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `telefone` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`cliente_id`, `nome`, `telefone`, `email`) VALUES
(1, 'Marcos Santos', '(11)9999-9999', 'santos@email.com.br'),
(2, 'Laura Silva', '(11)6666-7777', 'laura@email.com.br'),
(3, 'Antonio Chagas', '(81)7777-9191', 'chagas@email.com.br'),
(4, 'Suzana Steves', '(21)1112-3131', 'suzana@email.com.br'),
(5, 'Alvaro Magalhães', '(34) 4545-0939', 'magalhaes@email.com.br'),
(6, 'Valdeci Arruda', '(71) 3333-0939', 'arruda@email.com.br');

-- --------------------------------------------------------

--
-- Estrutura da tabela `estoque`
--

CREATE TABLE `estoque` (
  `produtos_id` int(11) NOT NULL,
  `marca` varchar(100) NOT NULL,
  `modelo` varchar(100) NOT NULL,
  `preco` decimal(10,0) NOT NULL,
  `quantidade` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `estoque`
--

INSERT INTO `estoque` (`produtos_id`, `marca`, `modelo`, `preco`, `quantidade`) VALUES
(1, 'BMW', 'Série 3 Sedã', '195950', 1),
(4, 'BMW', '430i Cabrio Sport', '320950', 1),
(5, 'BMW', 'M2 Competition', '389950', 1),
(6, 'BMW', 'Série 7 Hybrid', '499950', 1),
(9, 'BMW', 'Série 8 Coupé', '799950', 1),
(10, 'BMW', 'X1', '191950', 1),
(11, 'BMW', 'X2', '191950', 1),
(12, 'BMW', 'X3', '284950', 1),
(13, 'BMW', 'X4', '343950', 1),
(14, 'BMW', 'X5', '455950', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `email`, `senha`) VALUES
(1, 'usuario@dominio.com', '81dc9bdb52d04dc20036dbd8313ed055');

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendas`
--

CREATE TABLE `vendas` (
  `vendas_id` int(11) NOT NULL,
  `produtos_id` int(11) NOT NULL,
  `quantidade_vendida` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `vendas`
--

INSERT INTO `vendas` (`vendas_id`, `produtos_id`, `quantidade_vendida`, `cliente_id`) VALUES
(1, 1, 1, 2),
(2, 9, 1, 3);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `alugado`
--
ALTER TABLE `alugado`
  ADD PRIMARY KEY (`alugado_id`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cliente_id`);

--
-- Índices para tabela `estoque`
--
ALTER TABLE `estoque`
  ADD PRIMARY KEY (`produtos_id`),
  ADD KEY `alugado` (`quantidade`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`vendas_id`),
  ADD KEY `estoque` (`produtos_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `alugado`
--
ALTER TABLE `alugado`
  MODIFY `alugado_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `cliente_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `estoque`
--
ALTER TABLE `estoque`
  MODIFY `produtos_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `vendas`
--
ALTER TABLE `vendas`
  MODIFY `vendas_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `estoque`
--
ALTER TABLE `estoque`
  ADD CONSTRAINT `venda` FOREIGN KEY (`quantidade`) REFERENCES `vendas` (`vendas_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `vendas`
--
ALTER TABLE `vendas`
  ADD CONSTRAINT `cliente` FOREIGN KEY (`vendas_id`) REFERENCES `cliente` (`cliente_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `estoque` FOREIGN KEY (`produtos_id`) REFERENCES `estoque` (`produtos_id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
