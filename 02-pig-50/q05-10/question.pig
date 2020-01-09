-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
-- aparece cada letra minúscula en la columna 2.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
fs -rm -f data.tsv

fs -put -f data.tsv .

lines= LOAD 'data.tsv' USING PigStorage() AS (
    f1:CHARARRAY,
    f2:BAG{t: TUPLE()},
    f3:MAP[]
);

c2 = FOREACH lines GENERATE FLATTEN(f2) AS f1;

letras = FOREACH c2 GENERATE FLATTEN(TOKENIZE(f1)) AS letra;

grouped = GROUP letras BY letra;

lettercount = FOREACH grouped GENERATE group, COUNT(letras);

STORE lettercount INTO 'output';

fs -get output .

fs -rm data.tsv

fs -rm output/*

fs -rmdir output