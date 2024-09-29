CREATE TABLE pais (
    id_pais SERIAL PRIMARY KEY,
    nome_pais VARCHAR(100) NOT NULL,
    sigla_pais VARCHAR(3) NOT NULL
);

CREATE TABLE acorde (
    id_acorde SERIAL PRIMARY KEY,
    nome_acorde VARCHAR(100) NOT NULL
);

CREATE TABLE marca (
    id_marca SERIAL PRIMARY KEY,
    nome_marca VARCHAR(255) NOT NULL,
    id_pais INT REFERENCES pais(id_pais) NOT NULL
);

CREATE TABLE concentracao (
    id_concentracao SERIAL PRIMARY KEY,
    nome_concentracao VARCHAR(50) NOT NULL,
    sigla_concentracao VARCHAR(10) NOT NULL
);

CREATE TABLE genero (
    id_genero SERIAL PRIMARY KEY,
    nome_genero VARCHAR(10)
);

CREATE TABLE perfume (
    id_perfume SERIAL PRIMARY KEY,
    nome_perfume VARCHAR(100) NOT NULL,
    id_marca INT REFERENCES marca(id_marca),
    ano_lançamento_perfume INT NOT NULL,
    id_concentracao INT REFERENCES concentracao(id_concentracao),
    id_genero INT REFERENCES genero(id_genero),
    link_imagem VARCHAR(255)
);

CREATE TABLE perfume_nota (
    id_perfume INT REFERENCES perfume(id_perfume) ON DELETE CASCADE,
    id_acorde INT REFERENCES acorde(id_acorde) ON DELETE CASCADE,
    PRIMARY KEY (id_perfume, id_acorde)
);