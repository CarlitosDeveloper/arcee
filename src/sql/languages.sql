-- Table: public.languages

-- DROP TABLE IF EXISTS public.languages;

CREATE TABLE IF NOT EXISTS public.languages
(
    id integer NOT NULL DEFAULT nextval('languages_id_seq'::regclass),
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    name_code2 character(2) COLLATE pg_catalog."default" NOT NULL,
    name_code3 character(3) COLLATE pg_catalog."default" NOT NULL,
    direction character(3) COLLATE pg_catalog."default" NOT NULL,
    is_active boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT languages_pkey PRIMARY KEY (id),
    CONSTRAINT languages_direction_check CHECK (direction::text = ANY (ARRAY['LTR'::character varying::text, 'RTL'::character varying::text]))
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.languages
    OWNER to postgres;

COMMENT ON TABLE public.languages
    IS 'Tabla que almacena los idiomas soportados por la aplicación, incluyendo códigos ISO y dirección de escritura.';

COMMENT ON COLUMN public.languages.id
    IS 'Identificador único del idioma (clave primaria).';

COMMENT ON COLUMN public.languages.name
    IS 'Nombre del idioma (Ej: Español, English, Français).';

COMMENT ON COLUMN public.languages.name_code2
    IS 'Código ISO de 2 letras del idioma (Ej: "es", "en", "fr").';

COMMENT ON COLUMN public.languages.name_code3
    IS 'Código ISO de 3 letras del idioma (Ej: "spa", "eng", "fra").';

COMMENT ON COLUMN public.languages.direction
    IS 'Dirección del texto: "LTR" (Left to Right) o "RTL" (Right to Left).';

COMMENT ON COLUMN public.languages.is_active
    IS 'Indica si el idioma está activo (true) o inactivo (false).';

COMMENT ON COLUMN public.languages.created_at
    IS 'Fecha y hora de creación del registro.';

COMMENT ON COLUMN public.languages.updated_at
    IS 'Fecha y hora de la última modificación del registro.';
COMMENT ON CONSTRAINT languages_pkey ON public.languages
    IS 'Clave primaria basada en la columna id.';

COMMENT ON CONSTRAINT languages_direction_check ON public.languages
    IS 'Valida que la dirección del texto sea "LTR" o "RTL".';

-- Trigger: trigger_languages_refresh_column_updated_at

-- DROP TRIGGER IF EXISTS trigger_languages_refresh_column_updated_at ON public.languages;

CREATE OR REPLACE TRIGGER trigger_languages_refresh_column_updated_at
    BEFORE UPDATE 
    ON public.languages
    FOR EACH ROW
    EXECUTE FUNCTION public.refresh_column_updated_at();

COMMENT ON TRIGGER trigger_languages_refresh_column_updated_at ON public.languages
    IS 'Trigger que actualiza automáticamente la columna updated_at antes de cualquier UPDATE.';