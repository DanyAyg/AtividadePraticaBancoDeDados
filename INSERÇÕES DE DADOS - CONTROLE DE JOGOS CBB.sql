/*https://github.com/DanyAyg/AtividadePraticaBancoDeDados*/

/*INSERÇÕES*/
insert into estadio (nome_estadio, cidade_estadio, capacidade_estadio) 
values ('Panela de Pressão', 'Bauru', 2000), ('Nilson Nelson', 'Brasília', 11397), 
('SESI','Caxias do Sul', 4500), ('ASCEB','	Brasília', 1100),
('Wlamir Marques','São Paulo', 6500), ('Maracanãzinho','Rio de Janeiro', 11800), 
('Centro de Formação Olímpica','Fortaleza', 17100), ('Arena Unifacisa','Campina Grande', 1200),
('Poliesportivo Arnão','Santa Cruz do Sul', 6000), ('Arena Minas TC','Belo Horizonte', 4000);

insert into treinador (nome_treinador, historico_treinador)
values ('Paulo Chupeta', 'Campeonato 2008 - Flamengo'), ('Lula Ferreira', 'Campeonato 2009 - Lobos'),
('Hélio Rubens','Campeonato 2010 - Franca'), ('Régis Marrelli','Campeonato 2011 - São José'),
('Lula Ferreira','Campeonato 2012 - Franca'), ('Gustavo de Conti','Campeonato 2013 - Paulistano'),
('Dedé Barbosa','Campeonato 2014 - Limeira'), ('José Alves Neto','Campeonato 2015 - Flamengo'),
('Léo Figueiró','Campeonato 2018 - Botafogo'), ('Guerrinha','Campeonato 2020 - Mogi');

insert into equipe (nome_equipe, casa_equipe, id_treinador)
values ('Bauru', 'Panela de Pressão', 1), ('Brasilia', 'Nilson Nelson', 2), ('Caxias do Sul', 'SESI', 3), 
('Cerrado', 'ASCEB', 4), ('Corinthians', 'Wlamir Marques', 5), ('Flamengo', 'Maracanazinho', 6),
('Fortaleza', 'Centro de Formação Olimpica', 7), ('Minas', 'Arena Minas TC', 8), ('Uniao', 'Poliesportivo Arnao', 9),
('Unifacisa', 'Arena Unifacisa', 10);

insert into jogador (nome_jogador, numero_jogador, altura_jogador, peso_jogador, nome_equipe)
values ('Kevin', 8, 1.92, 92, 'Bauru'), ('Nick', 7, 1.98, 90, 'Bauru'), ('Samuel', 20, 1.82, 85, 'Bauru'), ('Larry', 4, 1.81, 90, 'Bauru'), ('Lucas', 6, 1.87, 81, 'Bauru'),
('Zach', 5, 1.97, 92, 'Brasilia'), ('Ronald', 11, 2.06, 105, 'Brasilia'), ('Arthur', 15, 1.97, 85, 'Brasilia'), ('Ricardo', 1, 1.85, 95, 'Brasilia'), ('Gemerson', 8, 2.05, 99, 'Brasilia'),
('Paixao', 0, 2.01, 92, 'Caxias do Sul'), ('Martini', 1, 1.95, 95, 'Caxias do Sul'), ('Caue', 8, 1.92, 80, 'Caxias do Sul'), ('Pedro', 9, 1.96, 92, 'Caxias do Sul'), ('Marco', 10, 1.87, 85, 'Caxias do Sul'),
('Thornton', 0, 1.94, 100, 'Cerrado'), ('Joao Marcos', 1, 1.91, 90, 'Cerrado'), ('Pierotti', 4, 1.85, 81, 'Cerrado'), ('Paulo', 7, 1.93, 91, 'Cerrado'), ('Ruan', 8, 2.03, 95, 'Cerrado'),
('Jean', 0, 1.79, 70, 'Corinthians'), ('Fuller', 2, 1.85, 82, 'Corinthians'), ('Beto', 4, 1.88, 90, 'Corinthians'), ('Djalo', 7, 1.99, 96, 'Corinthians'), ('Dalaqua', 8, 1.82, 100, 'Corinthians');

insert into jogo (data_jogo, equipe1, equipe2, placar1, placar2, arrecadacao, custo, nome_estadio)
values('10/05/2020', 'Bauru', 'Brasilia', 100, 80, 10000, 8000, 'Panela de Pressão'),
('20/05/2020', 'Bauru', 'Caxias do Sul', 75, 99, 25000, 30000, 'SESI'),
('08/06/2020', 'Bauru', 'Cerrado', 80, 80, 15000, 6000, 'Panela de Pressão'),
('10/05/2020', 'Bauru', 'Corinthians', 120, 80, 30000, 45000, 'Wlamir MArques'),
('10/06/2020', 'Brasilia', 'Caxias do Sul', 75, 82, 10000, 8000, 'Nilson Nelson'),
('15/06/2020', 'Brasilia', 'Cerrado', 99, 98, 21000, 8000, 'Nilson Nelson'),
('30/06/2020', 'Brasilia', 'Corinthians', 100, 121, 50000, 12000, 'Wlamir MArques'),
('25/07/2020', 'Caxias do Sul', 'Cerrado', 50, 35, 4000, 4200, 'SESI'),
('25/07/2020', 'Caxias do Sul', 'Corinthians', 72, 100, 8000, 7500, 'SESI'),
('25/07/2020', 'Cerrado', 'Corinthians', 74, 74, 10000, 2500, 'ASCEB');

insert into patrocinador (nome_patrocinador, area_patrocinador, tipo_patrocinador)
values ('Budweiser', 'Alimenticio', 1), ('SKY', 'Entreterimento', 1), ('Penalty', 'Materiais Esportivos', 2),
('ESPN', 'Entreterimento', 1), ('Betmotion', 'Apostas', 1), ('Nike', 'Materiais Esportivos', 2), 
('Spalding', 'Materiais Esportivos', 2), ('Cultura', 'Entreterimento', 1), ('Jogo limpo', 'Suporte', 2),
('Facebook', 'Entreterimento', 1);

insert into cobertura (canal_cobertura, audiencia_cobertura)
values ('ESPN', 9.5), ('SportTV', 7), ('NBB league Pass', 9.9), ('Vivo NBB', 4.3), ('Band', 5.5), 
('Fox Sports', 7.8), ('YouTube', 9.1), ('Facebook', 8), ('TV Cultura', 4.1), ('TNT', 5);

insert into torcedor(equipe_torcedor, genero_torcedor)
values ('Bauru', 1), ('Bauru', 2), 
('Basilia', 2), ('Brasilia', 1), 
('Caxias do Sul', 3), ('Caxias do Sul', 3), 
('Cerrado', 1), ('Cerrado', 2), 
('Corinthians', 4), ('Corinthians', 1);

insert into funcionario(nome_funcionario, salario_funcionario)
values ('Natalia Camarinho', 3000), ('Maryam Veleda', 3000), ('Leandro Moreno', 3000), ('Cristian Moreno', 3000), ('Tamára Bencatel', 3000), 
('Henzo Faia Carvalhosa', 2500), ('Vanessa Rabelo', 2500), ('Matteo Calheiros Valério', 2500), ('Louisa Alvarenga Marques', 2500), ('Laurindo Fitas', 2500),
('Andra Mangueira', 1900), ('Mel Poças', 2100), ('Youssef Colares', 2100), ('Wilson Salvado Cardim', 1600), ('Alan Montenegro', 1900), 
('Tiago Veleda', 1200), ('Oumou Meira', 2500), ('Lucca Catela', 1900), ('Viktoriya Marmou Rua', 2100), ('Kimi Lagoa', 2000);

insert into juiz (id_juiz, tipo_juiz, genero_juiz)
values (1, 1, 2), (2, 1, 2), (3, 1, 1), (4, 1, 1), (5, 1, 2), 
(6, 2, 1), (7, 2, 2), (8, 2, 1), (9, 2, 2), (10, 2, 1);

insert into organizador (id_organizador, setor_organizador, responsabilidade_organizador, serial_jogo)
values (11, 'Limpeza', 'Quadra', 1), (12, 'Segurança', 'Portaria', 1), 
(13, 'Limpeza', 'Vestiario', 2), (14, 'Segurança', 'Estádio', 2), 
(15,'Segurança', 'Portaria', 3), (16, 'Limpeza', 'Quadra', 3), 
(17, 'Limpeza', 'Vestiario', 4), (18, 'Segurança', 'Portaria', 4), 
(19, 'Limpeza', 'Quadra', 5), (20, 'Limpeza', 'Vestiario', 5);

insert into patrocina (nome_patrocinador, serial_jogo, nome_equipe)
values ('Betmotion', 1, 'Bauru'), ('Budweiser', 2, 'Bauru'), ('Cultura', 2, 'Brasilia'), 
('ESPN', 3, 'Caxias do Sul'), ('Facebook', 3, 'Bauru'), ('Jogo limpo', 4, 'Corinthians'), 
('Nike', 4, 'Bauru'), ('Penalty', 5, 'Brasilia'), ('SKY', 6, 'Cerrado'), 
('Spalding', 7, 'Brasilia');

insert into transmite (id_cobertura, serial_jogo)
values (1, 1), (2, 1), (3, 2), (4, 2), (5, 2), 
(6, 5), (7, 9), (8, 4), (9, 3), (10, 3);

insert into dirige(id_juiz, serial_jogo)
values (1, 1), (4, 1), (9, 1),
(2, 2), (5, 2), (9, 2),
(3, 8), (6, 8), (6, 4),
(8, 4);

insert into assiste(numero_ingresso, serial_jogo)
values (1, 1), (1, 4), (1, 9), 
(2, 1), (4, 5), (10, 10), 
(6, 4), (8, 10), (4, 1), 
(5, 7), (4, 8), (10, 4), (5, 5);