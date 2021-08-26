-- Trigger Inseção em Participa
CREATE OR REPLACE TRIGGER INSERCAO_PARTICIPA BEFORE INSERT ON PARTICIPA FOR EACH ROW DECLARE
    cntr_total NUMBER(1) := 0;
    cntr_time NUMBER(1) := 0;
    is_in NUMBER(1) := 0;
BEGIN
    FOR reg_pXp IN
        (SELECT *
        FROM PARTIDA P1 INNER JOIN PARTICIPA P2 ON P1.CODIGO = P2.CODIGO
        WHERE P1.CODIGO = :NEW.CODIGO)
    LOOP
    cntr_total := cntr_total + 1;

    IF reg_pXp.TIME = :NEW.TIME
    THEN cntr_time := cntr_time + 1;
    END IF;

    IF cntr_time >= 3
    THEN RAISE_APPLICATION_ERROR(-20205, 'Time já está cheio\n');
    ELSIF cntr_total >= 6
    THEN RAISE_APPLICATION_ERROR(-20205, 'Partida já está lotada\n');
    END IF;

    END LOOP;
    FOR reg_p IN (SELECT * FROM POSSUI WHERE :NEW.ID = POSSUI.ID AND :NEW.NICKNAME = POSSUI.NICK)
    LOOP
        IF(reg_p.NOME = :NEW.CAMPEAO) THEN
            is_in := 1;
        END IF;
    EXIT WHEN is_in = 1;
    END LOOP;

    IF is_in = 0
    THEN RAISE_APPLICATION_ERROR(-20205, 'Jogador não possui esse personagem\n');
    END IF;
END;