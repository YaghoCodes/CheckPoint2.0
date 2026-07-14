drop database if exists checkpoint2;
CREATE DATABASE if not exists checkpoint2;
USE checkpoint2;

drop table if exists usuario;
drop table if exists jogo;
drop table if exists avaliacao;

CREATE TABLE usuario(
  id_usuario INT NOT NULL AUTO_INCREMENT,
  username VARCHAR(45) NOT NULL,
  email VARCHAR(255) NOT NULL,
  senha VARCHAR(255) NOT NULL,
  PRIMARY KEY (id_usuario)
) AUTO_INCREMENT = 1;

CREATE TABLE jogo(
  id_jogo INT NOT NULL auto_increment,
  nome VARCHAR(100) NOT NULL,
  description TEXT NOT NULL,
  imagem VARCHAR(255) null,
  PRIMARY KEY (id_jogo)
)AUTO_INCREMENT = 10;

CREATE TABLE avaliacao (
  fk_usuario INT NOT NULL,
  fk_jogo INT NOT NULL,
  status TINYINT NOT NULL DEFAULT 0, -- 0 = WishList 1 = Jogando 2 = Concluido 3 = nada --
  review TEXT NULL,
  nota INT NULL,
  PRIMARY KEY (fk_usuario, fk_jogo),
  CONSTRAINT fk_Avaliacoes_Usuario FOREIGN KEY (fk_usuario) REFERENCES usuario (id_usuario),
  CONSTRAINT fk_Avaliacoes_Jogos FOREIGN KEY (fk_jogo) REFERENCES jogo (id_jogo),
  CONSTRAINT chk_nota CHECK (nota BETWEEN 0 AND 5)
);

insert into usuario(id_usuario, username, email, senha) values(1, 'yagho', 'yaghochinaglia@gmail.com', 123);

select * from usuario;
select * from jogo;
select * from avaliacao;
