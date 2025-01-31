﻿/*
* Amigas na piscina II- Problema de Lógica
* Cinco amigas estão lado a lado aproveitando o sol para pegar um bronze
* na piscina. Descubra qual protetor cada uma está usando, o picolé que
* cada uma gosta e outras coisas mais.
* São:
*   05 colunas
*   06 linhas
*   24 instruções
* Fonte: https://rachacuca.com.br/logica/problemas/amigas-na-piscina-ii/
*/


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Fatos
%% O que a gente tem de base de dados?

        %MAIO
        maio(amarelo).
        maio(azul).
        maio(branco).
        maio(verde).
        maio(vermelho).

        %NOMES
        nome(amanda).
        nome(flavia).
        nome(larissa).
        nome(priscila).
        nome(veronica).

        %IDADE
        idade(7).
        idade(8).
        idade(9).
        idade(10).
        idade(11).

        %SUCOS
        suco(laranja).
        suco(limao).
        suco(maca).
        suco(maracuja).
        suco(uva).

        %PROTETOR
        protetor(fps40).
        protetor(fps45).
        protetor(fps50).
        protetor(fps55).
        protetor(fps60).

        %ANIMALS
        animal(cachorros).
        animal(coelhos).
        animal(gatos).
        animal(passaros).
        animal(peixes).

% Vamos estabelecemos uma regra com a função ALLDIFERENT
% podemos ter apenas um único resultado
% A restrição alldifferent garante que as variáveis ​​na lista devem
% ter valores diferentes

alldifferent([]).%define uma lista vazia (nenhum membro)
alldifferent([Elemento|Lista]):-
      not(member(Elemento,Lista)),% retorna TRUE se o elemento NÃO for membro da lista
      alldifferent(Lista).


% Qual o modelo que a gente quer chegar?
modelo([
        (Maio_1, Nome_1, Idade_1, Suco_1, Protetor_1, Animal_1),
        (Maio_2, Nome_2, Idade_2, Suco_2, Protetor_2, Animal_2),
        (Maio_3, Nome_3, Idade_3, Suco_3, Protetor_3, Animal_3),
        (Maio_4, Nome_4, Idade_4, Suco_4, Protetor_4, Animal_4),
        (Maio_5, Nome_5, Idade_5, Suco_5, Protetor_5, Animal_5)
       ]) :-

%Vamos analisar cada uma das instruções do problema,
%sem seguir uma ordem pré-definida

%%%%%%%%%%%%%%%%%%%%%%%%SUCO
suco(Suco_1),
suco(Suco_2),
suco(Suco_3),
suco(Suco_4),
suco(Suco_5),

alldifferent([Suco_1, Suco_2, Suco_3, Suco_4, Suco_5]),

%%%%%%%%%%%%%%%%%%%%%%%% Protetor
protetor(Protetor_1),
protetor(Protetor_2),
protetor(Protetor_3),
protetor(Protetor_4),
protetor(Protetor_5),

alldifferent([Protetor_1, Protetor_2, Protetor_3, Protetor_4, Protetor_5]),

%21) Na primeira posição está a menina que gosta de suco de maçã.
(Suco_1==maca),

%20) Quem gosta de suco de Laranja usa protetor com FPS 40.
(
(Suco_1==laranja, Protetor_1==fps40);
(Suco_2==laranja, Protetor_2==fps40);
(Suco_3==laranja, Protetor_3==fps40);
(Suco_4==laranja, Protetor_4==fps40);
(Suco_5==laranja, Protetor_5==fps40)
),

%%%%%%%%%%%%%%%%%%%%%%%%Idade
idade(Idade_1),
idade(Idade_2),
idade(Idade_3),
idade(Idade_4),
idade(Idade_5),

%16)A menina mais nova gosta de suco de Maracujá.
(
(Idade_1==7, Suco_1==maracuja);
(Idade_2==7, Suco_2==maracuja);
(Idade_3==7, Suco_3==maracuja);
(Idade_4==7, Suco_4==maracuja);
(Idade_5==7, Suco_5==maracuja)
),

alldifferent([Idade_1, Idade_2, Idade_3, Idade_4, Idade_5]),

%10)	A menina de 10 anos gosta de suco de Limão.

(
(Idade_1==10, Suco_1==limao);
(Idade_2==10, Suco_2==limao);
(Idade_3==10, Suco_3==limao);
(Idade_4==10, Suco_4==limao);
(Idade_5==10, Suco_5==limao)
),

%%%%%%%%%%%%NOMES
nome(Nome_1),
nome(Nome_2),
nome(Nome_3),
nome(Nome_4),
nome(Nome_5),

%12.	Verônica está na segunda posição.
(Nome_2==veronica),

alldifferent([Nome_1, Nome_2, Nome_3, Nome_4, Nome_5]),

%%%%%%%%%%%%%%%%%%%%%%%%ANIMAIS
animal(Animal_1),
animal(Animal_2),
animal(Animal_3),
animal(Animal_4),
animal(Animal_5),

%14)	Flávia gosta de Coelhos.
(
(Nome_1==flavia, Animal_1==coelhos);
(Nome_2==flavia, Animal_2==coelhos);
(Nome_3==flavia, Animal_3==coelhos);
(Nome_4==flavia, Animal_4==coelhos);
(Nome_5==flavia, Animal_5==coelhos)
),

alldifferent([Animal_1, Animal_2, Animal_3, Animal_4, Animal_5]),

%1)A garota que gosta de Pássaros está na quinta posição.
(Animal_5==passaros),



%2) Amanda usa o protetor solar de maior fator de proteção.
(
(Nome_1==amanda, Protetor_1==fps60);
(Nome_2==amanda, Protetor_2==fps60);
(Nome_3==amanda, Protetor_3==fps60);
(Nome_4==amanda, Protetor_4==fps60);
(Nome_5==amanda, Protetor_5==fps60)
),

%8)Quem gosta de Cachorros está na terceira posição.
(Animal_3==cachorros),

%6)Na quarta posição está a menina que gosta de Coelhos.
(Animal_4==coelhos),

%18)A menina do protetor com FPS 50 gosta de Gatos.
(
(Protetor_1==fps50, Animal_1==gatos);
(Protetor_2==fps50, Animal_2==gatos);
(Protetor_3==fps50, Animal_3==gatos);
(Protetor_4==fps50, Animal_4==gatos);
(Protetor_5==fps50, Animal_5==gatos)
),

maio(Maio_1),
maio(Maio_2),
maio(Maio_3),
maio(Maio_4),
maio(Maio_5),


%23)A menina do maiô Verde usa protetor com FPS 40.
(
(Maio_1==verde, Protetor_1==fps40);
(Maio_2==verde, Protetor_2==fps40);
(Maio_3==verde, Protetor_3==fps40);
(Maio_4==verde, Protetor_4==fps40);
(Maio_5==verde, Protetor_5==fps40)
),

alldifferent([Maio_1, Maio_2, Maio_3, Maio_4, Maio_5]),


%24) A garota de 8 anos está na segunda posição.
(Idade_2==8),

% 11)Quem gosta de Peixes está ao lado de quem usa o protetor com FPS 60.
(
(Protetor_1==fps60, Animal_2==peixes);
(Protetor_2==fps60, (Animal_1==peixes ; Animal_3==peixes));
(Protetor_3==fps60, (Animal_2==peixes ; Animal_4==peixes));
(Protetor_4==fps60, (Animal_3==peixes ; Animal_5==peixes));
(Protetor_5==fps60, Animal_4==peixes)
),


%9)A menina de maiô Branco está em uma das pontas.
(Maio_1==branco; Maio_5==branco),


%3)Larissa está ao lado da menina mais nova.
(
(Nome_1==larissa, Idade_2==7);
(Nome_2==larissa, (Idade_1==7 ; Idade_3==7));
(Nome_3==larissa, (Idade_2==7 ; Idade_4==7));
(Nome_4==larissa, (Idade_3==7 ; Idade_5==7));
(Nome_5==larissa, Idade_4==7)
),


% 13) A menina no maiô Azul está em algum lugar à esquerda de quem
%usa protetor com FPS 45.
(
(Protetor_5==fps45, (Maio_4==azul ; Maio_3==azul ; Maio_2==azu ; Maio_1==azul));
(Protetor_4==fps45, (Maio_3==azul ; Maio_2==azul ; Maio_1==azul));
(Protetor_3==fps45, (Maio_2==azul ; Maio_1==azul));
(Protetor_2==fps45, Maio_1==azul)
),

%15)A menina de maiô Vermelho está em algum lugar a esquerda da que usa filtro solar com FPS 55.
(
(Protetor_5==fps55, (Maio_4==vermelho ; Maio_3==vermelho ; Maio_2==vermelho ; Maio_1==azul));
(Protetor_4==fps55, (Maio_3==vermelho ; Maio_2==vermelho ; Maio_1==vermelho));
(Protetor_3==fps55, (Maio_2==vermelho ; Maio_1==vermelho));
(Protetor_2==fps55, Maio_1==vermelho)
),

%17)Flávia está ao lado da garota de maiô Azul.
(
(Maio_1==azul, Nome_2==flavia);
(Maio_2==azul, (Nome_1==flavia ; Nome_3==flavia));
(Maio_3==azul, (Nome_2==flavia ; Nome_4==flavia));
(Maio_4==azul, (Nome_3==flavia ; Nome_5==flavia));
(Maio_5==azul, Nome_4==flavia)
),

%19)A garota do maiô Vermelho está ao lado da que gosta de Pássaros.
(
(Animal_1==passaros, Maio_2==vermelho);
(Animal_2==passaros, (Maio_1==vermelho ; Maio_3==vermelho));
(Animal_3==passaros, (Maio_2==vermelho ; Maio_4==vermelho));
(Animal_4==passaros, (Maio_3==vermelho ; Maio_5==vermelho));
(Animal_5==passaros, Maio_4==vermelho)
),

%22)A garota que usa protetor FPS 55 está exatamente à direita da que gosta de suco de Maracujá.
(
(Protetor_2==fps55, Suco_1==maracuja);
(Protetor_3==fps55, Suco_2==maracuja);
(Protetor_4==fps55, Suco_3==maracuja);
(Protetor_5==fps55, Suco_4==maracuja)                                                 ),

%4)A garota de 7 anos está exatamente à esquerda da que está de maiô Branco.
(
(Idade_1==7, Maio_2==branco);
(Idade_2==7, Maio_3==branco);
(Idade_3==7, Maio_4==branco);
(Idade_4==7, Maio_5==branco)
),

%5)A garota de 10 anos está em algum lugar à direita da menina do maiô Azul.
(
(Maio_1==azul, (Idade_2==10 ; Idade_3==10 ; Idade_4==10;Idade_5==10));
(Maio_2==azul, (Idade_3==10 ; Idade_4==10 ; Idade_5==10));
(Maio_3==azul, (Idade_4==10 ; Idade_5==10));
(Maio_4==azul, Idade_5==10)
),

%7.     A garota de 9 anos está exatamente à direita da que gosta de Peixes.
(
(Idade_2==9, Animal_1==peixes);
(Idade_3==9, Animal_2==peixes);
(Idade_4==9, Animal_3==peixes);
(Idade_5==9, Animal_4==peixes)
),



nl,%insere uma nova linha (coloca o cursor no início da linha de baixo)
write('CHEGAMOS AO FIM DO MODELO')
.% fechando o modelo

%%%%%%%%%%%%%%%%%%%%%%%% Imprimindo a lista
imprime_lista([]):- write('\n\n FIM do imprime_lista \n').
imprime_lista([H|T]):-
	write('\n......................................\n'),
	write(H), write(' : '),
              imprime_lista(T).

/**********************************************************/
%% main fornece ponto de entrada para scripts
main :-
   %% statistics mostra informações sobre o uso de recursos
   %% Obtém o tempo inicial baseado no Tempo de CPU desde que o thread foi iniciado (em milissegundos).
    statistics(cputime,Tempo_inicial),

    %%chama modelo
    %% lembrando que modelo foi definido como:
    %%  modelo([
    %%     (Maio_1, Nome_1, Idade_1, Suco_1, Protetor_1, Animal_1),
    %%     (Maio_2, Nome_2, Idade_2, Suco_2, Protetor_2, Animal_2),
    %%     (Maio_3, Nome_3, Idade_3, Suco_3, Protetor_3, Animal_3),
    %%     (Maio_4, Nome_4, Idade_4, Suco_4, Protetor_4, Animal_4),
    %%     (Maio_5, Nome_5, Idade_5, Suco_5, Protetor_5, Animal_5)
    %%  ])

    modelo(  [Coluna1, Coluna2, Coluna3, Coluna4, Coluna5]  ),

    %%chama imprime_lista
    imprime_lista(  [Coluna1, Coluna2, Coluna3, Coluna4, Coluna5]  ),

    %% Obtém o tempo final baseado no Tempo de CPU desde que o thread foi iniciado (em milissegundos).
    statistics(cputime ,Tempo_final),
    Tempo_BUSCA is Tempo_final - Tempo_inicial,

    %%define o formato do tempo na saída
    format('\n Tempo inicial: ~f \t Tempo final: ~f  msec', [Tempo_inicial, Tempo_final]),
    format('\n Tempo total: ~10f  msec', Tempo_BUSCA),
    fail.
main :-

    nl,
    write('xxxx AQUI SOH PODE VIR UMA RESPOSTA ....'),
    nl,
    write('........ UFA apos o fail .......').

