-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Obtenga los apellidos que empiecen por las letras entre la 'd' y la 'k'. La 
-- salida esperada es la siguiente:
-- 
--   (Hamilton)
--   (Holcomb)
--   (Garrett)
--   (Fry)
--   (Kinney)
--   (Klein)
--   (Diaz)
--   (Guy)
--   (Estes)
--   (Jarvis)
--   (Knight)
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
fs -rm -f data.csv

fs -put -f data.csv .

u = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

t = FOREACH u GENERATE surname;

f = FILTER t BY (surname matches '.*D.*') OR (surname matches '.*E.*') OR (surname matches '.*F.*') OR (surname matches '.*G.*') OR (surname matches '.*H.*') OR (surname matches '.*I.*') OR (surname matches '.*J.*') OR (surname matches '.*K.*');

STORE f INTO 'output' ;

fs -get output .

fs -rm data.csv

fs -rm output/*

fs -rmdir output