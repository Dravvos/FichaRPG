use RPG
go
exec spInsert_Patente 'Recruta'
go
exec spInsert_Patente 'Operador'
go
exec spInsert_Patente 'Agente Especial'
go
exec spInsert_Patente 'Oficial de Opera��es'
go
exec spInsert_Patente 'Agente de Elite'
go

exec spInsert_Classe 'Combatente'
go
exec spInsert_Classe 'Especialista'
go
exec spInsert_Classe 'Ocultista'
go

exec spInsert_Poder_Classe 'Armamento Pesado','Voc� recebe profici�ncia com armas pesadas. Pr�-Requisito: For 2.',1
go
exec spInsert_Poder_Classe 'Artista Marcial','Seus ataques desarmados causam 1d6 pontos de dano, podem causar dano letal e contam como armas �geis. 
Em NEX 35%, o dano aumenta para 1d8 e, em NEX 70%, para 1d10.',1
go
exec spInsert_Poder_Classe 'Ataque de Oportunidade','Sempre que um ser sair voluntariamente de um espa�o adjacente ao seu, voc� pode gastar uma rea��o e 1 PE para fazer
um ataque corpo a corpo contra ele.',1
go
exec spInsert_Poder_Classe 'Combater com Duas Armas','Se estiver usando duas armas (e pelo menos uma for leve) e fizer a a��o agredir, voc� pode fazer dois ataques, um
com cada arma. Se fizer isso, sofre �1 dado em todos os testes de ataque at� o seu pr�ximo turno. Pr�-requisitos: Agi 3, treinado em Luta ou Pontaria.',1
go
exec spInsert_Poder_Classe 'Combate Defensivo','Quando usa a a��o agredir, voc� pode combater defensivamente. Se fizer isso, at� seu pr�ximo turno, sofre �1 dado em todos
os testes de ataque, mas recebe +5 na Defesa. Pr�-requisito: Int 2.',1
go
exec spInsert_Poder_Classe 'Golpe Demolidor','Quando usa a manobra quebrar ou ataca um objeto, voc� pode gastar 1 PE para causar dois dados de dano extra do mesmo
tipo de sua arma. Pr�-requisitos: For +2, treinado em Luta.',1
go
exec spInsert_Poder_Classe 'Golpe Pesado','O dano de suas armas corpo a corpo aumenta em mais um dado do mesmo tipo',1
go
exec spInsert_Poder_Classe 'Incans�vel','Uma vez por cena, voc� pode gastar 2 PE para fazer uma a��o de investiga��o adicional, mas deve usar For�a ou Agilidade como 
atributo-base do teste.',1
go
exec spInsert_Poder_Classe 'Presteza Atl�tica','Quando faz um teste de facilitar a investiga��o, voc� pode gastar 1 PE para usar For�a ou Agilidade no lugar do atributo-base 
da per�cia. Se passar no teste, o pr�ximo aliado que usar seu b�nus tamb�m recebe +1 dado no teste.',1
go
exec spInsert_Poder_Classe 'Prote��o Pesada','Voc� recebe profici�ncia com Prote��es Pesadas. Pr�-requisito: NEX 30%.',1
go
exec spInsert_Poder_Classe 'Reflexos Defensivos','Voc� recebe +5 em Defesa e em testes de resist�ncia contra inimigos em alcance curto. Pr�-requisitos: Agi 2.',1
go
exec spInsert_Poder_Classe 'Saque R�pido','Voc� pode sacar ou guardar itens como uma a��o livre (em vez de a��o de movimento). Al�m disso, a a��o que voc� gasta para 
recarregar uma arma de disparo diminui em uma categoria (a��o completa para padr�o, padr�o para movimento, movimento para livre). Pr�-requisito: treinado em Iniciativa.',1
go
exec spInsert_Poder_Classe 'Segurar o Gatilho','Sempre que acerta um ataque com uma arma de fogo, pode fazer outro ataque com a mesma arma contra o mesmo alvo,
pagando 2 PE por cada ataque j� realizado no turno. Ou seja, pode fazer o primeiro ataque extra gastando 2 PE e, se acertar, pode fazer um segundo ataque extra 
gastando mais 4 PE e assim por diante, at� errar um ataque ou atingir o limite de seus PE por rodada. Pr�-requisito: NEX 60%.',1
go
exec spInsert_Poder_Classe 'Sentido T�tico','Voc� pode gastar uma a��o de movimento e 2 PE para analisar o ambiente. Se fizer isso, recebe +5 em Defesa e em testes 
de resist�ncia at� o final da cena. Pr�-requisitos: treinado em Percep��o e T�tica.', 1
go
exec spInsert_Poder_Classe 'Tanque de Guerra','Se estiver usando uma prote��o pesada, a Defesa e a resist�ncia a dano que ela fornece aumentam em +2. Pr�-requisito:
Prote��o Pesada.', 1
go
exec spInsert_Poder_Classe 'Tiro Certeiro','Se estiver usando uma arma de disparo, voc� soma sua Agilidade nas rolagens de dano e ignora a penalidade contra alvos 
envolvidos em combate corpo a corpo (mesmo se n�o usar a a��o mirar). Pr�-requisito: treinado em Pontaria', 1
go
exec spInsert_Poder_Classe 'Tiro de Cobertura','Voc� pode gastar uma a��o padr�o e 1 PE para disparar uma arma de fogo na dire��o de um personagem no alcance da arma 
apenas para for��-lo a se proteger. Fa�a um teste de Pontaria contra a Vontade do alvo. Se vencer, at� o in�cio do seu pr�ximo turno o alvo n�o pode sair do lugar 
onde est� e sofre �5 em testes de ataque. A crit�rio do mestre, o alvo recebe +5 no teste de Vontade se estiver em um lugar extremamente perigoso, como uma casa em 
chamas ou um barco afundando. Este � um efeito de medo.',1
go
exec spInsert_Poder_Classe 'Transcender','Escolha um poder paranormal. Voc� recebe o poder escolhido, mas n�o ganha Sanidade neste aumento de NEX. Voc� pode escolher 
este poder v�rias vezes.',1
go
exec spInsert_Poder_Classe 'Treinamento em Per�cia','Escolha duas per�cias. Voc� se torna treinado nessas per�cias. A partir de NEX 35%, voc� pode escolher per�cias 
nas quais j� � treinado para se tornar veterano. A partir de NEX 70%, pode escolher per�cias nas quais j� � veterano para se tornar expert. Voc� pode escolher este 
poder v�rias vezes.',1
go


exec spInsert_Poder_Classe 'Artista Marcial','Seus ataques desarmados causam 1d6 pontos de dano, podem causar dano letal e contam como armas �geis. 
Em NEX 35%, o dano aumenta para 1d8 e, em NEX 70%, para 1d10.',2
go
exec spInsert_Poder_Classe 'Bal�stica Avan�ada','Voc� recebe profici�ncia com armas t�ticas de fogo e +2 em rolagens de dano com essas armas.',2
go
exec spInsert_Poder_Classe 'Conhecimento Aplicado','Quando faz um teste de per�cia (exceto Luta e Pontaria), voc� pode gastar 2 PE para mudar o atributo-base da 
per�cia para Int. Pr�-requisito: Int 2.',2
go
exec spInsert_Poder_Classe 'Hacker','Voc� recebe +5 em testes de Tecnologia para invadir sistemas e diminui o tempo necess�rio para hackear qualquer sistema para uma 
a��o completa. Pr�-requisito: treinado em Tecnologia.',2
go
exec spInsert_Poder_Classe 'M�os R�pidas','Ao fazer um teste de Crime, voc� pode pagar 1 PE para faz�-lo como uma a��o livre. Pr�-requisitos: Agi 3, treinado em 
Crime.',2
go
exec spInsert_Poder_Classe 'Mochila de Utilidades','Um item a sua escolha (exceto armas) conta como uma categoria abaixo e ocupa 1 espa�o a menos.',2
go
exec spInsert_Poder_Classe 'Movimento T�tico','Voc� pode gastar 1 PE para ignorar a penalidade em deslocamento por terreno dif�cil e por escalar at� o final do turno. 
Pr�-requisito: treinado em Atletismo.',2
go
exec spInsert_Poder_Classe 'Na Trilha Certa','Sempre que tiver sucesso em um teste para procurar pistas, voc� pode gastar 1 PE para receber +O no pr�ximo teste. Os 
custos e os b�nus s�o cumulativos (se passar num segundo teste, pode pagar 2 PE para receber um total de +2 dados no pr�ximo teste, e assim por diante).',2
go
exec spInsert_Poder_Classe 'Nerd','Voc� � um reposit�rio de conhecimento �til (e in�til). Uma vez por cena, pode gastar 2 PE para fazer um teste de Atualidades (DT 20). 
Se passar, recebe uma informa��o �til para essa cena (se for uma investiga��o, uma dica para uma pista; se for um combate, uma fraqueza de um inimigo, e assim por 
diante). A fonte da informa��o pode ser desde um livro antigo que voc� leu na biblioteca at� um epis�dio de sua s�rie de fic��o favorita.',2
GO
exec spInsert_Poder_Classe 'Ninja Urbano','Voc� recebe profici�ncia com armas t�ticas de ataque corpo a corpo e +2 em rolagens de dano com essas armas.',2
go
exec spInsert_Poder_Classe 'Pensamento �gil','Uma vez por rodada, durante uma cena de investiga��o, voc� pode gastar 2 PE para fazer uma a��o de procurar pistas 
adicional.',2
go
exec spInsert_Poder_Classe 'Perito em Explosivos','Voc� soma seu Intelecto na DT para resistir aos seus explosivos e pode excluir dos efeitos da explos�o um n�mero de 
alvos igual ao seu valor de Intelecto.',2
go
exec spInsert_Poder_Classe 'Primeira Impress�o','Voc� recebe +2 dados no primeiro teste de Diplomacia, Engana��o, Intimida��o ou Intui��o que fizer em uma cena.',2
go
exec spInsert_Poder_Classe 'Transcender','Escolha um poder paranormal. Voc� recebe o poder escolhido, mas n�o ganha Sanidade neste aumento de NEX. Voc� pode escolher 
este poder v�rias vezes.',2
go
exec spInsert_Poder_Classe 'Treinamento em Per�cia','Escolha duas per�cias. Voc� se torna treinado nessas per�cias. A partir de NEX 35%, voc� pode escolher per�cias 
nas quais j� � treinado para se tornar veterano. A partir de NEX 70%, pode escolher per�cias nas quais j� � veterano para se tornar expert. Voc� pode escolher este 
poder v�rias vezes.',2
go


exec spInsert_Poder_Classe 'Camuflar Ocultismo','Voc� pode gastar uma a��o livre para esconder s�mbolos e sigilos que estejam desenhados ou gravados em objetos ou 
em sua pele, tornando-os invis�veis para outras pessoas al�m de voc� mesmo. Al�m disso, quando lan�a um ritual, pode gastar +2 PE para lan��-lo sem usar componentes 
ritual�sticos e sem gesticular (o que permite conjurar um ritual com as m�os presas), usando apenas concentra��o. Outros seres s� perceber�o que voc� lan�ou uma ritual 
se passarem num teste de Ocultismo (DT 25).',3
go
exec spInsert_Poder_Classe 'Criar Selo','Voc� sabe fabricar selos amaldi�oados. Escolha um ritual que voc� conhe�a para gravar no selo. O processo de fabrica��o 
gasta uma hora e um n�mero de PE iguais ao custo de conjurar o ritual. No final do processo, fa�a um teste de Ocultismo (DT 15 + PE gastos). Se passar, voc� cria o 
selo. Voc� pode ter um n�mero m�ximo de selos criados a qualquer momento igual � sua Presen�a.',3
go
exec spInsert_Poder_Classe 'Envolto em Mist�rio','Sua apar�ncia e postura assombrosas o permitem manipular e assustar pessoas ignorantes ou supersticiosas. O mestre 
define o que exatamente voc� pode fazer e quem se encaixa nessa descri��o. Como regra geral, voc� recebe +5 em Engana��o e Intimida��o contra pessoas n�o treinadas em 
Ocultismo.',3
go
exec spInsert_Poder_Classe 'Especialista em Elemento','Escolha um elemento. A DT para resistir aos seus rituais desse elemento aumenta em +2',3
go
exec spInsert_Poder_Classe 'Ferramentas Paranormais','Voc� pode ativar equipamentos paranormais sem pagar seu custo em PE',3
go
exec spInsert_Poder_Classe 'Fluxo de Poder','Voc� pode manter dois efeitos sustentados de rituais ativos simultaneamente com apenas uma a��o livre, pagando o custo 
de cada efeito separadamente. Pr�-requisito: NEX 60%.',3
go
exec spInsert_Poder_Classe 'Guiado pelo Paranormal','Uma vez por cena, voc� pode gastar 2 PE para fazer uma a��o de investiga��o adicional',3
go
exec spInsert_Poder_Classe 'Identifica��o Paranormal','Voc� recebe +10 em testes de Ocultismo para identificar criaturas, objetos ou rituais.',3
go
exec spInsert_Poder_Classe 'Improvisar Componentes','Uma vez por cena, voc� pode gastar uma a��o completa para fazer um teste de Investiga��o (DT 15). Se passar, 
encontra objetos que podem servir como componentes ritual�sticos de um elemento � sua escolha. O mestre define se � poss�vel usar esse poder na cena atual.',3
go
exec spInsert_Poder_Classe 'Intui��o Paranormal','Sempre que usa a a��o facilitar investiga��o, voc� soma seu Intelecto ou Presen�a no teste (� sua escolha).',3
go
exec spInsert_Poder_Classe 'Mestre em Elemento','Escolha um elemento. O custo para lan�ar rituais desse elemento diminui em �1 PE. Pr�-requisitos: Especialista em 
Elemento no elemento escolhido, NEX 45%.',3
go
exec spInsert_Poder_Classe 'Ritual Potente','Voc� soma seu Intelecto nas rolagens de dano ou nos efeitos de cura de seus rituais. Pr�-requisito: Int 2.',3
go
exec spInsert_Poder_Classe 'Ritual Predileto','Escolha um ritual que voc� conhece. Voc� reduz em �1 PE o custo do ritual. Essa redu��o se acumula com redu��es 
fornecidas por outras fontes.',3
go
exec spInsert_Poder_Classe 'Tatuagem Ritual�stica','S�mbolos marcados em sua pele reduzem em �1 PE o custo de rituais de alcance pessoal que t�m voc� como alvo.',3
go
exec spInsert_Poder_Classe 'Transcender','Escolha um poder paranormal. Voc� recebe o poder escolhido, mas n�o ganha Sanidade neste aumento de NEX. Voc� pode escolher 
este poder v�rias vezes.',3
go
exec spInsert_Poder_Classe 'Treinamento em Per�cia','Escolha duas per�cias. Voc� se torna treinado nessas per�cias. A partir de NEX 35%, voc� pode escolher per�cias 
nas quais j� � treinado para se tornar veterano. A partir de NEX 70%, pode escolher per�cias nas quais j� � veterano para se tornar expert. Voc� pode escolher este 
poder v�rias vezes.',3
go


exec spInsert_Trilha 'Aniquilador', 1
go
exec spInsert_Trilha 'Comandante de Campo', 1
go
exec spInsert_Trilha 'Guerreiro', 1
go
exec spInsert_Trilha 'Opera��es Especiais', 1
go
exec spInsert_Trilha 'Tropa de Choque', 1
go


exec spInsert_Trilha 'Atirador de Elite', 2
go
exec spInsert_Trilha 'Infiltrador', 2
go
exec spInsert_Trilha 'M�dico de Campo', 2
go
exec spInsert_Trilha 'Negociador', 2
go
exec spInsert_Trilha 'T�cnico', 2
go


exec spInsert_Trilha 'Condu�te', 3
go
exec spInsert_Trilha 'Flagelador', 3
go
exec spInsert_Trilha 'Graduado', 3
go
exec spInsert_Trilha 'Intuitivo', 3
go
exec spInsert_Trilha 'L�mina Paranormal', 3
go


exec spInsert_Poder_Trilha 'A Favorita','Escolha uma arma para ser sua favorita, como katana ou fuzil de assalto. A categoria da arma escolhida � reduzida em I.',
1,10
go
exec spInsert_Poder_Trilha 'T�cnica Secreta','A categoria da arma favorita passa a ser reduzida em II. Quando faz um ataque com ela, voc� pode gastar 2 PE para executar
um dos efeitos abaixo como parte do ataque. Voc� pode adicionar mais efeitos gastando +2 PE por efeito adicional. Amplo: O ataque pode atingir um alvo adicional em seu 
alcance e adjacente ao original (use o mesmo teste de ataque para ambos). Destruidor: Aumenta o multiplicador de cr�tico da arma em +1.', 1,40
go
exec spInsert_Poder_Trilha 'T�cnica Sublime','A categoria da arma favorita passa a ser reduzida em III e voc� adiciona os seguintes efeitos � lista de sua T�cnica Secreta:
Letal: Aumenta a margem de amea�a em +2. Voc� pode escolher este efeito duas vezes para aumentar a margem de amea�a em +5. Perfurante: Ignora at� 5 pontos de resist�ncia a 
dano de qualquer tipo do alvo.', 1,65
go
exec spInsert_Poder_Trilha 'M�quina de Matar','A categoria da arma favorita passa a ser reduzida em IV, ela recebe +2 na margem de amea�a e seu dano aumenta em um passo.',
1,99
go
exec spInsert_Poder_Trilha 'Inspirar Confian�a','Sua lideran�a inspira seus aliados. Voc� pode gastar uma rea��o e 2 PE para fazer um aliado em alcance curto rolar novamente 
um teste rec�m realizado.', 2,10
go
exec spInsert_Poder_Trilha 'Estrategista','Voc� pode direcionar aliados em alcance curto. Gaste uma a��o padr�o e 1 PE por aliado que quiser direcionar (limitado pelo seu 
Intelecto). No pr�ximo turno dos aliados afetados, eles ganham uma a��o de movimento adicional.', 2,40
go
exec spInsert_Poder_Trilha 'Brecha na Guarda','Uma vez por rodada, quando um aliado causar dano em um inimigo que esteja em seu alcance curto, voc� pode gastar uma rea��o e 
2 PE para que voc� ou outro aliado em alcance curto fa�a um ataque adicional contra o mesmo inimigo. Al�m disso, o alcance de inspirar confian�a e estrategista aumenta para 
m�dio.', 2,65
go
exec spInsert_Poder_Trilha 'Oficial Comandante','Voc� pode gastar uma a��o padr�o e 5 PE para que cada aliado que voc� possa ver em alcance m�dio receba uma a��o padr�o 
adicional no pr�ximo turno dele.', 2,99
go
exec spInsert_Poder_Trilha 'T�cnica Letal','Voc� recebe um aumento de +2 na margem de amea�a com todos os seus ataques corpo a corpo',
3,10
go
exec spInsert_Poder_Trilha 'Revidar','Sempre que bloquear um ataque, voc� pode gastar uma rea��o e 2 PE para fazer um ataque corpo a corpo no inimigo que o atacou.', 
3,40
go
exec spInsert_Poder_Trilha 'For�a Opressora','Quando acerta um ataque corpo a corpo, voc� pode gastar 1 PE para realizar uma manobra derrubar ou empurrar contra o alvo 
do ataque como a��o livre. Se escolher empurrar, recebe um b�nus de +5 para cada 10 pontos de dano que causou no alvo. Se escolher derrubar e vencer no teste oposto, 
voc� pode gastar 1 PE para fazer um ataque adicional contra o alvo ca�do.',
3,65
go
exec spInsert_Poder_Trilha 'Pot�ncia M�xima','Quando usa seu Ataque Especial com armas corpo a corpo, todos os b�nus num�ricos s�o dobrados. Por exemplo, se usar 5 PE 
para receber +5 no ataque e +15 no dano, voc� recebe +10 no ataque e +30 no dano.',
3,99
go
exec spInsert_Poder_Trilha 'Iniciativa Aprimorada','Voc� recebe +5 em Iniciativa e recebe uma a��o de movimento adicional na primeira rodada.',
4,10
go
exec spInsert_Poder_Trilha 'Ataque Extra','Uma vez por rodada, quando faz um ataque, voc� pode gastar 2 PE para fazer um ataque adicional.', 
4,40
go
exec spInsert_Poder_Trilha 'Surto de Adrenalina','Uma vez por rodada, voc� pode gastar 5 PE para realizar uma a��o padr�o ou de movimento adicional.',
4,65
go
exec spInsert_Poder_Trilha 'Sempre Alerta','Voc� recebe uma a��o padr�o adicional no in�cio de cada cena de combate.',
4,99
go
exec spInsert_Poder_Trilha 'Casca Grossa','Voc� recebe +1 PV para cada 5% de NEX e, quando faz um bloqueio, soma seu Vigor na resist�ncia a dano recebida.',
5,10
go
exec spInsert_Poder_Trilha 'Cai Dentro','Sempre que um oponente em alcance curto ataca um de seus aliados, voc� pode gastar uma rea��o e 1 PE para fazer com 
que esse oponente fa�a um teste de Vontade (DT Vig). Se falhar, o oponente deve atacar voc� em vez de seu aliado. Este poder s� funciona se voc� puder ser 
efetivamente atacado e estiver no alcance do ataque (por exemplo, adjacente a um oponente atacando em corpo a corpo ou dentro do alcance de uma arma de ataque 
� dist�ncia). Um oponente que passe no teste de Vontade n�o pode ser afetado por seu poder Cai Dentro at� o final da cena.', 
5,40
go
exec spInsert_Poder_Trilha 'Duro de Matar','Ao sofrer dano n�o paranormal, voc� pode gastar uma rea��o e 2 PE para reduzir esse dano � metade. Em NEX 85%, 
voc� pode usar esta habilidade para reduzir dano paranormal.',
5,65
go
exec spInsert_Poder_Trilha 'Inquebr�vel','Enquanto estiver machucado, voc� recebe +10 na Defesa e resist�ncia a dano 5. Enquanto estiver morrendo, em vez do 
normal, voc� n�o fica indefeso e ainda pode realizar a��es. Voc� ainda segue as regras de morte normalmente.',
5,99
go
exec spInsert_Poder_Trilha 'Mira de Elite','Voc� recebe profici�ncia com armas de fogo que usam balas longas e soma seu Intelecto em rolagens de dano com 
essas armas.',
6,10
go
exec spInsert_Poder_Trilha 'Disparo Letal','Quando faz a a��o mirar voc� pode gastar 1 PE para aumentar em +2 a margem de amea�a do pr�ximo ataque que fizer 
at� o final de seu pr�ximo turno.', 
6,40
go
exec spInsert_Poder_Trilha 'Disparo Impactante','Se estiver usando uma arma de fogo com calibre grosso voc� pode gastar 2 PE para fazer as manobras derrubar, 
desarmar, empurrar e quebrar usando um ataque a dist�ncia.', 
6,65
go
exec spInsert_Poder_Trilha 'Atirar Para Matar','Quando faz um acerto cr�tico com uma arma de fogo, voc� causa dano m�ximo, sem precisar rolar dados.',
6,99
go
exec spInsert_Poder_Trilha 'Ataque Furtivo','Voc� sabe atingir os pontos vitais de um inimigo distra�do. Uma vez por rodada, quando atinge um alvo desprevenido 
com um ataque corpo a corpo ou em alcance curto, ou um alvo que voc� esteja flanqueando, voc� pode gastar 1 PE para causar +1d6 pontos de dano do mesmo tipo da
arma. Em NEX 40% o dano adicional aumenta para +2d6, em NEX 65% aumenta para +3d6 e em NEX 99% aumenta para +4d6.', 
7,10
go
exec spInsert_Poder_Trilha 'Gatuno','Voc� recebe +5 em Atletismo e Crime e pode percorrer seu deslocamento normal quando e se esconder sem penalidade (veja a 
per�cia Furtividade).', 
7,40
go
exec spInsert_Poder_Trilha 'Assassinar','Voc� pode gastar uma a��o de movimento e 3 PE para analisar um alvo em alcance curto. At� o fim de seu pr�ximo turno, 
seu primeiro Ataque Furtivo que causar dano a ele tem seus dados de dano extras dessa habilidade dobrados. Al�m disso, se sofrer dano de seu ataque, o alvo fica
inconsciente ou morrendo, � sua escolha (Fortitude DT Agi evita).', 
7,65
go
exec spInsert_Poder_Trilha 'Sombra Fugaz','Quando faz um teste de Furtividade ap�s atacar ou fazer outra a��o chamativa, voc� pode gastar 3 PE para n�o sofrer a 
penalidade de �15 no teste.', 
7,99
go
exec spInsert_Poder_Trilha 'Param�dico','Voc� pode usar uma a��o padr�o e 2 PE para curar 2d10 pontos de vida de um aliado adjacente. Voc� pode curar +1d10 PV respectivamente
em NEX 40%, 65% e 99%, gastando +1 PE por dado adicional de cura.',
8,10
go
exec spInsert_Poder_Trilha 'Equipe de Trauma','Voc� pode usar uma a��o padr�o e 2 PE para remover uma condi��o negativa (exceto morrendo) de um aliado adjacente', 
8,40
go
exec spInsert_Poder_Trilha 'Resgate','Uma vez por rodada, se estiverem alcance curto de um aliado machucado ou morrendo, voc� pode se aproximar do aliado com uma a��o 
livre (desde que seja capaz de faz�-lo usando seu deslocamento normal). Al�m disso, sempre que curar PV ou remover condi��es do aliado, voc� e o aliado recebem +5 na 
Defesa at� o in�cio de seu pr�ximo turno. Por fim, para voc�, o total de espa�os ocupados por carregar um personagem � reduzido pela metade.',
8,65
go
exec spInsert_Poder_Trilha 'Reanima��o','Uma vez por cena, voc� pode gastar uma a��o completa e 10 PE para trazer de volta a vida um personagem que tenha morrido na mesma 
cena (exceto morte por dano massivo).',
8,99
go
exec spInsert_Poder_Trilha 'Eloqu�ncia','Voc� pode usar uma a��o completa e 1 PE por alvo em alcance curto para afetar outros personagens com sua fala. Fa�a um teste de 
Diplomacia, Engana��o ou Intimida��o contra a Vontade dos alvos. Se voc� vencer, os alvos ficam fascinados enquanto voc� se concentrar (uma a��o padr�o por rodada). Um 
alvo hostil ou que esteja envolvido em combate recebe +5 em seu teste de resist�ncia e tem direito a um novo teste por rodada, sempre que voc� se concentrar Um personagem 
que passar no teste fica imune a este efeito por um dia.',
9,10
go
exec spInsert_Poder_Trilha 'Discurso Motivador','Voc� pode gastar uma a��o padr�o e 4 PE para inspirar seus aliados com suas palavras. Voc� e todos os seus aliados em alcance 
curto ganham +1 dado em testes de per�cia at� o fim da cena. A partir de NEX 65%, voc� pode gastar 8 PE para fornecer um b�nus total de +2 dados.', 
9,40
go
exec spInsert_Poder_Trilha 'Eu Conhe�o um Cara','Uma vez por miss�o, voc� pode ativar sua rede de contatos para pedir um favor, como por exemplo trocar todo o equipamento do seu 
grupo (como se tivesse uma segunda fase de prepara��o de miss�o), conseguir um local de descanso ou mesmo ser resgatado de uma cena. O mestre tem a palavra final de quando � poss�vel 
usar essa habilidade e quais favores podem ser obtidos.',
9,65
go
exec spInsert_Poder_Trilha 'Truque de Mestre','Acostumado a uma vida de fingimento e manipula��o, voc� pode gastar 5 PE para simular o efeito de qualquer habilidade que voc� tenha 
visto um de seus aliados usar durante a cena. Voc� ignora os pr�-requisitos da habilidade, mas ainda precisa pagar todos os seus custos, incluindo a��es, PE e materiais, e ela usa os 
seus par�metros de jogo, como se voc� estivesse usando a habilidade em quest�o.',
9,99
go
exec spInsert_Poder_Trilha 'Invent�rio Otimizado','Voc� soma seu Intelecto � sua For�a para calcular seu valor de invent�rio. Por exemplo, se voc� tem For�a 1 e Intelecto 3, seu invent�rio 
tem 20 espa�os.',
10,10
go
exec spInsert_Poder_Trilha 'Remend�o','Voc� pode gastar uma a��o completa e 1 PE para remover a condi��o quebrado de um equipamento adjacente at� o final da cena. Al�m disso, qualquer 
equipamento de investiga��o tem sua categoria reduzida em I para voc�.', 
10,40
go
exec spInsert_Poder_Trilha 'Improvisar','Voc� pode improvisar equipamentos com materiais ao seu redor. Escolha um equipamento de investiga��o e gaste uma a��o completa e 2 PE, mais 2 PE 
por categoria do item escolhido. Voc� cria uma vers�o funcional do equipamento, que segue suas regras de espa�o e categoria como normal. Ao final da cena, seu equipamento improvisado se 
torna in�til.',
10,65
go
exec spInsert_Poder_Trilha 'Preparado para Tudo','Voc� sempre tem o que precisa para qualquer situa��o. Sempre que precisar de um item qualquer (exceto armas), pode gastar uma a��o de movimento 
e 3 PE por categoria do item para lembrar que colocou ele no fundo da bolsa! Depois de encontrado, o item segue normalmente as regras de invent�rio.',
10,99
go
exec spInsert_Poder_Trilha 'Ampliar Ritual','Quando lan�a um ritual, voc� pode gastar +2 PE para aumentar seu alcance em um passo (de curto para m�dio, de m�dio para longo ou de longo para extremo) 
ou dobrar sua �rea de efeito.',
11,10
go
exec spInsert_Poder_Trilha 'Acelerar Ritual','Uma vez por rodada, voc� pode aumentar o custo de um ritual em 4 PE para conjur�-lo como uma a��o livre.', 
11,40
go
exec spInsert_Poder_Trilha 'Anular Ritual','Quando for alvo de um ritual, voc� pode gastar uma quantidade de PE igual ao custo pago por esse ritual e fazer um teste oposto de Ocultismo 
contra o conjurador. Se vencer, voc� anula o ritual, cancelando todos os seus efeitos.',
11,65
go
exec spInsert_Poder_Trilha 'Canalizar o Medo','Voc� aprende o ritual Canalizar o Medo',
11,99
go
exec spInsert_Poder_Trilha 'Poder do Flagelo','Ao conjurar um ritual, voc� pode gastar seus pr�prios pontos de vida para pagar o custo em pontos de esfor�o, � taxa de 2 PV por 
PE pago. Pontos de vida gastos dessa forma s� podem ser recuperados com descanso.',
12,10
go
exec spInsert_Poder_Trilha 'Abra�ar a Dor','Sempre que sofrer dano n�o paranormal, voc� pode gastar uma rea��o e 2 PE para reduzir esse dano � metade.', 
12,40
go
exec spInsert_Poder_Trilha 'Absorver Agonia','Sempre que reduz um ou mais inimigos a 0 PV com um ritual, voc� recebe uma quantidade de PE tempor�rios igual ao c�rculo do ritual 
utilizado. Por exemplo, se ativar esse poder com um ritual de 2� c�rculo, receber� 2 PE.', 
12,65
go
exec spInsert_Poder_Trilha 'Medo Tang�vel','Voc� aprende o ritual Medo Tang�vel',
12,99
go
exec spInsert_Poder_Trilha 'Saber Ampliado','Voc� aprende um ritual de 1� c�rculo. Toda vez que ganha acesso a um novo c�rculo, aprende um ritual adicional daquele c�rculo. 
Esses rituais n�o contam no seu limite de rituais.', 
13,10
go
exec spInsert_Poder_Trilha 'Grim�rio Ritual�stico','Voc� cria um grim�rio especial, que armazena rituais que sua mente n�o seria capaz de guardar. Voc� aprende uma quantidade
de rituais de 1� ou 2� c�rculos igual ao seu Intelecto. Quando ganha acesso a um novo c�rculo, pode incluir um novo ritual desse c�rculo em seu grim�rio. Esses rituais n�o 
contam em seu limite de rituais conhecidos. Para conjurar um ritual armazenado em seu grim�rio, voc� precisa antes gastar uma a��o completa folheando o grim�rio e relembrando
o ritual. O grim�rio ocupa 1 espa�o em seu invent�rio. Se perd�-lo, voc� pode replic�-lo com uma semana de trabalho.', 
13,40
go
exec spInsert_Poder_Trilha 'Rituais Eficientes','A DT para resistir a todos os seus rituais aumenta em +5.', 
13,65
go
exec spInsert_Poder_Trilha 'Conhecendo o Medo','Voc� aprende o ritual Conhecendo o Medo', 
13,99
go
exec spInsert_Poder_Trilha 'Mente S�','Voc� compreende melhor as entidades do Outro Lado, e passa a ser menos abalado por seus efeitos. Voc� recebe resist�ncia paranormal +5 
(+5 em testes de resist�ncia contra efeitos paranormais).',
14,10
go
exec spInsert_Poder_Trilha 'Presen�a Poderosa','Sua resili�ncia mental faz com que voc� possa extrair mais do Outro Lado. Voc� adiciona sua Presen�a ao seu limite de PE por 
turno, mas apenas para conjurar rituais.', 
14,40
go
exec spInsert_Poder_Trilha 'Inabal�vel','Voc� recebe resist�ncia a dano mental e paranormal 10. Al�m disso, quando � alvo de um efeito paranormal que permite um teste de Vontade 
para reduzir o dano � metade, voc� n�o sofre dano algum se passar.',
14,65
go
exec spInsert_Poder_Trilha 'Presen�a do Medo','Voc� aprende o ritual Presen�a do Medo',
14,99
go
exec spInsert_Poder_Trilha 'L�mina Maldita','Voc� aprende o ritual Amaldi�oar Arma. Se j� o conhece, seu custo � reduzido em �1 PE. Al�m disso, quando conjura esse ritual, voc� pode 
usar Ocultismo, em vez de Luta ou Pontaria, para testes de ataque com a arma amaldi�oada.',
15,10
go
exec spInsert_Poder_Trilha 'Gladiador Paranormal','Sempre que acerta um ataque corpo a corpo em um inimigo, voc� recebe 2 PE tempor�rios. Voc� pode ganhar um m�ximo de PE tempor�rios 
por cena igual ao seu limite de PE. PE tempor�rios desaparecem no final da cena.', 
15,40
go
exec spInsert_Poder_Trilha 'Conjura��o Marcial','Uma vez por rodada, quando voc� lan�a um ritual com execu��o de uma a��o padr�o, pode gastar 2 PE para fazer um ataque corpo a corpo como 
uma a��o livre.',
15,65
go
exec spInsert_Poder_Trilha 'L�mina do Medo','Voc� aprende o ritual L�mina do Medo',
15,99
go


exec spInsert_Origem 'Acad�mico', 'Saber � Poder', 'Quando faz um teste usando Intelecto, 
voc� pode gastar 2 PE para receber +5 nesse teste.'
go
exec spInsert_Origem 'Agente de Sa�de', 'T�cnica Medicinal','Sempre que cura um personagem, voc� adiciona seu Intelecto 
no total de PV curados.'
go
exec spInsert_Origem 'Amn�sico', 'Vislumbre do Passado', 'Uma vez por miss�o, voc� pode fazer um teste de Intelecto (DT 10) 
para reconhecer pessoas ou lugares familiares, que tenha encontrado antes de perder a mem�ria. 
Se passar, recebe 1d4 PE tempor�rios e, a crit�rio do mestre, uma informa��o �til.'
go
exec spInsert_Origem 'Artista', 'Magnum Opus','Voc� �  famoso por uma de suas obras. Uma vez por miss�o, pode 
determinar que um personagem envolvido em uma cena de intera��o o reconhe�a. Voc� recebe +5 em testes de 
Presen�a e de per�cias baseadas em Presen�a contra aquele personagem. A crit�rio do mestre, pode receber 
esses b�nus em outras situa��es nas quais seria reconhecido.'
go
exec spInsert_Origem 'Atleta', '110%','Quando faz um teste de per�cia usando For�a ou Agilidade (exceto Luta e 
Pontaria) voc� pode gastar 2 PE para receber +5 nesse teste.'
go
exec spInsert_Origem 'Chef','Ingrediente Secreto','Em cenas de interl�dio, voc� pode gastar uma a��o para cozinhar um prato
gostoso. Cada membro do grupo (incluindo voc�) que gastar uma a��o para se alimentar recebe o benef�cio de 
dois pratos (caso o mesmo benef�cio seja escolhido duas vezes, seus efeitos se acumulam).'
go
exec spInsert_Origem 'Criminoso','O Crime Compensa','No final de uma miss�o, escolha um item encontrado na miss�o. Em sua pr�xima 
miss�o, voc� pode incluir esse item em seu invent�rio sem que ele conte em seu limite de itens por patente.'
go
exec spInsert_Origem'Cultista Arrependido','Tra�os do Outro Lado','Voc� possui um poder paranormal � sua escolha. 
Por�m, come�a o jogo com metade da Sanidade normal para sua classe.'
go
exec spInsert_Origem 'Desgarrado','Calejado','Voc� receb e +1 PV para cada 5% de NEX'
go
exec spInsert_Origem 'Engenheiro','Ferramentas Favoritas','Um item a sua escolha (exceto armas) conta como uma 
categoria abaixo (por exemplo, um item de categoria II conta como categoria I para voc�).'
go
exec spInsert_Origem 'Executivo','Processo Otimizado','Sempre que faz um teste de per�cia durante um teste estendido, 
pode pagar 2 PE para receber +5 nesse teste.'
go
exec spInsert_Origem 'Investigador', 'Faro Para Pistas','Uma vez por cena, quando fizer um teste para procurar pistas, 
voc� pode gastar 1 PE para receber +5 nesse teste.'
go
exec spInsert_Origem'Lutador', 'M�o Pesada', 'Voc� recebe +2 em rolagens de dano com ataques corpo a corpo'
go
exec spInsert_Origem'Magnata','Patrocinador da Ordem', 'Seu limite de cr�dito � sempre considerado um acima do atual'
go
exec spInsert_Origem'Mercen�rio','Posi��o de Combate','No primeiro turno de cada cena de a��o, voc� pode gastar 2 PE 
para receber uma a��o de movimento adicional.'
go
exec spInsert_Origem 'Militar','Para Bellum', 'Voc� recebe +2 em rolagens de dano com armas de fogo.'
go
exec spInsert_Origem 'Oper�rio','Ferramenta de Trabalho','Escolha uma arma simples ou t�tica 
que, a crit�rio do mestre, poderia ser usada como ferramenta em sua profiss�o (como uma marreta para um pedreiro). Voc� sabe usar a arma escolhida e 
recebe +1 em testes de ataque, rolagens de dano e margem de amea�a com ela.'
go
exec spInsert_Origem 'Policial','Patrulha','Voc� recebe +2 em Defesa'
go
exec spInsert_Origem 'Religioso', 'Acalentar','Voc� recebe +5 em testes de Religi�o para acalmar. Al�m disso, quando acalma uma pessoa, ela 
recebe um n�mero de pontos de Sanidade igual a 1d6 + a sua Presen�a.'
go
exec spInsert_Origem 'Servidor p�blico','Esp�rito C�vico','Sempre que faz um teste para ajudar, voc� pode gastar 1 PE para aumentar o b�nus concedido em +2'
go
exec spInsert_Origem'Te�rico da Conspira��o', 'Eu J� Sabia','Voc� n�o se abala com entidades
ou anomalias. Afinal, sempre soube que isso tudo existia. Voc� recebe resist�ncia a dano mental igual ao seu Intelecto.'
go
exec spInsert_Origem 'T.I.', 'Motor de Busca','A crit�rio do Mestre, sempre que tiver 
acesso a internet, voc� pode gastar 2 PE para substituir um teste de per�cia qualquer por um teste de Tecnologia.'
go
exec spInsert_Origem 'Trabalhador Rural','Desbravador','Quando faz um teste de Adestramento ou Sobreviv�ncia, voc� 
pode gastar 2 PE para receber +5 nesse teste. Al�m disso, voc� n�o sofre penalidade em deslocamento por terreno dif�cil.'
go
exec spInsert_Origem 'Trambiqueiro','Impostor','Uma vez por cena, voc� pode gastar 2 PE para substituir um teste de per�cia qualquer por um teste de Engana��o.'
go
exec spInsert_Origem 'Universit�rio','Dedica��o','Voc� recebe +1 PE, e mais 1 PE adicional a cada NEX �mpar (15%, 25%...). Al�m disso, seu limite de PE por turno aumenta em 1 
(em NEX 5% seu limite � 2, em NEX 10% � 3 e assim por diante).'
go
exec spInsert_Origem'V�tima', 'Cicatrizes Psicol�gicas', 'Voc� recebe +1 de sanidade para cada 5% de NEX'
go



exec spInsert_Poder_Paranormal 'Expans�o de Conhecimento','Conhecimento','Voc� se conecta com o Conhecimento do Outro Lado, rompendo os limites de sua compreens�o. 
Voc� aprende um poder de classe que n�o perten�a � sua classe (caso o poder possua pr�-requisitos, voc� precisa preench�-los). Pr�-requisito: Conhecimento 1.
Afinidade: voc� aprende um segundo poder de classe que n�o perten�a � sua classe.'
go
exec spInsert_Poder_Paranormal 'Percep��o Paranormal','Conhecimento','O Conhecimento sussurra em sua mente. Em cenas de investiga��o, sempre que fizer um teste 
para procurar pistas, voc� pode rolar novamente um dado com resultado menor que 10. Voc� deve aceitar a segunda rolagem, mesmo que seja menor que a primeira. 
Afinidade: voc� pode rolar novamente at� dois dados com resultado menor que 10.'
go
exec spInsert_Poder_Paranormal 'Precogni��o','Conhecimento','Voc� possui um �sexto sentido� que o avisa do perigo antes que ele aconte�a. Voc� recebe +2 em Defesa 
e em testes de resist�ncia. Pr�-requisito: Conhecimento 1. Afinidade: voc� fica imune � condi��o desprevenido.'
go
exec spInsert_Poder_Paranormal 'Sensitivo','Conhecimento','Voc� consegue sentir as emo��es e inten��es de outros personagens, como medo, raiva ou mal�cia, recebendo
+5 em testes de Diplomacia, Intimida��o e Intui��o. Afinidade: quando voc� faz um teste oposto usando uma dessas per�cias, o oponente sofre �1 dado.'
go
exec spInsert_Poder_Paranormal 'Vis�o do Oculto','Conhecimento','Voc� n�o enxerga mais pelos olhos, mas sim pela percep��o do Conhecimento em sua mente. Voc� recebe +5 
em testes de Percep��o e enxerga no escuro. Afinidade: voc� ignora camuflagem.'

go
exec spInsert_Poder_Paranormal 'Afortunado','Energia','A Energia considera resultados med�ocres entediantes. Uma vez por rolagem, voc� pode rolar novamente um 
resultado 1 em qualquer dado que n�o seja d20. Afinidade: al�m disso, uma vez por teste, voc� pode rolar novamente um resultado 1 em d20.'
go
exec spInsert_Poder_Paranormal 'Campo Protetor','Energia','Voc� consegue gerar um campo de Energia que o protege de perigos. Quando usa a a��o esquiva, voc� recebe 
+5 em Defesa. Pr�-requisito: Energia 1. Afinidade: voc� recebe +5 em Reflexo e, quando passa em um teste de Reflexo que reduziria o dano � metade, em vez disso n�o 
sofre nenhum dano.'
go
exec spInsert_Poder_Paranormal 'Causalidade Fortuita','Energia','A Energia o conduz rumo � descobertas. Em cenas de investiga��o, a DT para procurar pistas diminui
em �5 para voc� at� voc� encontrar uma pista. Afinidade: a DT para procurar pistas sempre diminui em �5 para voc�.'
go
exec spInsert_Poder_Paranormal 'Golpe de Sorte','Energia','Seus ataques recebem +1 na margem de amea�a. Pr�-requisito: Energia 1. Afinidade: seus ataques recebem +1 
no multiplicador de cr�tico.'
go
exec spInsert_Poder_Paranormal 'Manipular Entropia','Energia','Nada diverte mais a Energia do que a possibilidade de um desastre ainda maior. Voc� pode gastar 2 PE
para fazer um alvo em alcance curto (exceto voc� mesmo) rolar novamente um dos dados em um teste de per�cia. Pr�-requisito: Energia 1. Afinidade: o alvo rola novamente 
todos os dados que voc� escolher.'
go

exec spInsert_Poder_Paranormal 'Encarar a Morte','Morte','A sua conex�o com a Morte o tornou ap�tico diante da possibilidade do fim, fazendo com que voc� n�o hesite 
em situa��es de perigo. Durante cenas de a��o, seu limite de gasto de PE aumenta em +1. Afinidade: durante cenas de a��o, seu limite de gasto de PE aumenta em +2 
(para um total de +3).'
go
exec spInsert_Poder_Paranormal 'Escapar da Morte','Morte','A Morte tem um interesse especial em sua caminhada. Uma vez por cena, quando receber dano que o deixaria
com 0 PV, voc� fica com 1 PV. N�o funciona em caso de dano massivo. Pr�-requisito: Morte 1. Afinidade: em vez do normal, voc� evita completamente o dano. Em caso de 
dano massivo, voc� fica com 1 PV.'
go
exec spInsert_Poder_Paranormal 'Potencial Aprimorado','Morte','A Morte lhe concede potencial latente de momentos roubados de outro lugar. Voc� recebe +1 ponto de 
esfor�o por NEX. Quando sobe de NEX, os PE que recebe por este poder aumentam de acordo. Por exemplo, se escolher este poder em NEX 30%, recebe 6 PE. Quando subir 
para NEX 35%, recebe +1 PE adicional, e assim por diante. Afinidade: voc� recebe +1 PE adicional por NEX (para um total de +2 PE por NEX).'
go
exec spInsert_Poder_Paranormal 'Potencial Reaproveitado','Morte','Voc� absorve os momentos desperdi�ados de outros seres. Uma vez por rodada, quando passa num teste 
de resist�ncia, voc� ganha 1 ponto de esfor�o tempor�rio. Os pontos desaparecem no final da cena. Afinidade: voc� ganha 2 pontos de esfor�o tempor�rios, em vez de 1.'
go
exec spInsert_Poder_Paranormal 'Surto Temporal','Morte','A sua percep��o temporal se torna distorcida e espiralizada, fazendo com que a no��o de passagem do tempo 
nunca mais seja a mesma para voc�. Uma vez por cena, durante seu turno, voc� pode gastar 3 PE para realizar uma a��o padr�o adicional. Pr�-requisito: Morte 2. 
Afinidade: em vez de uma vez por cena, voc� pode usar este poder uma vez por turno.'
go

exec spInsert_Poder_Paranormal 'Anatomia Insana','Sangue','O seu corpo � transfigurado e parece desenvolver um instinto pr�prio separado da sua consci�ncia. Voc� tem 
50% de chance (resultado par em 1d4) de ignorar o dano adicional de um acerto cr�tico ou ataque furtivo. Pr�-requisito: Sangue 1. Afinidade: voc� � imune aos efeitos 
de acertos cr�ticos e ataques furtivos.'
go
exec spInsert_Poder_Paranormal 'Arma de Sangue','Sangue','O Sangue devora parte de seu corpo e se manifesta como parte de voc�. Voc� pode gastar uma a��o de movimento 
e 2 PE para produzir garras, chifres ou uma l�mina de sangue cristalizado que brota de seu antebra�o. Qualquer que seja sua escolha, � considerada uma arma simples 
leve que voc� n�o precisa empunhar e causa 1d6 pontos de dano de Sangue. Uma vez por turno, quando voc� usa a a��o agredir, pode gastar 1 PE para fazer um ataque 
corpo a corpo adicional com essa arma. A arma dura at� o final da cena, e ent�o se desfaz numa po�a de sangue coagulado. Afinidade: a arma se torna permanentemente 
parte de voc� e causa dano de Sangue.'
go
exec spInsert_Poder_Paranormal 'Sangue de Ferro','Sangue','O seu sangue flui de forma paranormal e agressiva, concedendo vigor n�o natural. Voc� recebe +2 pontos de
vida por NEX.Quando sobe de NEX, os PV que recebe por este poder aumentam de acordo. Por exemplo, se escolher este poder em NEX 50%, recebe 20 PV. Quando subir para 
NEX 55%, recebe +2 PV, e assim por diante. Afinidade: voc� recebe +5 em Fortitude e se torna imune a venenos e doen�as'
go
exec spInsert_Poder_Paranormal 'Sangue Fervente','Sangue','A intensidade da dor desperta em voc� sentimentos bestiais e prazerosos que voc� nem imaginava que existiam. 
Enquanto estiver machucado, voc� recebe +1 em Agilidade ou For�a, � sua escolha (escolha sempre que este efeito for ativado). Pr�-requisito: Sangue 2. Afinidade: o 
b�nus que voc� recebe em Agilidade ou For�a aumenta para +2.'
go
exec spInsert_Poder_Paranormal 'Sangue Vivo','Sangue','A carnificina n�o pode parar, o Sangue precisa continuar fluindo. Na primeira vez que ficar machucado durante 
uma cena, voc� recebe cura acelerada 2 Esse efeito nunca cura voc� acima da metade dos PV m�ximos (ou seja, voc� nunca deixa de estar machucado) e termina no fim da 
cena ou caso voc� perca a condi��o machucado. Pr�-requisito: Sangue 1. Afinidade: a cura acelerada aumenta para 5.'
go
select * from Origem
select * from Patente
select * from Classe
select * from Trilha
select * from Poder_Classe
select * from Poder_Trilha
select * from Poder_Paranormal
