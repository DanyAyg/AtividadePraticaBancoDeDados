/*https://github.com/DanyAyg/AtividadePraticaBancoDeDados*/

/*Equipes vencedoras de todos os jogos cadastrados*/
select serial_jogo, equipe1 as vencedores from jogo where placar1 > placar2
union
select serial_jogo, equipe2 from jogo where placar1 < placar2 order by serial_jogo

/*Nomes dos jogadores mais altos que venceram algum jogo*/
select jr.nome_jogador from jogador jr, equipe e
where jr.nome_equipe in (select equipe1 as vencedores from jogo 
						where placar1 > placar2
						union
						select equipe2 from jogo 
                        where placar1 < placar2)
and jr.altura_jogador = (select max(altura_jogador) from jogador)
group by jr.nome_jogador

/*Nome dos estadios em que houveram jogos que não deram prejuizo e que foram patrocinados pela ESPN*/
select e.cidade_estadio from estadio e, jogo j
where e.nome_estadio = j.nome_estadio
and j.arrecadacao - j.custo > 0
and exists (select j.nome_estadio from patrocinador p, patrocina pt
			where pt.serial_jogo = j.serial_jogo
            and pt.nome_patrocinador = p.nome_patrocinador
            and p.nome_patrocinador = 'ESPN')
            
/*Historico dos treinadores que treinaram equipes com os maiores placares nos jogos cadastrados*/
select t.historico_treinador, t.nome_treinador, e.nome_equipe from treinador t, equipe e
where t.id_treinador = e.id_treinador 
and e.nome_equipe in (select j.equipe1 from jogo j 
			where j.placar1 in (select max(placar1) from jogo)
            union
            select j.equipe2 from jogo j 
			where j.placar2 in (select max(placar2) from jogo))
            
/*Quantidade de torcedores que assistiram jogos em que seu time perdeu*/
select count(t.numero_ingresso) from torcedor t, assiste a, jogo j
where t.numero_ingresso = a.numero_ingresso
and a.serial_jogo = j.serial_jogo
and exists (select t.equipe_torcedor where t.equipe_torcedor = j.equipe1 and j.placar1 < j.placar2
			union
            select t.equipe_torcedor where t.equipe_torcedor = j.equipe2 and j.placar1 > j.placar2)

/*Nome das coberturas com audiencia superior a 5 pontos, que transmitiram todos os jogos*/
select * from cobertura c
where c.audiencia_cobertura > 5
and not exists (select j.serial_jogo from jogo j
			    where not exists (select j.serial_jogo from transmite t
								  where t.serial_jogo - j.serial_jogo
                                  and t.id_cobertura = c.id_cobertura))

/*Nomes dos juizes que apitaram os jogos com o maior lucro*/
select f.nome_funcionario, d.serial_jogo from funcionario f, juiz jz, dirige d
where jz.id_juiz = f.id_funcionario 
and d.id_juiz = jz.id_juiz
and exists (select j.serial_jogo from jogo j where d.serial_jogo = j.serial_jogo
			and (j.arrecadacao - j.custo) in(select max(j2.arrecadacao - j2.custo) from jogo j2))
            
/*Patrocinadores que patrocinaram jogos em que jogaram times com média de peso superior a 90*/
select p.nome_patrocinador from patrocinador p, patrocina pr, jogo j
where pr.nome_patrocinador = p.nome_patrocinador
and pr.serial_jogo = j.serial_jogo
and exists (select e.nome_equipe from jogador jr, equipe e
				  where jr.nome_equipe = e.nome_equipe
                  and e.nome_equipe = j.equipe1
                  group by e.nome_equipe 
                  having avg(jr.peso_jogador) > 90
                  union 
                  select e.nome_equipe from jogador jr, equipe e
				  where jr.nome_equipe = e.nome_equipe
                  and e.nome_equipe = j.equipe2
                  group by e.nome_equipe 
                  having avg(jr.peso_jogador) > 90)
                  
/*Nomes dos funcionários que trabalharam em jogos que aconteceram em São Paulo*/
select f.nome_funcionario from funcionario f, jogo j, estadio e
where exists (select jz.id_juiz from juiz jz, dirige d where f.id_funcionario = jz.id_juiz
			  and d.id_juiz = jz.id_juiz
              and j.serial_jogo = d.serial_jogo
			  union
              select o.id_organizador from organizador o where f.id_funcionario = o.id_organizador
              and o.serial_jogo = j.serial_jogo)
and j.nome_estadio = e.nome_estadio
and e.cidade_estadio = 'Sao Paulo'

/*Data dos jogos em o número de espectadores não excedeu o limite do estádio*/
select j.data_jogo from jogo j, estadio e
where j.nome_estadio = e.nome_estadio
and e.capacidade_estadio >= (select count(t.numero_ingresso) from torcedor t, assiste a 
								where a.numero_ingresso = t.numero_ingresso 
                                and a.serial_jogo = j.serial_jogo)
group by j.data_jogo


