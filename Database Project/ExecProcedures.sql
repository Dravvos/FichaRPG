use RPG
go
exec spInsert_Patente 'Recruta'
go
exec spInsert_Patente 'Operador'
go
exec spInsert_Patente 'Agente Especial'
go
exec spInsert_Patente 'Oficial de Operações'
go
exec spInsert_Patente 'Agente de Elite'
go

exec spInsert_Classe 'Combatente'
go
exec spInsert_Classe 'Especialista'
go
exec spInsert_Classe 'Ocultista'
go

exec spInsert_Poder_Classe 'Armamento Pesado','Você recebe proficiência com armas pesadas. Pré-Requisito: For 2.',1
go
exec spInsert_Poder_Classe 'Artista Marcial','Seus ataques desarmados causam 1d6 pontos de dano, podem causar dano letal e contam como armas ágeis. 
Em NEX 35%, o dano aumenta para 1d8 e, em NEX 70%, para 1d10.',1
go
exec spInsert_Poder_Classe 'Ataque de Oportunidade','Sempre que um ser sair voluntariamente de um espaço adjacente ao seu, você pode gastar uma reação e 1 PE para fazer
um ataque corpo a corpo contra ele.',1
go
exec spInsert_Poder_Classe 'Combater com Duas Armas','Se estiver usando duas armas (e pelo menos uma for leve) e fizer a ação agredir, você pode fazer dois ataques, um
com cada arma. Se fizer isso, sofre –1 dado em todos os testes de ataque até o seu próximo turno. Pré-requisitos: Agi 3, treinado em Luta ou Pontaria.',1
go
exec spInsert_Poder_Classe 'Combate Defensivo','Quando usa a ação agredir, você pode combater defensivamente. Se fizer isso, até seu próximo turno, sofre –1 dado em todos
os testes de ataque, mas recebe +5 na Defesa. Pré-requisito: Int 2.',1
go
exec spInsert_Poder_Classe 'Golpe Demolidor','Quando usa a manobra quebrar ou ataca um objeto, você pode gastar 1 PE para causar dois dados de dano extra do mesmo
tipo de sua arma. Pré-requisitos: For +2, treinado em Luta.',1
go
exec spInsert_Poder_Classe 'Golpe Pesado','O dano de suas armas corpo a corpo aumenta em mais um dado do mesmo tipo',1
go
exec spInsert_Poder_Classe 'Incansável','Uma vez por cena, você pode gastar 2 PE para fazer uma ação de investigação adicional, mas deve usar Força ou Agilidade como 
atributo-base do teste.',1
go
exec spInsert_Poder_Classe 'Presteza Atlética','Quando faz um teste de facilitar a investigação, você pode gastar 1 PE para usar Força ou Agilidade no lugar do atributo-base 
da perícia. Se passar no teste, o próximo aliado que usar seu bônus também recebe +1 dado no teste.',1
go
exec spInsert_Poder_Classe 'Proteção Pesada','Você recebe proficiência com Proteções Pesadas. Pré-requisito: NEX 30%.',1
go
exec spInsert_Poder_Classe 'Reflexos Defensivos','Você recebe +5 em Defesa e em testes de resistência contra inimigos em alcance curto. Pré-requisitos: Agi 2.',1
go
exec spInsert_Poder_Classe 'Saque Rápido','Você pode sacar ou guardar itens como uma ação livre (em vez de ação de movimento). Além disso, a ação que você gasta para 
recarregar uma arma de disparo diminui em uma categoria (ação completa para padrão, padrão para movimento, movimento para livre). Pré-requisito: treinado em Iniciativa.',1
go
exec spInsert_Poder_Classe 'Segurar o Gatilho','Sempre que acerta um ataque com uma arma de fogo, pode fazer outro ataque com a mesma arma contra o mesmo alvo,
pagando 2 PE por cada ataque já realizado no turno. Ou seja, pode fazer o primeiro ataque extra gastando 2 PE e, se acertar, pode fazer um segundo ataque extra 
gastando mais 4 PE e assim por diante, até errar um ataque ou atingir o limite de seus PE por rodada. Pré-requisito: NEX 60%.',1
go
exec spInsert_Poder_Classe 'Sentido Tático','Você pode gastar uma ação de movimento e 2 PE para analisar o ambiente. Se fizer isso, recebe +5 em Defesa e em testes 
de resistência até o final da cena. Pré-requisitos: treinado em Percepção e Tática.', 1
go
exec spInsert_Poder_Classe 'Tanque de Guerra','Se estiver usando uma proteção pesada, a Defesa e a resistência a dano que ela fornece aumentam em +2. Pré-requisito:
Proteção Pesada.', 1
go
exec spInsert_Poder_Classe 'Tiro Certeiro','Se estiver usando uma arma de disparo, você soma sua Agilidade nas rolagens de dano e ignora a penalidade contra alvos 
envolvidos em combate corpo a corpo (mesmo se não usar a ação mirar). Pré-requisito: treinado em Pontaria', 1
go
exec spInsert_Poder_Classe 'Tiro de Cobertura','Você pode gastar uma ação padrão e 1 PE para disparar uma arma de fogo na direção de um personagem no alcance da arma 
apenas para forçá-lo a se proteger. Faça um teste de Pontaria contra a Vontade do alvo. Se vencer, até o início do seu próximo turno o alvo não pode sair do lugar 
onde está e sofre –5 em testes de ataque. A critério do mestre, o alvo recebe +5 no teste de Vontade se estiver em um lugar extremamente perigoso, como uma casa em 
chamas ou um barco afundando. Este é um efeito de medo.',1
go
exec spInsert_Poder_Classe 'Transcender','Escolha um poder paranormal. Você recebe o poder escolhido, mas não ganha Sanidade neste aumento de NEX. Você pode escolher 
este poder várias vezes.',1
go
exec spInsert_Poder_Classe 'Treinamento em Perícia','Escolha duas perícias. Você se torna treinado nessas perícias. A partir de NEX 35%, você pode escolher perícias 
nas quais já é treinado para se tornar veterano. A partir de NEX 70%, pode escolher perícias nas quais já é veterano para se tornar expert. Você pode escolher este 
poder várias vezes.',1
go


exec spInsert_Poder_Classe 'Artista Marcial','Seus ataques desarmados causam 1d6 pontos de dano, podem causar dano letal e contam como armas ágeis. 
Em NEX 35%, o dano aumenta para 1d8 e, em NEX 70%, para 1d10.',2
go
exec spInsert_Poder_Classe 'Balística Avançada','Você recebe proficiência com armas táticas de fogo e +2 em rolagens de dano com essas armas.',2
go
exec spInsert_Poder_Classe 'Conhecimento Aplicado','Quando faz um teste de perícia (exceto Luta e Pontaria), você pode gastar 2 PE para mudar o atributo-base da 
perícia para Int. Pré-requisito: Int 2.',2
go
exec spInsert_Poder_Classe 'Hacker','Você recebe +5 em testes de Tecnologia para invadir sistemas e diminui o tempo necessário para hackear qualquer sistema para uma 
ação completa. Pré-requisito: treinado em Tecnologia.',2
go
exec spInsert_Poder_Classe 'Mãos Rápidas','Ao fazer um teste de Crime, você pode pagar 1 PE para fazê-lo como uma ação livre. Pré-requisitos: Agi 3, treinado em 
Crime.',2
go
exec spInsert_Poder_Classe 'Mochila de Utilidades','Um item a sua escolha (exceto armas) conta como uma categoria abaixo e ocupa 1 espaço a menos.',2
go
exec spInsert_Poder_Classe 'Movimento Tático','Você pode gastar 1 PE para ignorar a penalidade em deslocamento por terreno difícil e por escalar até o final do turno. 
Pré-requisito: treinado em Atletismo.',2
go
exec spInsert_Poder_Classe 'Na Trilha Certa','Sempre que tiver sucesso em um teste para procurar pistas, você pode gastar 1 PE para receber +O no próximo teste. Os 
custos e os bônus são cumulativos (se passar num segundo teste, pode pagar 2 PE para receber um total de +2 dados no próximo teste, e assim por diante).',2
go
exec spInsert_Poder_Classe 'Nerd','Você é um repositório de conhecimento útil (e inútil). Uma vez por cena, pode gastar 2 PE para fazer um teste de Atualidades (DT 20). 
Se passar, recebe uma informação útil para essa cena (se for uma investigação, uma dica para uma pista; se for um combate, uma fraqueza de um inimigo, e assim por 
diante). A fonte da informação pode ser desde um livro antigo que você leu na biblioteca até um episódio de sua série de ficção favorita.',2
GO
exec spInsert_Poder_Classe 'Ninja Urbano','Você recebe proficiência com armas táticas de ataque corpo a corpo e +2 em rolagens de dano com essas armas.',2
go
exec spInsert_Poder_Classe 'Pensamento Ágil','Uma vez por rodada, durante uma cena de investigação, você pode gastar 2 PE para fazer uma ação de procurar pistas 
adicional.',2
go
exec spInsert_Poder_Classe 'Perito em Explosivos','Você soma seu Intelecto na DT para resistir aos seus explosivos e pode excluir dos efeitos da explosão um número de 
alvos igual ao seu valor de Intelecto.',2
go
exec spInsert_Poder_Classe 'Primeira Impressão','Você recebe +2 dados no primeiro teste de Diplomacia, Enganação, Intimidação ou Intuição que fizer em uma cena.',2
go
exec spInsert_Poder_Classe 'Transcender','Escolha um poder paranormal. Você recebe o poder escolhido, mas não ganha Sanidade neste aumento de NEX. Você pode escolher 
este poder várias vezes.',2
go
exec spInsert_Poder_Classe 'Treinamento em Perícia','Escolha duas perícias. Você se torna treinado nessas perícias. A partir de NEX 35%, você pode escolher perícias 
nas quais já é treinado para se tornar veterano. A partir de NEX 70%, pode escolher perícias nas quais já é veterano para se tornar expert. Você pode escolher este 
poder várias vezes.',2
go


exec spInsert_Poder_Classe 'Camuflar Ocultismo','Você pode gastar uma ação livre para esconder símbolos e sigilos que estejam desenhados ou gravados em objetos ou 
em sua pele, tornando-os invisíveis para outras pessoas além de você mesmo. Além disso, quando lança um ritual, pode gastar +2 PE para lançá-lo sem usar componentes 
ritualísticos e sem gesticular (o que permite conjurar um ritual com as mãos presas), usando apenas concentração. Outros seres só perceberão que você lançou uma ritual 
se passarem num teste de Ocultismo (DT 25).',3
go
exec spInsert_Poder_Classe 'Criar Selo','Você sabe fabricar selos amaldiçoados. Escolha um ritual que você conheça para gravar no selo. O processo de fabricação 
gasta uma hora e um número de PE iguais ao custo de conjurar o ritual. No final do processo, faça um teste de Ocultismo (DT 15 + PE gastos). Se passar, você cria o 
selo. Você pode ter um número máximo de selos criados a qualquer momento igual à sua Presença.',3
go
exec spInsert_Poder_Classe 'Envolto em Mistério','Sua aparência e postura assombrosas o permitem manipular e assustar pessoas ignorantes ou supersticiosas. O mestre 
define o que exatamente você pode fazer e quem se encaixa nessa descrição. Como regra geral, você recebe +5 em Enganação e Intimidação contra pessoas não treinadas em 
Ocultismo.',3
go
exec spInsert_Poder_Classe 'Especialista em Elemento','Escolha um elemento. A DT para resistir aos seus rituais desse elemento aumenta em +2',3
go
exec spInsert_Poder_Classe 'Ferramentas Paranormais','Você pode ativar equipamentos paranormais sem pagar seu custo em PE',3
go
exec spInsert_Poder_Classe 'Fluxo de Poder','Você pode manter dois efeitos sustentados de rituais ativos simultaneamente com apenas uma ação livre, pagando o custo 
de cada efeito separadamente. Pré-requisito: NEX 60%.',3
go
exec spInsert_Poder_Classe 'Guiado pelo Paranormal','Uma vez por cena, você pode gastar 2 PE para fazer uma ação de investigação adicional',3
go
exec spInsert_Poder_Classe 'Identificação Paranormal','Você recebe +10 em testes de Ocultismo para identificar criaturas, objetos ou rituais.',3
go
exec spInsert_Poder_Classe 'Improvisar Componentes','Uma vez por cena, você pode gastar uma ação completa para fazer um teste de Investigação (DT 15). Se passar, 
encontra objetos que podem servir como componentes ritualísticos de um elemento à sua escolha. O mestre define se é possível usar esse poder na cena atual.',3
go
exec spInsert_Poder_Classe 'Intuição Paranormal','Sempre que usa a ação facilitar investigação, você soma seu Intelecto ou Presença no teste (à sua escolha).',3
go
exec spInsert_Poder_Classe 'Mestre em Elemento','Escolha um elemento. O custo para lançar rituais desse elemento diminui em –1 PE. Pré-requisitos: Especialista em 
Elemento no elemento escolhido, NEX 45%.',3
go
exec spInsert_Poder_Classe 'Ritual Potente','Você soma seu Intelecto nas rolagens de dano ou nos efeitos de cura de seus rituais. Pré-requisito: Int 2.',3
go
exec spInsert_Poder_Classe 'Ritual Predileto','Escolha um ritual que você conhece. Você reduz em –1 PE o custo do ritual. Essa redução se acumula com reduções 
fornecidas por outras fontes.',3
go
exec spInsert_Poder_Classe 'Tatuagem Ritualística','Símbolos marcados em sua pele reduzem em –1 PE o custo de rituais de alcance pessoal que têm você como alvo.',3
go
exec spInsert_Poder_Classe 'Transcender','Escolha um poder paranormal. Você recebe o poder escolhido, mas não ganha Sanidade neste aumento de NEX. Você pode escolher 
este poder várias vezes.',3
go
exec spInsert_Poder_Classe 'Treinamento em Perícia','Escolha duas perícias. Você se torna treinado nessas perícias. A partir de NEX 35%, você pode escolher perícias 
nas quais já é treinado para se tornar veterano. A partir de NEX 70%, pode escolher perícias nas quais já é veterano para se tornar expert. Você pode escolher este 
poder várias vezes.',3
go


exec spInsert_Trilha 'Aniquilador', 1
go
exec spInsert_Trilha 'Comandante de Campo', 1
go
exec spInsert_Trilha 'Guerreiro', 1
go
exec spInsert_Trilha 'Operações Especiais', 1
go
exec spInsert_Trilha 'Tropa de Choque', 1
go


exec spInsert_Trilha 'Atirador de Elite', 2
go
exec spInsert_Trilha 'Infiltrador', 2
go
exec spInsert_Trilha 'Médico de Campo', 2
go
exec spInsert_Trilha 'Negociador', 2
go
exec spInsert_Trilha 'Técnico', 2
go


exec spInsert_Trilha 'Conduíte', 3
go
exec spInsert_Trilha 'Flagelador', 3
go
exec spInsert_Trilha 'Graduado', 3
go
exec spInsert_Trilha 'Intuitivo', 3
go
exec spInsert_Trilha 'Lâmina Paranormal', 3
go


exec spInsert_Poder_Trilha 'A Favorita','Escolha uma arma para ser sua favorita, como katana ou fuzil de assalto. A categoria da arma escolhida é reduzida em I.',
1,10
go
exec spInsert_Poder_Trilha 'Técnica Secreta','A categoria da arma favorita passa a ser reduzida em II. Quando faz um ataque com ela, você pode gastar 2 PE para executar
um dos efeitos abaixo como parte do ataque. Você pode adicionar mais efeitos gastando +2 PE por efeito adicional. Amplo: O ataque pode atingir um alvo adicional em seu 
alcance e adjacente ao original (use o mesmo teste de ataque para ambos). Destruidor: Aumenta o multiplicador de crítico da arma em +1.', 1,40
go
exec spInsert_Poder_Trilha 'Técnica Sublime','A categoria da arma favorita passa a ser reduzida em III e você adiciona os seguintes efeitos à lista de sua Técnica Secreta:
Letal: Aumenta a margem de ameaça em +2. Você pode escolher este efeito duas vezes para aumentar a margem de ameaça em +5. Perfurante: Ignora até 5 pontos de resistência a 
dano de qualquer tipo do alvo.', 1,65
go
exec spInsert_Poder_Trilha 'Máquina de Matar','A categoria da arma favorita passa a ser reduzida em IV, ela recebe +2 na margem de ameaça e seu dano aumenta em um passo.',
1,99
go
exec spInsert_Poder_Trilha 'Inspirar Confiança','Sua liderança inspira seus aliados. Você pode gastar uma reação e 2 PE para fazer um aliado em alcance curto rolar novamente 
um teste recém realizado.', 2,10
go
exec spInsert_Poder_Trilha 'Estrategista','Você pode direcionar aliados em alcance curto. Gaste uma ação padrão e 1 PE por aliado que quiser direcionar (limitado pelo seu 
Intelecto). No próximo turno dos aliados afetados, eles ganham uma ação de movimento adicional.', 2,40
go
exec spInsert_Poder_Trilha 'Brecha na Guarda','Uma vez por rodada, quando um aliado causar dano em um inimigo que esteja em seu alcance curto, você pode gastar uma reação e 
2 PE para que você ou outro aliado em alcance curto faça um ataque adicional contra o mesmo inimigo. Além disso, o alcance de inspirar confiança e estrategista aumenta para 
médio.', 2,65
go
exec spInsert_Poder_Trilha 'Oficial Comandante','Você pode gastar uma ação padrão e 5 PE para que cada aliado que você possa ver em alcance médio receba uma ação padrão 
adicional no próximo turno dele.', 2,99
go
exec spInsert_Poder_Trilha 'Técnica Letal','Você recebe um aumento de +2 na margem de ameaça com todos os seus ataques corpo a corpo',
3,10
go
exec spInsert_Poder_Trilha 'Revidar','Sempre que bloquear um ataque, você pode gastar uma reação e 2 PE para fazer um ataque corpo a corpo no inimigo que o atacou.', 
3,40
go
exec spInsert_Poder_Trilha 'Força Opressora','Quando acerta um ataque corpo a corpo, você pode gastar 1 PE para realizar uma manobra derrubar ou empurrar contra o alvo 
do ataque como ação livre. Se escolher empurrar, recebe um bônus de +5 para cada 10 pontos de dano que causou no alvo. Se escolher derrubar e vencer no teste oposto, 
você pode gastar 1 PE para fazer um ataque adicional contra o alvo caído.',
3,65
go
exec spInsert_Poder_Trilha 'Potência Máxima','Quando usa seu Ataque Especial com armas corpo a corpo, todos os bônus numéricos são dobrados. Por exemplo, se usar 5 PE 
para receber +5 no ataque e +15 no dano, você recebe +10 no ataque e +30 no dano.',
3,99
go
exec spInsert_Poder_Trilha 'Iniciativa Aprimorada','Você recebe +5 em Iniciativa e recebe uma ação de movimento adicional na primeira rodada.',
4,10
go
exec spInsert_Poder_Trilha 'Ataque Extra','Uma vez por rodada, quando faz um ataque, você pode gastar 2 PE para fazer um ataque adicional.', 
4,40
go
exec spInsert_Poder_Trilha 'Surto de Adrenalina','Uma vez por rodada, você pode gastar 5 PE para realizar uma ação padrão ou de movimento adicional.',
4,65
go
exec spInsert_Poder_Trilha 'Sempre Alerta','Você recebe uma ação padrão adicional no início de cada cena de combate.',
4,99
go
exec spInsert_Poder_Trilha 'Casca Grossa','Você recebe +1 PV para cada 5% de NEX e, quando faz um bloqueio, soma seu Vigor na resistência a dano recebida.',
5,10
go
exec spInsert_Poder_Trilha 'Cai Dentro','Sempre que um oponente em alcance curto ataca um de seus aliados, você pode gastar uma reação e 1 PE para fazer com 
que esse oponente faça um teste de Vontade (DT Vig). Se falhar, o oponente deve atacar você em vez de seu aliado. Este poder só funciona se você puder ser 
efetivamente atacado e estiver no alcance do ataque (por exemplo, adjacente a um oponente atacando em corpo a corpo ou dentro do alcance de uma arma de ataque 
à distância). Um oponente que passe no teste de Vontade não pode ser afetado por seu poder Cai Dentro até o final da cena.', 
5,40
go
exec spInsert_Poder_Trilha 'Duro de Matar','Ao sofrer dano não paranormal, você pode gastar uma reação e 2 PE para reduzir esse dano à metade. Em NEX 85%, 
você pode usar esta habilidade para reduzir dano paranormal.',
5,65
go
exec spInsert_Poder_Trilha 'Inquebrável','Enquanto estiver machucado, você recebe +10 na Defesa e resistência a dano 5. Enquanto estiver morrendo, em vez do 
normal, você não fica indefeso e ainda pode realizar ações. Você ainda segue as regras de morte normalmente.',
5,99
go
exec spInsert_Poder_Trilha 'Mira de Elite','Você recebe proficiência com armas de fogo que usam balas longas e soma seu Intelecto em rolagens de dano com 
essas armas.',
6,10
go
exec spInsert_Poder_Trilha 'Disparo Letal','Quando faz a ação mirar você pode gastar 1 PE para aumentar em +2 a margem de ameaça do próximo ataque que fizer 
até o final de seu próximo turno.', 
6,40
go
exec spInsert_Poder_Trilha 'Disparo Impactante','Se estiver usando uma arma de fogo com calibre grosso você pode gastar 2 PE para fazer as manobras derrubar, 
desarmar, empurrar e quebrar usando um ataque a distância.', 
6,65
go
exec spInsert_Poder_Trilha 'Atirar Para Matar','Quando faz um acerto crítico com uma arma de fogo, você causa dano máximo, sem precisar rolar dados.',
6,99
go
exec spInsert_Poder_Trilha 'Ataque Furtivo','Você sabe atingir os pontos vitais de um inimigo distraído. Uma vez por rodada, quando atinge um alvo desprevenido 
com um ataque corpo a corpo ou em alcance curto, ou um alvo que você esteja flanqueando, você pode gastar 1 PE para causar +1d6 pontos de dano do mesmo tipo da
arma. Em NEX 40% o dano adicional aumenta para +2d6, em NEX 65% aumenta para +3d6 e em NEX 99% aumenta para +4d6.', 
7,10
go
exec spInsert_Poder_Trilha 'Gatuno','Você recebe +5 em Atletismo e Crime e pode percorrer seu deslocamento normal quando e se esconder sem penalidade (veja a 
perícia Furtividade).', 
7,40
go
exec spInsert_Poder_Trilha 'Assassinar','Você pode gastar uma ação de movimento e 3 PE para analisar um alvo em alcance curto. Até o fim de seu próximo turno, 
seu primeiro Ataque Furtivo que causar dano a ele tem seus dados de dano extras dessa habilidade dobrados. Além disso, se sofrer dano de seu ataque, o alvo fica
inconsciente ou morrendo, à sua escolha (Fortitude DT Agi evita).', 
7,65
go
exec spInsert_Poder_Trilha 'Sombra Fugaz','Quando faz um teste de Furtividade após atacar ou fazer outra ação chamativa, você pode gastar 3 PE para não sofrer a 
penalidade de –15 no teste.', 
7,99
go
exec spInsert_Poder_Trilha 'Paramédico','Você pode usar uma ação padrão e 2 PE para curar 2d10 pontos de vida de um aliado adjacente. Você pode curar +1d10 PV respectivamente
em NEX 40%, 65% e 99%, gastando +1 PE por dado adicional de cura.',
8,10
go
exec spInsert_Poder_Trilha 'Equipe de Trauma','Você pode usar uma ação padrão e 2 PE para remover uma condição negativa (exceto morrendo) de um aliado adjacente', 
8,40
go
exec spInsert_Poder_Trilha 'Resgate','Uma vez por rodada, se estiverem alcance curto de um aliado machucado ou morrendo, você pode se aproximar do aliado com uma ação 
livre (desde que seja capaz de fazê-lo usando seu deslocamento normal). Além disso, sempre que curar PV ou remover condições do aliado, você e o aliado recebem +5 na 
Defesa até o início de seu próximo turno. Por fim, para você, o total de espaços ocupados por carregar um personagem é reduzido pela metade.',
8,65
go
exec spInsert_Poder_Trilha 'Reanimação','Uma vez por cena, você pode gastar uma ação completa e 10 PE para trazer de volta a vida um personagem que tenha morrido na mesma 
cena (exceto morte por dano massivo).',
8,99
go
exec spInsert_Poder_Trilha 'Eloquência','Você pode usar uma ação completa e 1 PE por alvo em alcance curto para afetar outros personagens com sua fala. Faça um teste de 
Diplomacia, Enganação ou Intimidação contra a Vontade dos alvos. Se você vencer, os alvos ficam fascinados enquanto você se concentrar (uma ação padrão por rodada). Um 
alvo hostil ou que esteja envolvido em combate recebe +5 em seu teste de resistência e tem direito a um novo teste por rodada, sempre que você se concentrar Um personagem 
que passar no teste fica imune a este efeito por um dia.',
9,10
go
exec spInsert_Poder_Trilha 'Discurso Motivador','Você pode gastar uma ação padrão e 4 PE para inspirar seus aliados com suas palavras. Você e todos os seus aliados em alcance 
curto ganham +1 dado em testes de perícia até o fim da cena. A partir de NEX 65%, você pode gastar 8 PE para fornecer um bônus total de +2 dados.', 
9,40
go
exec spInsert_Poder_Trilha 'Eu Conheço um Cara','Uma vez por missão, você pode ativar sua rede de contatos para pedir um favor, como por exemplo trocar todo o equipamento do seu 
grupo (como se tivesse uma segunda fase de preparação de missão), conseguir um local de descanso ou mesmo ser resgatado de uma cena. O mestre tem a palavra final de quando é possível 
usar essa habilidade e quais favores podem ser obtidos.',
9,65
go
exec spInsert_Poder_Trilha 'Truque de Mestre','Acostumado a uma vida de fingimento e manipulação, você pode gastar 5 PE para simular o efeito de qualquer habilidade que você tenha 
visto um de seus aliados usar durante a cena. Você ignora os pré-requisitos da habilidade, mas ainda precisa pagar todos os seus custos, incluindo ações, PE e materiais, e ela usa os 
seus parâmetros de jogo, como se você estivesse usando a habilidade em questão.',
9,99
go
exec spInsert_Poder_Trilha 'Inventário Otimizado','Você soma seu Intelecto à sua Força para calcular seu valor de inventário. Por exemplo, se você tem Força 1 e Intelecto 3, seu inventário 
tem 20 espaços.',
10,10
go
exec spInsert_Poder_Trilha 'Remendão','Você pode gastar uma ação completa e 1 PE para remover a condição quebrado de um equipamento adjacente até o final da cena. Além disso, qualquer 
equipamento de investigação tem sua categoria reduzida em I para você.', 
10,40
go
exec spInsert_Poder_Trilha 'Improvisar','Você pode improvisar equipamentos com materiais ao seu redor. Escolha um equipamento de investigação e gaste uma ação completa e 2 PE, mais 2 PE 
por categoria do item escolhido. Você cria uma versão funcional do equipamento, que segue suas regras de espaço e categoria como normal. Ao final da cena, seu equipamento improvisado se 
torna inútil.',
10,65
go
exec spInsert_Poder_Trilha 'Preparado para Tudo','Você sempre tem o que precisa para qualquer situação. Sempre que precisar de um item qualquer (exceto armas), pode gastar uma ação de movimento 
e 3 PE por categoria do item para lembrar que colocou ele no fundo da bolsa! Depois de encontrado, o item segue normalmente as regras de inventário.',
10,99
go
exec spInsert_Poder_Trilha 'Ampliar Ritual','Quando lança um ritual, você pode gastar +2 PE para aumentar seu alcance em um passo (de curto para médio, de médio para longo ou de longo para extremo) 
ou dobrar sua área de efeito.',
11,10
go
exec spInsert_Poder_Trilha 'Acelerar Ritual','Uma vez por rodada, você pode aumentar o custo de um ritual em 4 PE para conjurá-lo como uma ação livre.', 
11,40
go
exec spInsert_Poder_Trilha 'Anular Ritual','Quando for alvo de um ritual, você pode gastar uma quantidade de PE igual ao custo pago por esse ritual e fazer um teste oposto de Ocultismo 
contra o conjurador. Se vencer, você anula o ritual, cancelando todos os seus efeitos.',
11,65
go
exec spInsert_Poder_Trilha 'Canalizar o Medo','Você aprende o ritual Canalizar o Medo',
11,99
go
exec spInsert_Poder_Trilha 'Poder do Flagelo','Ao conjurar um ritual, você pode gastar seus próprios pontos de vida para pagar o custo em pontos de esforço, à taxa de 2 PV por 
PE pago. Pontos de vida gastos dessa forma só podem ser recuperados com descanso.',
12,10
go
exec spInsert_Poder_Trilha 'Abraçar a Dor','Sempre que sofrer dano não paranormal, você pode gastar uma reação e 2 PE para reduzir esse dano à metade.', 
12,40
go
exec spInsert_Poder_Trilha 'Absorver Agonia','Sempre que reduz um ou mais inimigos a 0 PV com um ritual, você recebe uma quantidade de PE temporários igual ao círculo do ritual 
utilizado. Por exemplo, se ativar esse poder com um ritual de 2º círculo, receberá 2 PE.', 
12,65
go
exec spInsert_Poder_Trilha 'Medo Tangível','Você aprende o ritual Medo Tangível',
12,99
go
exec spInsert_Poder_Trilha 'Saber Ampliado','Você aprende um ritual de 1º círculo. Toda vez que ganha acesso a um novo círculo, aprende um ritual adicional daquele círculo. 
Esses rituais não contam no seu limite de rituais.', 
13,10
go
exec spInsert_Poder_Trilha 'Grimório Ritualístico','Você cria um grimório especial, que armazena rituais que sua mente não seria capaz de guardar. Você aprende uma quantidade
de rituais de 1º ou 2º círculos igual ao seu Intelecto. Quando ganha acesso a um novo círculo, pode incluir um novo ritual desse círculo em seu grimório. Esses rituais não 
contam em seu limite de rituais conhecidos. Para conjurar um ritual armazenado em seu grimório, você precisa antes gastar uma ação completa folheando o grimório e relembrando
o ritual. O grimório ocupa 1 espaço em seu inventário. Se perdê-lo, você pode replicá-lo com uma semana de trabalho.', 
13,40
go
exec spInsert_Poder_Trilha 'Rituais Eficientes','A DT para resistir a todos os seus rituais aumenta em +5.', 
13,65
go
exec spInsert_Poder_Trilha 'Conhecendo o Medo','Você aprende o ritual Conhecendo o Medo', 
13,99
go
exec spInsert_Poder_Trilha 'Mente Sã','Você compreende melhor as entidades do Outro Lado, e passa a ser menos abalado por seus efeitos. Você recebe resistência paranormal +5 
(+5 em testes de resistência contra efeitos paranormais).',
14,10
go
exec spInsert_Poder_Trilha 'Presença Poderosa','Sua resiliência mental faz com que você possa extrair mais do Outro Lado. Você adiciona sua Presença ao seu limite de PE por 
turno, mas apenas para conjurar rituais.', 
14,40
go
exec spInsert_Poder_Trilha 'Inabalável','Você recebe resistência a dano mental e paranormal 10. Além disso, quando é alvo de um efeito paranormal que permite um teste de Vontade 
para reduzir o dano à metade, você não sofre dano algum se passar.',
14,65
go
exec spInsert_Poder_Trilha 'Presença do Medo','Você aprende o ritual Presença do Medo',
14,99
go
exec spInsert_Poder_Trilha 'Lâmina Maldita','Você aprende o ritual Amaldiçoar Arma. Se já o conhece, seu custo é reduzido em –1 PE. Além disso, quando conjura esse ritual, você pode 
usar Ocultismo, em vez de Luta ou Pontaria, para testes de ataque com a arma amaldiçoada.',
15,10
go
exec spInsert_Poder_Trilha 'Gladiador Paranormal','Sempre que acerta um ataque corpo a corpo em um inimigo, você recebe 2 PE temporários. Você pode ganhar um máximo de PE temporários 
por cena igual ao seu limite de PE. PE temporários desaparecem no final da cena.', 
15,40
go
exec spInsert_Poder_Trilha 'Conjuração Marcial','Uma vez por rodada, quando você lança um ritual com execução de uma ação padrão, pode gastar 2 PE para fazer um ataque corpo a corpo como 
uma ação livre.',
15,65
go
exec spInsert_Poder_Trilha 'Lâmina do Medo','Você aprende o ritual Lâmina do Medo',
15,99
go


exec spInsert_Origem 'Acadêmico', 'Saber é Poder', 'Quando faz um teste usando Intelecto, 
você pode gastar 2 PE para receber +5 nesse teste.'
go
exec spInsert_Origem 'Agente de Saúde', 'Técnica Medicinal','Sempre que cura um personagem, você adiciona seu Intelecto 
no total de PV curados.'
go
exec spInsert_Origem 'Amnésico', 'Vislumbre do Passado', 'Uma vez por missão, você pode fazer um teste de Intelecto (DT 10) 
para reconhecer pessoas ou lugares familiares, que tenha encontrado antes de perder a memória. 
Se passar, recebe 1d4 PE temporários e, a critério do mestre, uma informação útil.'
go
exec spInsert_Origem 'Artista', 'Magnum Opus','Você é  famoso por uma de suas obras. Uma vez por missão, pode 
determinar que um personagem envolvido em uma cena de interação o reconheça. Você recebe +5 em testes de 
Presença e de perícias baseadas em Presença contra aquele personagem. A critério do mestre, pode receber 
esses bônus em outras situações nas quais seria reconhecido.'
go
exec spInsert_Origem 'Atleta', '110%','Quando faz um teste de perícia usando Força ou Agilidade (exceto Luta e 
Pontaria) você pode gastar 2 PE para receber +5 nesse teste.'
go
exec spInsert_Origem 'Chef','Ingrediente Secreto','Em cenas de interlúdio, você pode gastar uma ação para cozinhar um prato
gostoso. Cada membro do grupo (incluindo você) que gastar uma ação para se alimentar recebe o benefício de 
dois pratos (caso o mesmo benefício seja escolhido duas vezes, seus efeitos se acumulam).'
go
exec spInsert_Origem 'Criminoso','O Crime Compensa','No final de uma missão, escolha um item encontrado na missão. Em sua próxima 
missão, você pode incluir esse item em seu inventário sem que ele conte em seu limite de itens por patente.'
go
exec spInsert_Origem'Cultista Arrependido','Traços do Outro Lado','Você possui um poder paranormal à sua escolha. 
Porém, começa o jogo com metade da Sanidade normal para sua classe.'
go
exec spInsert_Origem 'Desgarrado','Calejado','Você receb e +1 PV para cada 5% de NEX'
go
exec spInsert_Origem 'Engenheiro','Ferramentas Favoritas','Um item a sua escolha (exceto armas) conta como uma 
categoria abaixo (por exemplo, um item de categoria II conta como categoria I para você).'
go
exec spInsert_Origem 'Executivo','Processo Otimizado','Sempre que faz um teste de perícia durante um teste estendido, 
pode pagar 2 PE para receber +5 nesse teste.'
go
exec spInsert_Origem 'Investigador', 'Faro Para Pistas','Uma vez por cena, quando fizer um teste para procurar pistas, 
você pode gastar 1 PE para receber +5 nesse teste.'
go
exec spInsert_Origem'Lutador', 'Mão Pesada', 'Você recebe +2 em rolagens de dano com ataques corpo a corpo'
go
exec spInsert_Origem'Magnata','Patrocinador da Ordem', 'Seu limite de crédito é sempre considerado um acima do atual'
go
exec spInsert_Origem'Mercenário','Posição de Combate','No primeiro turno de cada cena de ação, você pode gastar 2 PE 
para receber uma ação de movimento adicional.'
go
exec spInsert_Origem 'Militar','Para Bellum', 'Você recebe +2 em rolagens de dano com armas de fogo.'
go
exec spInsert_Origem 'Operário','Ferramenta de Trabalho','Escolha uma arma simples ou tática 
que, a critério do mestre, poderia ser usada como ferramenta em sua profissão (como uma marreta para um pedreiro). Você sabe usar a arma escolhida e 
recebe +1 em testes de ataque, rolagens de dano e margem de ameaça com ela.'
go
exec spInsert_Origem 'Policial','Patrulha','Você recebe +2 em Defesa'
go
exec spInsert_Origem 'Religioso', 'Acalentar','Você recebe +5 em testes de Religião para acalmar. Além disso, quando acalma uma pessoa, ela 
recebe um número de pontos de Sanidade igual a 1d6 + a sua Presença.'
go
exec spInsert_Origem 'Servidor público','Espírito Cívico','Sempre que faz um teste para ajudar, você pode gastar 1 PE para aumentar o bônus concedido em +2'
go
exec spInsert_Origem'Teórico da Conspiração', 'Eu Já Sabia','Você não se abala com entidades
ou anomalias. Afinal, sempre soube que isso tudo existia. Você recebe resistência a dano mental igual ao seu Intelecto.'
go
exec spInsert_Origem 'T.I.', 'Motor de Busca','A critério do Mestre, sempre que tiver 
acesso a internet, você pode gastar 2 PE para substituir um teste de perícia qualquer por um teste de Tecnologia.'
go
exec spInsert_Origem 'Trabalhador Rural','Desbravador','Quando faz um teste de Adestramento ou Sobrevivência, você 
pode gastar 2 PE para receber +5 nesse teste. Além disso, você não sofre penalidade em deslocamento por terreno difícil.'
go
exec spInsert_Origem 'Trambiqueiro','Impostor','Uma vez por cena, você pode gastar 2 PE para substituir um teste de perícia qualquer por um teste de Enganação.'
go
exec spInsert_Origem 'Universitário','Dedicação','Você recebe +1 PE, e mais 1 PE adicional a cada NEX ímpar (15%, 25%...). Além disso, seu limite de PE por turno aumenta em 1 
(em NEX 5% seu limite é 2, em NEX 10% é 3 e assim por diante).'
go
exec spInsert_Origem'Vítima', 'Cicatrizes Psicológicas', 'Você recebe +1 de sanidade para cada 5% de NEX'
go



exec spInsert_Poder_Paranormal 'Expansão de Conhecimento','Conhecimento','Você se conecta com o Conhecimento do Outro Lado, rompendo os limites de sua compreensão. 
Você aprende um poder de classe que não pertença à sua classe (caso o poder possua pré-requisitos, você precisa preenchê-los). Pré-requisito: Conhecimento 1.
Afinidade: você aprende um segundo poder de classe que não pertença à sua classe.'
go
exec spInsert_Poder_Paranormal 'Percepção Paranormal','Conhecimento','O Conhecimento sussurra em sua mente. Em cenas de investigação, sempre que fizer um teste 
para procurar pistas, você pode rolar novamente um dado com resultado menor que 10. Você deve aceitar a segunda rolagem, mesmo que seja menor que a primeira. 
Afinidade: você pode rolar novamente até dois dados com resultado menor que 10.'
go
exec spInsert_Poder_Paranormal 'Precognição','Conhecimento','Você possui um “sexto sentido” que o avisa do perigo antes que ele aconteça. Você recebe +2 em Defesa 
e em testes de resistência. Pré-requisito: Conhecimento 1. Afinidade: você fica imune à condição desprevenido.'
go
exec spInsert_Poder_Paranormal 'Sensitivo','Conhecimento','Você consegue sentir as emoções e intenções de outros personagens, como medo, raiva ou malícia, recebendo
+5 em testes de Diplomacia, Intimidação e Intuição. Afinidade: quando você faz um teste oposto usando uma dessas perícias, o oponente sofre –1 dado.'
go
exec spInsert_Poder_Paranormal 'Visão do Oculto','Conhecimento','Você não enxerga mais pelos olhos, mas sim pela percepção do Conhecimento em sua mente. Você recebe +5 
em testes de Percepção e enxerga no escuro. Afinidade: você ignora camuflagem.'

go
exec spInsert_Poder_Paranormal 'Afortunado','Energia','A Energia considera resultados medíocres entediantes. Uma vez por rolagem, você pode rolar novamente um 
resultado 1 em qualquer dado que não seja d20. Afinidade: além disso, uma vez por teste, você pode rolar novamente um resultado 1 em d20.'
go
exec spInsert_Poder_Paranormal 'Campo Protetor','Energia','Você consegue gerar um campo de Energia que o protege de perigos. Quando usa a ação esquiva, você recebe 
+5 em Defesa. Pré-requisito: Energia 1. Afinidade: você recebe +5 em Reflexo e, quando passa em um teste de Reflexo que reduziria o dano à metade, em vez disso não 
sofre nenhum dano.'
go
exec spInsert_Poder_Paranormal 'Causalidade Fortuita','Energia','A Energia o conduz rumo à descobertas. Em cenas de investigação, a DT para procurar pistas diminui
em –5 para você até você encontrar uma pista. Afinidade: a DT para procurar pistas sempre diminui em –5 para você.'
go
exec spInsert_Poder_Paranormal 'Golpe de Sorte','Energia','Seus ataques recebem +1 na margem de ameaça. Pré-requisito: Energia 1. Afinidade: seus ataques recebem +1 
no multiplicador de crítico.'
go
exec spInsert_Poder_Paranormal 'Manipular Entropia','Energia','Nada diverte mais a Energia do que a possibilidade de um desastre ainda maior. Você pode gastar 2 PE
para fazer um alvo em alcance curto (exceto você mesmo) rolar novamente um dos dados em um teste de perícia. Pré-requisito: Energia 1. Afinidade: o alvo rola novamente 
todos os dados que você escolher.'
go

exec spInsert_Poder_Paranormal 'Encarar a Morte','Morte','A sua conexão com a Morte o tornou apático diante da possibilidade do fim, fazendo com que você não hesite 
em situações de perigo. Durante cenas de ação, seu limite de gasto de PE aumenta em +1. Afinidade: durante cenas de ação, seu limite de gasto de PE aumenta em +2 
(para um total de +3).'
go
exec spInsert_Poder_Paranormal 'Escapar da Morte','Morte','A Morte tem um interesse especial em sua caminhada. Uma vez por cena, quando receber dano que o deixaria
com 0 PV, você fica com 1 PV. Não funciona em caso de dano massivo. Pré-requisito: Morte 1. Afinidade: em vez do normal, você evita completamente o dano. Em caso de 
dano massivo, você fica com 1 PV.'
go
exec spInsert_Poder_Paranormal 'Potencial Aprimorado','Morte','A Morte lhe concede potencial latente de momentos roubados de outro lugar. Você recebe +1 ponto de 
esforço por NEX. Quando sobe de NEX, os PE que recebe por este poder aumentam de acordo. Por exemplo, se escolher este poder em NEX 30%, recebe 6 PE. Quando subir 
para NEX 35%, recebe +1 PE adicional, e assim por diante. Afinidade: você recebe +1 PE adicional por NEX (para um total de +2 PE por NEX).'
go
exec spInsert_Poder_Paranormal 'Potencial Reaproveitado','Morte','Você absorve os momentos desperdiçados de outros seres. Uma vez por rodada, quando passa num teste 
de resistência, você ganha 1 ponto de esforço temporário. Os pontos desaparecem no final da cena. Afinidade: você ganha 2 pontos de esforço temporários, em vez de 1.'
go
exec spInsert_Poder_Paranormal 'Surto Temporal','Morte','A sua percepção temporal se torna distorcida e espiralizada, fazendo com que a noção de passagem do tempo 
nunca mais seja a mesma para você. Uma vez por cena, durante seu turno, você pode gastar 3 PE para realizar uma ação padrão adicional. Pré-requisito: Morte 2. 
Afinidade: em vez de uma vez por cena, você pode usar este poder uma vez por turno.'
go

exec spInsert_Poder_Paranormal 'Anatomia Insana','Sangue','O seu corpo é transfigurado e parece desenvolver um instinto próprio separado da sua consciência. Você tem 
50% de chance (resultado par em 1d4) de ignorar o dano adicional de um acerto crítico ou ataque furtivo. Pré-requisito: Sangue 1. Afinidade: você é imune aos efeitos 
de acertos críticos e ataques furtivos.'
go
exec spInsert_Poder_Paranormal 'Arma de Sangue','Sangue','O Sangue devora parte de seu corpo e se manifesta como parte de você. Você pode gastar uma ação de movimento 
e 2 PE para produzir garras, chifres ou uma lâmina de sangue cristalizado que brota de seu antebraço. Qualquer que seja sua escolha, é considerada uma arma simples 
leve que você não precisa empunhar e causa 1d6 pontos de dano de Sangue. Uma vez por turno, quando você usa a ação agredir, pode gastar 1 PE para fazer um ataque 
corpo a corpo adicional com essa arma. A arma dura até o final da cena, e então se desfaz numa poça de sangue coagulado. Afinidade: a arma se torna permanentemente 
parte de você e causa dano de Sangue.'
go
exec spInsert_Poder_Paranormal 'Sangue de Ferro','Sangue','O seu sangue flui de forma paranormal e agressiva, concedendo vigor não natural. Você recebe +2 pontos de
vida por NEX.Quando sobe de NEX, os PV que recebe por este poder aumentam de acordo. Por exemplo, se escolher este poder em NEX 50%, recebe 20 PV. Quando subir para 
NEX 55%, recebe +2 PV, e assim por diante. Afinidade: você recebe +5 em Fortitude e se torna imune a venenos e doenças'
go
exec spInsert_Poder_Paranormal 'Sangue Fervente','Sangue','A intensidade da dor desperta em você sentimentos bestiais e prazerosos que você nem imaginava que existiam. 
Enquanto estiver machucado, você recebe +1 em Agilidade ou Força, à sua escolha (escolha sempre que este efeito for ativado). Pré-requisito: Sangue 2. Afinidade: o 
bônus que você recebe em Agilidade ou Força aumenta para +2.'
go
exec spInsert_Poder_Paranormal 'Sangue Vivo','Sangue','A carnificina não pode parar, o Sangue precisa continuar fluindo. Na primeira vez que ficar machucado durante 
uma cena, você recebe cura acelerada 2 Esse efeito nunca cura você acima da metade dos PV máximos (ou seja, você nunca deixa de estar machucado) e termina no fim da 
cena ou caso você perca a condição machucado. Pré-requisito: Sangue 1. Afinidade: a cura acelerada aumenta para 5.'
go
select * from Origem
select * from Patente
select * from Classe
select * from Trilha
select * from Poder_Classe
select * from Poder_Trilha
select * from Poder_Paranormal
