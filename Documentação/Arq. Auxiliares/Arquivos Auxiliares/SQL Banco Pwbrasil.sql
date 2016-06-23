select op.idOrdemProducao,c.Referencia, d.idFase,f.Fase,ac.acao, p.Parte, isnull(d.complemento,'') as complemento, b.tempo 
from Cronometragens a , Operacoes_Tempos b, Produtos c , Operacoes d, Ordem_Producao_Fases opf, Ordem_Producao op,
Fases f, Acoes ac, Partes p
where a.idCronometragem = b.idcronometragem and c.CodProduto = a.codproduto and d.idOperacao = b.idOperacao 
and f.CodFase = d.idFase and opf.idFase = f.CodFase and ac.idAcao = d.idAcao and p.idParte = d.idParte
and op.idOrdemProducao = opf.idOrdemProducao and opf.idFase = d.idFase and op.CodProduto = c.CodProduto
and QtdeProduzindo >0 and op.idOrdemProducao = 49319
order by op.idOrdemProducao, ac.acao, p.Parte



select c.CodColecao, COUNT(*)  from Ordem_Producao_Fases opf, Ordem_Producao op, Produtos c 
where op.idOrdemProducao = opf.idOrdemProducao and QtdeProduzindo >0
and c.codproduto = op.CodProduto
group by c.CodColecao


select * from Operacoes
select * from Acoes
select * from Partes


select * from Ordem_Producao_Fases where QtdeProduzindo >0
where CodColecao = 99 and
CodProduto not in (select distinct CodProduto from Cronometragens)

select * from Ordem_Producao

select * from Colecoes

lx_cade_coluna nome