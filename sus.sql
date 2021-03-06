PGDMP                         x            sus    9.6.18    9.6.18     e           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            f           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            g           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            h           1262    16420    sus    DATABASE     �   CREATE DATABASE sus WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';
    DROP DATABASE sus;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            i           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12387    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            j           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    16447 	   pacientes    TABLE     �  CREATE TABLE public.pacientes (
    id bigint NOT NULL,
    cpf character(11) NOT NULL,
    nome character varying(50) NOT NULL,
    telefone character varying(11) NOT NULL,
    email character varying(50) NOT NULL,
    cep character(8) NOT NULL,
    cidade character varying(50) NOT NULL,
    estado character(2) NOT NULL,
    bairro character varying(50) NOT NULL,
    rua character varying(50) NOT NULL,
    numero integer NOT NULL,
    complemento character varying(100) NOT NULL
);
    DROP TABLE public.pacientes;
       public         postgres    false    3            �            1259    16445    pacientes_id_seq    SEQUENCE     y   CREATE SEQUENCE public.pacientes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.pacientes_id_seq;
       public       postgres    false    190    3            k           0    0    pacientes_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.pacientes_id_seq OWNED BY public.pacientes.id;
            public       postgres    false    189            �            1259    16423    perfils    TABLE     d   CREATE TABLE public.perfils (
    id bigint NOT NULL,
    perfil character varying(255) NOT NULL
);
    DROP TABLE public.perfils;
       public         postgres    false    3            �            1259    16421    perfils_id_seq    SEQUENCE     w   CREATE SEQUENCE public.perfils_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.perfils_id_seq;
       public       postgres    false    3    186            l           0    0    perfils_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.perfils_id_seq OWNED BY public.perfils.id;
            public       postgres    false    185            �            1259    16431    usuarios    TABLE     �   CREATE TABLE public.usuarios (
    id bigint NOT NULL,
    usuario character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    senha character varying(255) NOT NULL,
    perfils_id bigint NOT NULL
);
    DROP TABLE public.usuarios;
       public         postgres    false    3            �            1259    16429    usuarios_id_seq    SEQUENCE     x   CREATE SEQUENCE public.usuarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.usuarios_id_seq;
       public       postgres    false    3    188            m           0    0    usuarios_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;
            public       postgres    false    187            �           2604    16450    pacientes id    DEFAULT     l   ALTER TABLE ONLY public.pacientes ALTER COLUMN id SET DEFAULT nextval('public.pacientes_id_seq'::regclass);
 ;   ALTER TABLE public.pacientes ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    189    190    190            �           2604    16426 
   perfils id    DEFAULT     h   ALTER TABLE ONLY public.perfils ALTER COLUMN id SET DEFAULT nextval('public.perfils_id_seq'::regclass);
 9   ALTER TABLE public.perfils ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    186    185    186            �           2604    16434    usuarios id    DEFAULT     j   ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);
 :   ALTER TABLE public.usuarios ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    187    188    188            b          0    16447 	   pacientes 
   TABLE DATA               z   COPY public.pacientes (id, cpf, nome, telefone, email, cep, cidade, estado, bairro, rua, numero, complemento) FROM stdin;
    public       postgres    false    190   �       n           0    0    pacientes_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.pacientes_id_seq', 37, true);
            public       postgres    false    189            ^          0    16423    perfils 
   TABLE DATA               -   COPY public.perfils (id, perfil) FROM stdin;
    public       postgres    false    186   �       o           0    0    perfils_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.perfils_id_seq', 2, true);
            public       postgres    false    185            `          0    16431    usuarios 
   TABLE DATA               I   COPY public.usuarios (id, usuario, email, senha, perfils_id) FROM stdin;
    public       postgres    false    188          p           0    0    usuarios_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.usuarios_id_seq', 31, true);
            public       postgres    false    187            �           2606    16455    pacientes pacientes_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.pacientes
    ADD CONSTRAINT pacientes_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.pacientes DROP CONSTRAINT pacientes_pkey;
       public         postgres    false    190    190            �           2606    16428    perfils perfils_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.perfils
    ADD CONSTRAINT perfils_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.perfils DROP CONSTRAINT perfils_pkey;
       public         postgres    false    186    186            �           2606    16439    usuarios usuarios_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public         postgres    false    188    188            �           2606    16440 !   usuarios usuarios_perfils_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_perfils_id_fkey FOREIGN KEY (perfils_id) REFERENCES public.perfils(id);
 K   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_perfils_id_fkey;
       public       postgres    false    188    2018    186            b      x������ � �      ^      x�3�tL�������� ��      `   3   x�3��*���/��S����E�%���9z�����F�&�f�F\1z\\\ m=g     