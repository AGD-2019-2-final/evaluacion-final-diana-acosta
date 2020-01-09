-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Cuente la cantidad de personas nacidas por año.
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
t = FOREACH u GENERATE 
    firstname,
    GetYear(ToDate(birthday, 'yyyy-MM-dd')) AS f2;

v = GROUP t BY f2;

g = FOREACH v GENERATE group, COUNT(t);

STORE g INTO 'output' USING PigStorage(',');

fs -get output .

fs -rm data.csv

fs -rm output/*

fs -rmdir output