-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código en Pig para manipulación de fechas que genere la siguiente 
-- salida.
-- 
--    1971-07-08,jul,07,7
--    1974-05-23,may,05,5
--    1973-04-22,abr,04,4
--    1975-01-29,ene,01,1
--    1974-07-03,jul,07,7
--    1974-10-18,oct,10,10
--    1970-10-05,oct,10,10
--    1969-02-24,feb,02,2
--    1974-10-17,oct,10,10
--    1975-02-28,feb,02,2
--    1969-12-07,dic,12,12
--    1973-12-24,dic,12,12
--    1970-08-27,ago,08,8
--    1972-12-12,dic,12,12
--    1970-07-01,jul,07,7
--    1974-02-11,feb,02,2
--    1973-04-01,abr,04,4
--    1973-04-29,abr,04,4
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
    birthday, 
    CASE GetMonth(ToDate(birthday, 'yyyy-MM-dd'))
    WHEN 1 THEN 'ene'
    WHEN 2 THEN 'feb'
    WHEN 3 THEN 'mar'
    WHEN 4 THEN 'abr'
    WHEN 5 THEN 'may'
    WHEN 6 THEN 'jun'
    WHEN 7 THEN 'jul'
    WHEN 8 THEN 'ago'
    WHEN 9 THEN 'sep'
    WHEN 10 THEN 'oct'
    WHEN 11 THEN 'nov'
    ELSE 'dic'
    END,
    CASE GetMonth(ToDate(birthday, 'yyyy-MM-dd'))
    WHEN 1 THEN '01'
    WHEN 2 THEN '02'
    WHEN 3 THEN '03'
    WHEN 4 THEN '04'
    WHEN 5 THEN '05'
    WHEN 6 THEN '06'
    WHEN 7 THEN '07'
    WHEN 8 THEN '08'
    WHEN 9 THEN '09'
    WHEN 10 THEN '10'
    WHEN 11 THEN '11'
    ELSE '12'
    END,
    GetMonth(ToDate(birthday, 'yyyy-MM-dd')
    );

STORE t INTO 'output' USING PigStorage(',');

fs -get output .

fs -rm data.csv

fs -rm output/*

fs -rmdir output