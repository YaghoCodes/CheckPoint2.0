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
  imagem TEXT null,
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

select j.id_jogo, j.nome, j.imagem, AVG(a.nota) as media from jogo j
join avaliacao a on j.id_jogo = a.fk_jogo GROUP BY
    j.id_jogo,
    j.nome,
    j.imagem order by media LIMIT 30;
    
  INSERT INTO jogo (nome, description, imagem) VALUES
('Hollow Knight', 'Explore o vasto reino subterrâneo de Hallownest em um metroidvania desafiador. Enfrente criaturas perigosas, descubra segredos escondidos e aprimore suas habilidades enquanto desvenda a história de um antigo reino em ruínas.', 'https://upload.wikimedia.org/wikipedia/en/thumb/d/de/Hollow_Knight_2026_cover_art.jpg/250px-Hollow_Knight_2026_cover_art.jpg'),
('Celeste', 'Acompanhe Madeline em sua jornada para escalar a montanha Celeste. Com controles precisos, fases desafiadoras e uma narrativa emocionante, o jogo aborda temas como superação, ansiedade e autoconhecimento.', 'https://store-images.s-microsoft.com/image/apps.21257.71633162879241707.7cf18b3b-9fa5-486f-9a68-067f06d50bf1.8f7909cf-d9a5-44aa-9901-2635255ab2ee'),
('Terraria', 'Um sandbox 2D repleto de exploração, construção e combate. Cave em busca de recursos, enfrente chefes poderosos, construa sua própria base e descubra centenas de itens e biomas diferentes em um mundo gerado proceduralmente.', 'https://upload.wikimedia.org/wikipedia/en/1/1a/Terraria_Steam_artwork.jpg'),
('Stardew Valley', 'Assuma a antiga fazenda de seu avô e transforme-a em um lugar próspero. Cultive plantações, crie animais, participe de festivais, faça amizades com os moradores e explore minas repletas de desafios e tesouros.', 'https://upload.wikimedia.org/wikipedia/en/f/fd/Logo_of_Stardew_Valley.png'),
('The Witcher 3', 'Controle Geralt de Rívia em uma aventura épica de mundo aberto. Aceite contratos para caçar monstros, tome decisões que influenciam a história e procure por Ciri em um continente devastado pela guerra.', 'https://upload.wikimedia.org/wikipedia/en/0/0c/Witcher_3_cover_art.jpg'),
('Red Dead Redemption 2', 'Viva a história de Arthur Morgan, um fora da lei tentando sobreviver ao fim da era do Velho Oeste. Explore um enorme mundo aberto, participe de assaltos, caçadas e interaja com personagens marcantes.', 'https://upload.wikimedia.org/wikipedia/en/4/44/Red_Dead_Redemption_II.jpg'),
('Cyberpunk 2077', 'Entre na metrópole futurista de Night City como V, um mercenário em busca de fama e sobrevivência. Personalize seu personagem, realize missões variadas e enfrente corporações em um RPG de ação repleto de escolhas.', 'https://upload.wikimedia.org/wikipedia/en/9/9f/Cyberpunk_2077_box_art.jpg'),
('Minecraft', 'Explore um mundo infinito formado por blocos onde você pode construir praticamente qualquer coisa. Sobreviva enfrentando monstros, colete recursos, automatize processos com redstone ou simplesmente dê vida às suas ideias.', 'https://www.minecraft.net/content/dam/minecraftnet/games/minecraft/key-art/Homepage_Discover-our-games_MC-Vanilla-KeyArt_864x864.jpg'),
('Portal 2', 'Resolva quebra-cabeças utilizando uma arma capaz de criar portais entre superfícies. Com uma campanha envolvente, humor marcante e mecânicas inovadoras, o jogo desafia a criatividade e o raciocínio do jogador.', 'https://upload.wikimedia.org/wikipedia/en/f/f9/Portal2cover.jpg'),
('Hades', 'Lute para escapar do Submundo controlando Zagreus, filho de Hades. Em um roguelike de ação acelerado, cada tentativa traz novas habilidades, armas e diálogos que expandem a narrativa inspirada na mitologia grega.', 'https://upload.wikimedia.org/wikipedia/en/c/cc/Hades_cover_art.jpg');

INSERT INTO avaliacao (fk_usuario, fk_jogo, status, review, nota) VALUES
(1, 10, 2, 'Um dos melhores metroidvanias que já joguei.', 5),
(1, 11, 2, 'Gameplay excelente e história emocionante.', 5),
(1, 12, 1, 'Muito divertido para jogar com amigos.', 4),
(1, 13, 2, 'Jogo extremamente relaxante.', 5),
(1, 14, 2, 'Narrativa fantástica e mundo incrível.', 5),
(1, 15, 1, 'História muito boa, mas ainda estou jogando.', 4),
(1, 16, 0, 'Expectativas Altas!', 3),
(1, 17, 2, 'Um clássico que nunca perde a graça.', 5),
(1, 18, 2, 'Quebra-cabeças muito inteligentes.', 5),
(1, 19, 1, 'Combate viciante e ótima trilha sonora.', 4);


INSERT INTO usuario (username, email, senha) VALUES
('Lucas', 'lucas@email.com', '123456'),
('Fernanda', 'fernanda@email.com', '123456'),
('Gustavo', 'gustavo@email.com', '123456'),
('Amanda', 'amanda@email.com', '123456');



INSERT INTO avaliacao (fk_usuario, fk_jogo, status, review, nota) VALUES
(2, 10, 2, 'Um dos melhores metroidvanias que já joguei. O mapa é enorme, a trilha sonora é excelente e o combate é muito satisfatório.', 5),
(2, 12, 2, 'Terraria é um jogo que sempre volto a jogar. Tem muito conteúdo e cada mundo acaba sendo uma experiência diferente.', 5),
(2, 14, 2, 'A história é fantástica e as escolhas realmente fazem diferença. Geralt é um protagonista incrível.', 5),
(2, 17, 1, 'Mesmo depois de tantos anos ainda encontro coisas novas para construir. Um clássico que nunca enjoa.', 4),
(2, 19, 2, 'Combate rápido, personagens carismáticos e ótima trilha sonora. Um dos melhores roguelikes.', 5),
(3, 11, 2, 'Celeste consegue ser extremamente desafiador sem deixar de ser divertido. A história também é muito bonita.', 5),
(3, 13, 2, 'Um jogo relaxante, perfeito para passar horas cuidando da fazenda e conhecendo os moradores.', 5),
(3, 15, 2, 'Visual incrível e uma narrativa emocionante. Arthur Morgan é um dos melhores personagens dos videogames.', 5),
(3, 16, 1, 'Depois das atualizações ficou muito melhor. Night City é impressionante e as missões são bem variadas.', 4),
(3, 18, 2, 'Portal 2 é um dos jogos mais inteligentes que já joguei. Os puzzles são criativos do começo ao fim.', 5),
(4, 10, 2, 'Achei a ambientação fantástica e o combate muito divertido. Um dos melhores jogos do gênero.', 5),
(4, 11, 2, 'Excelente plataforma. Algumas fases me fizeram passar muita raiva, mas valeu a pena.', 4),
(4, 12, 2, 'Tem muito conteúdo e liberdade, mas às vezes fico perdido sem saber o que fazer.', 4),
(4, 13, 2, 'Muito relaxante. Gostei bastante de cuidar da fazenda e conversar com os NPCs.', 5),
(4, 14, 2, 'A história é excelente, porém achei a movimentação um pouco pesada em alguns momentos.', 4),
(4, 15, 1, 'Visual absurdo e personagens muito bem escritos. Ainda não terminei.', 5),
(4, 16, 2, 'As atualizações melhoraram bastante o jogo, mas ainda encontrei alguns bugs.', 3),
(4, 17, 2, 'Sempre divertido jogar com amigos. Nunca enjoa.', 5),
(4, 18, 2, 'Os puzzles são inteligentes, mas alguns demoraram bastante para eu entender.', 4),
(4, 19, 1, 'Gostei do combate, mas repetiu um pouco depois de várias horas.', 3),
(5, 10, 2, 'Gostei muito da direção artística, mas achei alguns chefes difíceis demais.', 4),
(5, 11, 2, 'Uma experiência incrível. A história consegue emocionar e a jogabilidade é perfeita.', 5),
(5, 12, 1, 'Divertido no multiplayer, porém sozinho acabou ficando repetitivo para mim.', 3),
(5, 13, 2, 'Perfeito para jogar sem pressa. Um dos meus jogos favoritos.', 5),
(5, 14, 2, 'O mundo aberto impressiona e as missões secundárias são excelentes.', 5),
(5, 15, 2, 'Achei o ritmo da história um pouco lento, mas o final compensa bastante.', 4),
(5, 16, 2, 'Esperava mais. A cidade é bonita, porém algumas mecânicas não me prenderam.', 2),
(5, 17, 2, 'Clássico absoluto. Dá para passar horas construindo qualquer coisa.', 5),
(5, 18, 2, 'Muito criativo e engraçado. Recomendo para qualquer pessoa.', 5),
(5, 19, 2, 'Gostei bastante, mas roguelikes não são meu gênero favorito.', 4);