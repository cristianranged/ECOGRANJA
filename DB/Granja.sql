PGDMP                         |            Granja    13.15    13.15 #    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16394    Granja    DATABASE     g   CREATE DATABASE "Granja" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Colombia.1252';
    DROP DATABASE "Granja";
                postgres    false            �            1259    16395    animal    TABLE     $  CREATE TABLE public.animal (
    id_animal integer NOT NULL,
    nombre character varying(255),
    tipo character varying(255),
    fecha_ingreso date,
    fecha_sacrificio date,
    peso integer,
    resp_registro character varying(255) NOT NULL,
    resp_proceso character varying(255)
);
    DROP TABLE public.animal;
       public         heap    postgres    false            �            1259    16401    detallereporte    TABLE     �   CREATE TABLE public.detallereporte (
    id_detalle integer NOT NULL,
    id_reporte integer,
    id_animal integer,
    id_producto integer,
    id_residuo integer
);
 "   DROP TABLE public.detallereporte;
       public         heap    postgres    false            �            1259    16404    producto    TABLE       CREATE TABLE public.producto (
    id_producto integer NOT NULL,
    nombre character varying(255),
    tipo character varying(255),
    cantidad integer,
    fecha_registro date,
    fecha_salida date,
    id_animal integer,
    resp_registro character varying(255)
);
    DROP TABLE public.producto;
       public         heap    postgres    false            �            1259    16410    producto_id_producto_seq    SEQUENCE     �   ALTER TABLE public.producto ALTER COLUMN id_producto ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.producto_id_producto_seq
    START WITH 5
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    202            �            1259    16412    reporte    TABLE     g   CREATE TABLE public.reporte (
    id_reporte integer NOT NULL,
    fecha date,
    descripcion text
);
    DROP TABLE public.reporte;
       public         heap    postgres    false            �            1259    16418    residuo    TABLE     �   CREATE TABLE public.residuo (
    id_residuo integer NOT NULL,
    descripcion text,
    cantidad integer,
    id_animal integer,
    fecha_generacion date,
    fecha_salida date
);
    DROP TABLE public.residuo;
       public         heap    postgres    false            �            1259    16424    user    TABLE       CREATE TABLE public."user" (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    password_hash character varying(255) NOT NULL,
    type character varying(50) NOT NULL
);
    DROP TABLE public."user";
       public         heap    postgres    false            �            1259    16427    user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public          postgres    false    206            �           0    0    user_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;
          public          postgres    false    207            <           2604    16429    user id    DEFAULT     d   ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 8   ALTER TABLE public."user" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    206            �          0    16395    animal 
   TABLE DATA           }   COPY public.animal (id_animal, nombre, tipo, fecha_ingreso, fecha_sacrificio, peso, resp_registro, resp_proceso) FROM stdin;
    public          postgres    false    200   m*       �          0    16401    detallereporte 
   TABLE DATA           d   COPY public.detallereporte (id_detalle, id_reporte, id_animal, id_producto, id_residuo) FROM stdin;
    public          postgres    false    201   �*       �          0    16404    producto 
   TABLE DATA              COPY public.producto (id_producto, nombre, tipo, cantidad, fecha_registro, fecha_salida, id_animal, resp_registro) FROM stdin;
    public          postgres    false    202   �*       �          0    16412    reporte 
   TABLE DATA           A   COPY public.reporte (id_reporte, fecha, descripcion) FROM stdin;
    public          postgres    false    204   Z+       �          0    16418    residuo 
   TABLE DATA           o   COPY public.residuo (id_residuo, descripcion, cantidad, id_animal, fecha_generacion, fecha_salida) FROM stdin;
    public          postgres    false    205   w+       �          0    16424    user 
   TABLE DATA           W   COPY public."user" (id, first_name, last_name, email, password_hash, type) FROM stdin;
    public          postgres    false    206   �+       �           0    0    producto_id_producto_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.producto_id_producto_seq', 22, true);
          public          postgres    false    203            �           0    0    user_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.user_id_seq', 13, true);
          public          postgres    false    207            >           2606    16431    animal animal_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.animal
    ADD CONSTRAINT animal_pkey PRIMARY KEY (id_animal);
 <   ALTER TABLE ONLY public.animal DROP CONSTRAINT animal_pkey;
       public            postgres    false    200            @           2606    16433 "   detallereporte detallereporte_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.detallereporte
    ADD CONSTRAINT detallereporte_pkey PRIMARY KEY (id_detalle);
 L   ALTER TABLE ONLY public.detallereporte DROP CONSTRAINT detallereporte_pkey;
       public            postgres    false    201            B           2606    16435    producto producto_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (id_producto);
 @   ALTER TABLE ONLY public.producto DROP CONSTRAINT producto_pkey;
       public            postgres    false    202            D           2606    16437    reporte reporte_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.reporte
    ADD CONSTRAINT reporte_pkey PRIMARY KEY (id_reporte);
 >   ALTER TABLE ONLY public.reporte DROP CONSTRAINT reporte_pkey;
       public            postgres    false    204            F           2606    16439    residuo residuo_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.residuo
    ADD CONSTRAINT residuo_pkey PRIMARY KEY (id_residuo);
 >   ALTER TABLE ONLY public.residuo DROP CONSTRAINT residuo_pkey;
       public            postgres    false    205            H           2606    16441    user user_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_email_key;
       public            postgres    false    206            J           2606    16443    user user_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public            postgres    false    206            K           2606    16444 ,   detallereporte detallereporte_id_animal_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detallereporte
    ADD CONSTRAINT detallereporte_id_animal_fkey FOREIGN KEY (id_animal) REFERENCES public.animal(id_animal);
 V   ALTER TABLE ONLY public.detallereporte DROP CONSTRAINT detallereporte_id_animal_fkey;
       public          postgres    false    2878    201    200            L           2606    16449 .   detallereporte detallereporte_id_producto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detallereporte
    ADD CONSTRAINT detallereporte_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES public.producto(id_producto);
 X   ALTER TABLE ONLY public.detallereporte DROP CONSTRAINT detallereporte_id_producto_fkey;
       public          postgres    false    2882    202    201            M           2606    16454 -   detallereporte detallereporte_id_reporte_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detallereporte
    ADD CONSTRAINT detallereporte_id_reporte_fkey FOREIGN KEY (id_reporte) REFERENCES public.reporte(id_reporte);
 W   ALTER TABLE ONLY public.detallereporte DROP CONSTRAINT detallereporte_id_reporte_fkey;
       public          postgres    false    2884    201    204            N           2606    16459 -   detallereporte detallereporte_id_residuo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detallereporte
    ADD CONSTRAINT detallereporte_id_residuo_fkey FOREIGN KEY (id_residuo) REFERENCES public.residuo(id_residuo);
 W   ALTER TABLE ONLY public.detallereporte DROP CONSTRAINT detallereporte_id_residuo_fkey;
       public          postgres    false    205    2886    201            O           2606    16464     producto producto_id_animal_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_id_animal_fkey FOREIGN KEY (id_animal) REFERENCES public.animal(id_animal);
 J   ALTER TABLE ONLY public.producto DROP CONSTRAINT producto_id_animal_fkey;
       public          postgres    false    200    202    2878            P           2606    16469    residuo residuo_id_animal_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.residuo
    ADD CONSTRAINT residuo_id_animal_fkey FOREIGN KEY (id_animal) REFERENCES public.animal(id_animal);
 H   ALTER TABLE ONLY public.residuo DROP CONSTRAINT residuo_id_animal_fkey;
       public          postgres    false    2878    205    200            �   <   x�3�KLN��IM�H-J�4200�54�56Dfp���%���h.#N�Ĥ"����qqq ��      �      x������ � �      �   t   x�3������KL.���440�4200�54�56���4�,K��/�/ �Դ��|.#�����|N�Ă�L�.#tMFX4s:��d��$�-3#�2N���ļ�b�6�i����� s0?�      �      x������ � �      �   1   x�3��(M-�/VHIU(KLN�0�4�4202�54�54������� �	U      �   `  x�e��r�0��u|�)	޺��r�R��&T0`������9�3g��'f2K�oI	����$h��!��i_y�oo�������N|k@e�B��:�u������e�e-�� P&����4c2.�	�{�i�����aS�k:�[��:ǩ!_fhZ�^�f��E5�{t�U��X�Tƣ�8H$�N1���~�Rhx�ΖX�����:"�p��vv�x456�/Saek��L���ǿ>"|�G���y�N>�:tյY#�(ȝ�#;�k��JC�\O�+�*�
׿��Q��O\*��W	T����XI|�J�Z�m�t��5l��R�*� !/�U���.�ѭ:ry��?a���d���     