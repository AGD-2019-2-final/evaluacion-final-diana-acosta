-- Pregunta
-- ===========================================================================
-- 
-- Obtenga los cinco (5) valores más pequeños de la 3ra columna.
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
fs -rm -f data.tsv

fs -put -f data.tsv

lines= LOAD 'data.tsv' AS (letra:CHARARRAY,
        fecha:CHARARRAY,
        valor:INT
        );

ordenadas = ORDER lines BY valor;

col = FOREACH ordenadas GENERATE valor;

s = LIMIT col 5;

STORE s INTO 'output';

fs -get output .

fs -rm data.tsv

fs -rm output/*

fs -rmdir output