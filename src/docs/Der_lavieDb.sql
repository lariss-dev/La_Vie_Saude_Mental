SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


-- Estrutura da tabela `atendimentos`
CREATE TABLE `atendimentos` (
  `ID` INT(5) UNSIGNED ZEROFILL NOT NULL,
  `DATA_ATENDIMENTO` date NOT NULL,
  `OBSERVACAO` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PACIENTE_ID` INT(5) UNSIGNED ZEROFILL DEFAULT NULL,
  `PSICOLOGO_ID` INT(5) UNSIGNED ZEROFILL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- Extraindo dados da tabela `atendimentos`
INSERT INTO `atendimentos` (`ID`, `DATA_ATENDIMENTO`, `OBSERVACAO`, `PACIENTE_ID`, `PSICOLOGO_ID`) VALUES


-- Estrutura da tabela `pacientes`
CREATE TABLE `pacientes` (
  `ID` INT(5) UNSIGNED ZEROFILL NOT NULL,
  `NOME` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `EMAIL` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IDADE` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- Extraindo dados da tabela `pacientes`
INSERT INTO `pacientes` (`ID`, `NOME`, `EMAIL`, `IDADE`) VALUES


-- Estrutura da tabela `psicologos`
CREATE TABLE `psicologos` (
  `ID` INT(5) UNSIGNED ZEROFILL NOT NULL,
  `NOME` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `EMAIL` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SENHA` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `APRESENTACAO` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- Extraindo dados da tabela `psicologos`
INSERT INTO `psicologos` (`ID`, `NOME`, `EMAIL`, `SENHA`, `APRESENTACAO`) VALUES


-- Índices para tabela `atendimentos`
ALTER TABLE `atendimentos`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_PACIENTE` (`PACIENTE_ID`),
  ADD KEY `FK_PSICOLOGO_idx` (`PSICOLOGO_ID`);


-- Índices para tabela `pacientes`
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`ID`);


-- Índices para tabela `psicologos`
ALTER TABLE `psicologos`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `EMAIL_UNIQUE` (`EMAIL`);


-- AUTO_INCREMENT de tabela `atendimentos`
ALTER TABLE `atendimentos`
  MODIFY `ID` INT(5) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;


-- AUTO_INCREMENT de tabela `pacientes`
ALTER TABLE `pacientes`
  MODIFY `ID` INT(5) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;


-- AUTO_INCREMENT de tabela `psicologos`
ALTER TABLE `psicologos`
  MODIFY `ID` INT(5) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;


-- Limitadores para a tabela `atendimentos`
ALTER TABLE `atendimentos`
  ADD CONSTRAINT `FK_PACIENTE` FOREIGN KEY (`PACIENTE_ID`) REFERENCES `pacientes` (`ID`),
  ADD CONSTRAINT `FK_PSICOLOGO` FOREIGN KEY (`PSICOLOGO_ID`) REFERENCES `psicologos` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

