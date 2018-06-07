CREATE DATABASE IF NOT EXISTS `jsp` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `jsp`;

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `aniversario` date DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT '0',
  `cep` varchar(255) DEFAULT NULL,
  `logradouro` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `sobre_nome` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `produto`;
CREATE TABLE `produto` (
  `id` int(11) NOT NULL,
  `ativo` tinyint(1) DEFAULT '0',
  `descricao` varchar(255) DEFAULT NULL,
  `preco_venda` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `ativo` tinyint(1) DEFAULT '0',
  `login` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `usuario` (`id`, `ativo`, `login`, `nome`, `senha`) VALUES
(1, 1, 'andre', 'andre', '1234');


ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `produto`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `produto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;