PGDMP                      }         
   mangoda_db    17.2    17.2 m    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16673 
   mangoda_db    DATABASE     �   CREATE DATABASE mangoda_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Philippines.1252';
    DROP DATABASE mangoda_db;
                     postgres    false                        2615    16849    CSS    SCHEMA        CREATE SCHEMA "CSS";
    DROP SCHEMA "CSS";
                     postgres    false            �           1247    17015    question_type    TYPE     `   CREATE TYPE "CSS".question_type AS ENUM (
    'Rating',
    'Multiple Choice',
    'Comment'
);
    DROP TYPE "CSS".question_type;
       CSS               postgres    false    6            l           1247    16709    client_type    TYPE     x   CREATE TYPE public.client_type AS ENUM (
    'Citizen',
    'Business',
    'Government (Empolyee or another agency'
);
    DROP TYPE public.client_type;
       public               postgres    false            f           1247    16675    enum_response_role    TYPE     X   CREATE TYPE public.enum_response_role AS ENUM (
    'Admin',
    'User',
    'Guest'
);
 %   DROP TYPE public.enum_response_role;
       public               postgres    false            i           1247    16682    enum_response_sex    TYPE     X   CREATE TYPE public.enum_response_sex AS ENUM (
    'Male',
    'Female',
    'Other'
);
 $   DROP TYPE public.enum_response_sex;
       public               postgres    false            u           1247    16851    question_type    TYPE     m   CREATE TYPE public.question_type AS ENUM (
    'Multiple Choice',
    'Text',
    'Rating',
    'Comment'
);
     DROP TYPE public.question_type;
       public               postgres    false            o           1247    16716 	   role_type    TYPE       CREATE TYPE public.role_type AS ENUM (
    'Alumni',
    'Faculty',
    'Lecturer',
    'Official/Responsibility Center Head',
    'Parent of Student/Alumni',
    'Staff',
    'Student(Enrolled)',
    'Student(Offsem)',
    'Supplier',
    'General Client/Citizen/Visitor'
);
    DROP TYPE public.role_type;
       public               postgres    false            r           1247    16738    sex_type    TYPE     B   CREATE TYPE public.sex_type AS ENUM (
    'male',
    'female'
);
    DROP TYPE public.sex_type;
       public               postgres    false            �            1259    16941    answer    TABLE     �   CREATE TABLE "CSS".answer (
    id integer NOT NULL,
    option_id integer,
    question_id integer,
    response_id integer,
    text character varying(255)
);
    DROP TABLE "CSS".answer;
       CSS         heap r       postgres    false    6            �            1259    16940    answer_id_seq    SEQUENCE     �   CREATE SEQUENCE "CSS".answer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE "CSS".answer_id_seq;
       CSS               postgres    false    6    234            �           0    0    answer_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE "CSS".answer_id_seq OWNED BY "CSS".answer.id;
          CSS               postgres    false    233            �            1259    17033    college    TABLE     b   CREATE TABLE "CSS".college (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);
    DROP TABLE "CSS".college;
       CSS         heap r       postgres    false    6            �            1259    17032    college_id_seq    SEQUENCE     �   CREATE SEQUENCE "CSS".college_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE "CSS".college_id_seq;
       CSS               postgres    false    6    239            �           0    0    college_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE "CSS".college_id_seq OWNED BY "CSS".college.id;
          CSS               postgres    false    238            �            1259    16858    office    TABLE     a   CREATE TABLE "CSS".office (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);
    DROP TABLE "CSS".office;
       CSS         heap r       postgres    false    6            �            1259    16857    office_id_seq    SEQUENCE     �   CREATE SEQUENCE "CSS".office_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE "CSS".office_id_seq;
       CSS               postgres    false    6    220            �           0    0    office_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE "CSS".office_id_seq OWNED BY "CSS".office.id;
          CSS               postgres    false    219            �            1259    16929    option    TABLE     h   CREATE TABLE "CSS".option (
    id integer NOT NULL,
    question_id integer,
    text text NOT NULL
);
    DROP TABLE "CSS".option;
       CSS         heap r       postgres    false    6            �            1259    16928    option_id_seq    SEQUENCE     �   CREATE SEQUENCE "CSS".option_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE "CSS".option_id_seq;
       CSS               postgres    false    6    232            �           0    0    option_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE "CSS".option_id_seq OWNED BY "CSS".option.id;
          CSS               postgres    false    231            �            1259    16865 	   personnel    TABLE     {   CREATE TABLE "CSS".personnel (
    id integer NOT NULL,
    office_id integer,
    name character varying(100) NOT NULL
);
    DROP TABLE "CSS".personnel;
       CSS         heap r       postgres    false    6            �            1259    16864    personnel_id_seq    SEQUENCE     �   CREATE SEQUENCE "CSS".personnel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE "CSS".personnel_id_seq;
       CSS               postgres    false    222    6            �           0    0    personnel_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE "CSS".personnel_id_seq OWNED BY "CSS".personnel.id;
          CSS               postgres    false    221            �            1259    16917    question    TABLE     �   CREATE TABLE "CSS".question (
    id integer NOT NULL,
    survey_id integer,
    text text NOT NULL,
    type public.question_type NOT NULL
);
    DROP TABLE "CSS".question;
       CSS         heap r       postgres    false    885    6            �            1259    16916    question_id_seq    SEQUENCE     �   CREATE SEQUENCE "CSS".question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE "CSS".question_id_seq;
       CSS               postgres    false    6    230            �           0    0    question_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE "CSS".question_id_seq OWNED BY "CSS".question.id;
          CSS               postgres    false    229            �            1259    16997    question_option    TABLE     �   CREATE TABLE "CSS".question_option (
    question_id integer NOT NULL,
    option_id integer NOT NULL,
    survey_id integer
);
 "   DROP TABLE "CSS".question_option;
       CSS         heap r       postgres    false    6            �            1259    17042    region    TABLE     a   CREATE TABLE "CSS".region (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);
    DROP TABLE "CSS".region;
       CSS         heap r       postgres    false    6            �            1259    17041    region_id_seq    SEQUENCE     �   CREATE SEQUENCE "CSS".region_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE "CSS".region_id_seq;
       CSS               postgres    false    6    241            �           0    0    region_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE "CSS".region_id_seq OWNED BY "CSS".region.id;
          CSS               postgres    false    240            �            1259    16898    response    TABLE     �  CREATE TABLE "CSS".response (
    id integer NOT NULL,
    survey_id integer,
    office_id integer,
    type public.client_type NOT NULL,
    role public.role_type NOT NULL,
    sex public.sex_type NOT NULL,
    age integer,
    region character varying(100),
    email character varying(100),
    phone character varying(20),
    "timestamp" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    comment text,
    CONSTRAINT response_age_check CHECK ((age > 0))
);
    DROP TABLE "CSS".response;
       CSS         heap r       postgres    false    879    882    6    876            �            1259    16897    response_id_seq    SEQUENCE     �   CREATE SEQUENCE "CSS".response_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE "CSS".response_id_seq;
       CSS               postgres    false    6    228            �           0    0    response_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE "CSS".response_id_seq OWNED BY "CSS".response.id;
          CSS               postgres    false    227            �            1259    17024    role    TABLE     _   CREATE TABLE "CSS".role (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);
    DROP TABLE "CSS".role;
       CSS         heap r       postgres    false    6            �            1259    17023    role_id_seq    SEQUENCE     �   CREATE SEQUENCE "CSS".role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE "CSS".role_id_seq;
       CSS               postgres    false    6    237            �           0    0    role_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE "CSS".role_id_seq OWNED BY "CSS".role.id;
          CSS               postgres    false    236            �            1259    16877    service    TABLE     z   CREATE TABLE "CSS".service (
    id integer NOT NULL,
    office_id integer,
    name character varying(1000) NOT NULL
);
    DROP TABLE "CSS".service;
       CSS         heap r       postgres    false    6            �            1259    16876    service_id_seq    SEQUENCE     �   CREATE SEQUENCE "CSS".service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE "CSS".service_id_seq;
       CSS               postgres    false    6    224            �           0    0    service_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE "CSS".service_id_seq OWNED BY "CSS".service.id;
          CSS               postgres    false    223            �            1259    16889    survey    TABLE     �   CREATE TABLE "CSS".survey (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    office_id integer
);
    DROP TABLE "CSS".survey;
       CSS         heap r       postgres    false    6            �            1259    16888    survey_id_seq    SEQUENCE     �   CREATE SEQUENCE "CSS".survey_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE "CSS".survey_id_seq;
       CSS               postgres    false    6    226            �           0    0    survey_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE "CSS".survey_id_seq OWNED BY "CSS".survey.id;
          CSS               postgres    false    225            �            1259    16822    survey_survey_id_seq    SEQUENCE     }   CREATE SEQUENCE public.survey_survey_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.survey_survey_id_seq;
       public               postgres    false            �           2604    16944 	   answer id    DEFAULT     d   ALTER TABLE ONLY "CSS".answer ALTER COLUMN id SET DEFAULT nextval('"CSS".answer_id_seq'::regclass);
 7   ALTER TABLE "CSS".answer ALTER COLUMN id DROP DEFAULT;
       CSS               postgres    false    234    233    234            �           2604    17036 
   college id    DEFAULT     f   ALTER TABLE ONLY "CSS".college ALTER COLUMN id SET DEFAULT nextval('"CSS".college_id_seq'::regclass);
 8   ALTER TABLE "CSS".college ALTER COLUMN id DROP DEFAULT;
       CSS               postgres    false    239    238    239            �           2604    16861 	   office id    DEFAULT     d   ALTER TABLE ONLY "CSS".office ALTER COLUMN id SET DEFAULT nextval('"CSS".office_id_seq'::regclass);
 7   ALTER TABLE "CSS".office ALTER COLUMN id DROP DEFAULT;
       CSS               postgres    false    220    219    220            �           2604    16932 	   option id    DEFAULT     d   ALTER TABLE ONLY "CSS".option ALTER COLUMN id SET DEFAULT nextval('"CSS".option_id_seq'::regclass);
 7   ALTER TABLE "CSS".option ALTER COLUMN id DROP DEFAULT;
       CSS               postgres    false    231    232    232            �           2604    16868    personnel id    DEFAULT     j   ALTER TABLE ONLY "CSS".personnel ALTER COLUMN id SET DEFAULT nextval('"CSS".personnel_id_seq'::regclass);
 :   ALTER TABLE "CSS".personnel ALTER COLUMN id DROP DEFAULT;
       CSS               postgres    false    222    221    222            �           2604    16920    question id    DEFAULT     h   ALTER TABLE ONLY "CSS".question ALTER COLUMN id SET DEFAULT nextval('"CSS".question_id_seq'::regclass);
 9   ALTER TABLE "CSS".question ALTER COLUMN id DROP DEFAULT;
       CSS               postgres    false    229    230    230            �           2604    17045 	   region id    DEFAULT     d   ALTER TABLE ONLY "CSS".region ALTER COLUMN id SET DEFAULT nextval('"CSS".region_id_seq'::regclass);
 7   ALTER TABLE "CSS".region ALTER COLUMN id DROP DEFAULT;
       CSS               postgres    false    241    240    241            �           2604    16901    response id    DEFAULT     h   ALTER TABLE ONLY "CSS".response ALTER COLUMN id SET DEFAULT nextval('"CSS".response_id_seq'::regclass);
 9   ALTER TABLE "CSS".response ALTER COLUMN id DROP DEFAULT;
       CSS               postgres    false    227    228    228            �           2604    17027    role id    DEFAULT     `   ALTER TABLE ONLY "CSS".role ALTER COLUMN id SET DEFAULT nextval('"CSS".role_id_seq'::regclass);
 5   ALTER TABLE "CSS".role ALTER COLUMN id DROP DEFAULT;
       CSS               postgres    false    237    236    237            �           2604    16880 
   service id    DEFAULT     f   ALTER TABLE ONLY "CSS".service ALTER COLUMN id SET DEFAULT nextval('"CSS".service_id_seq'::regclass);
 8   ALTER TABLE "CSS".service ALTER COLUMN id DROP DEFAULT;
       CSS               postgres    false    224    223    224            �           2604    16892 	   survey id    DEFAULT     d   ALTER TABLE ONLY "CSS".survey ALTER COLUMN id SET DEFAULT nextval('"CSS".survey_id_seq'::regclass);
 7   ALTER TABLE "CSS".survey ALTER COLUMN id DROP DEFAULT;
       CSS               postgres    false    225    226    226            |          0    16941    answer 
   TABLE DATA           N   COPY "CSS".answer (id, option_id, question_id, response_id, text) FROM stdin;
    CSS               postgres    false    234   #y       �          0    17033    college 
   TABLE DATA           *   COPY "CSS".college (id, name) FROM stdin;
    CSS               postgres    false    239   �y       n          0    16858    office 
   TABLE DATA           )   COPY "CSS".office (id, name) FROM stdin;
    CSS               postgres    false    220   w{       z          0    16929    option 
   TABLE DATA           6   COPY "CSS".option (id, question_id, text) FROM stdin;
    CSS               postgres    false    232   }}       p          0    16865 	   personnel 
   TABLE DATA           7   COPY "CSS".personnel (id, office_id, name) FROM stdin;
    CSS               postgres    false    222   �~       x          0    16917    question 
   TABLE DATA           <   COPY "CSS".question (id, survey_id, text, type) FROM stdin;
    CSS               postgres    false    230   y�       }          0    16997    question_option 
   TABLE DATA           K   COPY "CSS".question_option (question_id, option_id, survey_id) FROM stdin;
    CSS               postgres    false    235   є       �          0    17042    region 
   TABLE DATA           )   COPY "CSS".region (id, name) FROM stdin;
    CSS               postgres    false    241   ��       v          0    16898    response 
   TABLE DATA           }   COPY "CSS".response (id, survey_id, office_id, type, role, sex, age, region, email, phone, "timestamp", comment) FROM stdin;
    CSS               postgres    false    228   ֖                 0    17024    role 
   TABLE DATA           '   COPY "CSS".role (id, name) FROM stdin;
    CSS               postgres    false    237   ݗ       r          0    16877    service 
   TABLE DATA           5   COPY "CSS".service (id, office_id, name) FROM stdin;
    CSS               postgres    false    224   ��       t          0    16889    survey 
   TABLE DATA           B   COPY "CSS".survey (id, title, description, office_id) FROM stdin;
    CSS               postgres    false    226   ?�       �           0    0    answer_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('"CSS".answer_id_seq', 19, true);
          CSS               postgres    false    233            �           0    0    college_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('"CSS".college_id_seq', 18, true);
          CSS               postgres    false    238            �           0    0    office_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('"CSS".office_id_seq', 27, true);
          CSS               postgres    false    219            �           0    0    option_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('"CSS".option_id_seq', 25, true);
          CSS               postgres    false    231            �           0    0    personnel_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('"CSS".personnel_id_seq', 370, true);
          CSS               postgres    false    221            �           0    0    question_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('"CSS".question_id_seq', 26, true);
          CSS               postgres    false    229            �           0    0    region_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('"CSS".region_id_seq', 17, true);
          CSS               postgres    false    240            �           0    0    response_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('"CSS".response_id_seq', 7, true);
          CSS               postgres    false    227            �           0    0    role_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('"CSS".role_id_seq', 10, true);
          CSS               postgres    false    236            �           0    0    service_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('"CSS".service_id_seq', 198, true);
          CSS               postgres    false    223            �           0    0    survey_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('"CSS".survey_id_seq', 2, true);
          CSS               postgres    false    225            �           0    0    survey_survey_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.survey_survey_id_seq', 4, true);
          public               postgres    false    218            �           2606    16946    answer answer_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY "CSS".answer
    ADD CONSTRAINT answer_pkey PRIMARY KEY (id);
 ;   ALTER TABLE ONLY "CSS".answer DROP CONSTRAINT answer_pkey;
       CSS                 postgres    false    234            �           2606    17040    college college_name_key 
   CONSTRAINT     R   ALTER TABLE ONLY "CSS".college
    ADD CONSTRAINT college_name_key UNIQUE (name);
 A   ALTER TABLE ONLY "CSS".college DROP CONSTRAINT college_name_key;
       CSS                 postgres    false    239            �           2606    17038    college college_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY "CSS".college
    ADD CONSTRAINT college_pkey PRIMARY KEY (id);
 =   ALTER TABLE ONLY "CSS".college DROP CONSTRAINT college_pkey;
       CSS                 postgres    false    239            �           2606    16863    office office_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY "CSS".office
    ADD CONSTRAINT office_pkey PRIMARY KEY (id);
 ;   ALTER TABLE ONLY "CSS".office DROP CONSTRAINT office_pkey;
       CSS                 postgres    false    220            �           2606    16934    option option_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY "CSS".option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);
 ;   ALTER TABLE ONLY "CSS".option DROP CONSTRAINT option_pkey;
       CSS                 postgres    false    232            �           2606    16870    personnel personnel_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY "CSS".personnel
    ADD CONSTRAINT personnel_pkey PRIMARY KEY (id);
 A   ALTER TABLE ONLY "CSS".personnel DROP CONSTRAINT personnel_pkey;
       CSS                 postgres    false    222            �           2606    17001 $   question_option question_option_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY "CSS".question_option
    ADD CONSTRAINT question_option_pkey PRIMARY KEY (question_id, option_id);
 M   ALTER TABLE ONLY "CSS".question_option DROP CONSTRAINT question_option_pkey;
       CSS                 postgres    false    235    235            �           2606    16922    question question_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY "CSS".question
    ADD CONSTRAINT question_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY "CSS".question DROP CONSTRAINT question_pkey;
       CSS                 postgres    false    230            �           2606    17049    region region_name_key 
   CONSTRAINT     P   ALTER TABLE ONLY "CSS".region
    ADD CONSTRAINT region_name_key UNIQUE (name);
 ?   ALTER TABLE ONLY "CSS".region DROP CONSTRAINT region_name_key;
       CSS                 postgres    false    241            �           2606    17047    region region_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY "CSS".region
    ADD CONSTRAINT region_pkey PRIMARY KEY (id);
 ;   ALTER TABLE ONLY "CSS".region DROP CONSTRAINT region_pkey;
       CSS                 postgres    false    241            �           2606    16905    response response_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY "CSS".response
    ADD CONSTRAINT response_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY "CSS".response DROP CONSTRAINT response_pkey;
       CSS                 postgres    false    228            �           2606    17031    role role_name_key 
   CONSTRAINT     L   ALTER TABLE ONLY "CSS".role
    ADD CONSTRAINT role_name_key UNIQUE (name);
 ;   ALTER TABLE ONLY "CSS".role DROP CONSTRAINT role_name_key;
       CSS                 postgres    false    237            �           2606    17029    role role_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY "CSS".role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);
 7   ALTER TABLE ONLY "CSS".role DROP CONSTRAINT role_pkey;
       CSS                 postgres    false    237            �           2606    16882    service service_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY "CSS".service
    ADD CONSTRAINT service_pkey PRIMARY KEY (id);
 =   ALTER TABLE ONLY "CSS".service DROP CONSTRAINT service_pkey;
       CSS                 postgres    false    224            �           2606    16896    survey survey_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY "CSS".survey
    ADD CONSTRAINT survey_pkey PRIMARY KEY (id);
 ;   ALTER TABLE ONLY "CSS".survey DROP CONSTRAINT survey_pkey;
       CSS                 postgres    false    226            �           2606    16947    answer answer_question_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "CSS".answer
    ADD CONSTRAINT answer_question_id_fkey FOREIGN KEY (question_id) REFERENCES "CSS".question(id) ON DELETE CASCADE;
 G   ALTER TABLE ONLY "CSS".answer DROP CONSTRAINT answer_question_id_fkey;
       CSS               postgres    false    234    230    4796            �           2606    16952    answer answer_response_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "CSS".answer
    ADD CONSTRAINT answer_response_id_fkey FOREIGN KEY (response_id) REFERENCES "CSS".response(id) ON DELETE CASCADE;
 G   ALTER TABLE ONLY "CSS".answer DROP CONSTRAINT answer_response_id_fkey;
       CSS               postgres    false    4794    234    228            �           2606    16935    option option_question_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "CSS".option
    ADD CONSTRAINT option_question_id_fkey FOREIGN KEY (question_id) REFERENCES "CSS".question(id) ON DELETE CASCADE;
 G   ALTER TABLE ONLY "CSS".option DROP CONSTRAINT option_question_id_fkey;
       CSS               postgres    false    230    232    4796            �           2606    16871 "   personnel personnel_office_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "CSS".personnel
    ADD CONSTRAINT personnel_office_id_fkey FOREIGN KEY (office_id) REFERENCES "CSS".office(id) ON DELETE SET NULL;
 K   ALTER TABLE ONLY "CSS".personnel DROP CONSTRAINT personnel_office_id_fkey;
       CSS               postgres    false    222    220    4786            �           2606    17007 .   question_option question_option_option_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "CSS".question_option
    ADD CONSTRAINT question_option_option_id_fkey FOREIGN KEY (option_id) REFERENCES "CSS".option(id);
 W   ALTER TABLE ONLY "CSS".question_option DROP CONSTRAINT question_option_option_id_fkey;
       CSS               postgres    false    235    232    4798            �           2606    17002 0   question_option question_option_question_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "CSS".question_option
    ADD CONSTRAINT question_option_question_id_fkey FOREIGN KEY (question_id) REFERENCES "CSS".question(id);
 Y   ALTER TABLE ONLY "CSS".question_option DROP CONSTRAINT question_option_question_id_fkey;
       CSS               postgres    false    230    4796    235            �           2606    17050 .   question_option question_option_survey_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "CSS".question_option
    ADD CONSTRAINT question_option_survey_id_fkey FOREIGN KEY (survey_id) REFERENCES "CSS".survey(id) ON DELETE CASCADE;
 W   ALTER TABLE ONLY "CSS".question_option DROP CONSTRAINT question_option_survey_id_fkey;
       CSS               postgres    false    226    235    4792            �           2606    16923     question question_survey_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "CSS".question
    ADD CONSTRAINT question_survey_id_fkey FOREIGN KEY (survey_id) REFERENCES "CSS".survey(id) ON DELETE CASCADE;
 I   ALTER TABLE ONLY "CSS".question DROP CONSTRAINT question_survey_id_fkey;
       CSS               postgres    false    230    4792    226            �           2606    16911     response response_office_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "CSS".response
    ADD CONSTRAINT response_office_id_fkey FOREIGN KEY (office_id) REFERENCES "CSS".office(id) ON DELETE SET NULL;
 I   ALTER TABLE ONLY "CSS".response DROP CONSTRAINT response_office_id_fkey;
       CSS               postgres    false    4786    228    220            �           2606    16906     response response_survey_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "CSS".response
    ADD CONSTRAINT response_survey_id_fkey FOREIGN KEY (survey_id) REFERENCES "CSS".survey(id) ON DELETE CASCADE;
 I   ALTER TABLE ONLY "CSS".response DROP CONSTRAINT response_survey_id_fkey;
       CSS               postgres    false    226    228    4792            �           2606    16883    service service_office_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "CSS".service
    ADD CONSTRAINT service_office_id_fkey FOREIGN KEY (office_id) REFERENCES "CSS".office(id) ON DELETE SET NULL;
 G   ALTER TABLE ONLY "CSS".service DROP CONSTRAINT service_office_id_fkey;
       CSS               postgres    false    224    4786    220            �           2606    16958    survey survey_office_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "CSS".survey
    ADD CONSTRAINT survey_office_id_fkey FOREIGN KEY (office_id) REFERENCES "CSS".office(id) ON DELETE CASCADE;
 E   ALTER TABLE ONLY "CSS".survey DROP CONSTRAINT survey_office_id_fkey;
       CSS               postgres    false    220    4786    226            |   �   x���1
� ��YO�N�h4�D��NY$y��%����7�ҡ ȏ�+�xe��	v���	�[�3�i��0<x,&|�m�8����&��x��0�h�����򻡩!5:jȿ=5Ο�x燳jz)�9�J�d���*����:�e��K+��'Yo      �   �  x���1o�0�g�+<��ڎi�"a�S�yI��ؑ� ���9�j@2 !��Ow�$�7�Yڶ
��T��owi�'�Q
*`�d���	]0n$
ŸD��f)�q�0g�i;�q�؋2�,���4�4(�{�jpg~*��Z~�m�BA����£�Ẏ�տ�˵��
[�	�i lH^�z�,_S����(X�I��8z�� �����DxJ~n}���54�H)��Qr?�	@Ґ��$��Zد��xN�$���e�%�j��2�M�	�W�w�?�J��R@K��,Z��߳�vMƸ�5:oϣ�V��54�9��Y���]u�GF�C��ġ�TW5���=�ae�؄,�Ew�p�WNG@xX*ʐk�HeNp��sB<�Bt}���=��u�[�FQ�u�)      n   �  x�mR�n�0<�_�H�H~%GCvc#v[�zɅ�V2j)��ߕ�Fl��`Y3��;���R6b�X����y��&6���Rl���`�"����B���qΊ�F܊=aj'�b�'u���EDe�X��DE�m��2L=�h�} 鐆�e��#=�	^ئ��?Π.h���|�
k� l5��lg} ��.6�x�q�(k�~���3�.���N+�	&c�h��4��4�g'�Wd�GU��9;@-�$4~�ٌO����Y$�;m4���lξK��sU�Y�bóE�U�e�}o��g7�Q\��=���y�LOQ�}����g�V	�%���P��A�݁4���R�E�P��K�4qL {L`�ֺ�Ӯ��>�b9$�����<K����M=�� ݕ���W�8�ÕN[k�U:���Og�;�U�|�H5�����|��X�	�`�ضf�h�_*.Yb������ڊb���*�v�9���EJ      z   5  x�}Q�r�0��Whl�8PʘK{W�t�#�!��jl.vȱ����%�J��IOzOOҨ7+z�P;�2;x�^�jD���)sV�֐1����#7d]�\(A\�l�1z�����	|Z�B[� 
��eK��W-��R�\��ߞ�}�n��M ^�K(�?��ͫ�a�7�j�%��Y�Yr�Vh���ԱKG77ͳ	��	g�=W��]f}K�<쿊��ԩ�d��yz/�zU~���H�_a�Ƅ<�=�V{M�vc���-$/d|�����z�fQ	�2uk�T�.dڍ�`P��IixA�3{����ոv      p      x�mZ[v�H�F���|@B<>���׀�>�3?	dAڒ�II�ƻ���zcso$��S����@�7�q#�I��H_r���U�`s�SA��\;�g�ݩ"�^�S�JU�6*�R�r�U��*�S���zP\������!�Q�ɱ�J�S\-�lQ٠դV�"L�J�p����*h����tatx��Ѡ�2Ul�1hEЍU�3�W*S{Z�Hk������j2S�V���ei6r��f��*h%��pG�T84��Z��U8�d�r�� c3h	(�N�A�����]�c�
n�_<�;��̬S<>����Wg�L���BX�2�R��!��Ru��R:4�"B�4�f��Mit�K�! ��#� W��^����pȓgjW�ADLV����j�����mp�|���܇U�
�V��y�N#j���[�y<����3�Bq��
oq��m�ѴM���6��pS���*�\�=����N�+^c�,��q�����Ip�ۚ�ī=��;>�K�iG��~�8nč�3[�Z����f*��-����q�}�5tV^~܁@���;=8�yW�)q&�$��= � ����4�v;�_�	!��~6@�ؠ݂h��y:\�ݵA���tvD|��l|LGN�Im^�(�;U��[x�H�6����v�h7n�*���}�tιIҥ�MTue���>]�/,�k$�t��mx�۽Q��cț*���?��7���V�U6H�t�r ���5�-H���))�I�.A��� ��$���C%�F�1TE%�=D��h���rY�� ��
'�P;$�3��
�4�o�vzz҅f���p�I�3Om��'�RW�p�0rA҇d�m��z�M%�t�P�����ܬPp��ӂ|�*��,�]��C����N�Rn`��"ݩmЉ)�)A����޴:4xi6Hu[��l�f��>�Me�_j��aK�޹�\���6Ғ:JA�V��]��ĽXw� �=����n����Jm��>T�,���L���b�^RD��˷�r�P&Z�}�ݕ$��ɂ^�O�E8�o8�{���A/�r��*?�����׆�w�zI�ט��jl�z!�![�ԕ~#�A��R˥,����Aza��Eq���7|��/f-���
�-�
dF� q�[ŲA<���»�?��*���TЏ���b�����jq�m�ȯ�~�@8o�|�An�'�ީ5�����3-�f�;P�#�a?��tg�~�1p-��RK���=J��9��2��)�e-�=��̢�6i�����{�ּ&����3m�橬�k5i8��a/��\CA��H�9�2K�q*�pJ�i��"��� �V\�&�*X�ʴ��>����e��(�MT.^2��=r����vȃu��bGߋ�W�@.�˔`'M��g�uZ �UUKTN(�y��`��!s�E9Lsԓ���o8��9��?h������t$(*Fo qk}z+�ԩ#:w�.�ܠ�å[-��V<���#��
2����agv�@w�,?�u�p��04��c*	N�:��-2�g0�;[��?ڲ�
a ���v:;��䎂˷�g�鵚����k�t@B�CB�^�ȭ���cy�����D!�{KF)������F2��P� `v�������18rv6�@�ib���#����,�E��>�}�׊G_T�����B�]���x�Ύ2�H�Z�@u�A��k���w�2(�SHyF,@&݀�oL	���E۸�����6��.�ڹc���ro��Z�4�m��w�p���;T[@����>s�>�j;���d��o�-��ϟk���n�n{���dm����y��>�m���7Cc �z�续����8�Һ�C���Xx�I�${Sv�8��S⍬��� ;��$�IH[�MwO���%�r���%+�b�'b�������*��D��mHL<a"6N�x	{*d�C*���I�!�:}�v��;�ެ� �k�OB0O�4>Q�hz����oB��R�����뗰3VM|Ϝ���g��F�$8�TL]譓�pK�s�F�F`WGL^J�� QótOBQ�-�>/��b�@Jgk������h�� �8�t�7���!����my͑�A u���X1������KvƎV8�����b�Ҳ�`�����n�e8�oy��%n�RK���v?�wW����ڝ$Q!��N~��?��IQ �[���j+��|��p�^���-y��Lz������,��9D�3��ޏnt�S«d��ؽBF̀+��cO,~�η��`D���tj��R�)��0�^��|��V0${b� ��������2t�Z�j����Ym7���g�|������h�b)�Ju/��-�s��K�DA]B��˷ ���Qx��1��] jO�L}�1�kHk�Uz� r��� G*�8FX�pT�B���S�wDM�A
��L��ۉ���y* J��������(V�>����o�~'P<)񅱕�%O
�@qa� ^�.D�g�H�눸��R9�%�K�+�[���ߠ�	��4�p�U�����A�oԁ��g�[�o�zx��;���c~�H�b�+�����QLD�G��|�'��ԀG$smǌ=����N�@�Gj@�3��)��K�l��.-	 �l���~�Hi�k|k��/6P����(�K��D��Q�
�XL,�KUIP_[W��Gdv���Hc�����[��_����G;�?7;K�".E��4����Ҡ����J��4V�f9`���%ѻԵFdx��`9�S�y�����s(�T\���I8Ng<�hv����.]N�و~��T}�ƣ�hz���Ť�)~6��|��=�MBH�g2�L��cz}K��t:M������9�&�f9z���!���N�(�pg����M��rM�������(L��x�'�C�z����L����j�N&�����֤�W�1O+�\������\���d�яH�8p�?+�ي�>��}@ &���F�Yc�kQw�r�~�u��q������ ����g�F����w`
2ӳNo�pr�.{���a�
���ʄRt�h���tj��F̒�u�x��X�]�̦�#jw�z�SG��	�<0ܡ�����đOӷ�- ̬�N�*��/�3J����^U{���ևV��X�>���DpX�/q�k����=���̚B�"�vVFkQ����w�;~9s" ]�~r�^�A�c��WP�.8wD������+#O�y�+��ukia_�:�}�O���K㑈t�߸�(�cC�	���Ic_����lQ�T�f���3뺬�aOe�J\7K�-�Kd��=^��#�ǈ���ܘ�5V�]�G��~6�F�
q��1�7��-��a?����/�����F��o�IB�������/��i� ��.������m��ƃ�0��SFd�P�B�Ȗ�F5�@צn��b�;G���ڿ����S�Z�J*d<�y����=K��_��I�8����ʀ���Q}���$��3D� �>��"0M�q�LJt|� لn�Ly9���K�L�@�;�fY:����e~�m,Z0�Þ���W Je�~M����������ّ���vh:� ������5�>=���B�0$K![�e�ܒS< B
�R����>X�Ez�:�%�MА�G}g�����5��d�/�\��5��&�����¿��E�y�J�>r�4 �X�6�׆��䥃<�$�cx����0�AF���&�03︟j/��T�Se�@F ���qVt2|�`�_KʃoA&�;�b�P�9�2^���#���nJ���
��L��48���eL7���/-��7�|�s��=��GqS0XJݢ�n��$��Z�D��߸)��Ф�!74U�Qd�qSL?eg;��=����g�<�C�\&gn	ϧ��{������Z`��P�n��x��*PQ�m��H͜##@�����O��r}*�N丽��kđ�c�������@���e���G����4 �  *5}j�%V�sE]#3B�g���� 3AբJ�H޷�vok$�/���q6�c����~/H�-%����Iy�E!�ȹ����|�L�����)��~�ץ�G�<d�����|�Li��>�M1�= 8�,��$�|�;џX�����3��Ȥv���|tn,n�o�$�p�
�w�)�!��_5�~r�3�?�/XV2-��a��JDbAD�?�ɏ�X���?�-�韾9r�c�)�U'��f,H<��Q�N��jU�<.\�'�Ow��d5�\ o�<�����
�)/�����jxM)/1�'����_�2�mʯ�c�+�nMiB��_LᚔvDj�0Qr>��4�:_jD��� ��	��2��2�rXpOQ���dJ��'M�r��L�{���Aa�s]�Ь��������'Z	Sk�',��+a��u7N�%�xMq����Z�(� /��C�m��N:^�ˋ���������o�����E`$�[@[�I�f�I� �j�q�i��i?C,v��q��5����U���h��b����J'�!lÝ~qG ��~���q���y�On�I��b�胎���z�mz�K3�@��:&���	`�;���R���:E�M}%ȓzv�!��K����?Fh^>���� �?�9      x   H  x�}T=s�F��_�.��N>I��4)��In&M�	�/w�ݥ����L�����a�u7��D����l�,6�_��͚>Ro�&C�M��,�������H�ԝ)㢩�x�^�b���r�z��l)���F*�� �H��O���P����X�����D��]Q=�*ֻ����FѴz��5U~�����!&�4+2��i���i'-��v�u�����j��O�P����h�>r

i�fp�jT�;`���)/SH�d����h�'�eb%�U��w�����%Y��K��*��'[���km9�.�=F�:΃U2y�M�N��Ϳ�*��S�&-ȃ��go�8��n�g�)$>\w[?F�o8FP6Vb��ޣ7vx+��Z�������nQw���k�j/�{k��^9(͚c�t�Ȍ&��nh/I�b�]�}k`�����&��x�Pb��e�cS�5u���=r@��W;����F?�Z�(�WZH�%^����/ �g��7+��>ǅ��С��N��W������I^�Յ��[�$�s6�"�S��M�C��rI�P���p<B�g�g�P��Q�]��#�p`���ž�/'׿V���%�����d!Q4E���mޛ����^���˕��o^�ɱӂO�*����m{z�;歐�Y��}L�G:@���+b8`vy���'���o�N/X�-p#��C-�������؈ڿ��I���31#힑��W,'�����?����̏><(Ѭ.j�J�06�S����$q��0}���Ԩ]#�o3�}���1���t4�L��>����e[�{5q@��G>D\�����r�?�M�      }   �   x�-����0��q17Yڎ�^�����~=���4��z�l��-l)p�ܯ�ܘscn̍���17��ܘsc̃y0��<�g��`̃y0�uk��#[\z��8�<�%W&fb&fb&fb&db&fb&fb&f�L�)3e�̔�"Sf�L�)3ef?[�S^���#[����.�#K��w��w�?k\�      �   %  x�]��n� ���S�.�M�.����ZMM�,�9*�H(g���=��h�+����9�LɊ��B4�j\�Lh=��y�k����R�Tt`��o��z��u�s*�-0�ǤEQAgp|�sf�^�v�h�{�Cݦ	nF�r��|D��*�BV˕dO`C��в�$E����t0��&�{<����X���)ˎ�4{W_ig\�,0��+J��W�Pw�D��.:��)��^��z���m-��E��t �s�4Y&f�\VEO!4�ˮE�v��Qܐ{�i��w��_(���      v   �   x��ѽj�0�Y~
��`qu�gi2�v��t��E$"d9$2�}��i�P(t18��� �IK�����ryx��)�pz$�O� ���O>���p+mx��%v�F���J��T5`���)p�m�M������L���|�6�>��5I98�N�҂nVMS�	͌0f�Ԏ�p��a
�\5�h|Ӟ�qN�c3��@k���H>��_bY��&?ߵ���_��K&QY�+gv�h�A�����UU�D췫         �   x�E�;�0F�{EF�X��Q��AP8���.�IIo����Pp<��Upt��K8�&9q7j$E�����ܰq哆>��?�XFU���J��<L̬�UFiIm�r�nA��w0jv�18Gm����G���S�;���.�)��,r�f�/���K���#��s?�      r   �  x��Z�r�8}�O�ʎD�5o	I��� �xk_42'Q�#g$9[y��?�/���E c+��VMe,�t���h�9츝$��;�6�mμ�p����nN�3�P���y��9����O�m��BXg��x�������w�?���S�?�����c~`��i����g��wx���di�=-�)=�Z�G�`�b<X	��%�vf@I�3�Q�%����q{TQ #������RE�[&���+Z2�f��R�x�W�e�ҕ�~�����Bc"�5IBO���G�^�d��;���E�@y� �z�&�q�'u�Ag���N��uǁ�v�!P1�!n0\��Ze�&-䨉U���{�-c�i	\��%3TJ*�>_�y�hA��;���j�����	1����2�˗��2��T���
�I�j���h�8�k�
��2��O��#��կ� Ȭ��r]]L���Vͮ��W2&�G)D��	];�^[G��[)SV��+�1���6���L%C!�=�Pzl�"�h����"JT����U���_�R���S���5_�;��E�|�|����˞z�]Y-����B��,$����2��1��"�2�0囚rY�>mIb����	��E�=I�B~��G�f/���*�JRS0��A��[*�c�$��[a#{�gЎ<�J��wA[ �:
w"l��5���{���8P!w�h��������[��`s0X@��P@�D!���iC�e
�ʸ��`�ux�K3aVa�$��kl��<�׍��6V��~^�E��Nw�S4,,���b��L�:^��p�4 +M���̆��'�2�%�9E崽S��+!R�{>�*f��gI��*�d4��ú:C��dQ���θC�ː0O��P�
g8�����}*�H2g84����=ҡ�d�'���A$MZ��S��+��N��ߚ�qZ~�h��H�w*y״l�8�����a-4�ј<�3r�AB����h剸�aSG���G|���Md���w������s���R�UU4�!�!�T��]6gҙ���3�S:
3-����eQ������Tl-�TTa�q��x%!�J�oY��(�J��D��iFu�&��3��Ĕ_(���4�~Bs �2���+��#3�{�ig)"A�PFTE
m2�=��Fc��B6��y��*"��I�����T�h��3;���[���*���v�C�۬��v���jDI?�����RX	�I�xLF)0�h��d0Pz4ߤ3�`"����+Ss�6A�TE)Z�31U����Pt��R��g��8�ܘ	8Ȑ3����d�L��H���8t&}�cѨ�t`I��j�H����:UI��X7����ž���d �8=b~&�e}q&C3f�/P`��<�W^f�V��#)�p�&�ܿ��/F��,�#[��h]�҈�_5Ev�E'4�^���:`:�Rg2m#*���x�&�P̰O���u$*QL��3���B������}�2�"�1���V�8xS�lx��en@#d��:�~eֶ�R�D�U9S��n]XΛ�[Օ� �����,(g��cI)qyg:%�m-�m�3��ǋ��,^�WX
����h�l��X!E��CC�'���?@/���p�4��ȑ*�#P��Q���/��g��	��,�T"�T�<sl$�*R�uf����E���v|U��ـ��m[���;փh6~�kVc���gCA)g#B7w��ɱ���Jʙ�I�v��(�V d�gNoj\Mv�5z6iK�L��d�[�KN�K�~g���)h���ˢ��M۪Zqk�yI�y�2�];��j蕊��rf3{FXZ�mQ�.��7n#⌿��\�q�_�hJ���o��k.���@ӕ"A� /��P��vd#��T�ZR�)>�����	k{�:Yi���ӂ�-*΢�j�ޣD��+9��İ-��@*��q�IX���	ah}�����d6|a��n����q��A�M*D�d�����j���
���$�2�G��dJJ�7F�^��.�6{v�y���tT���~R��T���[����nS�X��MT>ޭ�mH�I�}iܿ]!ɾA[H��߲Gꘋ b8��s4��Sft_D�L1��?k���7>13�>�|Ej!Ƀgs�+D��|��)�	z��|c�Uஊ�F5�`���>�.�������S��i[�"XV��"&t6�Ҏ�H*o���Ե}����{���f�>h��젞7C}
5���i��]�/ҵ��v��:I��F +��=�g�k�;��K`��!�׭�	NBBX��&�����M+� 5%�x/Srˆ��\�K���m�y5�^a ��L<��'R�X��O��5�U�.+��^~@�
S鹵�@Cdu�ּp�����C���0�f�e8hGh�[Apl����K�>�i�.�9��W����?&3�e�����6��lok�c!�%kqO5�8����j�{m]^@��ёJ��%��*2A��U?B>k��� ��1�@�M�,�Èk����w��mZ����6�����/�cMb�,��HV��*K*Y��[QޠtHJuS����٢qVEk�������tB
XW�GA�=?����}��0�t�0�{���eu�|_�b��	)Ġy�t����c̹=ʉ���oJf�˥+V��wU�z���m��	ĝt�v�̣�jp�o�Pʨ����Rn��m�Ӹ��^����(l���O�ܐ{���le����h�=�v.�qɚ <��pIW[��h���+C��v�#���la3Թٌ�B�V�Ƕbj�D��3@
[��P���V0i	hz�W�2zR���!m�9e����}�;����_q�}SuZ����}��9�G�Q�T�"#X�3�lKE	v�f{��%J�ۂ\�o#�W��6o
�c�Z�+ԟk3��lh�<4�ZO�5�E����!��L�����{�� �D�K&}�`��Kl����^�Z�5-jb���j������VA�,i��*|��!p��7��W���$�T���'V K�;tC+z�a=�<�ZƜu�w�O�>��b����������xb>���i�=��3zF_<�� �ϟ??��#����_v���.i���x�m�|��@�B�O������?)8 Ay<>�o* ��/�Sa��LA��ίF�t�~���?��W볍��Ш�� ����:~|�O���w���@�{,�i���gf�g<}���|s4��9uM�.���`��+�Ox��ML��Ñq��r�n�C��M�m�����lS��5�z�aϢ�Ӯ7���������H�Rd�1�!��1���N���Rs�>�����I�?ua��H����j�F;������1g1L�OpXI9�j���C��~e�g�I��YP���)�k��w_�]��vO�G�珻/�aW$F�jd�愧���M��	����OŒF�����T:&����_z�O�ojl��GX �	u�śWHM��ͽJbx~+�b��0�G̙�9m��Q��d����������wJ�57`(Y�������a�������ѬO!x����[�ˊ��}���a������m�����o��ـt$N��V��oL~O�_o~RM?�y������$?���q$��|�v���90��<�-CF���[u1Tƴ��I6��bÝMq��ڇ�lJ`���6�o&���u�?�6�7      t   R  x��T�n�0<�_��%@b������@p��/4��S����}�+�ri��<vv��7k�%:�db�t2�юÚ;y������H#ӻ���Dɏ*T���mf��k(�LuN�������f�ܽ��a�*��Z��J�M[g����#���6��]!	>7����Y��r=�f%�o��G��wU�)���"D,���y���88)l���D�ž�2�ܾ:XѤiM/��%%��Tqm���D-�^ PV��������B4�X��&/�,�-���趎���������g[�5g.����(�M�Ζ�����W!��
�d�*X*�\�(ǌ��9���璔(8t׈��qt�S�2|'F��#��T.���\�[��"�O�KD��+\ s�_�>��iZ���>�F����d3����氻#�D��y��w���wv�@�2,~ku��+)�N���m�� �]\���R/��N�
3c��\/q����K'�
IlU �%�3���ՠp���6�E(;�)���"��GW���*F
����u���[oX���&�*�v�ׇ������y���D����q�Z�� Qܡ�     