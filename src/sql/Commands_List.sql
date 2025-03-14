




-- Cambiar, Nombre, Columna
ALTER TABLE public.countries
RENAME COLUMN enabled TO is_active;
--- END

-- Cambiar, Booleano, Columna
ALTER TABLE public.languages
ALTER COLUMN is_active SET DEFAULT false;
--- END

-- Verificar, Existe, Trigger
SELECT trigger_name, event_manipulation, action_statement
FROM information_schema.triggers
WHERE event_object_table = 'countries';
--- END

-- Listador de funciones
SELECT proname FROM pg_proc
JOIN pg_namespace ON pg_proc.pronamespace = pg_namespace.oid
WHERE nspname NOT IN ('pg_catalog', 'information_schema')
ORDER BY proname;
--- END

-- Listador de funciones mas complejo
    -- Explicación:
        -- pg_proc: Tabla interna que almacena las funciones.
        -- pg_namespace: Permite filtrar solo las funciones creadas por el usuario.
        -- pg_get_function_result(oid): Muestra el tipo de retorno de la función.
        -- pg_get_function_arguments(oid): Lista los parámetros de la función.
        -- prosrc: Código fuente de la función.
        -- nspname: Esquema al que pertenece la función.
SELECT proname, pg_catalog.pg_get_function_result(oid) AS return_type,
       pg_catalog.pg_get_function_arguments(oid) AS arguments,
       prosrc AS source_code, nspname AS schema
FROM pg_proc
JOIN pg_namespace ON pg_proc.pronamespace = pg_namespace.oid
WHERE nspname NOT IN ('pg_catalog', 'information_schema')
ORDER BY proname;
--- END

-- Comprobar si esta funcion existe?
SELECT proname, nspname
FROM pg_proc
JOIN pg_namespace ON pg_proc.pronamespace = pg_namespace.oid
WHERE proname = 'func_refresh_column_updated_at';

--- END
