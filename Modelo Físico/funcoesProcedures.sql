---------- firstIsFriendSecond-------------

CREATE OR REPLACE PROCEDURE firstIsFriendSecond(id1 IN jogador.id%TYPE, nick1 IN jogador.nickname%TYPE, id2 IN jogador.id%TYPE, nick2 IN jogador.nickname%TYPE)
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




