--
-- PostgreSQL database dump
--

-- Dumped from database version 12.15 (Ubuntu 12.15-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.15 (Ubuntu 12.15-0ubuntu0.20.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: posts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    name_dog character varying(12) NOT NULL,
    image text NOT NULL,
    description text NOT NULL,
    user_id integer,
    active boolean DEFAULT false NOT NULL
);


--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    user_id integer,
    token text NOT NULL,
    creatdat timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    cpf character varying(11) NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    phone character varying(11) NOT NULL,
    creatdat timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.posts VALUES (10, 'Chocolate', 'https://img.freepik.com/fotos-premium/labrador-retriever-marrom-sentado-e-descansando-na-sombra-em-dia-ensolarado_552988-704.jpg?w=2000', 'Craque em natação, cuidador de crianças!', 2, true);
INSERT INTO public.posts VALUES (6, 'Bob', 'https://fisiocarepet.com.br/wp-content/uploads/2021/12/pastor-1.jpg', 'Cão de guarda', 2, true);
INSERT INTO public.posts VALUES (1, 'Fred', 'https://petanjo.com/blog/wp-content/uploads/2021/11/labrador-tudo-sobre-a-raca.jpg', 'Òtimo cão guia para deficientes visuais', 1, true);
INSERT INTO public.posts VALUES (5, 'Lalaika', 'https://guiaanimal.net/uploads/article/image/690/AdobeStock_47432136.jpeg', 'Super linda e carinhosa', 3, true);
INSERT INTO public.posts VALUES (3, 'Hulk', 'https://static.wixstatic.com/media/db516d_29006f5a1e304f068b4fea66c40bab83~mv2.jpg/v1/fill/w_640,h_450,al_c,q_80,usm_1.20_1.00_0.01,enc_auto/db516d_29006f5a1e304f068b4fea66c40bab83~mv2.jpg', 'Cão farejador treinado pelo Bope', 1, true);
INSERT INTO public.posts VALUES (9, 'Lilica', 'https://patrocinados.estadao.com.br/portal-animal/wp-content/uploads/sites/8/2015/12/iStock_000016556419_Large_small.jpg', 'Top model das passarelas', 5, true);
INSERT INTO public.posts VALUES (7, 'Jade', 'data:image/jpeg;base64,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', 'A mais linda do role', 4, true);
INSERT INTO public.posts VALUES (8, 'Uly', 'data:image/jpeg;base64,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', 'Espuletinha da galera', 4, true);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, 1, '92e0a157-f2af-4a99-a3ec-4f9b34e74e70', '2023-08-08 19:28:30.590576');
INSERT INTO public.sessions VALUES (2, 2, '724961f7-2208-4305-8567-cbe381002313', '2023-08-08 19:40:28.119456');
INSERT INTO public.sessions VALUES (3, 3, 'a425a640-b630-494f-b078-bbdf4521ace2', '2023-08-08 21:27:14.437632');
INSERT INTO public.sessions VALUES (4, 3, 'ed5aabe1-f24c-465d-a973-ecdac448b2d6', '2023-08-08 21:27:42.10417');
INSERT INTO public.sessions VALUES (5, 1, 'd1b56fe2-31d6-441a-bf91-e3a39d644403', '2023-08-08 21:30:39.595091');
INSERT INTO public.sessions VALUES (6, 2, 'e359cac0-2389-46ee-8d40-6b971df61431', '2023-08-09 11:59:03.290218');
INSERT INTO public.sessions VALUES (7, 1, '6da03b22-574b-4c39-b729-96e75bb02e76', '2023-08-09 12:11:57.325868');
INSERT INTO public.sessions VALUES (8, 1, '43917b4c-de33-4269-944a-5166e0b1075e', '2023-08-09 19:03:38.47747');
INSERT INTO public.sessions VALUES (9, 1, '9048c897-1a42-4241-8fa1-778715b79c9e', '2023-08-09 19:37:26.368907');
INSERT INTO public.sessions VALUES (10, 1, 'd8b9e4db-70a4-4aed-b004-768de74577c9', '2023-08-09 19:40:54.701821');
INSERT INTO public.sessions VALUES (11, 2, '1e63aba6-afb1-4715-81da-fa9d5ee2498c', '2023-08-09 19:45:11.858505');
INSERT INTO public.sessions VALUES (12, 2, 'b7405d2d-a669-4258-bb41-b24873811e19', '2023-08-09 19:46:52.061541');
INSERT INTO public.sessions VALUES (13, 1, '59d1d757-fd36-47bb-9acb-5ef3f0883e62', '2023-08-09 19:55:33.535685');
INSERT INTO public.sessions VALUES (14, 3, '5acc2830-e0b8-4594-8c97-7405c43aca0b', '2023-08-09 20:43:39.792316');
INSERT INTO public.sessions VALUES (15, 3, 'fc24d1a1-d5dd-4778-a129-9564059eafe7', '2023-08-09 20:51:21.676562');
INSERT INTO public.sessions VALUES (16, 3, '796615da-c562-409d-a14c-f68978260250', '2023-08-09 20:56:05.222797');
INSERT INTO public.sessions VALUES (17, 3, 'e5bd6782-c1c1-4a17-baed-4b2c79850a46', '2023-08-09 21:17:17.295402');
INSERT INTO public.sessions VALUES (18, 3, '2cff4472-8361-4809-bcd1-fe42b1374589', '2023-08-09 21:20:21.062085');
INSERT INTO public.sessions VALUES (19, 1, 'a3b48346-88f2-43b9-aec4-fd79e470abff', '2023-08-10 20:31:16.78184');
INSERT INTO public.sessions VALUES (20, 1, 'c161d734-e0c7-4c5a-b390-24ece1e73a13', '2023-08-11 17:03:44.675746');
INSERT INTO public.sessions VALUES (21, 1, '785ed87d-24d9-4548-8c86-3398faea22b9', '2023-08-11 17:15:24.29903');
INSERT INTO public.sessions VALUES (22, 1, '5db592a3-49ff-48d2-804e-e776ccff7038', '2023-08-11 17:55:33.137481');
INSERT INTO public.sessions VALUES (23, 1, 'd27fcec6-0051-411f-8e96-69a75741e7cd', '2023-08-11 18:15:22.023166');
INSERT INTO public.sessions VALUES (24, 1, '2df6d44c-11a7-4509-8598-83f898773f00', '2023-08-12 10:24:40.566402');
INSERT INTO public.sessions VALUES (25, 1, '6af55dd8-62ad-49be-900d-dcd5547ad05e', '2023-08-12 10:34:02.293035');
INSERT INTO public.sessions VALUES (26, 1, '9a73a472-4483-4092-89fe-54bc4814a1ab', '2023-08-12 10:45:57.439604');
INSERT INTO public.sessions VALUES (27, 1, 'c72bc709-22cb-41d3-bfbc-d3f34b908da3', '2023-08-12 11:01:13.657986');
INSERT INTO public.sessions VALUES (28, 1, '324ca01d-338d-4b46-8df6-14422334170e', '2023-08-12 11:20:32.345887');
INSERT INTO public.sessions VALUES (29, 1, '05d68fd9-d425-4067-a7c0-82a3379feb80', '2023-08-12 11:25:33.476895');
INSERT INTO public.sessions VALUES (30, 1, '2ea757fa-4bfc-4e5c-82a9-c1cf2e7e1ab1', '2023-08-12 11:39:03.871244');
INSERT INTO public.sessions VALUES (31, 1, '6bb09690-ded5-48c5-9b2f-b6b4764a0670', '2023-08-12 11:50:53.139953');
INSERT INTO public.sessions VALUES (32, 3, '44b1d97b-600c-4b59-bb0e-28ce97d69665', '2023-08-12 12:11:11.498011');
INSERT INTO public.sessions VALUES (33, 1, 'd716ee57-3a9e-4693-a013-1ebc77c6c81a', '2023-08-12 12:16:54.644823');
INSERT INTO public.sessions VALUES (34, 2, 'fbf4d347-4382-43b2-8a0b-126b6b0ba4a0', '2023-08-12 12:28:14.838247');
INSERT INTO public.sessions VALUES (35, 1, '51617739-bfdc-4b83-83df-cfe96167c7bc', '2023-08-12 12:31:16.920565');
INSERT INTO public.sessions VALUES (36, NULL, 'cf663e9c-9c9f-41bb-b6f6-0712ae487c2f', '2023-08-14 11:39:35.878684');
INSERT INTO public.sessions VALUES (37, 4, 'c9537f69-a29d-415c-a125-cfd2a3514b0f', '2023-08-14 11:40:53.714597');
INSERT INTO public.sessions VALUES (38, 4, 'b2a46a6a-9c20-44b2-94c4-00b64acd0399', '2023-08-14 12:19:35.391555');
INSERT INTO public.sessions VALUES (39, 4, '0d61d8e8-d08e-40e7-b9f0-183c4be01417', '2023-08-14 12:31:40.956714');
INSERT INTO public.sessions VALUES (40, 4, 'd39cbd84-cfcd-4796-9f3f-1d123bec4a3c', '2023-08-14 12:36:25.40358');
INSERT INTO public.sessions VALUES (41, 1, '279ab030-bdf0-4e5f-ac64-3f698985b7de', '2023-08-14 13:47:30.079579');
INSERT INTO public.sessions VALUES (42, 5, 'd7c54243-d290-4a0b-a333-af25d6a41d5f', '2023-08-14 15:08:28.73203');
INSERT INTO public.sessions VALUES (43, 1, '0bcd5ef3-6558-44ee-9b37-3d9f07924cf3', '2023-08-14 15:29:09.923783');
INSERT INTO public.sessions VALUES (44, 2, 'f1792778-6e83-4476-a185-f51e8bcf0172', '2023-08-14 15:47:29.370105');
INSERT INTO public.sessions VALUES (45, 1, 'ddb3a20f-dba0-4f5f-82c9-6d1a4f548357', '2023-08-14 15:56:54.274695');
INSERT INTO public.sessions VALUES (46, 5, '47b683ef-9ff7-4358-8ca0-cab12d0fe470', '2023-08-14 15:58:05.319938');
INSERT INTO public.sessions VALUES (47, 4, 'b6eb0022-0b43-407d-811f-bbfe5a66a4c6', '2023-08-14 15:58:23.355502');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'Nilton', '12345678910', 'nilton@email.com', '$2b$10$CMaI4t9yqfrlMpQvCqi6NOi2G7fhI4T1txIZ9EGZXojniPthaFhsO', '61985688568', '2023-08-08 19:27:35.370333');
INSERT INTO public.users VALUES (2, 'Tamires', '12345678911', 'tami@email.com', '$2b$10$qAs/7oR4apnJT9ZPW7AKlOUreEurP97kKEFwe.iRoD7JOg5BpA7qm', '61985688569', '2023-08-08 19:39:29.032631');
INSERT INTO public.users VALUES (3, 'Luiza', '12345678912', 'luiza@email.com', '$2b$10$Uclip8jTwEFfiaTQEcl4uej/I5IXnYvLLX2Np14CME8dBCmaLNSUq', '61985688570', '2023-08-08 21:19:58.990481');
INSERT INTO public.users VALUES (4, 'Andre', '12345678909', 'andre@email.com', '$2b$10$cN5gUPd11eNqzzN1uz5WGuMQP.GdA9yrSFDq.Ah1n1vAPmWkVGaOa', '61985688588', '2023-08-14 11:06:39.266738');
INSERT INTO public.users VALUES (5, 'Maria', '02136654789', 'maria@email.com', '$2b$10$PUFbaVdQIlJlfpckkk1cbeSeTI1Lo6CxitUEwQv56fAeJsDhrjNUq', '61985681889', '2023-08-14 15:08:16.221815');


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.posts_id_seq', 10, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 47, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: posts posts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

