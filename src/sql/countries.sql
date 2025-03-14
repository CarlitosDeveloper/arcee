-- Table: public.countries

-- DROP TABLE IF EXISTS public.countries;

CREATE TABLE IF NOT EXISTS public.countries
(
    id integer NOT NULL DEFAULT nextval('countries_id_seq'::regclass),
    name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    name_code2 character varying(2) COLLATE pg_catalog."default" NOT NULL,
    name_code3 character varying(3) COLLATE pg_catalog."default" NOT NULL,
    phone_code smallint NOT NULL,
    is_active boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT countries_pkey PRIMARY KEY (id),
    CONSTRAINT countries_name_code2_key UNIQUE (name_code2),
    CONSTRAINT countries_name_code3_key UNIQUE (name_code3),
    CONSTRAINT countries_name_key UNIQUE (name),
    CONSTRAINT countries_name_code2_check CHECK (char_length(name_code2::text) = 2),
    CONSTRAINT countries_name_code3_check CHECK (char_length(name_code3::text) = 3),
    CONSTRAINT chk_phone_code CHECK (phone_code > 0)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.countries
    OWNER to postgres;
-- Index: idx_countries_name

-- DROP INDEX IF EXISTS public.idx_countries_name;

CREATE INDEX IF NOT EXISTS idx_countries_name
    ON public.countries USING btree
    (name COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Trigger: trigger_countries_refresh_column_updated_at

-- DROP TRIGGER IF EXISTS trigger_countries_refresh_column_updated_at ON public.countries;

CREATE OR REPLACE TRIGGER trigger_countries_refresh_column_updated_at
    BEFORE UPDATE 
    ON public.countries
    FOR EACH ROW
    EXECUTE FUNCTION public.func_refresh_column_updated_at();

-- Trigger: trigger_languages_refresh_column_updated_at
