create database RPG
go
use RPG
go
create table Usuario(id int primary key identity(1,1),
	nome varchar(150) not null,
	usuario_login varchar(MAX) not null,
	senha varchar(max) not null)

create table Origem(id int primary key identity(1,1),
	nome varchar(50) not null,
	poder_nome varchar(200) not null,
	poder_resumo varchar(max) not null
)
create table Patente(id int primary key identity(1,1),
	nome varchar(100) not null
)
create table Classe(id int primary key identity(1,1),
	nome varchar(50) not null
)
create table Trilha(id int primary key identity(1,1),
	nome varchar(50) not null,
	classe_id int foreign key references Classe(id) not null
)
create table Rituais(id int primary key identity(1,1),
	nome varchar(200) not null,
	elemento varchar(100) not null,
	circulo smallint not null,
	execucao varchar(200) not null,
	alcance varchar(100) not null,
	efeito varchar(max) not null,
	duracao varchar(200) not null,
	resistencia varchar(200) null,
	discente varchar(max) null,
	verdadeiro varchar(max) null
	)

create table Poder_Paranormal(id int primary key identity(1,1),
	nome varchar(200) not null,
	elemento varchar(100) not null,
	resumo varchar(max) not null)

create table Poder_Classe(id int primary key identity (1,1),
	nome varchar(200) not null,
	descricao varchar(max) not null,
	classe_id int foreign key references Classe(id) not null,

	)
create table Poder_Trilha(id int primary key identity (1,1),
	nome varchar(200) not null,
	descricao varchar(max) not null,
	trilha_id int foreign key references Trilha(id) not null,
	nex smallint not null
	)

create table Personagem(id int primary key identity(1,1),
	usuario_id int constraint FK_Usuario_Personagem foreign key references Usuario(id) not null,
	nome varchar(200) not null,
	idade smallint not null,
	local_nascimento varchar(500) null,
	nex smallint not null,
	historia varchar(max) null,
	aparencia varchar(max) null,
	personalidade varchar(max) null,
	doenca_fobia_mania varchar(max) null,
	favoritos varchar(max) null,
	anotacoes varchar(max) null,
	origem_id int constraint FK_Origem_Personagem foreign key references Origem(id) not null,
	pv_max smallint not null,
	sanidade_max smallint not null,
	pe_max smallint not null,
	pv_atual smallint not null,
	sanidade_atual smallint not null,
	pe_atual smallint not null,
	deslocamento smallint,
	patente_id int constraint FK_Patente_Personagem foreign key references Patente(id) not null,
	classe_id int constraint FK_Classe_Personagem foreign key references Classe(id) not null,
	trilha_id int constraint FK_Trilha_Personagem foreign key references Trilha(id) null,
	forca smallint not null,
	vigor smallint not null,
	intelecto smallint not null,
	presenca smallint not null,
	agilidade smallint not null,

	acrobacia smallint not null,
	adestramento smallint not null,
	artes smallint not null,
	atletismo smallint not null,
	atualidades smallint not null,
	ciencias smallint not null,
	crime smallint not null,
	diplomacia smallint not null,
	enganacao smallint not null,
	fortitude smallint not null,
	furtividade smallint not null,
	iniciativa smallint not null,
	intimidacao smallint not null,
	intuicao smallint not null,
	investigacao smallint not null,
	luta smallint not null,
	medicina smallint not null,
	ocultismo smallint not null,
	percepcao smallint not null,
	pilotagem smallint not null,
	pontaria smallint not null,
	profissao smallint not null,
	reflexos smallint not null,
	religiao smallint not null,
	sobrevivencia smallint not null,
	tatica smallint not null,
	tecnologia smallint not null,
	vontade smallint not null,
	)
	
	

create table Relacao_Paranormal(id int primary key identity(1,1),
	personagem_id int constraint FK_Personagem_Poder foreign key references Personagem(id) not null,
	poder_paranormal_id int foreign key references Poder_Paranormal(id) not null)

create table Relacao_Ritual(id int primary key identity(1,1),
	personagem_id int constraint FK_Personagem_Ritual foreign key references Personagem(id) not null,
	ritual_id int foreign key references Rituais(id) not null)

create table Dados_Personalizados(id int primary key identity(1,1),
	nome varchar(200) null,
	dado varchar(15) not null,
	personagem_id int constraint FK_Personagem_Dado foreign key references Personagem(id) not null,
	dano bit not null)

create table Armas(id int primary key identity(1,1),
	nome varchar(200) not null,
	dano varchar(20) not null,
	alcance varchar(100) not null,
	tipo varchar(200) not null,
	espaco int not null,
	critico varchar(200) not null,
	categoria varchar(3) not null,
	personagem_id int constraint FK_Personagem_Arma foreign key references Personagem(id) not null)

create table Itens(id int primary key identity(1,1),
	nome varchar(200) not null,
	descricao varchar(max) not null,
	espaco int not null,
	categoria varchar(3) not null,
	personagem_id int constraint FK_Personagem_Item foreign key references Personagem(id) not null
)


create table Campanha 
(
	id int primary key identity (1,1),
	nome varchar(300) not null,
	descricao varchar(max) null,
	fotoCapa varbinary(max) null,
)
go

create table Campanha_Usuario
(
	id int primary key identity (1,1),
	campanha_id int foreign key references Campanha(id) not null,
	usuario_id int foreign key references Usuario(id) not null
)
go

create table Campanha_Personagem
(
	id int primary key identity (1,1),
	campanha_id int foreign key references Campanha(id) not null,
	personagem_id int foreign key references Personagem(id) not null
)
go
