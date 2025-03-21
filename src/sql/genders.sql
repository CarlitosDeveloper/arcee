-- Table: public.genders

-- DROP TABLE IF EXISTS public.genders;

CREATE TABLE IF NOT EXISTS public.genders
(
    id boolean NOT NULL,
    name character varying COLLATE pg_catalog."default" NOT NULL,
    short_name character(1) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT genders_pkey PRIMARY KEY (id),
    CONSTRAINT genders_name_key UNIQUE (name),
    CONSTRAINT genders_short_name_key UNIQUE (short_name)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.genders
    OWNER to postgres;

COMMENT ON TABLE public.genders
    IS 'Tabla que almacena los géneros "Hombre" y "Mujer", representados con valores booleanos (true/false) y en inglés.';

COMMENT ON COLUMN public.genders.id
    IS 'Identificador del género: true (1) = Hombre, false (0) = Mujer.';

COMMENT ON COLUMN public.genders.name
    IS 'Nombre completo del género (Ej: Masculino, Femenino).';

COMMENT ON COLUMN public.genders.short_name
    IS 'Abreviatura del género (Ej: M para Masculino, F para Femenino).';
COMMENT ON CONSTRAINT genders_pkey ON public.genders
    IS 'Clave primaria basada en la columna id (tipo boolean).';

COMMENT ON CONSTRAINT genders_name_key ON public.genders
    IS 'Restricción de unicidad sobre el nombre completo del género.';
COMMENT ON CONSTRAINT genders_short_name_key ON public.genders
    IS 'Restricción de unicidad sobre la abreviatura del género.';