CREATE DATABASE IF NOT EXISTS meubanco;
USE meubanco;

CREATE TABLE IF NOT EXISTS cliente (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    rg VARCHAR(255) NOT NULL,
    telefone VARCHAR(255) NOT NULL,
    foto VARCHAR(255) NOT NULL,
    criado_em DATETIME NOT NULL
);

CREATE TABLE IF NOT EXISTS indicadores (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    total_veiculos INT NOT NULL,
    veiculos_disponiveis INT NOT NULL,
    locacoes_ativas INT NOT NULL,
    receita_mes FLOAT NOT NULL,
    criado_em DATETIME NOT NULL
);

CREATE TABLE IF NOT EXISTS locacao (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    veiculo_id INT NOT NULL,
    cliente_id INT NOT NULL,
    data_inicio DATETIME NOT NULL,
    data_fim DATETIME NOT NULL,
    total_dias INT NOT NULL,
    valor_total FLOAT NOT NULL,
    criado_em DATETIME NOT NULL
);

CREATE TABLE IF NOT EXISTS veiculo (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(255) NOT NULL,
    modelo VARCHAR(255) NOT NULL,
    marca VARCHAR(255) NOT NULL,
    placa VARCHAR(255) NOT NULL,
    ano INT NOT NULL,
    cor VARCHAR(255) NOT NULL,
    valor_diaria FLOAT NOT NULL,
    status VARCHAR(255) NOT NULL,
    criado_em DATETIME NOT NULL
);
