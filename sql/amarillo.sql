--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.6
-- Dumped by pg_dump version 9.6.11

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: amarillo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.amarillo (
    id integer NOT NULL,
    date_ordered date,
    address character varying(200),
    ordered_from character varying(200),
    ordered_by character varying(200),
    date_deliveredby date,
    file_no character varying(50),
    project_no character varying(200),
    date_pd date,
    date_due character varying(50),
    surveyor character varying(50),
    field_crew character varying(200),
    cancelled character varying(50),
    aka character varying(255),
    user_id integer,
    updated_at timestamp with time zone,
    created_at timestamp with time zone,
    fee numeric(6,2)
);


ALTER TABLE public.amarillo OWNER TO postgres;

--
-- Name: blog_formall_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.blog_formall_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_formall_id_seq OWNER TO postgres;

--
-- Name: blog_formall_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.blog_formall_id_seq OWNED BY public.amarillo.id;


--
-- Name: amarillo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.amarillo ALTER COLUMN id SET DEFAULT nextval('public.blog_formall_id_seq'::regclass);


--
-- Data for Name: amarillo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.amarillo (id, date_ordered, address, ordered_from, ordered_by, date_deliveredby, file_no, project_no, date_pd, date_due, surveyor, field_crew, cancelled, aka, user_id, updated_at, created_at, fee) FROM stdin;
17	2019-01-02	7502 JACKSONHOLE	LAWYERS TITLE	LORIE	2019-01-04	L-17	1924041	\N	8-Jan	HEATHER 	TL	\N	\N	\N	\N	\N	541.25
18	2019-01-02	4408 PRAIRIE	LAWYERS TITLE	TASHA	\N	K-14	1924042	\N	ASAP	\N	TL	\N	\N	\N	\N	\N	542.25
19	2019-01-02	2919 BAGARRY 	LAWYERS TITLE	LORIE	2019-01-07	Q-13	1924043	\N	8-Jan	HEATHER 	JA	\N	\N	\N	\N	\N	\N
20	2019-01-02	1305 SW 5TH AVENUE	ALLENS TRI STATE MECHANICAL	DUSTI	2019-01-07	M-11	1924044	\N	\N	HEATHER 	\N	\N	\N	\N	\N	\N	866.00
21	2019-01-03	MULESHOE	ATMOS	\N	\N	\N	1924045	\N	\N	\N	\N	\N	\N	\N	\N	\N	541.25
22	2019-01-03	3417 HARRIS 	LAWYERS TITLE	VALERIE	2019-01-07	Q-14	1924046	\N	\N	HEATHER 	RM	\N	\N	\N	\N	\N	541.25
23	2019-01-03	7004 FULHAM	CHICAGO	AMBER	2019-01-07	J-16	1924047	\N	\N	HEATHER 	CL	\N	\N	\N	\N	\N	541.25
24	2019-01-03	9750 YESTERDAY LANE WEST	CHICAGO	 AJA	2019-01-07	H-22	1924048	\N	\N	HEATHER 	RM	\N	\N	\N	\N	\N	541.25
25	2019-01-04	4808 EBERLY 	TEXAS LEGACY	STEPHANIE	2019-01-07	N-15	1924049	\N	\N	HEATHER 	RM	\N	\N	\N	\N	\N	541.25
26	2019-01-04	4709 GLOSTER 	TEXAS LEGACY	STEPHANIE	2019-01-07	N-15	1924050	\N	\N	HEATHER 	RM	\N	\N	\N	\N	\N	\N
27	2019-01-04	11910 FM 2590	LAWYERS TITLE	LORIE	\N	H-20	1924051	\N	8-Jan	\N	\N	\N	\N	\N	\N	\N	\N
28	2019-01-04	QUAIL CREEK	CKP CONSTRUCTION	TODD	\N	J-11	1924052	\N	\N	\N	\N	\N	NEUROSCIENCE	\N	\N	\N	2706.25
29	2019-01-04	5225 E. AMARILLO BLVD.	\N	H. COWAN	\N	R-10	1924053	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
30	2019-01-04	9300 GARRISON CREEK	CHICAGO	AJA	2019-01-08	F-18	1925054	\N	8-Jan	HEATHER 	RM	\N	\N	\N	\N	\N	541.25
31	2019-01-04	103 SW 41ST AVE.	CHICAGO	ELIZABETH	\N	N-14	1925055	\N	8-Jan	\N	RM	\N	\N	\N	\N	\N	541.25
32	2019-01-07	5102 TAWNEY	LAWYERS TITLE	TASHA	\N	K-13	1925056	\N	RUSH 	\N	\N	\N	\N	\N	\N	\N	541.25
33	2019-01-07	4816 EBERLY 	TEXAS LEGACY	STEPHANIE	\N	N-15	1925057	\N	9-Jan	\N	\N	\N	\N	\N	\N	\N	541.25
34	2019-01-07	COULTER STREET -TOPO	ALT	ENTERPRISES	\N	J-19	1924058	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
35	2019-01-08	S. UH 87	TEXAS LEGACY	SHALMARIE	\N	I-24	1924059	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
36	2019-01-08	7912 ZOE	TEXAS LEGACY	ELEXA	\N	H-17	1924060	\N	RUSH 	\N	\N	\N	\N	\N	\N	\N	541.25
37	2019-01-08	3702 KILEEN	CHICAGO	SHAWNEE	\N	J-14	1924061	\N	11-Jan	\N	\N	\N	\N	\N	\N	\N	541.25
38	2019-01-08	5216 WESTWAY TRL.	CHICAGO	ELIZABETH	\N	K-15	1924062	\N	11-Jan	\N	\N	\N	\N	\N	\N	\N	541.25
39	2019-01-08	47 CANYON RIM	STEWART	EVAN	\N	I-26	1924063	\N	ASAP	\N	\N	\N	\N	\N	\N	\N	541.25
40	2019-01-10	1800 PLATEAU LANE 	CHICAGO 	LISA	\N	K-12	1924075	\N	1/15/2019	\N	\N	\N	\N	\N	\N	\N	\N
11	2019-01-10	 13333 MAPLE DRIVE	STEWART TITLE	LISA	\N	G-21	1924076	\N	2019-01-14			Yes		\N	\N	\N	0.00
\.


--
-- Name: blog_formall_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.blog_formall_id_seq', 40, true);


--
-- Name: amarillo blog_formall_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.amarillo
    ADD CONSTRAINT blog_formall_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

