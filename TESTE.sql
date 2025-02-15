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


INSERT INTO pais (id_pais, nome_pais) VALUES (1, 'Brasil');
INSERT INTO pais (id_pais, nome_pais) VALUES (2, 'Argentina');
INSERT INTO pais (id_pais, nome_pais) VALUES (3, 'Chile');
INSERT INTO pais (id_pais, nome_pais) VALUES (4, 'Peru');
INSERT INTO pais (id_pais, nome_pais) VALUES (5, 'Colômbia');

INSERT INTO estado (id_estado, nome_estado, id_pais) VALUES (1, 'São Paulo', 1);
INSERT INTO estado (id_estado, nome_estado, id_pais) VALUES (2, 'Buenos Aires', 2);
INSERT INTO estado (id_estado, nome_estado, id_pais) VALUES (3, 'Santiago', 3);
INSERT INTO estado (id_estado, nome_estado, id_pais) VALUES (4, 'Lima', 4);
INSERT INTO estado (id_estado, nome_estado, id_pais) VALUES (5, 'Bogotá', 5);


INSERT INTO cidade (id_cidade, nome_cidade, id_estado) VALUES (1, 'São Paulo', 1);
INSERT INTO cidade (id_cidade, nome_cidade, id_estado) VALUES (2, 'La Plata', 2);
INSERT INTO cidade (id_cidade, nome_cidade, id_estado) VALUES (3, 'Santiago', 3);
INSERT INTO cidade (id_cidade, nome_cidade, id_estado) VALUES (4, 'Lima', 4);
INSERT INTO cidade (id_cidade, nome_cidade, id_estado) VALUES (5, 'Bogotá', 5);

INSERT INTO bairro (id_bairro, nome_bairro, id_cidade) VALUES (1, 'Centro', 1);
INSERT INTO bairro (id_bairro, nome_bairro, id_cidade) VALUES (2, 'La Boca', 2);
INSERT INTO bairro (id_bairro, nome_bairro, id_cidade) VALUES (3, 'Providencia', 3);
INSERT INTO bairro (id_bairro, nome_bairro, id_cidade) VALUES (4, 'Miraflores', 4);
INSERT INTO bairro (id_bairro, nome_bairro, id_cidade) VALUES (5, 'Chapinero', 5);


INSERT INTO tipo_logradouro (id_tipo_log, descricao) VALUES (1, 'Rua');
INSERT INTO tipo_logradouro (id_tipo_log, descricao) VALUES (2, 'Avenida');
INSERT INTO tipo_logradouro (id_tipo_log, descricao) VALUES (3, 'Praça');
INSERT INTO tipo_logradouro (id_tipo_log, descricao) VALUES (4, 'Travessa');
INSERT INTO tipo_logradouro (id_tipo_log, descricao) VALUES (5, 'Alameda');

INSERT INTO end_cliente (id_end, logradouro, numero, cep, id_tipo_log, referencia, complemento, id_cliente) 
VALUES (1, 'Rua dos Três Irmãos', 123, 12345678, 1, 'Perto da praça central', 'Apto 202', 1);

INSERT INTO end_cliente (id_end, logradouro, numero, cep, id_tipo_log, referencia, complemento, id_cliente) 
VALUES (2, 'Avenida Paulista', 456, 98765432, 2, 'Ao lado do shopping', 'Bloco B', 2);

INSERT INTO end_cliente (id_end, logradouro, numero, cep, id_tipo_log, referencia, complemento, id_cliente) 
VALUES (3, 'Praça da Liberdade', 789, 11223344, 3, 'Em frente ao museu', 'Casa 10', 3);

INSERT INTO end_cliente (id_end, logradouro, numero, cep, id_tipo_log, referencia, complemento, id_cliente) 
VALUES (4, 'Travessa das Flores', 101, 22334455, 4, 'Próximo ao supermercado', 'Sala 5', 4);

INSERT INTO end_cliente (id_end, logradouro, numero, cep, id_tipo_log, referencia, complemento, id_cliente) 
VALUES (5, 'Alameda dos Anjos', 202, 33445566, 5, 'Atrás da igreja', 'Apartamento 303', 5);

INSERT INTO tipo_cliente (id_tipo_cli, descricao) VALUES (1, 'Pessoa Física');
INSERT INTO tipo_cliente (id_tipo_cli, descricao) VALUES (2, 'Pessoa Jurídica');

INSERT INTO genero (id_genero, descricao) VALUES (1, 'Masculino');
INSERT INTO genero (id_genero, descricao) VALUES (2, 'Feminino');

INSERT INTO end_cliente (id_end, logradouro, numero, cep, id_tipo_log, referencia, complemento, id_cliente) 
VALUES (1, 'Rua A', 123, 12345678, 1, 'Near Park', 'Apt 101', 1);

INSERT INTO end_cliente (id_end, logradouro, numero, cep, id_tipo_log, referencia, complemento, id_cliente) 
VALUES (2, 'Avenue B', 456, 87654321, 2, 'Next to Mall', 'Apt 202', 2);

INSERT INTO end_cliente (id_end, logradouro, numero, cep, id_tipo_log, referencia, complemento, id_cliente) 
VALUES (3, 'Boulevard C', 789, 23456789, 3, 'Near Lake', 'Apt 303', 3);

INSERT INTO end_cliente (id_end, logradouro, numero, cep, id_tipo_log, referencia, complemento, id_cliente) 
VALUES (4, 'Square D', 101, 34567890, 4, 'Near School', 'Apt 404', 4);

INSERT INTO end_cliente (id_end, logradouro, numero, cep, id_tipo_log, referencia, complemento, id_cliente) 
VALUES (5, 'Alley E', 202, 45678901, 5, 'Near Hospital', 'Apt 505', 5);




ALTER TABLE end_cliente ADD id_tipo_log NUMBER;


INSERT INTO end_cliente (id_end, logradouro, numero, cep, id_tipo_log, referencia, complemento, id_cliente) 
VALUES (1, 'Rua A', 123, 12345678, 1, 'Near Park', 'Apt 101', 1);

INSERT INTO end_cliente (id_end, logradouro, numero, cep, id_tipo_log, referencia, complemento, id_cliente) 
VALUES (2, 'Avenue B', 456, 87654321, 2, 'Next to Mall', 'Apt 202', 2);

INSERT INTO end_cliente (id_end, logradouro, numero, cep, id_tipo_log, referencia, complemento, id_cliente) 
VALUES (3, 'Boulevard C', 789, 23456789, 3, 'Near Lake', 'Apt 303', 3);

INSERT INTO end_cliente (id_end, logradouro, numero, cep, id_tipo_log, referencia, complemento, id_cliente) 
VALUES (4, 'Square D', 101, 34567890, 4, 'Near School', 'Apt 404', 4);

INSERT INTO end_cliente (id_end, logradouro, numero, cep, id_tipo_log, referencia, complemento, id_cliente) 
VALUES (5, 'Alley E', 202, 45678901, 5, 'Near Hospital', 'Apt 505', 5);
