-- Ofensivos
INSERT INTO PERSONAGENS(NOME,HP,ATAQUE,PODER,ARMADURA,V_ATAQUE,V_MOVIMENTO)
VALUES ('Scincus', 100, 130, 40, 50, 120, 140);
INSERT INTO OFENSIVO(NOME, CRITICO)
VALUES ('Scincus',15);
-- Lagarto do deserto
INSERT INTO PERSONAGENS(NOME,HP,ATAQUE,PODER,ARMADURA,V_ATAQUE,V_MOVIMENTO)
VALUES ('Lupus', 90, 71, 191, 98, 199, 148);
INSERT INTO OFENSIVO(NOME, CRITICO)
VALUES ('Lupus',20);
-- lobo
INSERT INTO PERSONAGENS(NOME,HP,ATAQUE,PODER,ARMADURA,V_ATAQUE,V_MOVIMENTO)
VALUES ('Strigs', 131, 55, 123, 189, 124, 132);
INSERT INTO OFENSIVO(NOME, CRITICO)
VALUES ('Strigs', 25);
-- coruja
INSERT INTO PERSONAGENS(NOME,HP,ATAQUE,PODER,ARMADURA,V_ATAQUE,V_MOVIMENTO)
VALUES ('Aries', 53, 168, 78, 182, 152, 158);
INSERT INTO OFENSIVO(NOME, CRITICO)
VALUES ('Aries',20);
-- carneiro
INSERT INTO PERSONAGENS(NOME,HP,ATAQUE,PODER,ARMADURA,V_ATAQUE,V_MOVIMENTO)
VALUES ('Hyaen', 66, 57, 126, 137, 111, 132);
INSERT INTO OFENSIVO(NOME, CRITICO)
VALUES ('Hyaen', 20);
-- Hyena
INSERT INTO PERSONAGENS(NOME,HP,ATAQUE,PODER,ARMADURA,V_ATAQUE,V_MOVIMENTO)
VALUES ('Alpheus', 190, 163, 66, 62, 65, 171);
INSERT INTO OFENSIVO(NOME, CRITICO)
VALUES ('Alpheus',25);
-- Camarão estalo
INSERT INTO PERSONAGENS(NOME,HP,ATAQUE,PODER,ARMADURA,V_ATAQUE,V_MOVIMENTO)
VALUES ('Crotal', 174, 148, 74, 116, 179, 62);
INSERT INTO OFENSIVO(NOME, CRITICO)
VALUES ('Crotal', 15);
-- Cascável

-- Defensivos
INSERT INTO PERSONAGENS(NOME,HP,ATAQUE,PODER,ARMADURA,V_ATAQUE,V_MOVIMENTO)
VALUES ('Talpi', 153, 182, 131, 138, 143, 124);
INSERT INTO DEFENSIVO(NOME, RESISTENCIA)
VALUES ('Talpi', 25);
-- Toupeira
INSERT INTO PERSONAGENS(NOME,HP,ATAQUE,PODER,ARMADURA,V_ATAQUE,V_MOVIMENTO)
VALUES ('Manid', 159, 141, 113, 184, 75, 190);
INSERT INTO DEFENSIVO(NOME, RESISTENCIA)
VALUES ('Manid', 30);
-- pangolim
INSERT INTO PERSONAGENS(NOME,HP,ATAQUE,PODER,ARMADURA,V_ATAQUE,V_MOVIMENTO)
VALUES ('Bison', 186, 178, 56, 70, 158, 155);
INSERT INTO DEFENSIVO(NOME, RESISTENCIA)
VALUES ('Bison',15);
-- Bisão
INSERT INTO PERSONAGENS(NOME,HP,ATAQUE,PODER,ARMADURA,V_ATAQUE,V_MOVIMENTO)
VALUES ('Hercules', 131, 104, 130, 77, 108, 122);
INSERT INTO DEFENSIVO(NOME, RESISTENCIA)
VALUES ('Hercules',20);
-- Besouro (kabuto)
INSERT INTO PERSONAGENS(NOME,HP,ATAQUE,PODER,ARMADURA,V_ATAQUE,V_MOVIMENTO)
VALUES ('Ursus', 167, 191, 136, 54, 87, 151);
INSERT INTO DEFENSIVO(NOME, RESISTENCIA)
VALUES ('Ursus', 10);
-- Urso
INSERT INTO PERSONAGENS(NOME,HP,ATAQUE,PODER,ARMADURA,V_ATAQUE,V_MOVIMENTO)
VALUES ('Birgus', 86, 127, 122, 189, 61, 95);
INSERT INTO DEFENSIVO(NOME, RESISTENCIA)
VALUES ('Birgus', 20);
-- Carangueijo coqueiro
INSERT INTO PERSONAGENS(NOME,HP,ATAQUE,PODER,ARMADURA,V_ATAQUE,V_MOVIMENTO)
VALUES ('Rhino', 110, 193, 161, 79, 138, 91);
INSERT INTO DEFENSIVO(NOME, RESISTENCIA)
VALUES ('Rhino', 15);
-- Rinoceronte

-- Suporte
INSERT INTO PERSONAGENS(NOME,HP,ATAQUE,PODER,ARMADURA,V_ATAQUE,V_MOVIMENTO)
VALUES ('Anura', 77, 64, 51, 134, 86, 52);
INSERT INTO SUPORTE(NOME, CURA)
VALUES ('Anura', 30);
-- Sapo venenoso
INSERT INTO PERSONAGENS(NOME,HP,ATAQUE,PODER,ARMADURA,V_ATAQUE,V_MOVIMENTO)
VALUES ('Suidae', 115, 181, 116, 50, 162, 178);
INSERT INTO SUPORTE(NOME, CURA)
VALUES ('Suidae', 15);
-- Porco
INSERT INTO PERSONAGENS(NOME,HP,ATAQUE,PODER,ARMADURA,V_ATAQUE,V_MOVIMENTO)
VALUES ('Rose', 97, 51, 133, 80, 58, 127);
INSERT INTO SUPORTE(NOME, CURA)
VALUES ('Rose', 15);
-- Flamingo
INSERT INTO PERSONAGENS(NOME,HP,ATAQUE,PODER,ARMADURA,V_ATAQUE,V_MOVIMENTO)
VALUES ('Vultur', 53, 79, 78, 115, 99, 181);
INSERT INTO SUPORTE(NOME, CURA)
VALUES ('Vultur', 30);
-- urubu
INSERT INTO PERSONAGENS(NOME,HP,ATAQUE,PODER,ARMADURA,V_ATAQUE,V_MOVIMENTO)
VALUES ('Aniso', 145, 180, 90, 186, 83, 103);
INSERT INTO SUPORTE(NOME, CURA)
VALUES ('Aniso', 25);
-- Libélula
INSERT INTO PERSONAGENS(NOME,HP,ATAQUE,PODER,ARMADURA,V_ATAQUE,V_MOVIMENTO)
VALUES ('Bato', 143, 84, 169, 111, 146, 174);
INSERT INTO SUPORTE(NOME, CURA)
VALUES ('Bato', 20);
-- Arraia
INSERT INTO PERSONAGENS(NOME,HP,ATAQUE,PODER,ARMADURA,V_ATAQUE,V_MOVIMENTO)
VALUES ('Novem', 78, 150, 63, 71, 109, 152);
INSERT INTO SUPORTE(NOME, CURA)
VALUES ('Novem', 15);
-- tatu

-- Protege
INSERT INTO PROTEGE(DEF_NOME, SUP_NOME, EXALTACAO)
VALUES ('Talpi', 'Anura', 30);

INSERT INTO PROTEGE(DEF_NOME, SUP_NOME, EXALTACAO)
VALUES ('Bison', 'Suidae', 25);

INSERT INTO PROTEGE(DEF_NOME, SUP_NOME, EXALTACAO)
VALUES ('Rhino', 'Novem', 20);

INSERT INTO PROTEGE(DEF_NOME, SUP_NOME, EXALTACAO)
VALUES ('Birgus', 'Bato', 20);

-- Parceria
INSERT INTO PARCERIA(OF_NOME, DEF_NOME, MITIGACAO)
VALUES('Aries','Talpi', 30);

INSERT INTO PARCERIA(OF_NOME, DEF_NOME, MITIGACAO)
VALUES('Crotal','Rhino', 30);

INSERT INTO PARCERIA(OF_NOME, DEF_NOME, MITIGACAO)
VALUES('Hyaen','Bison', 20);

INSERT INTO PARCERIA(OF_NOME, DEF_NOME, MITIGACAO)
VALUES('Alpheus','Birgus', 25);