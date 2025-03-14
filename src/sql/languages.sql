-- Table: public.languages

-- DROP TABLE IF EXISTS public.;

CREATE TABLE IF NOT EXISTS public.languages
(
    id integer NOT NULL DEFAULT nextval('languages_id_seq'::regclass),
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    name_code2 character(2) COLLATE pg_catalog."default" NOT NULL,
    name_code3 character(3) COLLATE pg_catalog."default" NOT NULL,
    direction character varying(3) COLLATE pg_catalog."default" NOT NULL,
    is_active boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT languages_pkey PRIMARY KEY (id),
    CONSTRAINT languages_direction_check CHECK (direction::text = ANY (ARRAY['LTR'::character varying, 'RTL'::character varying]::text[]))
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.languages
    OWNER to postgres;