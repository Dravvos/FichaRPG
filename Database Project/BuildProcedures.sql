use RPG
go
--PROCEDURES INSERT
create proc spInsert_Usuario(@nome varchar(150),@usuario_login varchar(max), 
@senha varchar(max))
as begin
	insert into Usuario(nome,usuario_login,senha) 
	values(@nome,@usuario_login,@senha)
end
go
create proc spInsert_Classe(@nome varchar(50))
as begin
	insert into Classe(nome) 
	values(@nome)
end
go
create proc spInsert_Poder_Paranormal (@nome varchar(200), 
@elemento varchar(100),@resumo varchar(max))
as begin
	insert into Poder_Paranormal(nome,elemento,resumo) 
	values(@nome,@elemento,@resumo)
end
go
create proc spInsert_Poder_Classe(@nome varchar(200), 
@descricao varchar(max), @classe_id int)
as begin
	insert into Poder_Classe(nome,descricao,classe_id) 
	values(@nome,@descricao,@classe_id)
end
go
create proc spInsert_Poder_Trilha(@nome varchar(200), 
@descricao varchar(max), @trilha_id int,@nex smallint)
as begin
	insert into Poder_Trilha(nome,descricao,trilha_id,nex) 
	values(@nome,@descricao,@trilha_id,@nex)
end
go
create proc spInsert_Patente(@nome varchar(150))
as begin
	insert into Patente(nome)
	values(@nome)
end
go
create proc spInsert_Trilha(@nome varchar(50), @classe_id int)
as begin
	insert into Trilha(nome,classe_id) 
	values(@nome,@classe_id)
end
go
create proc spInsert_Origem(@nome varchar(50),
@poder_nome varchar(200), @poder_resumo varchar(max))
as begin
	insert into Origem(nome,poder_nome,poder_resumo) 
	values(@nome,@poder_nome,@poder_resumo)
end
go
create proc spInsert_Relacao_Paranormal(@Personagem_id int, 
@Poder_Paranormal_id int)
as begin
	insert into Relacao_Paranormal(personagem_id,poder_paranormal_id) 
	values(@Personagem_id,@Poder_Paranormal_id)
end
go
go
create proc spInsert_Relacao_Ritual(@Personagem_id int, @Ritual_id int)
as begin
	insert into Relacao_Ritual(personagem_id,ritual_id) 
	values(@Personagem_id,@Ritual_id)
end
go

create proc spInsert_Personagem(@usuario_id int, @nome varchar(200),@idade smallint, @local_nascimento varchar(500),
@nex smallint, @historia varchar(max), @aparencia varchar(max),@personalidade varchar(max),
@doenca_fobia_mania varchar(max), @favoritos varchar(max), @anotacoes varchar(max), @origem_id int, @pv_max smallint,
@sanidade_max smallint, @pe_max smallint, @pv_atual smallint, @sanidade_atual smallint, @pe_atual smallint,
@deslocamento smallint, @patente_id int, @classe_id int, @trilha_id int, @forca smallint, @vigor smallint, 
@intelecto smallint, @presenca smallint, @agilidade smallint, @acrobacia smallint, @adestramento smallint, 
@artes smallint, @atletismo smallint, @atualidades smallint, @ciencias smallint, @crime smallint, @diplomacia smallint,
@enganacao smallint, @fortitude smallint, @furtividade smallint, @iniciativa smallint, @intimidacao smallint, 
@intuicao smallint, @investigacao smallint, @luta smallint, @medicina smallint, @ocultismo smallint, @percepcao smallint,
@pilotagem smallint, @pontaria smallint, @profissao smallint, @reflexos smallint, @religiao smallint, @sobrevivencia smallint,
@tatica smallint, @tecnologia smallint, @vontade smallint)
as begin
	insert into Personagem(usuario_id,nome,idade,local_nascimento,nex,historia,aparencia,
	personalidade,doenca_fobia_mania,favoritos,anotacoes,origem_id,pv_max,sanidade_max,pe_max,pv_atual,
	sanidade_atual,pe_atual,deslocamento,patente_id,classe_id,trilha_id,forca,vigor,intelecto,presenca,
	agilidade,acrobacia,adestramento,artes,atletismo,atualidades,ciencias,crime,diplomacia,enganacao,
	fortitude,furtividade,iniciativa,intimidacao,intuicao,investigacao,luta,medicina,ocultismo,percepcao,
	pilotagem,pontaria,profissao,reflexos,religiao,sobrevivencia,tatica,tecnologia,vontade) 
	values(@usuario_id,@nome,@idade,@local_nascimento,@nex,@historia,@aparencia,
	@personalidade,@doenca_fobia_mania,@favoritos,@anotacoes,@origem_id,@pv_max,@sanidade_max,@pe_max,@pv_atual,
	@sanidade_atual,@pe_atual,@deslocamento,@patente_id,@classe_id,@trilha_id,@forca,@vigor,@intelecto,@presenca,
	@agilidade,@acrobacia,@adestramento,@artes,@atletismo,@atualidades,@ciencias,@crime,@diplomacia,@enganacao,
	@fortitude,@furtividade,@iniciativa,@intimidacao,@intuicao,@investigacao,@luta,@medicina,@ocultismo,@percepcao,
	@pilotagem,@pontaria,@profissao,@reflexos,@religiao,@sobrevivencia,@tatica,@tecnologia,@vontade)
end
go

create proc spInsert_Rituais(@nome varchar(200), @elemento varchar(100),
@circulo smallint, @execucao varchar(200), @alcance varchar(100), @efeito varchar(max),
@duracao varchar(200), @resistencia varchar(200),@discente varchar(max),@verdadeiro varchar(max))
as begin
	insert into Rituais(nome,elemento,circulo,execucao,alcance,efeito,duracao,resistencia,discente,verdadeiro) 
	values (@nome,@elemento,@circulo,@execucao,@alcance,@efeito,@duracao,@resistencia,@discente,@verdadeiro)
end
go

create proc spInsert_Dados(@nome varchar(200),@dado varchar(15),@personagem_id int,@is_damage bit)
as begin
	insert into Dados_Personalizados(nome,dado,personagem_id,dano)
	values (@nome,@dado,@personagem_id,@is_damage)
end
go
create proc spInsert_Itens(@nome varchar(200),@descricao varchar(max),@personagem_id int,@espaco int,
							@categoria varchar(3))
as begin
	insert into Itens(nome,descricao,personagem_id,categoria,espaco)
	values (@nome,@descricao,@personagem_id,@categoria,@espaco)
end
go
create proc spInsert_Armas(@nome varchar(200),@tipo varchar(100),@personagem_id int,@espaco int,
							@categoria varchar(3),@dano varchar(20),@alcance varchar(100),@critico varchar(20))
as begin
	insert into Armas(nome,tipo,personagem_id,categoria,espaco,dano,alcance,critico)
	values (@nome,@tipo,@personagem_id,@categoria,@espaco,@dano,@alcance,@critico)
end
go

create procedure spInsert_Campanha
(
	@id int,
	@nome varchar(300),
	@descricao varchar(max),
	@fotoCapa varbinary(max)
)
as begin
	insert into Campanha
		(id,nome,descricao,fotoCapa)
	values
		(@id, @nome, @descricao, @fotoCapa)

end
go

create procedure spInsert_Campanha_Personagem
(
	@id int,
	@campanhaId int,
	@personagemId int
)
as begin
	insert into Campanha_Personagem
		(id,campanha_id,personagem_id)
	values
		(@id, @campanhaId, @personagemId)

end
go

create procedure spInsert_Campanha_Usuario
(
	@id int,
	@campanhaId int,
	@usuarioId int
)
as begin
	insert into Campanha_Usuario
		(id,campanha_id,usuario_id)
	values
		(@id, @campanhaId, @usuarioId)

end
go

----------------------------------------------------------------------------
--PROCEDURES UPDATE
create proc spUpdate_Usuario(
@id int, @nome varchar(150), @usuarioLogin varchar(max),
@senha varchar(max))
as begin
	update Usuario set nome=@nome,usuario_login=@usuarioLogin,
	senha=@senha where id =@id
end
go
create proc spUpdate_Patente(@id int, @nome varchar(150))
as begin
	update Patente set nome=@nome where id=@id
end
go
create proc spUpdate_Classe(
@id int, @nome varchar(50))
as begin
	update Classe set nome=@nome 
	where id=@id
end
go
create proc spUpdate_Poder_Paranormal(
@id int, @nome varchar(200), @elemento varchar(100), 
@resumo varchar(max))
as begin
	update Poder_Paranormal set nome=@nome,elemento=@elemento,resumo=@resumo 
	where id=@id
end
go
create proc spUpdate_Trilha(
@id int, @nome varchar(50), @classe_id int)
as begin
	update Trilha set nome=@nome,classe_id=@classe_id 
	where id=@id
end
go
create proc spUpdate_Relacao_Paranormal(
@id int, @Personagem_id int, @Poder_Paranormal_id int)
as begin
	update Relacao_Paranormal set personagem_id=@Personagem_id,
	poder_paranormal_id=@Poder_Paranormal_id 
	where id=@id
end
go
create proc spUpdate_Relacao_Ritual(
@id int, @Personagem_id int, @Ritual_id int)
as begin
	update Relacao_Ritual set personagem_id=@Personagem_id,
	ritual_id=@Ritual_id
	where id=@id
end
go

go
create proc spUpdate_Personagem(@id int, @nome varchar(200),@idade smallint, 
@local_nascimento varchar(500), @nex smallint, @historia varchar(max), 
@aparencia varchar(max),@personalidade varchar(max), @doenca_fobia_mania varchar(max), 
@favoritos varchar(max), @anotacoes varchar(max), @origem_id int, @pv_max smallint, @sanidade_max smallint, 
@pe_max smallint, @deslocamento smallint, @patente_id int, @classe_id int, @trilha_id int, @forca smallint, 
@vigor smallint, @intelecto smallint, @presenca smallint, @agilidade smallint, @acrobacia smallint, 
@adestramento smallint, @artes smallint, @atletismo smallint, @atualidades smallint, @ciencias smallint, 
@crime smallint, @diplomacia smallint, @enganacao smallint, @fortitude smallint, @furtividade smallint, 
@iniciativa smallint, @intimidacao smallint, @intuicao smallint, @investigacao smallint, @luta smallint, 
@medicina smallint, @ocultismo smallint, @percepcao smallint, @pilotagem smallint, @pontaria smallint, 
@profissao smallint, @reflexos smallint, @religiao smallint, @sobrevivencia smallint, @tatica smallint, 
@tecnologia smallint, @vontade smallint)
as begin
	update Personagem set nome=@nome,idade=@idade,local_nascimento=@local_nascimento,
	nex=@nex,historia=@historia,aparencia=@aparencia,personalidade=@personalidade,
	doenca_fobia_mania=@doenca_fobia_mania,favoritos=@favoritos,anotacoes=@anotacoes,origem_id=@origem_id,
	pv_max=@pv_max,sanidade_max=@sanidade_max,pe_max=@pe_max,deslocamento=@deslocamento,patente_id=@patente_id,
	classe_id=@classe_id,trilha_id=@trilha_id, forca=@forca,vigor=@vigor,intelecto=@intelecto,presenca=@presenca,
	agilidade=@agilidade,acrobacia=@acrobacia, adestramento=@adestramento,artes=@artes,atletismo=@atletismo,
	atualidades=@atualidades,ciencias=@ciencias, crime=@crime,diplomacia=@diplomacia,enganacao=@enganacao,
	fortitude=@fortitude,furtividade=@furtividade, iniciativa=@iniciativa,intimidacao=@intimidacao,intuicao=@intuicao,
	investigacao=@investigacao,luta=@luta, medicina=@medicina,ocultismo=@ocultismo,percepcao=@percepcao,pilotagem=@pilotagem,
	pontaria=@pontaria,profissao=@profissao,reflexos=@reflexos,religiao=@religiao,sobrevivencia=@sobrevivencia,tatica=@tatica,
	tecnologia=@tecnologia,vontade=@vontade
	where id=@id
end
go
create proc spUpdate_Rituais(@id int, @nome varchar(200), @elemento varchar(100),
@circulo smallint, @execucao varchar(200), @alcance varchar(100), @efeito varchar(max),
@duracao varchar(200), @resistencia varchar(200),@discente varchar(max),@verdadeiro varchar(max))
as begin
	update Rituais set nome=@nome, elemento=@elemento, circulo=@circulo, execucao=@execucao,
	alcance=@alcance, efeito=@efeito, duracao=@duracao, resistencia=@resistencia ,discente=@discente,
	verdadeiro=@verdadeiro where id=@id
end
go

create proc spUpdate_Dados(@id int,@nome varchar(200),@dado varchar(15),@personagem_id int,@is_damage bit)
as begin
	update Dados_Personalizados set nome=@nome,dado=@dado,personagem_id=@personagem_id,dano=@is_damage
	where id=@id
end
go
create proc spUpdate_Itens(@id int,@nome varchar(200),@descricao varchar(max),@espaco int,
							@categoria varchar(2))
as begin
	update Itens set nome=@nome,descricao=@descricao,espaco=@espaco,
	categoria=@categoria
	where id=@id
end
go

create proc spUpdate_Armas(@id int,@nome varchar(200),@dano varchar(200),@espaco int,
							@categoria varchar(2),@alcance varchar(100),@tipo varchar(200),@critico varchar(200))
as begin
	update Armas set nome=@nome,tipo=@tipo,espaco=@espaco,
	categoria=@categoria,alcance=@alcance,dano=@dano,critico=@critico
	where id=@id
end
go
create proc spUpdate_Vida(@id int, @vida smallint)
as begin
	update Personagem set pv_atual=@vida where id=@id
end
go

create proc spUpdate_Sanidade(@id int, @sanidade smallint)
as begin
	update Personagem set sanidade_atual=@sanidade where id=@id
end
go

create proc spUpdate_Pe(@id int, @pe smallint)
as begin
	update Personagem set pe_atual=@pe where id=@id
end
go


create procedure spUpdate_Campanha
(
	@id int,
	@nome varchar(300),
	@descricao varchar(max),
	@fotoCapa varbinary(max)
)
as begin
	update Campanha set
		nome=@nome,
		descricao=@descricao,
		fotoCapa=@fotoCapa
	where id = @id
end
go

-----------------------------------------------------
--PROCEDURE DELETE
create proc spDelete (@tabela varchar(500),@id int)
as begin
	exec ('delete '+@tabela+' where id = '+@id)
end
go
create proc spDeleteRelacaoRitual(@personagem_id int, @ritual_id int)
as begin
	exec ('delete Relacao_Ritual where personagem_id = '+@personagem_id+' and ritual_id='+@ritual_id)
	exec ('delete Rituais where id='+@ritual_id)
end
go
create proc spDeleteDados (@id int)
as begin
	exec ('delete from Dados_Personalizados where personagem_id = '+@id)
end
go
create proc spDeletarArma (@id int)
as begin
	exec ('delete from Armas where personagem_id = '+@id)
end
go
create proc spDeletarItem (@id int)
as begin
	exec ('delete from Itens where personagem_id = '+@id)
end
go


create procedure spDelete_CampanhaPersonagem
(
	@campanhaId int,
	@personagemId int
)
as begin
exec ('delete Campanha_Personagem where campanha_id = '+@campanhaId +' and personagem_id='+ @personagemId)

end
go

create procedure spDelete_CampanhaUsuario
(
	@campanha_id int, @usuario_id int
)
as begin
	exec ('delete Campanha_Usuario where campanha_id = '+@campanha_id +' and usuario_id='+@usuario_id)
end
go

create procedure spDelete_CampanhaUsuarioPorUsuario
(
	@usuario_id int
)
as begin
	exec ('delete Campanha_Usuario where usuario_id='+@usuario_id)
end
go

create procedure spDelete_CampanhaUsuarioPorCampanha
(
	@campanha_id int
)
as begin
	exec ('delete Campanha_Usuario where campanha_id = '+@campanha_id)
end
go

create procedure spDelete_CampanhaPersonagemPorCampanha
(
	@campanhaId int
)
as begin
exec ('delete Campanha_Personagem where campanha_id = '+@campanhaId)

end
go

create procedure spDelete_CampanhaPersonagemPorPersonagem
(
	@personagemId int
)
as begin
exec ('delete Campanha_Personagem where personagem_id = '+@personagemId)

end
go
-----------------------------------------------------------------------------------
--PROCEDURES LIST
create proc spList (@tabela varchar(500))
as begin
	exec ('select * from '+@tabela)
end
go
create proc spListaTrilhas (@classe_id int)
as begin
	select t.id,t.nome,c.id as classe_id from Trilha t inner join Classe c on t.classe_id=c.id
	where c.id=@classe_id
end
go
create proc spListaDado(@Personagem_id int)
as begin
	select * from Dados_Personalizados where personagem_id=@Personagem_id
end
go
create proc spListaRituais(@Personagem_id int)
as begin
	select r.* from Relacao_Ritual rr inner join Rituais r 
	on rr.Ritual_id=r.id 
	inner join Personagem p on rr.personagem_id=p.id where p.id=@Personagem_id
end
go
create proc spListaPersonagens(@id int)
as begin
	select * from Personagem where usuario_id=@id
end
go
create proc spListaArmas(@id int)
as begin
	select * from Armas where personagem_id=@id
end
go
create proc spListaItens(@id int)
as begin
	select * from Itens where personagem_id=@id
end
go
create proc spListaPesoArmas(@p_id int)
as begin
	select sum(espaco) peso from Armas where personagem_id=@p_id
end
go
create proc spListaPesoItens(@p_id int)
as begin
	select sum(espaco) peso from Itens where personagem_id=@p_id
end
go

create procedure spListaCampanhas
(
	@usuarioId int
)
as begin
	select c.* from Campanha c
	inner join Campanha_Usuario cu on c.id=cu.campanha_id
	inner join Campanha_Personagem cp on cp.campanha_id= c.id
	where usuario_id=@usuarioId

end
go

create procedure spListaCampanhasUsuario
( @usuarioId int)
as begin
	select * from Campanha_Usuario
	where usuario_id = @usuarioId
end
go

create procedure spListaUsuariosCampanha
( @campanhaId int)
as begin
	select * from Campanha_Usuario
	where campanha_id = @campanhaId
end
go

create procedure spListaCampanhasPersonagem
( @personagemId int)
as begin
select * from Campanha_Personagem
	where personagem_id= @personagemId
end
go

create procedure spListaPersonagensCampanha
( @campanhaId int)
as begin
select * from Campanha_Personagem
	where campanha_id= @campanhaId
end
go

-----------------------------------
--PROCEDURE SEARCH
go
create proc spSearch (@id int, @tabela varchar(500))
as begin
	exec ('select * from '+ @tabela+' where id='+@id)
end
go
create proc spSearchUsuario(@id int)
as begin
	exec ('select id from Usuario where id='+@id)
end
go

----------------------------------------------------------------------------------------
create procedure spProximoId
(@tabela varchar(max))
as
begin
exec('select isnull(max(id) +1, 1) as MAIOR from '
+@tabela)
end
GO

go

CREATE PROCEDURE spVerificaUsuarioCadastrado
(
	@UsuarioEncriptografado	VARCHAR(max)
)
AS
BEGIN
	IF EXISTS(SELECT * FROM Usuario WHERE usuario_login = @UsuarioEncriptografado)
		SELECT 1 AS RETORNO
	ELSE
		SELECT 0 AS RETORNO
END
GO

CREATE PROCEDURE spVerificaUsuarioESenhaCorretos
(
	@UsuarioEncriptografado	VARCHAR(max),
	@SenhaEncriptografada	VARCHAR(max)
)
AS
BEGIN
	IF EXISTS(SELECT * FROM Usuario WHERE usuario_login = @UsuarioEncriptografado AND
												Senha = @SenhaEncriptografada)
			SELECT * FROM Usuario WHERE usuario_login = @UsuarioEncriptografado AND
												Senha = @SenhaEncriptografada
END
GO

create proc spRetornaPericias (@id int)
as begin

DECLARE @PivotColumnHeaders VARCHAR(MAX)
SELECT @PivotColumnHeaders = 
  COALESCE(
    @PivotColumnHeaders + ',[' + cast([date] as varchar) + ']',
    '[' + cast([date] as varchar)+ ']'
  )
    FROM ( 
        SELECT distinct [date]
        FROM Personagem
        UNPIVOT
        ( qty FOR date IN ([acrobacia],[adestramento],[artes],[atletismo],[atualidades],[ciencias],[crime],[diplomacia],[enganacao],
	[fortitude],[furtividade],[iniciativa],[intimidacao],[intuicao],[investigacao],[luta],[medicina],[ocultismo],[percepcao],
	[pilotagem],[pontaria],[profissao],[reflexos],[religiao],[sobrevivencia],[tatica],[tecnologia],[vontade] )
        ) AS Unp
        WHERE qty >= 5 and id=@id
) rtn
DECLARE @PivotTableSQL NVARCHAR(4000)
SET @PivotTableSQL = N'
SELECT *
FROM ( 
    SELECT [id], [date], [qty]
    FROM Personagem
    UNPIVOT
    ( qty FOR date IN ([acrobacia],[adestramento],[artes],[atletismo],[atualidades],[ciencias],[crime],[diplomacia],[enganacao],
	[fortitude],[furtividade],[iniciativa],[intimidacao],[intuicao],[investigacao],[luta],[medicina],[ocultismo],[percepcao],
	[pilotagem],[pontaria],[profissao],[reflexos],[religiao],[sobrevivencia],[tatica],[tecnologia],[vontade])
    ) AS Unp    
) piv
PIVOT
( SUM([qty])
  FOR [date] IN ( ' + @PivotColumnHeaders + ' )
) AS PivotTable
where id='+cast(@id as varchar(5))

EXECUTE(@PivotTableSQL)
end
GO
