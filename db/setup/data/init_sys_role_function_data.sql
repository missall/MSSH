--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.4.0
-- Started on 2015-07-16 09:07:12 CST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- TOC entry 2031 (class 0 OID 32817)
-- Dependencies: 180
-- Data for Name: sys_role_function; Type: TABLE DATA; Schema: public; Owner: nms
--

SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE sys_role_function DISABLE TRIGGER ALL;

COPY sys_role_function (sys_role_id, sys_function_id) FROM stdin;
\.


ALTER TABLE sys_role_function ENABLE TRIGGER ALL;

-- Completed on 2015-07-16 09:07:16 CST

--
-- PostgreSQL database dump complete
--

