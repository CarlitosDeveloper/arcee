PGDMP  "                    }            postgres    17.4    17.4     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    5    postgres    DATABASE     n   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en-US';
    DROP DATABASE postgres;
                     postgres    false            �           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                        postgres    false    4832            �            1255    17341     func_refresh_column_updated_at()    FUNCTION     �   CREATE FUNCTION public.func_refresh_column_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$;
 7   DROP FUNCTION public.func_refresh_column_updated_at();
       public               postgres    false            �            1259    17321    countries_backup    TABLE     �  CREATE TABLE public.countries_backup (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    name_code2 character varying(2) NOT NULL,
    name_code3 character varying(3) NOT NULL,
    phone_code smallint NOT NULL,
    is_active boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_phone_code CHECK ((phone_code > 0)),
    CONSTRAINT countries_name_code2_check CHECK ((char_length((name_code2)::text) = 2)),
    CONSTRAINT countries_name_code3_check CHECK ((char_length((name_code3)::text) = 3))
);
 $   DROP TABLE public.countries_backup;
       public         heap r       postgres    false            �            1259    17320    countries_id_seq    SEQUENCE     �   CREATE SEQUENCE public.countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.countries_id_seq;
       public               postgres    false    218            �           0    0    countries_id_seq    SEQUENCE OWNED BY     L   ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries_backup.id;
          public               postgres    false    217            �            1259    17344    states    TABLE     �  CREATE TABLE public.states (
    id integer NOT NULL,
    country_id integer NOT NULL,
    name character varying(100) NOT NULL,
    code character varying(5) NOT NULL,
    is_active boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT states_code_check CHECK (((char_length((code)::text) > 0) AND (char_length((code)::text) <= 5)))
);
    DROP TABLE public.states;
       public         heap r       postgres    false            �            1259    17343    states_id_seq    SEQUENCE     �   CREATE SEQUENCE public.states_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.states_id_seq;
       public               postgres    false    220            �           0    0    states_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.states_id_seq OWNED BY public.states.id;
          public               postgres    false    219            '           2604    17324    countries_backup id    DEFAULT     s   ALTER TABLE ONLY public.countries_backup ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);
 B   ALTER TABLE public.countries_backup ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    218    217    218            +           2604    17347 	   states id    DEFAULT     f   ALTER TABLE ONLY public.states ALTER COLUMN id SET DEFAULT nextval('public.states_id_seq'::regclass);
 8   ALTER TABLE public.states ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    220    219    220            �          0    17321    countries_backup 
   TABLE DATA           {   COPY public.countries_backup (id, name, name_code2, name_code3, phone_code, is_active, created_at, updated_at) FROM stdin;
    public               postgres    false    218   f&       �          0    17344    states 
   TABLE DATA           _   COPY public.states (id, country_id, name, code, is_active, created_at, updated_at) FROM stdin;
    public               postgres    false    220   �&       �           0    0    countries_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.countries_id_seq', 1, false);
          public               postgres    false    217            �           0    0    states_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.states_id_seq', 1, false);
          public               postgres    false    219            4           2606    17336 )   countries_backup countries_name_code2_key 
   CONSTRAINT     j   ALTER TABLE ONLY public.countries_backup
    ADD CONSTRAINT countries_name_code2_key UNIQUE (name_code2);
 S   ALTER TABLE ONLY public.countries_backup DROP CONSTRAINT countries_name_code2_key;
       public                 postgres    false    218            6           2606    17338 )   countries_backup countries_name_code3_key 
   CONSTRAINT     j   ALTER TABLE ONLY public.countries_backup
    ADD CONSTRAINT countries_name_code3_key UNIQUE (name_code3);
 S   ALTER TABLE ONLY public.countries_backup DROP CONSTRAINT countries_name_code3_key;
       public                 postgres    false    218            8           2606    17334 #   countries_backup countries_name_key 
   CONSTRAINT     ^   ALTER TABLE ONLY public.countries_backup
    ADD CONSTRAINT countries_name_key UNIQUE (name);
 M   ALTER TABLE ONLY public.countries_backup DROP CONSTRAINT countries_name_key;
       public                 postgres    false    218            :           2606    17332    countries_backup countries_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.countries_backup
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);
 I   ALTER TABLE ONLY public.countries_backup DROP CONSTRAINT countries_pkey;
       public                 postgres    false    218            >           2606    17355    states states_code_unique 
   CONSTRAINT     `   ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_code_unique UNIQUE (country_id, code);
 C   ALTER TABLE ONLY public.states DROP CONSTRAINT states_code_unique;
       public                 postgres    false    220    220            @           2606    17357    states states_name_unique 
   CONSTRAINT     `   ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_name_unique UNIQUE (country_id, name);
 C   ALTER TABLE ONLY public.states DROP CONSTRAINT states_name_unique;
       public                 postgres    false    220    220            B           2606    17353    states states_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.states DROP CONSTRAINT states_pkey;
       public                 postgres    false    220            ;           1259    17364    idx_countries_name    INDEX     O   CREATE INDEX idx_countries_name ON public.countries_backup USING btree (name);
 &   DROP INDEX public.idx_countries_name;
       public                 postgres    false    218            <           1259    17363    idx_states_country    INDEX     K   CREATE INDEX idx_states_country ON public.states USING btree (country_id);
 &   DROP INDEX public.idx_states_country;
       public                 postgres    false    220            D           2620    17342 <   countries_backup trigger_countries_refresh_column_updated_at    TRIGGER     �   CREATE TRIGGER trigger_countries_refresh_column_updated_at BEFORE UPDATE ON public.countries_backup FOR EACH ROW EXECUTE FUNCTION public.func_refresh_column_updated_at();
 U   DROP TRIGGER trigger_countries_refresh_column_updated_at ON public.countries_backup;
       public               postgres    false    221    218            E           2620    17365 /   states trigger_states_refresh_column_updated_at    TRIGGER     �   CREATE TRIGGER trigger_states_refresh_column_updated_at BEFORE UPDATE ON public.states FOR EACH ROW EXECUTE FUNCTION public.func_refresh_column_updated_at();
 H   DROP TRIGGER trigger_states_refresh_column_updated_at ON public.states;
       public               postgres    false    221    220            C           2606    17358    states states_country_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_country_fk FOREIGN KEY (country_id) REFERENCES public.countries_backup(id) ON UPDATE CASCADE ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.states DROP CONSTRAINT states_country_fk;
       public               postgres    false    218    220    4666            �      x������ � �      �      x������ � �     