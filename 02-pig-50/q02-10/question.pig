-- Pregunta
-- ===========================================================================
-- 
-- Ordene el archivo `data.tsv`  por letra y valor (3ra columna).
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
--  >>> Escriba el codigo del mapper a partir de este punto <<<
-- 

lines= LOAD 'data.tsv' AS (letra:CHARARRAY,
        fecha:CHARARRAY,
        valor:INT
        );

ordenadas = ORDER lines BY letra, valor ;

STORE ordenadas INTO 'output';

fs -get output .

fs -rm data.tsv

fs -rm output/*

fs -rmdir output
