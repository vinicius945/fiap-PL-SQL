CREATE TABLE pais (
    id_pais   NUMBER PRIMARY KEY,
    nome_pais VARCHAR2(30)
);

CREATE TABLE estado (
    id_estado   NUMBER PRIMARY KEY,
    nome_estado VARCHAR2(30),
    id_pais     NUMBER
);

ALTER TABLE estado
    ADD CONSTRAINT pk_estado FOREIGN KEY ( id_pais )
        REFERENCES pais ( id_pais );

CREATE TABLE cidade (
    id_cidade   NUMBER PRIMARY KEY,
    nome_cidade VARCHAR2(30),
    id_estado   NUMBER
);

ALTER TABLE cidade
    ADD CONSTRAINT pk_cidade FOREIGN KEY ( id_estado )
        REFERENCES estado ( id_estado );

CREATE TABLE bairro (
    id_bairro   NUMBER PRIMARY KEY,
    nome_bairro VARCHAR2(30),
    id_cidade   NUMBER
);

ALTER TABLE bairro
    ADD CONSTRAINT pk_bairro FOREIGN KEY ( id_cidade )
        REFERENCES cidade ( id_cidade );

CREATE TABLE end_cliente (
    id_end      NUMBER PRIMARY KEY,
    logradouro  VARCHAR2(50),
    numero      NUMBER,
    cep         NUMBER,
    id_tipo_log NUMBER,
    referencia  VARCHAR2(30),
    complemento VARCHAR2(30)
);

ALTER TABLE end_cliente ADD id_cliente NUMBER;

CREATE TABLE tipo_logradouro (
    id_tipo_log NUMBER PRIMARY KEY,
    descricao   VARCHAR2(30)
);

ALTER TABLE end_cliente
    ADD CONSTRAINT pk_tipo_log FOREIGN KEY ( id_tipo_log )
        REFERENCES tipo_logradouro ( id_tipo_log );

CREATE TABLE cliente (
    id_cliente  NUMBER PRIMARY KEY,
    nome        VARCHAR2(100),
    data_nasc   DATE,
    cpf_cnpj    NUMBER,
    id_tipo_cli NUMBER,
    id_genero   NUMBER,
    email       VARCHAR2(30),
    telefone    NUMBER
);

CREATE TABLE tipo_cliente (
    id_tipo_cli NUMBER PRIMARY KEY,
    descricao   VARCHAR2(30)
);

CREATE TABLE genero (
    id_genero NUMBER PRIMARY KEY,
    descricao VARCHAR2(30)
);

ALTER TABLE cliente
    ADD CONSTRAINT pk_genero FOREIGN KEY ( id_genero )
        REFERENCES genero ( id_genero );

ALTER TABLE cliente
    ADD CONSTRAINT pk_tipo_cli FOREIGN KEY ( id_tipo_cli )
        REFERENCES tipo_cliente ( id_tipo_cli );

      
DROP TABLE CLIENTE;