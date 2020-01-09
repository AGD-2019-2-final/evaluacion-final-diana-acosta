-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra. 
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
fs -rm -f data.tsv

fs -put -f data.tsv .

lines= LOAD 'data.tsv' USING PigStorage()
    AS (letra:CHARARRAY,
        fecha:CHARARRAY,
        valor:INT
        );

words = FOREACH lines GENERATE FLATTEN(TOKENIZE(letra)) AS word;

grouped = GROUP words BY word;

wordcount = FOREACH grouped GENERATE group, COUNT(words);

STORE wordcount INTO 'output';

fs -get output .

fs -rm data.tsv

fs -rm output/*

fs -rmdir output