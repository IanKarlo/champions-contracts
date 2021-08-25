--- Quantidade de jogadores------
DECLARE
    quantidade number;
BEGIN
    SELECT COUNT(NICKNAME) INTO quantidade
    from JOGADOR;
    dbms_output.put_line('Quantidade: '||quantidade);
END;
--------------------------------


SELECT P.NOME, P.HP, P.ATAQUE, P.PODER, P.ARMADURA, P.V_ATAQUE, P.V_MOVIMENTO, D.RESISTENCIA
FROM PERSONAGEM P INNER JOIN DEFENSIVO D
    ON P.NOME = D.NOME

--GET BESTEST MVP OF ALL TIME
SELECT ID, NICKNAME, KDA
FROM     (
        SELECT ID, NICKNAME, S_KILL/S_DEATH + S_ASSIST AS KDA
        FROM(
                SELECT     ID, NICKNAME, SUM(KILL) AS S_KILL, SUM(DEATH) AS S_DEATH, SUM(ASSIST) AS S_ASSIST
                FROM    PARTICIPA
                WHERE     KILL IS NOT NULL AND DEATH IS NOT NULL AND ASSIST IS NOT NULL
                GROUP BY (ID, NICKNAME)
            )
        )
WHERE KDA = (
                SELECT MAX(KDA) 
                FROM(
                        SELECT ID, NICKNAME, S_KILL/S_DEATH + S_ASSIST AS KDA
                        FROM(
                                SELECT     ID, NICKNAME, SUM(KILL) AS S_KILL, SUM(DEATH) AS S_DEATH, SUM(ASSIST) AS S_ASSIST
                                FROM    PARTICIPA
                                WHERE     KILL IS NOT NULL AND DEATH IS NOT NULL AND ASSIST IS NOT NULL
                                GROUP BY (ID, NICKNAME)
                            )
                    )
            );

SELECT NICKNAME, AVG(KILL) MEDIA_KILL FROM PARTICIPA
    GROUP BY NICKNAME
    ORDER BY MEDIA_KILL
