--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-03-14 10:20:18

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 239 (class 1255 OID 17306)
-- Name: update_gender_translations_timestamp(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_gender_translations_timestamp() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.update_gender_translations_timestamp() OWNER TO postgres;

--
-- TOC entry 238 (class 1255 OID 17303)
-- Name: update_timestamp(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_timestamp() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.update_timestamp() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 235 (class 1259 OID 17245)
-- Name: account_statuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_statuses (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    slug character varying(50) NOT NULL,
    color_code character(7) NOT NULL
);


ALTER TABLE public.account_statuses OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 17244)
-- Name: account_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.account_statuses_id_seq OWNER TO postgres;

--
-- TOC entry 4966 (class 0 OID 0)
-- Dependencies: 234
-- Name: account_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_statuses_id_seq OWNED BY public.account_statuses.id;


--
-- TOC entry 237 (class 1259 OID 17256)
-- Name: accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts (
    id integer NOT NULL,
    status_id integer DEFAULT 1,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    is_premium boolean,
    buy_starts timestamp without time zone,
    buy_ends timestamp without time zone,
    user_name character varying(20),
    first_name character varying(100),
    last_name character varying(100),
    gender_id boolean,
    birthdate date,
    profile_picture text,
    bio text,
    email character varying(255) NOT NULL,
    password_hash text NOT NULL,
    phone character varying(20),
    is_verified_account boolean DEFAULT false,
    is_verified_user boolean DEFAULT false,
    has_2fa_enabled boolean DEFAULT false,
    last_login timestamp without time zone,
    last_password_change timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    failed_login_attempts integer DEFAULT 0,
    language_id integer,
    timezone character varying(50) DEFAULT 'UTC'::character varying,
    uses_dark_mode boolean DEFAULT false,
    notify_email boolean DEFAULT true,
    notify_sms boolean DEFAULT false,
    notify_push boolean DEFAULT true,
    country_id integer,
    state character varying(100),
    city character varying(100),
    street character varying(255),
    postal_code character varying(20)
);


ALTER TABLE public.accounts OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 17255)
-- Name: accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.accounts_id_seq OWNER TO postgres;

--
-- TOC entry 4967 (class 0 OID 0)
-- Dependencies: 236
-- Name: accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_id_seq OWNED BY public.accounts.id;


--
-- TOC entry 233 (class 1259 OID 17039)
-- Name: addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.addresses (
    id integer NOT NULL,
    account_id integer,
    street character varying(255),
    city character varying(100),
    state character varying(100),
    postal_code character varying(20),
    country_id integer
);


ALTER TABLE public.addresses OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 17038)
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.addresses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.addresses_id_seq OWNER TO postgres;

--
-- TOC entry 4968 (class 0 OID 0)
-- Dependencies: 232
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.addresses_id_seq OWNED BY public.addresses.id;


--
-- TOC entry 227 (class 1259 OID 16636)
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities (
    id integer NOT NULL,
    state_id integer NOT NULL,
    name character varying(100) NOT NULL,
    enabled boolean DEFAULT true
);


ALTER TABLE public.cities OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16635)
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cities_id_seq OWNER TO postgres;

--
-- TOC entry 4969 (class 0 OID 0)
-- Dependencies: 226
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- TOC entry 220 (class 1259 OID 16567)
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.countries (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    name_code2 character(2) NOT NULL,
    name_code3 character(3) NOT NULL,
    phone_code character varying(10) NOT NULL,
    is_active boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.countries OWNER TO postgres;

--
-- TOC entry 4970 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE countries; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.countries IS 'Tabla que almacena los países con sus códigos y prefijos telefónicos.';


--
-- TOC entry 4971 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN countries.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.countries.id IS 'Identificador único del país.';


--
-- TOC entry 4972 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN countries.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.countries.name IS 'Nombre completo del país.';


--
-- TOC entry 4973 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN countries.name_code2; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.countries.name_code2 IS 'Código de país de 2 letras según ISO 3166-1 alpha-2.';


--
-- TOC entry 4974 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN countries.name_code3; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.countries.name_code3 IS 'Código de país de 3 letras según ISO 3166-1 alpha-3.';


--
-- TOC entry 4975 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN countries.phone_code; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.countries.phone_code IS 'Código telefónico internacional del país.';


--
-- TOC entry 4976 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN countries.is_active; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.countries.is_active IS 'Indica si el país está activo (true) o inactivo (false).';


--
-- TOC entry 4977 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN countries.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.countries.created_at IS 'Fecha y hora en que se creó el registro. Se establece automáticamente al insertar un nuevo país.';


--
-- TOC entry 4978 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN countries.updated_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.countries.updated_at IS 'Fecha y hora de la última actualización del registro. Se actualiza automáticamente en cada modificación.';


--
-- TOC entry 219 (class 1259 OID 16566)
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.countries_id_seq OWNER TO postgres;

--
-- TOC entry 4979 (class 0 OID 0)
-- Dependencies: 219
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;


--
-- TOC entry 223 (class 1259 OID 16602)
-- Name: gender_translations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gender_translations (
    id integer NOT NULL,
    gender_id boolean,
    language_id integer NOT NULL,
    name character varying(20) NOT NULL,
    short_name character(1) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.gender_translations OWNER TO postgres;

--
-- TOC entry 4980 (class 0 OID 0)
-- Dependencies: 223
-- Name: TABLE gender_translations; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.gender_translations IS 'Tabla que almacena las traducciones de los géneros en diferentes idiomas.';


--
-- TOC entry 4981 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN gender_translations.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.gender_translations.id IS 'Identificador único de la traducción.';


--
-- TOC entry 4982 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN gender_translations.gender_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.gender_translations.gender_id IS 'Referencia al género (true = Hombre, false = Mujer).';


--
-- TOC entry 4983 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN gender_translations.language_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.gender_translations.language_id IS 'Referencia al idioma en la tabla languages.';


--
-- TOC entry 4984 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN gender_translations.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.gender_translations.name IS 'Nombre del género traducido en el idioma correspondiente.';


--
-- TOC entry 4985 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN gender_translations.short_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.gender_translations.short_name IS 'Abreviatura del género en el idioma correspondiente.';


--
-- TOC entry 4986 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN gender_translations.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.gender_translations.created_at IS 'Fecha y hora en que se creó el registro. Se establece automáticamente al insertar.';


--
-- TOC entry 4987 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN gender_translations.updated_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.gender_translations.updated_at IS 'Fecha y hora de la última actualización del registro. Se actualiza automáticamente en cada modificación.';


--
-- TOC entry 222 (class 1259 OID 16601)
-- Name: gender_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gender_translations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.gender_translations_id_seq OWNER TO postgres;

--
-- TOC entry 4988 (class 0 OID 0)
-- Dependencies: 222
-- Name: gender_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gender_translations_id_seq OWNED BY public.gender_translations.id;


--
-- TOC entry 221 (class 1259 OID 16580)
-- Name: genders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genders (
    id boolean NOT NULL,
    name character varying(20) NOT NULL,
    short_name character(1) NOT NULL
);


ALTER TABLE public.genders OWNER TO postgres;

--
-- TOC entry 4989 (class 0 OID 0)
-- Dependencies: 221
-- Name: TABLE genders; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.genders IS 'Tabla que almacena los géneros "Hombre" y "Mujer", representados con valores booleanos (true/false).';


--
-- TOC entry 4990 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN genders.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.genders.id IS 'Identificador del género: true (1) = Hombre, false (0) = Mujer.';


--
-- TOC entry 4991 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN genders.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.genders.name IS 'Nombre completo del género (Ej: Masculino, Femenino).';


--
-- TOC entry 4992 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN genders.short_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.genders.short_name IS 'Abreviatura del género (Ej: M para Masculino, F para Femenino).';


--
-- TOC entry 231 (class 1259 OID 16694)
-- Name: holiday_dates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.holiday_dates (
    id integer NOT NULL,
    holiday_id integer NOT NULL,
    holiday_date date NOT NULL
);


ALTER TABLE public.holiday_dates OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16693)
-- Name: holiday_dates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.holiday_dates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.holiday_dates_id_seq OWNER TO postgres;

--
-- TOC entry 4993 (class 0 OID 0)
-- Dependencies: 230
-- Name: holiday_dates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.holiday_dates_id_seq OWNED BY public.holiday_dates.id;


--
-- TOC entry 229 (class 1259 OID 16673)
-- Name: holidays; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.holidays (
    id integer NOT NULL,
    country_id integer NOT NULL,
    language_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.holidays OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16672)
-- Name: holidays_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.holidays_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.holidays_id_seq OWNER TO postgres;

--
-- TOC entry 4994 (class 0 OID 0)
-- Dependencies: 228
-- Name: holidays_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.holidays_id_seq OWNED BY public.holidays.id;


--
-- TOC entry 218 (class 1259 OID 16398)
-- Name: languages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.languages (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    name_code2 character(2) NOT NULL,
    name_code3 character(3) NOT NULL,
    direction character varying(3) NOT NULL,
    is_active boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT languages_direction_check CHECK (((direction)::text = ANY ((ARRAY['LTR'::character varying, 'RTL'::character varying])::text[])))
);


ALTER TABLE public.languages OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16397)
-- Name: languages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.languages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.languages_id_seq OWNER TO postgres;

--
-- TOC entry 4995 (class 0 OID 0)
-- Dependencies: 217
-- Name: languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.languages_id_seq OWNED BY public.languages.id;


--
-- TOC entry 225 (class 1259 OID 16619)
-- Name: states; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.states (
    id integer NOT NULL,
    country_id integer NOT NULL,
    name character varying(100) NOT NULL,
    code character varying(10) NOT NULL,
    enabled boolean DEFAULT true
);


ALTER TABLE public.states OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16618)
-- Name: states_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.states_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.states_id_seq OWNER TO postgres;

--
-- TOC entry 4996 (class 0 OID 0)
-- Dependencies: 224
-- Name: states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.states_id_seq OWNED BY public.states.id;


--
-- TOC entry 4710 (class 2604 OID 17248)
-- Name: account_statuses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_statuses ALTER COLUMN id SET DEFAULT nextval('public.account_statuses_id_seq'::regclass);


--
-- TOC entry 4711 (class 2604 OID 17259)
-- Name: accounts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts ALTER COLUMN id SET DEFAULT nextval('public.accounts_id_seq'::regclass);


--
-- TOC entry 4709 (class 2604 OID 17042)
-- Name: addresses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses ALTER COLUMN id SET DEFAULT nextval('public.addresses_id_seq'::regclass);


--
-- TOC entry 4705 (class 2604 OID 16639)
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- TOC entry 4696 (class 2604 OID 16570)
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);


--
-- TOC entry 4700 (class 2604 OID 16605)
-- Name: gender_translations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gender_translations ALTER COLUMN id SET DEFAULT nextval('public.gender_translations_id_seq'::regclass);


--
-- TOC entry 4708 (class 2604 OID 16697)
-- Name: holiday_dates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.holiday_dates ALTER COLUMN id SET DEFAULT nextval('public.holiday_dates_id_seq'::regclass);


--
-- TOC entry 4707 (class 2604 OID 16676)
-- Name: holidays id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.holidays ALTER COLUMN id SET DEFAULT nextval('public.holidays_id_seq'::regclass);


--
-- TOC entry 4692 (class 2604 OID 16401)
-- Name: languages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages ALTER COLUMN id SET DEFAULT nextval('public.languages_id_seq'::regclass);


--
-- TOC entry 4703 (class 2604 OID 16622)
-- Name: states id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.states ALTER COLUMN id SET DEFAULT nextval('public.states_id_seq'::regclass);


--
-- TOC entry 4958 (class 0 OID 17245)
-- Dependencies: 235
-- Data for Name: account_statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_statuses (id, name, slug, color_code) FROM stdin;
\.


--
-- TOC entry 4960 (class 0 OID 17256)
-- Dependencies: 237
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts (id, status_id, created_at, updated_at, is_premium, buy_starts, buy_ends, user_name, first_name, last_name, gender_id, birthdate, profile_picture, bio, email, password_hash, phone, is_verified_account, is_verified_user, has_2fa_enabled, last_login, last_password_change, failed_login_attempts, language_id, timezone, uses_dark_mode, notify_email, notify_sms, notify_push, country_id, state, city, street, postal_code) FROM stdin;
\.


--
-- TOC entry 4956 (class 0 OID 17039)
-- Dependencies: 233
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.addresses (id, account_id, street, city, state, postal_code, country_id) FROM stdin;
\.


--
-- TOC entry 4950 (class 0 OID 16636)
-- Dependencies: 227
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cities (id, state_id, name, enabled) FROM stdin;
\.


--
-- TOC entry 4943 (class 0 OID 16567)
-- Dependencies: 220
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.countries (id, name, name_code2, name_code3, phone_code, is_active, created_at, updated_at) FROM stdin;
2	Canadá	CA	CAN	+1	f	2025-03-13 15:04:59.131713	2025-03-13 15:04:59.131713
3	Estados Unidos	US	USA	+1	t	2025-03-13 15:04:59.131713	2025-03-13 15:04:59.131713
4	Reino Unido	GB	GBR	+44	f	2025-03-13 15:04:59.131713	2025-03-13 15:04:59.131713
5	Sudáfrica	ZA	ZAF	+27	f	2025-03-13 15:04:59.131713	2025-03-13 15:04:59.131713
6	Argentina	AR	ARG	+54	t	2025-03-13 15:04:59.131713	2025-03-13 15:04:59.131713
7	España	ES	ESP	+34	f	2025-03-13 15:04:59.131713	2025-03-13 15:04:59.131713
8	México	MX	MEX	+52	f	2025-03-13 15:04:59.131713	2025-03-13 15:04:59.131713
10	Chile	CL	CHL	+56	f	2025-03-13 15:04:59.131713	2025-03-13 15:04:59.131713
11	Brasil	BR	BRA	+55	t	2025-03-13 15:04:59.131713	2025-03-13 15:04:59.131713
12	Portugal	PT	PRT	+351	f	2025-03-13 15:04:59.131713	2025-03-13 15:04:59.131713
13	Angola	AO	AGO	+244	f	2025-03-13 15:04:59.131713	2025-03-13 15:04:59.131713
14	Mozambique	MZ	MOZ	+258	f	2025-03-13 15:04:59.131713	2025-03-13 15:04:59.131713
15	Cabo Verde	CV	CPV	+238	f	2025-03-13 15:04:59.131713	2025-03-13 15:04:59.131713
9	Colombia	CO	COL	+57	t	2025-03-13 15:04:59.131713	2025-03-13 15:04:59.131713
1	Australia	AU	AUS	+61	f	2025-03-13 15:04:59.131713	2025-03-14 10:09:23.2733
\.


--
-- TOC entry 4946 (class 0 OID 16602)
-- Dependencies: 223
-- Data for Name: gender_translations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gender_translations (id, gender_id, language_id, name, short_name, created_at, updated_at) FROM stdin;
1	t	1	Male	M	2025-03-13 16:34:13.594304	2025-03-13 16:34:13.594304
2	f	1	Female	F	2025-03-13 16:34:13.594304	2025-03-13 16:34:13.594304
3	t	2	Masculino	M	2025-03-13 16:34:13.594304	2025-03-13 16:34:13.594304
4	f	2	Femenino	F	2025-03-13 16:34:13.594304	2025-03-13 16:34:13.594304
5	t	3	Masculino	M	2025-03-13 16:34:13.594304	2025-03-13 16:34:13.594304
6	f	3	Feminino	F	2025-03-13 16:34:13.594304	2025-03-13 16:34:13.594304
7	t	4	男性	M	2025-03-13 16:34:13.594304	2025-03-13 16:34:13.594304
8	f	4	女性	F	2025-03-13 16:34:13.594304	2025-03-13 16:34:13.594304
9	t	5	पुरुष	M	2025-03-13 16:34:13.594304	2025-03-13 16:34:13.594304
10	f	5	महिला	F	2025-03-13 16:34:13.594304	2025-03-13 16:34:13.594304
11	t	6	Masculin	M	2025-03-13 16:34:13.594304	2025-03-13 16:34:13.594304
12	f	6	Féminin	F	2025-03-13 16:34:13.594304	2025-03-13 16:34:13.594304
13	\N	1	Unspecified	U	2025-03-13 16:34:13.594304	2025-03-13 16:34:13.594304
14	\N	2	No especificado	U	2025-03-13 16:34:13.594304	2025-03-13 16:34:13.594304
15	\N	3	Não especificado	U	2025-03-13 16:34:13.594304	2025-03-13 16:34:13.594304
16	\N	4	未指定	U	2025-03-13 16:34:13.594304	2025-03-13 16:34:13.594304
17	\N	5	निर्दिष्ट नहीं	U	2025-03-13 16:34:13.594304	2025-03-13 16:34:13.594304
18	\N	6	Non spécifié	U	2025-03-13 16:34:13.594304	2025-03-13 16:34:13.594304
\.


--
-- TOC entry 4944 (class 0 OID 16580)
-- Dependencies: 221
-- Data for Name: genders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.genders (id, name, short_name) FROM stdin;
t	Male	M
f	Female	F
\.


--
-- TOC entry 4954 (class 0 OID 16694)
-- Dependencies: 231
-- Data for Name: holiday_dates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.holiday_dates (id, holiday_id, holiday_date) FROM stdin;
1	5	2025-07-09
2	6	2025-05-01
3	7	2025-12-25
4	8	2025-05-25
5	9	2025-07-20
6	10	2025-05-01
7	11	2025-12-25
8	12	2025-10-12
9	13	2025-09-07
10	14	2025-05-01
11	15	2025-12-25
12	16	2025-11-15
13	1	2025-01-01
14	2	2025-07-04
15	3	2025-11-27
16	4	2025-12-25
\.


--
-- TOC entry 4952 (class 0 OID 16673)
-- Dependencies: 229
-- Data for Name: holidays; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.holidays (id, country_id, language_id, name, description) FROM stdin;
5	6	2	Día de la Independencia	Conmemoración de la independencia de Argentina
6	6	2	Día del Trabajador	Día internacional del trabajador
7	6	2	Navidad	Celebración del nacimiento de Jesús
8	6	2	Día de la Revolución de Mayo	Conmemoración de la Revolución de Mayo de 1810
9	9	2	Día de la Independencia	Conmemoración de la independencia de Colombia
10	9	2	Día del Trabajo	Día internacional del trabajador
11	9	2	Navidad	Celebración del nacimiento de Jesús
12	9	2	Día de la Raza	Conmemoración del encuentro de culturas en América
13	11	3	Dia da Independência	Comemoração da independência do Brasil
14	11	3	Dia do Trabalhador	Dia internacional do trabalhador
15	11	3	Natal	Celebração do nascimento de Jesus
16	11	3	Proclamação da República	Comemoração da proclamação da república brasileira
1	3	1	New Year's Day	Celebration of the first day of the year
2	3	1	Independence Day	Celebration of the United States independence from Great Britain
3	3	1	Thanksgiving	Day of giving thanks, celebrated with a feast
4	3	1	Christmas Day	Celebration of the birth of Jesus Christ
\.


--
-- TOC entry 4941 (class 0 OID 16398)
-- Dependencies: 218
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.languages (id, name, name_code2, name_code3, direction, is_active, created_at, updated_at) FROM stdin;
1	Inglés	en	eng	LTR	t	2025-03-13 18:00:51.634418	2025-03-13 18:00:51.634418
2	Español	es	spa	LTR	t	2025-03-13 18:00:51.634418	2025-03-13 18:00:51.634418
4	Chino Mandarín	zh	zho	LTR	f	2025-03-13 18:00:51.634418	2025-03-13 18:00:51.634418
5	Hindi	hi	hin	LTR	f	2025-03-13 18:00:51.634418	2025-03-13 18:00:51.634418
6	Francés	fr	fra	LTR	f	2025-03-13 18:00:51.634418	2025-03-13 18:00:51.634418
3	Portugués	pt	por	LTR	t	2025-03-13 18:00:51.634418	2025-03-13 18:00:51.634418
\.


--
-- TOC entry 4948 (class 0 OID 16619)
-- Dependencies: 225
-- Data for Name: states; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.states (id, country_id, name, code, enabled) FROM stdin;
\.


--
-- TOC entry 4997 (class 0 OID 0)
-- Dependencies: 234
-- Name: account_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_statuses_id_seq', 1, false);


--
-- TOC entry 4998 (class 0 OID 0)
-- Dependencies: 236
-- Name: accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_id_seq', 1, false);


--
-- TOC entry 4999 (class 0 OID 0)
-- Dependencies: 232
-- Name: addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.addresses_id_seq', 1, false);


--
-- TOC entry 5000 (class 0 OID 0)
-- Dependencies: 226
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cities_id_seq', 1, false);


--
-- TOC entry 5001 (class 0 OID 0)
-- Dependencies: 219
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.countries_id_seq', 15, true);


--
-- TOC entry 5002 (class 0 OID 0)
-- Dependencies: 222
-- Name: gender_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gender_translations_id_seq', 1, true);


--
-- TOC entry 5003 (class 0 OID 0)
-- Dependencies: 230
-- Name: holiday_dates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.holiday_dates_id_seq', 1, false);


--
-- TOC entry 5004 (class 0 OID 0)
-- Dependencies: 228
-- Name: holidays_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.holidays_id_seq', 1, false);


--
-- TOC entry 5005 (class 0 OID 0)
-- Dependencies: 217
-- Name: languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.languages_id_seq', 17, true);


--
-- TOC entry 5006 (class 0 OID 0)
-- Dependencies: 224
-- Name: states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.states_id_seq', 1, false);


--
-- TOC entry 4771 (class 2606 OID 17252)
-- Name: account_statuses account_statuses_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_statuses
    ADD CONSTRAINT account_statuses_name_key UNIQUE (name);


--
-- TOC entry 4773 (class 2606 OID 17250)
-- Name: account_statuses account_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_statuses
    ADD CONSTRAINT account_statuses_pkey PRIMARY KEY (id);


--
-- TOC entry 4775 (class 2606 OID 17254)
-- Name: account_statuses account_statuses_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_statuses
    ADD CONSTRAINT account_statuses_slug_key UNIQUE (slug);


--
-- TOC entry 4777 (class 2606 OID 17278)
-- Name: accounts accounts_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_email_key UNIQUE (email);


--
-- TOC entry 4779 (class 2606 OID 17280)
-- Name: accounts accounts_phone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_phone_key UNIQUE (phone);


--
-- TOC entry 4781 (class 2606 OID 17276)
-- Name: accounts accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- TOC entry 4769 (class 2606 OID 17044)
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- TOC entry 4757 (class 2606 OID 16644)
-- Name: cities cities_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_name_unique UNIQUE (state_id, name);


--
-- TOC entry 4759 (class 2606 OID 16642)
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- TOC entry 4735 (class 2606 OID 16575)
-- Name: countries countries_iso_code3_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_iso_code3_key UNIQUE (name_code3);


--
-- TOC entry 4737 (class 2606 OID 16577)
-- Name: countries countries_iso_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_iso_code_key UNIQUE (name_code2);


--
-- TOC entry 4739 (class 2606 OID 16579)
-- Name: countries countries_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_name_key UNIQUE (name);


--
-- TOC entry 4741 (class 2606 OID 16573)
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- TOC entry 4749 (class 2606 OID 16607)
-- Name: gender_translations gender_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gender_translations
    ADD CONSTRAINT gender_translations_pkey PRIMARY KEY (id);


--
-- TOC entry 4743 (class 2606 OID 16586)
-- Name: genders genders_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genders
    ADD CONSTRAINT genders_name_key UNIQUE (name);


--
-- TOC entry 4745 (class 2606 OID 16584)
-- Name: genders genders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genders
    ADD CONSTRAINT genders_pkey PRIMARY KEY (id);


--
-- TOC entry 4747 (class 2606 OID 16588)
-- Name: genders genders_short_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genders
    ADD CONSTRAINT genders_short_name_key UNIQUE (short_name);


--
-- TOC entry 4765 (class 2606 OID 16699)
-- Name: holiday_dates holiday_dates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.holiday_dates
    ADD CONSTRAINT holiday_dates_pkey PRIMARY KEY (id);


--
-- TOC entry 4767 (class 2606 OID 16701)
-- Name: holiday_dates holiday_dates_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.holiday_dates
    ADD CONSTRAINT holiday_dates_unique UNIQUE (holiday_id, holiday_date);


--
-- TOC entry 4761 (class 2606 OID 16680)
-- Name: holidays holidays_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.holidays
    ADD CONSTRAINT holidays_pkey PRIMARY KEY (id);


--
-- TOC entry 4763 (class 2606 OID 16682)
-- Name: holidays holidays_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.holidays
    ADD CONSTRAINT holidays_unique UNIQUE (country_id, language_id, name);


--
-- TOC entry 4727 (class 2606 OID 16411)
-- Name: languages languages_name_code2_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_name_code2_key UNIQUE (name_code2);


--
-- TOC entry 4729 (class 2606 OID 16413)
-- Name: languages languages_name_code3_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_name_code3_key UNIQUE (name_code3);


--
-- TOC entry 4731 (class 2606 OID 16409)
-- Name: languages languages_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_name_key UNIQUE (name);


--
-- TOC entry 4733 (class 2606 OID 16407)
-- Name: languages languages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (id);


--
-- TOC entry 4751 (class 2606 OID 16629)
-- Name: states states_code_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_code_unique UNIQUE (country_id, code);


--
-- TOC entry 4753 (class 2606 OID 16627)
-- Name: states states_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_name_unique UNIQUE (country_id, name);


--
-- TOC entry 4755 (class 2606 OID 16625)
-- Name: states states_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);


--
-- TOC entry 4794 (class 2620 OID 17310)
-- Name: countries trigger_update_countries; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trigger_update_countries BEFORE UPDATE ON public.countries FOR EACH ROW EXECUTE FUNCTION public.update_timestamp();


--
-- TOC entry 4790 (class 2606 OID 17286)
-- Name: accounts accounts_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.countries(id);


--
-- TOC entry 4791 (class 2606 OID 17291)
-- Name: accounts accounts_gender_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_gender_id_fkey FOREIGN KEY (gender_id) REFERENCES public.genders(id);


--
-- TOC entry 4792 (class 2606 OID 17296)
-- Name: accounts accounts_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_language_id_fkey FOREIGN KEY (language_id) REFERENCES public.languages(id);


--
-- TOC entry 4793 (class 2606 OID 17281)
-- Name: accounts accounts_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.account_statuses(id);


--
-- TOC entry 4789 (class 2606 OID 17050)
-- Name: addresses addresses_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.countries(id);


--
-- TOC entry 4785 (class 2606 OID 16645)
-- Name: cities cities_state_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_state_fk FOREIGN KEY (state_id) REFERENCES public.states(id) ON DELETE CASCADE;


--
-- TOC entry 4782 (class 2606 OID 16608)
-- Name: gender_translations gender_translations_gender_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gender_translations
    ADD CONSTRAINT gender_translations_gender_id_fkey FOREIGN KEY (gender_id) REFERENCES public.genders(id) ON DELETE CASCADE;


--
-- TOC entry 4783 (class 2606 OID 16613)
-- Name: gender_translations gender_translations_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gender_translations
    ADD CONSTRAINT gender_translations_language_id_fkey FOREIGN KEY (language_id) REFERENCES public.languages(id) ON DELETE CASCADE;


--
-- TOC entry 4788 (class 2606 OID 16702)
-- Name: holiday_dates holiday_dates_holiday_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.holiday_dates
    ADD CONSTRAINT holiday_dates_holiday_fk FOREIGN KEY (holiday_id) REFERENCES public.holidays(id) ON DELETE CASCADE;


--
-- TOC entry 4786 (class 2606 OID 16683)
-- Name: holidays holidays_country_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.holidays
    ADD CONSTRAINT holidays_country_fk FOREIGN KEY (country_id) REFERENCES public.countries(id) ON DELETE CASCADE;


--
-- TOC entry 4787 (class 2606 OID 16688)
-- Name: holidays holidays_language_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.holidays
    ADD CONSTRAINT holidays_language_fk FOREIGN KEY (language_id) REFERENCES public.languages(id) ON DELETE CASCADE;


--
-- TOC entry 4784 (class 2606 OID 16630)
-- Name: states states_country_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_country_fk FOREIGN KEY (country_id) REFERENCES public.countries(id) ON DELETE CASCADE;


-- Completed on 2025-03-14 10:20:19

--
-- PostgreSQL database dump complete
--

