/*https://github.com/DanyAyg/AtividadePraticaBancoDeDados*/

/*DROP DAS TABELAS DE RELACIONAMENTOS*/
DROP TABLE IF EXISTS DIRIGE;
DROP TABLE IF EXISTS PATROCINA;
DROP TABLE IF EXISTS TRANSMITE;
DROP TABLE IF EXISTS ASSISTE;
/*DROP DAS TABELAS DE ENTIDADES*/
DROP TABLE IF EXISTS ORGANIZADOR;
DROP TABLE IF EXISTS JOGO;
DROP TABLE IF EXISTS JOGADOR;
DROP TABLE IF EXISTS EQUIPE;
DROP TABLE IF EXISTS ESTADIO;
DROP TABLE IF EXISTS TREINADOR;
DROP TABLE IF EXISTS PATROCINADOR;
DROP TABLE IF EXISTS COBERTURA;
DROP TABLE IF EXISTS TORCEDOR;
DROP TABLE IF EXISTS JUIZ;
DROP TABLE IF EXISTS FUNCIONARIO;

/*CREATE DAS TABELAS DE ENTIDADES*/
CREATE TABLE ESTADIO(
    nome_estadio CHAR(50),
    cidade_estadio CHAR(150),
    capacidade_estadio INTEGER,
    PRIMARY KEY(nome_estadio)
);
CREATE TABLE TREINADOR(
	id_treinador INTEGER auto_increment,
    nome_treinador CHAR(50),
    historico_treinador char(255),
    UNIQUE(id_treinador),
    PRIMARY KEY(id_treinador)
);
CREATE TABLE EQUIPE(
	nome_equipe CHAR(50),
    casa_equipe CHAR(50),
    id_treinador INTEGER,
    UNIQUE(nome_equipe),
    PRIMARY KEY(nome_equipe),
    FOREIGN KEY(id_treinador) REFERENCES TREINADOR(id_treinador),
    FOREIGN KEY(casa_equipe) REFERENCES ESTADIO(nome_estadio)
);
CREATE TABLE JOGO(
	serial_jogo INTEGER auto_increment,
    data_jogo CHAR(50),
    equipe1 char(50),
    equipe2 char(50),
    placar1 INTEGER,
    placar2 INTEGER,
    arrecadacao FLOAT,
    custo FLOAT,
    nome_estadio CHAR(50),
    UNIQUE(serial_jogo),
    PRIMARY KEY(serial_jogo),
    FOREIGN KEY(nome_estadio) REFERENCES ESTADIO(nome_estadio),
    FOREIGN KEY(equipe1) REFERENCES EQUIPE(nome_equipe),
    FOREIGN KEY(equipe2) REFERENCES EQUIPE(nome_equipe)
);
CREATE TABLE JOGADOR(
	id_jogador INTEGER auto_increment,
    nome_jogador CHAR(50),
    numero_jogador INTEGER,
    altura_jogador FLOAT,
    peso_jogador FLOAT,
	nome_equipe CHAR(50),
    UNIQUE(id_jogador),
    PRIMARY KEY(id_jogador),
    FOREIGN KEY(nome_equipe) REFERENCES EQUIPE(nome_equipe)
);
CREATE TABLE PATROCINADOR(
	nome_patrocinador CHAR(50),
    area_patrocinador CHAR(50),
    tipo_patrocinador enum('monetario', 'apoio'),
    PRIMARY KEY(nome_patrocinador)
);
CREATE TABLE COBERTURA(
	id_cobertura INTEGER auto_increment,
    canal_cobertura CHAR(50),
    audiencia_cobertura FLOAT,
    PRIMARY KEY(id_cobertura)
);
CREATE TABLE TORCEDOR(
	numero_ingresso INTEGER auto_increment,
    equipe_torcedor CHAR(150),
    genero_torcedor ENUM('masculino','feminino','outro', 'prefiro nao dizer'),
    PRIMARY KEY(numero_ingresso)
);
/*create da hierarquia*/
CREATE TABLE FUNCIONARIO(
	id_funcionario INTEGER auto_increment,
    nome_funcionario CHAR(50),
    salario_funcionario FLOAT,
    PRIMARY KEY(id_funcionario)
);
CREATE TABLE JUIZ(
	id_juiz INTEGER,
    tipo_juiz ENUM('de quadra','de bancada'),
	genero_juiz ENUM('masculino','feminino','outro', 'prefiro nao dizer'),
    PRIMARY KEY(id_juiz),
    FOREIGN KEY (id_juiz) REFERENCES FUNCIONARIO(id_funcionario) ON DELETE CASCADE
);
CREATE TABLE ORGANIZADOR(
	id_organizador INTEGER,
	setor_organizador CHAR(50),
	responsabilidade_organizador CHAR(50),
	serial_jogo INTEGER,
    PRIMARY KEY(id_organizador),
    FOREIGN KEY (id_organizador) REFERENCES FUNCIONARIO(id_funcionario) ON DELETE CASCADE,
    FOREIGN KEY (serial_jogo) REFERENCES JOGO(serial_jogo)
);


/*CREATE DAS TABELAS DE RELACIONAMENTOS*/
CREATE TABLE PATROCINA(
	nome_patrocinador CHAR(50),
    serial_jogo INTEGER,
    nome_equipe CHAR(50),
    PRIMARY KEY(nome_patrocinador),
    FOREIGN KEY (nome_patrocinador) REFERENCES PATROCINADOR(nome_patrocinador) ON DELETE CASCADE,
    FOREIGN KEY (serial_jogo) REFERENCES JOGO(serial_jogo),
    FOREIGN KEY (nome_equipe) REFERENCES EQUIPE(nome_equipe)
);
CREATE TABLE TRANSMITE(
	id_cobertura INTEGER,
	serial_jogo INTEGER,
    PRIMARY KEY(id_cobertura, serial_jogo),
    FOREIGN KEY (id_cobertura) REFERENCES COBERTURA(id_cobertura) ON DELETE CASCADE,
    FOREIGN KEY (serial_jogo) REFERENCES JOGO(serial_jogo)
);
CREATE TABLE ASSISTE(
	numero_ingresso INTEGER,
	serial_jogo INTEGER,
    PRIMARY KEY(numero_ingresso, serial_jogo),
    FOREIGN KEY (numero_ingresso) REFERENCES TORCEDOR(numero_ingresso) ON DELETE CASCADE,
    FOREIGN KEY (serial_jogo) REFERENCES JOGO(serial_jogo)
);
CREATE TABLE DIRIGE(
	id_juiz INTEGER,
	serial_jogo INTEGER,
    PRIMARY KEY(id_juiz, serial_jogo),
    FOREIGN KEY (id_juiz) REFERENCES JUIZ(id_juiz) ON DELETE CASCADE,
    FOREIGN KEY (serial_jogo) REFERENCES JOGO(serial_jogo)
);