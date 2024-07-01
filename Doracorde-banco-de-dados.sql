CREATE DATABASE Doracorde;

USE Doracorde;

CREATE TABLE Plano (
    id_plano INT  NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_plano VARCHAR(255) NOT NULL,
    preco_plano DECIMAL(10, 2) NOT NULL,
    duracao_plano INT NOT NULL,
    descricao_plano TEXT NOT NULL,
    data_inicio_plano DATE NOT NULL,
    data_fim_plano DATE NOT NULL,
    beneficios VARCHAR(255) NOT NULL
);

CREATE TABLE Usuario (
    id_usuario INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    email_usuario VARCHAR(255) NOT NULL,
    senha_usuario VARCHAR(255) NOT NULL,
    nome_usuario VARCHAR(255) NOT NULL
);

CREATE TABLE Usuario_Plano (
    id_usuario_plano INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    plano_idPlano INT NOT NULL,
    usuario_idUsuario INT NOT NULL,
    recorrente BOOLEAN NOT NULL,
    FOREIGN KEY (plano_idPlano) REFERENCES Plano(id_plano),
    FOREIGN KEY (usuario_idUsuario) REFERENCES Usuario(id_usuario)
);

CREATE TABLE Pagamento (
    id_pagamento INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    valor_pagamento NUMERIC(10,2) NOT NULL,
    status_pagamento VARCHAR(255) NOT NULL,
    plano_idPlano INT NOT NULL,
    FOREIGN KEY (plano_idPlano) REFERENCES Plano(id_plano)
);

CREATE TABLE Pagamento_Usuario (
    id_pagamento_usuario INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    usuario_idUsuario INT,
    pagamento_idPagamento INT ,
    metodo_pagamento VARCHAR(255) NOT NULL,
    data_pagamento DATETIME NOT NULL,
    FOREIGN KEY (usuario_idUsuario) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (pagamento_idPagamento) REFERENCES Pagamento(id_pagamento)
);

CREATE TABLE Sessao (
    id_sessao INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    data_inicio_sessao DATE NOT NULL,
    data_fim_sessao DATE NOT NULL,
    ativo_sessao BOOLEAN NOT NULL,
    usuario_idUsuario INT,
    FOREIGN KEY (usuario_idUsuario) REFERENCES Usuario(id_usuario)
);

CREATE TABLE Noticia (
    id_noticia INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    autor_noticia VARCHAR(255) NOT NULL,
    tempo_leitura_noticia DATETIME NOT NULL,
    data_publicacao_noticia DATE NOT NULL,
    titulo_noticia VARCHAR(255) NOT NULL
);

CREATE TABLE Usuario_noticia (
    id_usuario_noticia INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    usuario_idUsuario INT,
    noticia_idNoticia INT,
    FOREIGN KEY (usuario_idUsuario) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (noticia_idNoticia) REFERENCES Noticia(id_noticia)
);

CREATE TABLE Exercicio (
    id_exercicio INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_exercicio VARCHAR(255) NOT NULL,
    tipo_exercicio VARCHAR(255) NOT NULL
);

CREATE TABLE Exercicio_usuario (
    id_exercicio_usuario INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    usuario_idUsuario INT,
    exercicio_idExercicio INT,
    nivel_progresso INTEGER NOT NULL,
	pontos_exercicio INTEGER NOT NULL,
    etapa_exercicio INTEGER NOT NULL,
    FOREIGN KEY (usuario_idUsuario) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (exercicio_idExercicio) REFERENCES Exercicio(id_exercicio)
);

CREATE TABLE Cifra (
    id_cifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    conteudo_cifra TEXT NOT NULL
);

CREATE TABLE Cifra_usuario (
    id_cifra_usuario INT PRIMARY KEY AUTO_INCREMENT,
    usuario_idUsuario INT,
    cifra_idCifra INT,
    FOREIGN KEY (usuario_idUsuario) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (cifra_idCifra) REFERENCES Cifra(id_cifra)
);

CREATE TABLE Instrumento (
    id_instrumento INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_instrumento VARCHAR(255) NOT NULL,
    tipo_instrumento VARCHAR(255) NOT NULL,
    descricao_instrumento TEXT NOT NULL,
    cifra_idCifra INT,
	FOREIGN KEY (cifra_idCifra) REFERENCES Cifra(id_cifra)
);

CREATE TABLE Musica (
    id_musica INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    titulo_musica VARCHAR(255) NOT NULL,
    genero_musica VARCHAR(255) NOT NULL,
    duracao_musica TIME NOT NULL
);

CREATE TABLE Artista (
    id_artista INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_artista VARCHAR(255) NOT NULL,
    genero_artista VARCHAR(255) NOT NULL,
    biografia_artista TEXT NOT NULL
);

CREATE TABLE Musica_artista(
	id_musica_artista INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    data_lancamento DATE NOT NULL, 
	artista_idArtista INT,
    musica_idMusica INT,
    FOREIGN KEY (musica_idMusica) REFERENCES Musica(id_musica),
    FOREIGN KEY (artista_idArtista) REFERENCES Artista(id_artista)
);

CREATE TABLE Cifra_musica (
    id_cifra_musica INT  NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cifra_idCifra INT,
    musica_idMusica INT,
    FOREIGN KEY (cifra_idCifra) REFERENCES Cifra(id_cifra),
    FOREIGN KEY (musica_idMusica) REFERENCES Musica(id_musica)
);