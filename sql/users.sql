--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.6
-- Dumped by pg_dump version 9.6.8

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
-- Name: blog_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.blog_users (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    remember_token character varying(100),
    role_id integer,
    edit_auth boolean NOT NULL
);


ALTER TABLE public.blog_users OWNER TO postgres;

--
-- Name: blog_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.blog_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_users_id_seq OWNER TO postgres;

--
-- Name: blog_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.blog_users_id_seq OWNED BY public.blog_users.id;


--
-- Name: blog_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blog_users ALTER COLUMN id SET DEFAULT nextval('public.blog_users_id_seq'::regclass);


--
-- Data for Name: blog_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.blog_users (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, remember_token, role_id, edit_auth) FROM stdin;
11	pbkdf2_sha256$100000$1oGV8y1ETn78$PcmdnmdQU+kIRNAguoafqIKe/tIWewzeMSpl5PgjdLc=	\N	f	curt			curt@beyondmapping.com	f	t	2018-08-15 19:52:51.021288+00	\N	\N	f
4	pbkdf2_sha256$100000$mC7vtK4szZVY$jCZXS9A0ZsikuLPRoY2ml+YubvcpBh4FokU8D2UKWwM=	2018-12-26 17:21:38.682077+00	f	jana			jana@furmanland.com	f	t	2018-08-06 20:49:34.136928+00	\N	\N	t
16	pbkdf2_sha256$100000$OCIOiraJGD5T$qvcV4/32qHCHa98HqPfR79AlwAVlAIe5p3UymDscRgM=	2018-10-04 15:44:31.409887+00	f	jarrod			jarrod@beyondmapping.com	f	t	2018-10-04 14:48:48.122515+00	\N	\N	f
13	pbkdf2_sha256$100000$2ILMiHWbAC6y$bKm/IhJodGGWK/WcgAXyDfWnPd15Njy8B89zVQ0H54k=	2018-12-27 20:17:04.19807+00	f	peter			peter@furmanland.com	f	t	2018-09-27 21:36:11.405821+00	\N	\N	f
12	pbkdf2_sha256$100000$w4cYcRCXPhx6$3OVNKs6OWbBhYZ3bidBTfVZf2hr5LYhHiP/SIUca9XE=	2018-12-27 20:30:52.987979+00	f	mshaw			michael@beyondmapping.com	f	t	2018-08-17 21:01:39.831929+00	\N	\N	t
6	pbkdf2_sha256$100000$MjKgMzZb6abt$SF2NBCPPVdzw4uGgKm3eXTgwMgF8jf3TZVsVk68lgmU=	2018-12-31 16:02:31.300553+00	f	charlotte			ctucker@beyondmapping.com	f	t	2018-08-06 21:38:35.765613+00	\N	\N	t
10	pbkdf2_sha256$100000$LYqg5by1oOEL$b0rBFF61TDiDcRie2KEiM35J8S/aBd45kNDAZMkGrNo=	2018-12-31 17:39:53.367078+00	f	lacy			lacy@beyondmapping.com	f	t	2018-08-15 05:15:24.218109+00	\N	\N	t
14	pbkdf2_sha256$100000$C3LiBxb6XJYJ$+QSB4fcjG/0W9k6kZPhFCmSUUgE3X4vfWR1SYNkBuCI=	2018-09-28 21:05:11.893529+00	f	Test			test@gmail.com	f	t	2018-09-28 19:26:58.714323+00	\N	\N	f
1	pbkdf2_sha256$100000$gPalsE9SN45p$gk3NIL0kZxWrO4XIEqgTwWvNXXIEzdJjVsRHFR/gz9g=	2019-01-01 22:18:25.843482+00	t	remmi11			noah@beyondmapping.com	t	t	2018-08-04 02:45:00.702433+00	\N	\N	t
5	pbkdf2_sha256$100000$zfnYs88oqcsr$HHJx+ouk1uhKZ5atzMeKb3SqAnuYnmaTOJye4QB0PFM=	\N	f	daryl			daryl@furmanland.com	f	t	2018-08-06 21:36:19.682528+00	\N	\N	t
8	pbkdf2_sha256$100000$CWDVtnrY3Z1R$Q3Pg3T9IpAHJ/9fuO9pPbpswIpnq1EzsoLYXLNEVkWI=	\N	f	lajena			lajena@furmanland.com	f	t	2018-08-07 19:35:36.441353+00	\N	\N	t
9	pbkdf2_sha256$100000$a7KvbSD35vwR$0mE+EmpSguDb8pGYU3GvkIoyv1IJd1UNTB6Yr6/2uhk=	2018-12-05 15:28:25.079808+00	f	jennifer			jennifer@furmanland.com	f	t	2018-08-13 15:55:14.286396+00	\N	\N	t
18	pbkdf2_sha256$100000$bYWYGrQ7ejSJ$Q60ABf7XxZl2y0aMxTL7yFxrb0iMpbWVfzjoolclvNc=	2018-11-08 15:53:32.990665+00	f	tanya			tanya@furmanland.com	f	t	2018-10-31 17:15:55.62278+00	\N	\N	f
15	pbkdf2_sha256$100000$XecxoMRKbK7c$Tdb4CUx46jJounEOpakvzj+d9Ycy4Vc9rX1oukttqi8=	2018-12-21 16:19:12.876103+00	f	nicci			nicci@furmanland.com	f	t	2018-10-01 19:14:19.457917+00	\N	\N	t
17	pbkdf2_sha256$100000$5iUf7D39ANZs$YzSAYRpu2uXr//jQBbBZM6X2xy1MH2AL8ckDWtW9rvI=	2018-10-25 20:01:10.110067+00	f	testuser			test@test.com	f	t	2018-10-25 20:00:53.396941+00	\N	\N	f
7	pbkdf2_sha256$100000$oYsDiysbRST1$d+6mpwYH+SOFyvDIjdLjSFOVRjgBY8vfgSbF7iITWpM=	2018-12-26 17:19:28.039531+00	f	nicole			nicole@furmanland.com	f	t	2018-08-06 21:50:59.484314+00	\N	\N	t
\.


--
-- Name: blog_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.blog_users_id_seq', 18, true);


--
-- Name: blog_users blog_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blog_users
    ADD CONSTRAINT blog_users_pkey PRIMARY KEY (id);


--
-- Name: blog_users blog_users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blog_users
    ADD CONSTRAINT blog_users_username_key UNIQUE (username);


--
-- Name: blog_users_username_1e1d7565_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX blog_users_username_1e1d7565_like ON public.blog_users USING btree (username varchar_pattern_ops);


--
-- PostgreSQL database dump complete
--

