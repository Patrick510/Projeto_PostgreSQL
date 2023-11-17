CREATE TABLE Pessoa(
	idPessoa SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	cpf VARCHAR(11) UNIQUE NOT NULL,
	rg VARCHAR (12),
	email VARCHAR(255),
	telefone VARCHAR(16),
	genero CHAR(1),
	estadoCivil VARCHAR(50),
	profissao VARCHAR(255)
);

CREATE TABLE Cliente(
	idCliente SERIAL PRIMARY KEY,
	rendaMensal DECIMAL(6,2),
	cep VARCHAR(50),
	endereco VARCHAR(255),
	bairro VARCHAR(100),
	cidade VARCHAR(150),
	estado VARCHAR(100),
	FOREIGN KEY (idCliente) REFERENCES Pessoa(idPessoa)
);

CREATE TABLE Corretor(
	idCorretor SERIAL PRIMARY KEY,
	matricula VARCHAR(10),
	dataAdmissao DATE,
	cargo VARCHAR(150),
	setor VARCHAR(100),
	empresa VARCHAR(255),
	comissao DECIMAL(5,2),
	FOREIGN KEY (idCorretor) REFERENCES Pessoa(idPessoa)
);

CREATE TABLE PlanoCarro(
	idPlano SERIAL PRIMARY KEY,
	nome VARCHAR(150),
	cobertura VARCHAR(255),
	valorMensal DECIMAL(10,2),
	descricao VARCHAR(255)
);

CREATE TABLE Seguro(
	idSeguro SERIAL PRIMARY KEY,
	nome VARCHAR(100),
	descricao VARCHAR(255),
	dataInicio DATE,
	dataFim DATE,
	preco DECIMAL(10,2),
	modalidade VARCHAR(50),
	cobertura VARCHAR(255),
	franquia VARCHAR(150),
	exclusao VARCHAR(150),
	percentualAdicao DECIMAL(5,2),
	idPlano INTEGER,
	FOREIGN KEY (idPlano) REFERENCES PlanoCarro(idPlano)
);

CREATE TABLE Contrato(
	idContrato SERIAL PRIMARY KEY,
	dataAssinatura DATE,
	valorPremio DECIMAL(6,2),
	valorCorretagem DECIMAL(6,2),
	valorAdicional DECIMAL(5,2),
	valorLiquido DECIMAL(10,2),
	dataPagamento DATE,
	status BOOLEAN,
	idSeguro INTEGER,
	idCorretor INTEGER,
	idCliente INTEGER,
	FOREIGN KEY (idSeguro) REFERENCES Seguro(idSeguro),
	FOREIGN KEY (idCorretor) REFERENCES Corretor(idCorretor),
	FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
); 

CREATE TABLE Veiculo(
	idVeiculo SERIAL PRIMARY KEY,
	marca VARCHAR(100),
	modelo VARCHAR(100),
	ano DATE,
	placa VARCHAR(10),
	idContrato INTEGER,
	idPlano INTEGER,
	FOREIGN KEY (idContrato) REFERENCES Contrato(idContrato),
	FOREIGN KEY (idPlano) REFERENCES PlanoCarro(idPlano)
);

CREATE TABLE Proposta(
	idProposta SERIAL PRIMARY KEY,
	dataProposta DATE,
	valorProposta DECIMAL(10,2),
	idContrato INTEGER,
	idCliente INTEGER,
	FOREIGN KEY (idContrato) REFERENCES Contrato(idContrato),
	FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

-- insert


-- fetch