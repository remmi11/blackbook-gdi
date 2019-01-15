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
-- Name: gdi; Type: TABLE; Schema: public; Owner: postgres
--
-- DROP TABLE IF EXISTS gdi;

CREATE TABLE public.gdi (
    id integer DEFAULT nextval('public.blog_formall_id_seq'::regclass) NOT NULL,
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
    fee numeric(9,2)
);


ALTER TABLE public.gdi OWNER TO postgres;

--
-- Data for Name: gdi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gdi (id, date_ordered, address, ordered_from, ordered_by, date_deliveredby, file_no, project_no, date_pd, date_due, surveyor, field_crew, cancelled, aka, user_id, updated_at, created_at, fee) FROM stdin;
433	2019-01-02	2919 BAGARRY 	LAWYERS TITLE	LORIE	2019-01-07	Q-13	1924043	\N	8-Jan	HEATHER 	JA	NO	\N	\N	\N	\N	541.25
434	2019-01-02	1305 SW 5TH AVENUE	ALLENS TRI STATE MECHANICAL	DUSTI	2019-01-07	M-11	1924044	\N	\N	HEATHER 	JA	NO	\N	\N	\N	\N	866.00
436	2019-01-03	3417 HARRIS 	LAWYERS TITLE	VALERIE	2019-01-07	Q-14	1924046	\N	\N	HEATHER 	RM	NO	\N	\N	\N	\N	541.25
437	2019-01-03	7004 FULHAM	CHICAGO	AMBER	2019-01-07	J-16	1924047	\N	\N	HEATHER 	CL	NO	\N	\N	\N	\N	541.25
438	2019-01-03	9750 YESTERDAY LANE WEST	CHICAGO	 AJA	2019-01-07	H-22	1924048	\N	\N	HEATHER 	RM	NO	\N	\N	\N	\N	541.25
439	2019-01-04	4808 EBERLY 	TEXAS LEGACY	STEPHANIE	2019-01-07	N-15	1924049	\N	\N	HEATHER 	RM	NO	\N	\N	\N	\N	541.25
440	2019-01-04	4709 GLOSTER 	TEXAS LEGACY	STEPHANIE	2019-01-07	N-15	1924050	\N	\N	HEATHER 	RM	NO	\N	\N	\N	\N	541.25
441	2019-01-04	11910 FM 2590	LAWYERS TITLE	LORIE	2019-01-08	H-20	1924051	\N	8-Jan	HEATHER 	TL	NO	\N	\N	\N	\N	1082.50
442	2019-01-04	QUAIL CREEK	CKP CONSTRUCTION	TODD	\N	J-11	1924052	\N	\N	\N	\N	NO	NEUROSCIENCE	\N	\N	\N	2706.25
443	2019-01-04	5225 E. gdi BLVD.	\N	H. COWAN	\N	R-10	1924053	\N	\N	\N	\N	NO	\N	\N	\N	\N	\N
444	2019-01-04	9300 GARRISON CREEK	CHICAGO	AJA	2019-01-08	F-18	1924054	\N	8-Jan	HEATHER 	RM	NO	\N	\N	\N	\N	541.25
445	2019-01-04	103 SW 41ST AVE.	CHICAGO	ELIZABETH	2019-01-09	N-14	1924055	\N	8-Jan	HEATHER 	RM	NO	\N	\N	\N	\N	541.25
447	2019-01-07	4816 EBERLY 	TEXAS LEGACY	STEPHANIE	2019-01-09	N-15	1924057	\N	9-Jan	HEATHER 	TL	NO	\N	\N	\N	\N	541.25
448	2019-01-07	COULTER STREET -TOPO	ALT	ENTERPRISES	\N	J-19	1924058	\N	\N	\N	\N	NO	\N	\N	\N	\N	\N
449	2019-01-08	S. UH 87	TEXAS LEGACY	SHALMARIE	\N	I-24	1924059	\N	\N	\N	\N	NO	\N	\N	\N	\N	\N
450	2019-01-08	7912 ZOE	TEXAS LEGACY	ELEXA	2019-01-10	H-17	1924060	\N	RUSH 	HEATHER 	TL	NO	\N	\N	\N	\N	541.25
452	2019-01-08	5216 WESTWAY TRL.	CHICAGO	ELIZABETH	2019-01-10	K-15	1924062	\N	11-Jan	HEATHER 	RM	NO	\N	\N	\N	\N	541.25
453	2019-01-08	47 CANYON RIM	STEWART	EVAN	2019-01-10	I-26	1924063	\N	ASAP	HEATHER 	TL	NO	\N	\N	\N	\N	541.25
454	2019-01-09	SW 6TH & S. POLK ST.	CORE CONSTRUCTION	SPENCER	\N	N-11	1924064	\N	\N	\N	\N	NO	BARFIELD BUILDING	\N	\N	\N	541.25
455	2019-01-09	715 S. FILLMORE ST.	HAPPY STATE BANK	DAVID AMBS	\N	N-12	1924065	\N	\N	\N	\N	NO	CIVIC CENTER INN	\N	\N	\N	1200.00
456	2019-01-09	CANYON DRIVE	TEXAS LEGACY	JUSTIN CHAPMAN	\N	K-16	1924066	\N	\N	\N	\N	NO	\N	\N	\N	\N	\N
460	2019-01-09	1548 SMILEY STREET	ALT	LEXI	\N	K-12	1924070	\N	43481	\N	\N	NO	\N	\N	\N	\N	541.25
461	2019-01-09	RM 1061	CHICAGO	MILES BONIFIELD	\N	H-8	1924071	\N	RUSH 	\N	\N	NO	\N	\N	\N	\N	1800.00
464	2019-01-09	508 S. JACKSON S.	ALT	DAVID GALLAWAY	\N	N-11	1924074	\N	43479	\N	\N	NO	\N	\N	\N	\N	\N
477	2019-01-10	14480 FM 1062 	ALT	BRANDI	\N	E-26	1924077	\N	1/15/2019			NO		\N	\N	\N	0.00
478	2019-01-10	 TITLE SURVEY	CHICAGO TITLE 	DONNA 	2019-01-10	K-12	1924075	\N	01/14/2019	HEATHER LEMONS 	CL & ZP 	No		\N	\N	\N	541.25
435	2019-01-03	PIZZA HUT PERMIT	ATMOS		\N		1924045	\N				No		\N	\N	\N	0.00
488	2019-01-11	4118 BUSHLAND BLVD \r\n\r\n EASEMENT 	CURTIS BRUEGAL 		\N	L-11	1924083	\N				No		\N	\N	\N	0.00
480	2019-01-10	4814 SW 11TH AVENUE  	CHICAGO 	AMBER	2019-01-14	K-12	1924078	\N	1/15/2019	HEATHER	TL	No		\N	\N	\N	541.25
462	2019-01-09	2350 GINGER	ALT	DONNELLA	2019-01-14	B-13	1924072	\N	43479	HEATHER	RM	No		\N	\N	\N	541.25
431	2019-01-02	7502 JACKSONHOLE	LAWYERS TITLE	LORIE	2019-01-04	L-17	1924041	\N	8-Jan	HEATHER 	TL	No		\N	\N	\N	154100.25
485	2019-01-11	3926 DORIS DRIVE 	LAWYERS TITLE 	TASHA	\N	L-14	1924082	\N	1/15/2019			No		\N	\N	\N	541.25
459	2019-01-09	2006 ESTES STREET	CHICAGO	MICHAEL	2019-01-11	P-10	1924069	\N	43476	HEATHER	TL	No		\N	\N	\N	541.25
432	2019-01-02	4408 PRAIRIE	LAWYERS TITLE	TASHA	\N	K-14	1924042	\N	ASAP	HEATHER	TL	No		\N	\N	\N	541.25
446	2019-01-07	5102 TAWNEY	LAWYERS TITLE	TASHA	2019-01-08	K-13	1924056	\N	RUSH 	HEATHER	RM	No		\N	\N	\N	541.25
451	2019-01-08	3702 KILEEN	CHICAGO	SHAWNEE	\N	J-14	1924061	\N	11-Jan	HEATHER	RM	No		\N	\N	\N	541.25
484	2019-01-11	3926 DORIS DRIVE	TEXAS LEGACY 	KIRSTAN	2019-01-14	H-17	1924081	\N	1/14	HEATHER	CL	No		\N	\N	\N	541.25
479	2019-01-10	13333 MAPLE DRIVE 	STEWART TITLE	LISA	2019-01-14	E-26	1924076	\N	1/14	HEATHER	RM	No		\N	\N	\N	0.00
463	2019-01-09	6800 TATUM CIRCLE	CHICAGO	AJA	2019-01-11	I-16	1924073	\N	43479	HEATHER	CL	No		\N	\N	\N	541.25
457	2019-01-09	9500 CAGLE DRIVE	TEXAS LEGACY	STEPHANIE	2019-01-11	H-17	1924067	\N	43476	HEATHER	RM	No		\N	\N	\N	541.25
489	2019-01-14	 2017 CURRIE	STEWART TITLE	AMY 	\N	P-10	1924084	\N	1/17/2019			No		\N	\N	\N	541.25
458	2019-01-09	9408 CAGLE DRIVE	TEXAS LEGACY	STEPHANIE	2019-01-11	H-17	1924068	\N	43476	HEATHER	RM	No		\N	\N	\N	541.25
483	2019-01-11	MAHONEY SUBSTATION - STRUCTURE STAKING R11 & R12\r\nPO# 4500286556	XCEL ENERGY		\N	YOAKUM CO.	1924080	\N	07/31/2019	CASEY		No		\N	\N	\N	11345.00
496	2019-01-15	 #4 LEAP FROG LANE 		BILL DAVIS 	\N	Q-23	1924090	\N	01/25/2019			No		\N	\N	\N	541.25
497	2019-01-15	9603 KORI  	TEXAS LEGACY 	STEPHANIE	\N	H-17	1924091	\N	1/17			No		\N	\N	\N	541.25
498	2019-01-15	2805 WESTBROOK	CHICAGO TITLE	VONDALYNN	\N	L-17	1924092	\N	1/18/2019			No		\N	\N	\N	541.25
499	2019-01-15	 415 NE 3RD AVENUE	AMERICAN LAND TITLE	CLETA	\N	O-11	1924093	\N	ASAP			No		\N	\N	\N	541.25
\.


--
-- Name: gdi blog_formall_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gdi
    ADD CONSTRAINT blog_formall_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

