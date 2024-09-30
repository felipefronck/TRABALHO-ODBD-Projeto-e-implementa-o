CREATE TABLE pais (
    id_pais SERIAL PRIMARY KEY,
    nome_pais VARCHAR(100) NOT NULL,
    sigla_pais VARCHAR(3) NOT NULL
);

CREATE TABLE marca (
    id_marca SERIAL PRIMARY KEY,
    nome_marca VARCHAR(255) NOT NULL,
    id_pais INT NOT NULL,
    FOREIGN KEY (id_pais) REFERENCES pais(id_pais)
);

CREATE TABLE genero (
    id_genero SERIAL PRIMARY KEY,
    nome_genero VARCHAR(50) NOT NULL
);

CREATE TABLE acorde (
    id_acorde SERIAL PRIMARY KEY,
    nome_acorde VARCHAR(100) NOT NULL
);

CREATE TABLE perfume (
    id_perfume SERIAL PRIMARY KEY,
    nome_perfume VARCHAR(100) NOT NULL,
    id_marca INT NOT NULL,
    ano_lancamento_perfume INT NOT NULL,
    id_genero INT NOT NULL,
    link_imagem VARCHAR(255),
    FOREIGN KEY (id_marca) REFERENCES marca(id_marca),
    FOREIGN KEY (id_genero) REFERENCES genero(id_genero)
);

CREATE TABLE perfume_acorde (
    id_perfume_acorde SERIAL PRIMARY KEY,
    id_perfume INT NOT NULL,
    id_acorde INT NOT NULL,
    FOREIGN KEY (id_perfume) REFERENCES perfume(id_perfume) ON DELETE CASCADE,
    FOREIGN KEY (id_acorde) REFERENCES acorde(id_acorde) ON DELETE CASCADE
);