-- FUNCTION: public.refresh_column_updated_at()

-- DROP FUNCTION IF EXISTS public.refresh_column_updated_at();

CREATE OR REPLACE FUNCTION public.refresh_column_updated_at()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$BODY$;

ALTER FUNCTION public.refresh_column_updated_at()
    OWNER TO postgres;
