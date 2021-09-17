---------- firstIsFriendSecond-------------
create or replace PROCEDURE firstIsFriendSecond(id1 IN jogador.id%TYPE, nick1 IN jogador.nickname%TYPE, 
id2 IN jogador.id%TYPE, nick2 IN jogador.nickname%TYPE)
IS
qtd NUMBER;
BEGIN
    SELECT COUNT(*) INTO qtd FROM AMIZADE A WHERE (A.lista_nick = nick1 AND a.lista_id = id1) AND (A.amigo_nick = nick2 AND a.amigo_id = id2);
    IF qtd > 0 THEN
        dbms_output.put_line(nick1||' é amigo de '||nick2);
    ELSE
    dbms_output.put_line(nick1||' não é amigo de '||nick2);
    END IF;
END;
---------------

--------------------------FUNÇÃO KDA--------------------------
create or replace FUNCTION KDA (abates NUMBER,assistencias NUMBER, mortes NUMBER) RETURN
NUMBER IS
kda NUMBER;
BEGIN
    BEGIN
        IF (mortes<=0) THEN
            kda := (abates+(assistencias/2));
        ELSE
            kda := (abates+(assistencias/2))/mortes;
        END IF;
    END;
    RETURN kda;
END;
---------------------------------------------------------

-----------------------------FUNÇÃO KDA POR PARTIDA DE UM JOGADOR-------------------------------------------
create or replace FUNCTION KDAP(ID participa.id%TYPE,NICK participa.nickname%TYPE,COD partida.codigo%TYPE ) 
RETURN NUMBER IS
    kdaP NUMBER;
    BEGIN
        SELECT KDA(P.KILL,P.ASSIST,P.DEATH) INTO kdap
        FROM participa P
        WHERE p.codigo = COD AND P.ID = ID AND P.NICKNAME = NICK;
        RETURN kdap;
    END;
-----------------------------

--------------------------------DICIONÁRIO-----------------------------------------------------------
create or replace PROCEDURE DICIONARIO(STR VARCHAR2) IS BEGIN
    FOR LINHA IN (SELECT * FROM
        (
        SELECT P.NOME FROM PERSONAGEM P
        UNION
        SELECT I.NOME FROM ITEM I
        )
        UN WHERE UPPER(UN.NOME) LIKE '%'||UPPER(STR)||'%')
    LOOP
    dbms_output.put_line(LINHA.NOME);
    END LOOP;
END;
------------------------------------

-------------------------------------TOTAL DE VITÓRIAS DE UM JOGADOR---------------------------------------
CREATE OR REPLACE FUNCTION VITORIAS_JOGADOR(in_id JOGADOR.ID%TYPE, in_nick JOGADOR.NICKNAME%TYPE)
RETURN NUMBER IS ret NUMBER(8);
BEGIN
    FOR LINHA IN (  SELECT J.ID, J.NICKNAME, COUNT(P.CODIGO) as QTD
                    FROM JOGADOR J LEFT OUTER JOIN PARTICIPA P ON P.NICKNAME = J.NICKNAME AND J.ID = P.ID
                    WHERE J.ID = in_id AND J.NICKNAME = in_nick AND P.TIME = (SELECT PARTIDA.TIME_V FROM PARTIDA WHERE PARTIDA.CODIGO = P.CODIGO)
                    GROUP BY (J.ID, J.NICKNAME)
                    ORDER BY J.ID, J.NICKNAME)
    LOOP
    ret := LINHA.QTD;
    END LOOP;
    return ret;
END;
-----------------------------------------------------------------

--- Inserir um personagem
CREATE OR REPLACE PROCEDURE INSERIR_PERSONAGEM(NOME VARCHAR2, HP NUMBER, ARMADURA NUMBER, ATAQUE NUMBER, PODER NUMBER, V_ATAQUE NUMBER, V_MOVIMENTO NUMBER, C_TYPE VARCHAR, EXTRA NUMBER)
IS

BEGIN
    IF(UPPER(C_TYPE) = 'OFENSIVO') THEN
        INSERT INTO PERSONAGEM(NOME,HP,ATAQUE,PODER,ARMADURA,V_ATAQUE,V_MOVIMENTO)
        VALUES (NOME, HP, ARMADURA, ATAQUE, PODER, V_ATAQUE, V_MOVIMENTO);
        INSERT INTO OFENSIVO(NOME, CRITICO)
        VALUES (NOME,EXTRA);
    ELSIF(UPPER(C_TYPE) = 'DEFENSIVO') THEN
        INSERT INTO PERSONAGEM(NOME,HP,ATAQUE,PODER,ARMADURA,V_ATAQUE,V_MOVIMENTO)
        VALUES (NOME, HP, ARMADURA, ATAQUE, PODER, V_ATAQUE, V_MOVIMENTO);
        INSERT INTO DEFENSIVO(NOME, RESISTENCIA)
        VALUES (NOME,EXTRA);
    ELSIF(UPPER(C_TYPE) = 'SUPORTE') THEN
        INSERT INTO PERSONAGEM(NOME,HP,ATAQUE,PODER,ARMADURA,V_ATAQUE,V_MOVIMENTO)
        VALUES (NOME, HP, ARMADURA, ATAQUE, PODER, V_ATAQUE, V_MOVIMENTO);
        INSERT INTO SUPORTE(NOME, CURA)
        VALUES (NOME,EXTRA);
    ELSE
        RAISE_APPLICATION_ERROR(-20205, 'Classe de personagem inválida\n');
    END IF;
    COMMIT;
END;
----------------------

------ Obter Classe ------
CREATE OR REPLACE FUNCTION OBTER_CLASSE_PERSONAGEM(C_NOME VARCHAR2)
RETURN VARCHAR2
IS
    Q_SIZE NUMBER := 0;
BEGIN
    SELECT COUNT(*) INTO Q_SIZE FROM OFENSIVO O WHERE O.NOME = C_NOME;
    IF Q_SIZE > 0 THEN
        RETURN 'Ofensivo';
    END IF;
    SELECT COUNT(*) INTO Q_SIZE FROM DEFENSIVO D WHERE D.NOME = C_NOME;
    IF Q_SIZE > 0 THEN
        RETURN 'Defensivo';
    END IF;
    SELECT COUNT(*) INTO Q_SIZE FROM SUPORTE S WHERE S.NOME = C_NOME;
    IF Q_SIZE > 0 THEN
        RETURN 'Suporte';
    END IF;
     RETURN 'Personagem inexistente';
END;
--------

