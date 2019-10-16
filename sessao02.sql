/*SESSAO 2*/

--v)
BEGIN
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
UPDATE Jogador
SET idequipe = 4
WHERE RG = 111111111
COMMIT;

--1vi) Repita o passo iv – o que aconteceu e por quê? 
-- 	Retornou os dados iniciais sem nenhuma alteracao, porque ainda nao haviamos executado o comando de confirmacao, o commit

--2vi) Repita o passo iv – o que aconteceu e por quê? 
 --apos o commit realizado na sessao2, os dados na sessao1 foram atualizados.
/*8*/
--a)
BEGIN
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
INSERT INTO Equipe VALUES(10, 'Portuguesa', 'SP', 'Profissional', 10)
COMMIT;

--b)
BEGIN
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO Equipe VALUES(11, 'Bragantino', 'SP', 'Profissional', 13)
COMMIT;

/*9*/
--a)

BEGIN
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
UPDATE Jogador
SET idequipe = 4
WHERE RG = 111111112;

--iii) a sessao 2 ficou impossibilitada de executar novos comandos, em outras palavras a sessao 2 ficou em execucao ate que fosse executado um commit na sessao 1.
--iv) apos realizar o commit na sessao 1, o terminal retornou a seguinte mensagem "Query returned successfully: one row affected, 02:55 minutes execution time.". Indicando que somente apos o commit que a sessao 2 voltou ao normal e que poderia executar novos comandos

--b)
BEGIN
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
UPDATE Jogador
SET idequipe = 4
WHERE RG = 111111112;

--iii) a sessao 2 ficou impossibilitada de executar novos comandos, em outras palavras a sessao 2 ficou em execucao ate que fosse executado um commit na sessao 1.
--iv) apos realizar o commit na sessao 1, o terminal retornou uma mensagem dizendo que nao eh possivel serializar a tupla devido a atualizacao simultanea

--c)
BEGIN
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
UPDATE Jogador
SET idequipe = 5
WHERE RG = 111111113;

--v)
--iii) a sessao 2 ficou impossibilitada de executar novos comandos, em outras palavras a sessao 2 ficou em execucao ate que fosse executado o rollback na sessao 1.
--iv) apos realizar o rollback na sessao 1, o terminal retornou a seguinte mensagem "Query returned successfully: one row affected, 9.8 secs execution time." Indicando que somente apos o rollback que a sessao 2 voltou ao normal e que poderia executar novos comandos
