--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12
-- Dumped by pg_dump version 15.1

-- Started on 2023-02-17 11:14:49 PST

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

--
-- TOC entry 4376 (class 1262 OID 16818)
-- Name: protoboard; Type: DATABASE; Schema: -; Owner: doadmin
--

CREATE DATABASE protoboard
    WITH
    OWNER = django
    ENCODING = 'UTF8'
    LC_COLLATE = 'C'
    LC_CTYPE = 'C'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

\connect protoboard

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

--
-- TOC entry 6 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 16947)
-- Name: activitytree_activitytree; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.activitytree_activitytree (
    id integer NOT NULL,
    current_activity_id integer,
    root_activity_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.activitytree_activitytree OWNER TO django;

--
-- TOC entry 218 (class 1259 OID 16945)
-- Name: activitytree_activitytree_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.activitytree_activitytree_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activitytree_activitytree_id_seq OWNER TO django;

--
-- TOC entry 4378 (class 0 OID 0)
-- Dependencies: 218
-- Name: activitytree_activitytree_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.activitytree_activitytree_id_seq OWNED BY public.activitytree_activitytree.id;


--
-- TOC entry 241 (class 1259 OID 17291)
-- Name: activitytree_authorprofile; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.activitytree_authorprofile (
    id integer NOT NULL,
    image character varying(200) NOT NULL,
    cover_image character varying(200) NOT NULL,
    short_about character varying(128) NOT NULL,
    about text NOT NULL,
    location text NOT NULL,
    web_page character varying(256) NOT NULL,
    twitter character varying(256) NOT NULL,
    github character varying(256) NOT NULL,
    youtube character varying(256) NOT NULL,
    twitch character varying(256) NOT NULL,
    instagram character varying(256) NOT NULL,
    user_id integer NOT NULL,
    google_scholar character varying(256) NOT NULL,
    linkedin character varying(256) NOT NULL
);


ALTER TABLE public.activitytree_authorprofile OWNER TO django;

--
-- TOC entry 240 (class 1259 OID 17289)
-- Name: activitytree_authorprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.activitytree_authorprofile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activitytree_authorprofile_id_seq OWNER TO django;

--
-- TOC entry 4379 (class 0 OID 0)
-- Dependencies: 240
-- Name: activitytree_authorprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.activitytree_authorprofile_id_seq OWNED BY public.activitytree_authorprofile.id;


--
-- TOC entry 221 (class 1259 OID 16963)
-- Name: activitytree_course; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.activitytree_course (
    id integer NOT NULL,
    root_id integer NOT NULL,
    author_id integer,
    uri character varying(50) NOT NULL,
    metadata jsonb
);


ALTER TABLE public.activitytree_course OWNER TO django;

--
-- TOC entry 220 (class 1259 OID 16961)
-- Name: activitytree_course_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.activitytree_course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activitytree_course_id_seq OWNER TO django;

--
-- TOC entry 4380 (class 0 OID 0)
-- Dependencies: 220
-- Name: activitytree_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.activitytree_course_id_seq OWNED BY public.activitytree_course.id;


--
-- TOC entry 252 (class 1259 OID 17426)
-- Name: activitytree_course_related; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.activitytree_course_related (
    id integer NOT NULL,
    from_course_id integer NOT NULL,
    to_course_id integer NOT NULL
);


ALTER TABLE public.activitytree_course_related OWNER TO django;

--
-- TOC entry 251 (class 1259 OID 17424)
-- Name: activitytree_course_related_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.activitytree_course_related_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activitytree_course_related_id_seq OWNER TO django;

--
-- TOC entry 4381 (class 0 OID 0)
-- Dependencies: 251
-- Name: activitytree_course_related_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.activitytree_course_related_id_seq OWNED BY public.activitytree_course_related.id;


--
-- TOC entry 223 (class 1259 OID 17002)
-- Name: activitytree_learningactivity; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.activitytree_learningactivity (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    uri character varying(200) NOT NULL,
    pre_condition_rule text NOT NULL,
    choice_exit boolean NOT NULL,
    rollup_rule text NOT NULL,
    rollup_progress boolean NOT NULL,
    attempt_limit smallint NOT NULL,
    available_from timestamp with time zone,
    available_until timestamp with time zone,
    is_container boolean NOT NULL,
    is_visible boolean NOT NULL,
    order_in_container integer NOT NULL,
    rules text NOT NULL,
    parent_id integer,
    root_id integer,
    CONSTRAINT activitytree_learningactivity_attempt_limit_check CHECK ((attempt_limit >= 0)),
    CONSTRAINT activitytree_learningactivity_order_in_container_check CHECK ((order_in_container >= 0))
);


ALTER TABLE public.activitytree_learningactivity OWNER TO django;

--
-- TOC entry 222 (class 1259 OID 17000)
-- Name: activitytree_learningactivity_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.activitytree_learningactivity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activitytree_learningactivity_id_seq OWNER TO django;

--
-- TOC entry 4382 (class 0 OID 0)
-- Dependencies: 222
-- Name: activitytree_learningactivity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.activitytree_learningactivity_id_seq OWNED BY public.activitytree_learningactivity.id;


--
-- TOC entry 243 (class 1259 OID 17322)
-- Name: activitytree_learningactivitylocal; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.activitytree_learningactivitylocal (
    id integer NOT NULL,
    title character varying(128) NOT NULL,
    uri character varying(200) NOT NULL
);


ALTER TABLE public.activitytree_learningactivitylocal OWNER TO django;

--
-- TOC entry 242 (class 1259 OID 17320)
-- Name: activitytree_learningactivitylocal_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.activitytree_learningactivitylocal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activitytree_learningactivitylocal_id_seq OWNER TO django;

--
-- TOC entry 4383 (class 0 OID 0)
-- Dependencies: 242
-- Name: activitytree_learningactivitylocal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.activitytree_learningactivitylocal_id_seq OWNED BY public.activitytree_learningactivitylocal.id;


--
-- TOC entry 225 (class 1259 OID 17015)
-- Name: activitytree_learningactivityrating; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.activitytree_learningactivityrating (
    id integer NOT NULL,
    "time" timestamp with time zone NOT NULL,
    rating smallint NOT NULL,
    context smallint NOT NULL,
    learning_activity_id integer NOT NULL,
    user_id integer NOT NULL,
    CONSTRAINT activitytree_learningactivityrating_context_check CHECK ((context >= 0)),
    CONSTRAINT activitytree_learningactivityrating_rating_check CHECK ((rating >= 0))
);


ALTER TABLE public.activitytree_learningactivityrating OWNER TO django;

--
-- TOC entry 224 (class 1259 OID 17013)
-- Name: activitytree_learningactivityrating_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.activitytree_learningactivityrating_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activitytree_learningactivityrating_id_seq OWNER TO django;

--
-- TOC entry 4384 (class 0 OID 0)
-- Dependencies: 224
-- Name: activitytree_learningactivityrating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.activitytree_learningactivityrating_id_seq OWNED BY public.activitytree_learningactivityrating.id;


--
-- TOC entry 227 (class 1259 OID 17025)
-- Name: activitytree_learningstyleinventory; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.activitytree_learningstyleinventory (
    id integer NOT NULL,
    visual smallint NOT NULL,
    verbal smallint NOT NULL,
    aural smallint NOT NULL,
    physical smallint NOT NULL,
    logical smallint NOT NULL,
    social smallint NOT NULL,
    solitary smallint NOT NULL,
    user_id integer NOT NULL,
    CONSTRAINT activitytree_learningstyleinventory_aural_check CHECK ((aural >= 0)),
    CONSTRAINT activitytree_learningstyleinventory_logical_check CHECK ((logical >= 0)),
    CONSTRAINT activitytree_learningstyleinventory_physical_check CHECK ((physical >= 0)),
    CONSTRAINT activitytree_learningstyleinventory_social_check CHECK ((social >= 0)),
    CONSTRAINT activitytree_learningstyleinventory_solitary_check CHECK ((solitary >= 0)),
    CONSTRAINT activitytree_learningstyleinventory_verbal_check CHECK ((verbal >= 0)),
    CONSTRAINT activitytree_learningstyleinventory_visual_check CHECK ((visual >= 0))
);


ALTER TABLE public.activitytree_learningstyleinventory OWNER TO django;

--
-- TOC entry 226 (class 1259 OID 17023)
-- Name: activitytree_learningstyleinventory_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.activitytree_learningstyleinventory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activitytree_learningstyleinventory_id_seq OWNER TO django;

--
-- TOC entry 4385 (class 0 OID 0)
-- Dependencies: 226
-- Name: activitytree_learningstyleinventory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.activitytree_learningstyleinventory_id_seq OWNED BY public.activitytree_learningstyleinventory.id;


--
-- TOC entry 229 (class 1259 OID 17042)
-- Name: activitytree_ula_event; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.activitytree_ula_event (
    id integer NOT NULL,
    time_stamp time without time zone NOT NULL,
    context text NOT NULL,
    "ULA_id" integer NOT NULL
);


ALTER TABLE public.activitytree_ula_event OWNER TO django;

--
-- TOC entry 228 (class 1259 OID 17040)
-- Name: activitytree_ula_event_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.activitytree_ula_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activitytree_ula_event_id_seq OWNER TO django;

--
-- TOC entry 4386 (class 0 OID 0)
-- Dependencies: 228
-- Name: activitytree_ula_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.activitytree_ula_event_id_seq OWNED BY public.activitytree_ula_event.id;


--
-- TOC entry 231 (class 1259 OID 17053)
-- Name: activitytree_userlearningactivity; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.activitytree_userlearningactivity (
    id integer NOT NULL,
    pre_condition character varying(32) NOT NULL,
    recommendation_value smallint,
    progress_status character varying(16) NOT NULL,
    objective_status character varying(16) NOT NULL,
    objective_measure double precision,
    last_visited timestamp with time zone,
    num_attempts smallint NOT NULL,
    suspended boolean NOT NULL,
    accumulated_time numeric(3,2),
    is_current boolean NOT NULL,
    learning_activity_id integer NOT NULL,
    user_id integer NOT NULL,
    CONSTRAINT activitytree_userlearningactivity_num_attempts_check CHECK ((num_attempts >= 0)),
    CONSTRAINT activitytree_userlearningactivity_recommendation_value_check CHECK ((recommendation_value >= 0))
);


ALTER TABLE public.activitytree_userlearningactivity OWNER TO django;

--
-- TOC entry 239 (class 1259 OID 17272)
-- Name: activitytree_ula_vw; Type: VIEW; Schema: public; Owner: django
--

CREATE VIEW public.activitytree_ula_vw AS
 SELECT ul.user_id,
    ul.learning_activity_id,
    ul.pre_condition,
    ul.progress_status,
    ul.objective_status,
    ul.objective_measure,
    la.parent_id,
    la.rollup_progress,
    la.name
   FROM (public.activitytree_learningactivity la
     JOIN public.activitytree_userlearningactivity ul ON ((la.id = ul.learning_activity_id)));


ALTER TABLE public.activitytree_ula_vw OWNER TO django;

--
-- TOC entry 230 (class 1259 OID 17051)
-- Name: activitytree_userlearningactivity_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.activitytree_userlearningactivity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activitytree_userlearningactivity_id_seq OWNER TO django;

--
-- TOC entry 4387 (class 0 OID 0)
-- Dependencies: 230
-- Name: activitytree_userlearningactivity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.activitytree_userlearningactivity_id_seq OWNED BY public.activitytree_userlearningactivity.id;


--
-- TOC entry 233 (class 1259 OID 17063)
-- Name: activitytree_userprofile; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.activitytree_userprofile (
    id integer NOT NULL,
    timezone character varying(30),
    reputation smallint NOT NULL,
    experience smallint NOT NULL,
    user_id integer NOT NULL,
    CONSTRAINT activitytree_userprofile_experience_check CHECK ((experience >= 0)),
    CONSTRAINT activitytree_userprofile_reputation_check CHECK ((reputation >= 0))
);


ALTER TABLE public.activitytree_userprofile OWNER TO django;

--
-- TOC entry 232 (class 1259 OID 17061)
-- Name: activitytree_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.activitytree_userprofile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activitytree_userprofile_id_seq OWNER TO django;

--
-- TOC entry 4388 (class 0 OID 0)
-- Dependencies: 232
-- Name: activitytree_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.activitytree_userprofile_id_seq OWNED BY public.activitytree_userprofile.id;


--
-- TOC entry 209 (class 1259 OID 16851)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO django;

--
-- TOC entry 208 (class 1259 OID 16849)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO django;

--
-- TOC entry 4389 (class 0 OID 0)
-- Dependencies: 208
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 211 (class 1259 OID 16861)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO django;

--
-- TOC entry 210 (class 1259 OID 16859)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO django;

--
-- TOC entry 4390 (class 0 OID 0)
-- Dependencies: 210
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 207 (class 1259 OID 16843)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO django;

--
-- TOC entry 206 (class 1259 OID 16841)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO django;

--
-- TOC entry 4391 (class 0 OID 0)
-- Dependencies: 206
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 213 (class 1259 OID 16869)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO django;

--
-- TOC entry 215 (class 1259 OID 16879)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO django;

--
-- TOC entry 214 (class 1259 OID 16877)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO django;

--
-- TOC entry 4392 (class 0 OID 0)
-- Dependencies: 214
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- TOC entry 212 (class 1259 OID 16867)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO django;

--
-- TOC entry 4393 (class 0 OID 0)
-- Dependencies: 212
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- TOC entry 217 (class 1259 OID 16887)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO django;

--
-- TOC entry 216 (class 1259 OID 16885)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO django;

--
-- TOC entry 4394 (class 0 OID 0)
-- Dependencies: 216
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- TOC entry 235 (class 1259 OID 17219)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO django;

--
-- TOC entry 234 (class 1259 OID 17217)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO django;

--
-- TOC entry 4395 (class 0 OID 0)
-- Dependencies: 234
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 247 (class 1259 OID 17344)
-- Name: django_comment_flags; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.django_comment_flags (
    id integer NOT NULL,
    flag character varying(30) NOT NULL,
    flag_date timestamp with time zone NOT NULL,
    comment_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.django_comment_flags OWNER TO django;

--
-- TOC entry 246 (class 1259 OID 17342)
-- Name: django_comment_flags_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.django_comment_flags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_comment_flags_id_seq OWNER TO django;

--
-- TOC entry 4396 (class 0 OID 0)
-- Dependencies: 246
-- Name: django_comment_flags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.django_comment_flags_id_seq OWNED BY public.django_comment_flags.id;


--
-- TOC entry 245 (class 1259 OID 17333)
-- Name: django_comments; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.django_comments (
    id integer NOT NULL,
    object_pk character varying(64) NOT NULL,
    user_name character varying(50) NOT NULL,
    user_email character varying(254) NOT NULL,
    user_url character varying(200) NOT NULL,
    comment text NOT NULL,
    submit_date timestamp with time zone NOT NULL,
    ip_address inet,
    is_public boolean NOT NULL,
    is_removed boolean NOT NULL,
    content_type_id integer NOT NULL,
    site_id integer NOT NULL,
    user_id integer
);


ALTER TABLE public.django_comments OWNER TO django;

--
-- TOC entry 244 (class 1259 OID 17331)
-- Name: django_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.django_comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_comments_id_seq OWNER TO django;

--
-- TOC entry 4397 (class 0 OID 0)
-- Dependencies: 244
-- Name: django_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.django_comments_id_seq OWNED BY public.django_comments.id;


--
-- TOC entry 250 (class 1259 OID 17414)
-- Name: django_comments_xtd_blacklisteddomain; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.django_comments_xtd_blacklisteddomain (
    id integer NOT NULL,
    domain character varying(200) NOT NULL
);


ALTER TABLE public.django_comments_xtd_blacklisteddomain OWNER TO django;

--
-- TOC entry 249 (class 1259 OID 17412)
-- Name: django_comments_xtd_blacklisteddomain_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.django_comments_xtd_blacklisteddomain_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_comments_xtd_blacklisteddomain_id_seq OWNER TO django;

--
-- TOC entry 4398 (class 0 OID 0)
-- Dependencies: 249
-- Name: django_comments_xtd_blacklisteddomain_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.django_comments_xtd_blacklisteddomain_id_seq OWNED BY public.django_comments_xtd_blacklisteddomain.id;


--
-- TOC entry 248 (class 1259 OID 17400)
-- Name: django_comments_xtd_xtdcomment; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.django_comments_xtd_xtdcomment (
    comment_ptr_id integer NOT NULL,
    thread_id integer NOT NULL,
    parent_id integer NOT NULL,
    level smallint NOT NULL,
    "order" integer NOT NULL,
    followup boolean NOT NULL,
    nested_count integer NOT NULL
);


ALTER TABLE public.django_comments_xtd_xtdcomment OWNER TO django;

--
-- TOC entry 205 (class 1259 OID 16833)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO django;

--
-- TOC entry 204 (class 1259 OID 16831)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO django;

--
-- TOC entry 4399 (class 0 OID 0)
-- Dependencies: 204
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 203 (class 1259 OID 16822)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO django;

--
-- TOC entry 202 (class 1259 OID 16820)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO django;

--
-- TOC entry 4400 (class 0 OID 0)
-- Dependencies: 202
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 236 (class 1259 OID 17250)
-- Name: django_session; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO django;

--
-- TOC entry 238 (class 1259 OID 17262)
-- Name: django_site; Type: TABLE; Schema: public; Owner: django
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO django;

--
-- TOC entry 237 (class 1259 OID 17260)
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: django
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO django;

--
-- TOC entry 4401 (class 0 OID 0)
-- Dependencies: 237
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: django
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- TOC entry 3997 (class 2604 OID 16950)
-- Name: activitytree_activitytree id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.activitytree_activitytree ALTER COLUMN id SET DEFAULT nextval('public.activitytree_activitytree_id_seq'::regclass);


--
-- TOC entry 4007 (class 2604 OID 17294)
-- Name: activitytree_authorprofile id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.activitytree_authorprofile ALTER COLUMN id SET DEFAULT nextval('public.activitytree_authorprofile_id_seq'::regclass);


--
-- TOC entry 3998 (class 2604 OID 16966)
-- Name: activitytree_course id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.activitytree_course ALTER COLUMN id SET DEFAULT nextval('public.activitytree_course_id_seq'::regclass);


--
-- TOC entry 4012 (class 2604 OID 17429)
-- Name: activitytree_course_related id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.activitytree_course_related ALTER COLUMN id SET DEFAULT nextval('public.activitytree_course_related_id_seq'::regclass);


--
-- TOC entry 3999 (class 2604 OID 17005)
-- Name: activitytree_learningactivity id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.activitytree_learningactivity ALTER COLUMN id SET DEFAULT nextval('public.activitytree_learningactivity_id_seq'::regclass);


--
-- TOC entry 4008 (class 2604 OID 17325)
-- Name: activitytree_learningactivitylocal id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.activitytree_learningactivitylocal ALTER COLUMN id SET DEFAULT nextval('public.activitytree_learningactivitylocal_id_seq'::regclass);


--
-- TOC entry 4000 (class 2604 OID 17018)
-- Name: activitytree_learningactivityrating id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.activitytree_learningactivityrating ALTER COLUMN id SET DEFAULT nextval('public.activitytree_learningactivityrating_id_seq'::regclass);


--
-- TOC entry 4001 (class 2604 OID 17028)
-- Name: activitytree_learningstyleinventory id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.activitytree_learningstyleinventory ALTER COLUMN id SET DEFAULT nextval('public.activitytree_learningstyleinventory_id_seq'::regclass);


--
-- TOC entry 4002 (class 2604 OID 17045)
-- Name: activitytree_ula_event id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.activitytree_ula_event ALTER COLUMN id SET DEFAULT nextval('public.activitytree_ula_event_id_seq'::regclass);


--
-- TOC entry 4003 (class 2604 OID 17056)
-- Name: activitytree_userlearningactivity id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.activitytree_userlearningactivity ALTER COLUMN id SET DEFAULT nextval('public.activitytree_userlearningactivity_id_seq'::regclass);


--
-- TOC entry 4004 (class 2604 OID 17066)
-- Name: activitytree_userprofile id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.activitytree_userprofile ALTER COLUMN id SET DEFAULT nextval('public.activitytree_userprofile_id_seq'::regclass);


--
-- TOC entry 3992 (class 2604 OID 16854)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 3993 (class 2604 OID 16864)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 3991 (class 2604 OID 16846)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 3994 (class 2604 OID 16872)
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- TOC entry 3995 (class 2604 OID 16882)
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- TOC entry 3996 (class 2604 OID 16890)
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 4005 (class 2604 OID 17222)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 4010 (class 2604 OID 17347)
-- Name: django_comment_flags id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_comment_flags ALTER COLUMN id SET DEFAULT nextval('public.django_comment_flags_id_seq'::regclass);


--
-- TOC entry 4009 (class 2604 OID 17336)
-- Name: django_comments id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_comments ALTER COLUMN id SET DEFAULT nextval('public.django_comments_id_seq'::regclass);


--
-- TOC entry 4011 (class 2604 OID 17417)
-- Name: django_comments_xtd_blacklisteddomain id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_comments_xtd_blacklisteddomain ALTER COLUMN id SET DEFAULT nextval('public.django_comments_xtd_blacklisteddomain_id_seq'::regclass);


--
-- TOC entry 3990 (class 2604 OID 16836)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 3989 (class 2604 OID 16825)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 4006 (class 2604 OID 17265)
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- TOC entry 4338 (class 0 OID 16947)
-- Dependencies: 219
-- Data for Name: activitytree_activitytree; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.activitytree_activitytree (id, current_activity_id, root_activity_id, user_id) FROM stdin;
3	36	2	3
2	14	2	2
4	47	2	47
1	11	2	1
\.


--
-- TOC entry 4359 (class 0 OID 17291)
-- Dependencies: 241
-- Data for Name: activitytree_authorprofile; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.activitytree_authorprofile (id, image, cover_image, short_about, about, location, web_page, twitter, github, youtube, twitch, instagram, user_id, google_scholar, linkedin) FROM stdin;
1	https://evo.sfo2.digitaloceanspaces.com/uno/autores/mario.jpg		Python, C#, Data Mining, Distributed Systems	Profesor del Instituto Tecnológico de Tijuana desde 1993. Cuento con experiencia desarrollado software utilizando las siguientes tecnologías: C#, Python, JavaScript, SQL, Redis, Docker Containers, Cloud Computing.	México		https://twitter.com/mariogarciav	https://twitter.com/mariogarciav	https://www.youtube.com/channel/UCN_tOrJI6BvU2aP_FRnpRfA			1	https://scholar.google.com/citations?hl=en&user=T4tW65wAAAAJ	https://www.linkedin.com/in/mariosky/
2	https://evo.sfo2.digitaloceanspaces.com/uno/autores/alan.jpg		Me dedico a ayudar a marcas que no tienen una dirección clara y que quieran mejorar su calidad de vida, por medio de un plan que	Me dedico a ayudar a marcas que no tienen una dirección clara y que quieran mejorar su calidad de vida, por medio de un plan que identifique a sus nichos y de estructura de un modelo de negocio. De esta forma, se traza un camino de metas que conduzca a objetivos por cumplir.	Tijuana, México							44		https://www.linkedin.com/in/lodisenoelcastellanos/
\.


--
-- TOC entry 4340 (class 0 OID 16963)
-- Dependencies: 221
-- Data for Name: activitytree_course; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.activitytree_course (id, root_id, author_id, uri, metadata) FROM stdin;
2	2	1	reto-listas-de-python	{"_id": "/activity/reto-listas-de-python", "uri": "reto-listas-de-python", "tags": ["curso", "python"], "level": "principiante", "title": "Reto de listas de python", "author": "Mario García Valdez", "rights": "Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)", "status": "published", "duration": "P0DT02H00M00S", "image_url": "https://evo.sfo2.digitaloceanspaces.com/codigo.uno/wrestler-python.jpg", "video_url": "", "is_private": false, "rights_url": "https://creativecommons.org/licenses/by-sa/4.0/", "start_date": null, "description": "Este es un ejercicio que consiste en realizar varios programas para poner a prueba tus conocimientos de listas en python.", "author_image": "https://evo.sfo2.digitaloceanspaces.com/uno/autores/mario.jpg", "external_url": "", "current_price": 0, "html_description": ""}
\.


--
-- TOC entry 4370 (class 0 OID 17426)
-- Dependencies: 252
-- Data for Name: activitytree_course_related; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.activitytree_course_related (id, from_course_id, to_course_id) FROM stdin;
\.


--
-- TOC entry 4342 (class 0 OID 17002)
-- Dependencies: 223
-- Data for Name: activitytree_learningactivity; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.activitytree_learningactivity (id, name, uri, pre_condition_rule, choice_exit, rollup_rule, rollup_progress, attempt_limit, available_from, available_until, is_container, is_visible, order_in_container, rules, parent_id, root_id) FROM stdin;
10	Producto punto	/program/PPP/13	if self.get_attr('/activity/new-11654cad-8662-48a5-8bd7-af712158333d','progress_status') == 'incomplete':\n    activity['pre_condition'] = 'disabled'\nelse:\n    activity['pre_condition'] = ''	t	completed IF All completed	t	100	\N	\N	f	t	2	{"id":"3","conditions":[{"id":"qo62x","uri":"/activity/new-11654cad-8662-48a5-8bd7-af712158333d","act_name":"Nivel 1","option":"progress_status","option_txt":"progreso","operator":"==","operator_txt":"igual a","value":"incomplete","activity":"true"}],"applyto":"10","operator":"and","precondition":"disabled"}	9	2
11	Extras	/activity/new-c85bfcd1-96ce-4a6e-978f-b7b69fc950eb		f	completed IF All completed	t	100	\N	\N	t	t	3		9	2
16	Introducción a la programación, tipos de datos y variables	/activity/video/6ca3fd92-81f5-11e6-a0af-0401663b8f01		t	completed IF All completed	t	100	\N	\N	f	t	0		11	2
12	Constructores C#	/activity/f4bf79d8-cb2a-11e8-9810-0e1899e09571		t	completed IF All completed	t	100	\N	\N	f	t	1		11	2
2	Reto de listas de python	/activity/reto-listas-de-python		t	completed IF All completed	t	100	\N	\N	t	t	0		\N	\N
3	Nivel 1	/activity/new-11654cad-8662-48a5-8bd7-af712158333d		f	completed IF AT LEAST 3 COUNT completed	t	100	\N	\N	t	t	0		2	2
13	Quiz Constructores	/test/999a224c-fd75-11e8-9810-0e1899e09571		t	completed IF All completed	t	100	\N	\N	f	t	0		3	2
14	New Name	/activity/new-b3309a4b-34d8-4d07-8c2a-dd69110598ea		f	completed IF All completed	t	100	\N	\N	t	f	1		3	2
15	New Name	/activity/new-3513ccf1-1620-4590-9587-fd486e074eb7		f	completed IF All completed	t	100	\N	\N	t	t	0		14	2
5	Dame una tupla	/program/PPP/7		f	completed IF All completed	t	100	\N	\N	f	t	0		15	2
4	¡Pura Acción!	/program/PPP/10		f	completed IF All completed	t	100	\N	\N	f	t	1		14	2
6	Solo una tajada	/program/PPP/8		f	completed IF All completed	t	100	\N	\N	f	t	2		3	2
8	mayor()	/program/PPP/6		f	completed IF All completed	t	100	\N	\N	f	t	3		3	2
9	Nivel 2	/activity/new-5678b630-ab27-4169-a1be-e6ece3503040		f	completed IF All completed	t	100	\N	\N	t	t	1		2	2
17	Definción de Clase	/test/8213ff52-0b40-11e7-9249-0401663b8331		t	completed IF All completed	t	100	\N	\N	f	t	0		9	2
7	Ordena la Lista	/program/PPP/12	if self.get_attr('/activity/new-11654cad-8662-48a5-8bd7-af712158333d','progress_status') == 'incomplete':\n    activity['pre_condition'] = 'disabled'\nelse:\n    activity['pre_condition'] = ''	t	completed IF All completed	t	100	\N	\N	f	t	1	{"id":"3","conditions":[{"id":"k4fnc","uri":"/activity/new-11654cad-8662-48a5-8bd7-af712158333d","act_name":"Nivel 1","option":"progress_status","option_txt":"progreso","operator":"==","operator_txt":"igual a","value":"incomplete","activity":"true"}],"applyto":"7","operator":"and","precondition":"disabled"}	9	2
\.


--
-- TOC entry 4361 (class 0 OID 17322)
-- Dependencies: 243
-- Data for Name: activitytree_learningactivitylocal; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.activitytree_learningactivitylocal (id, title, uri) FROM stdin;
1	Constructores C#	/activity/f4bf79d8-cb2a-11e8-9810-0e1899e09571
2	try catch en c# 	/activity/video/ed8faa70-0b41-11e7-82b3-0401663b8f01
3	Declaración de Clases en c#	/activity/video/528f4870-11e8-11e7-898e-0401663b8f01
4	Introducción a la programación, tipos de datos y variables	/activity/video/6ca3fd92-81f5-11e6-a0af-0401663b8f01
5	Especificadores de acceso en C#	/activity/video/caef9d0e-129e-11e7-9249-0401663b8f01
6	Creación de objetos en C#	/activity/video/a508542e-129d-11e7-9249-0401663b8f01
7	Instanciación de una Clase en C#	/activity/video/b1004f46-11f0-11e7-898e-0401663b8f01
8	Sobrecarga de operadores	/activity/b8d27e7a-1203-11e7-898e-0401663b8f01
9	Definción de Clase 	/activity/7330df52-0b40-11e7-9249-0401663b8f01
10	Sobrecarga de Operadores en C#	/activity/video/5cba7760-12b1-11e7-9249-0401663b8f01
11	Herencia simple en C#	/activity/video/ba9970e4-3538-11e7-9249-0401663b8f01
12	Variables Polimórficas en C#	/activity/video/7e76cca8-36d5-11e7-82b3-0401663b8f01
13	Valor de retorno en C#	/activity/video/7788fb1e-12b8-11e7-9249-0401663b8f01
14	Estructura de un método en C#	/activity/video/c3cf7e96-12b6-11e7-82b3-0401663b8f01
15	Clase derivada y clase base en Java	/activity/video/71771ca2-353f-11e7-82b3-0401663b8f01
16	Herencia simple y múltiple en C++	/activity/video/cfb5ed78-3537-11e7-9249-0401663b8f01
17	Ciclos "for" en Python 2: Escribiendo un programa que calcula el Factorial de un número. 	/activity/video/eaf6a4dc-81f1-11e6-b1c1-0401663b8f01
18	Interfaces en C#	/activity/video/d5860796-36d2-11e7-898e-0401663b8f01
19	Clase abstracta en C#	/activity/video/ebc6ea3c-353f-11e7-898e-0401663b8f01
20	Operadores unarios y binarios en C#	/activity/video/2e0bac06-12b4-11e7-82b3-0401663b8f01
21	Manejo de excepciones en C#	/activity/video/8b1c4842-1205-11e7-82b3-0401663b8f01
22	Referencia al objeto actual en C#	/activity/video/1b7370bc-1299-11e7-82b3-0401663b8f01
\.


--
-- TOC entry 4344 (class 0 OID 17015)
-- Dependencies: 225
-- Data for Name: activitytree_learningactivityrating; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.activitytree_learningactivityrating (id, "time", rating, context, learning_activity_id, user_id) FROM stdin;
\.


--
-- TOC entry 4346 (class 0 OID 17025)
-- Dependencies: 227
-- Data for Name: activitytree_learningstyleinventory; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.activitytree_learningstyleinventory (id, visual, verbal, aural, physical, logical, social, solitary, user_id) FROM stdin;
\.


--
-- TOC entry 4348 (class 0 OID 17042)
-- Dependencies: 229
-- Data for Name: activitytree_ula_event; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.activitytree_ula_event (id, time_stamp, context, "ULA_id") FROM stdin;
1	03:01:47.811755	{'jsonrpc': '2.0', 'method': '/program/PPP/7', 'params': ['\\ndef regresa_tupla(a,b,c):\\n    return (a,b,c) \\n'], 'id': 5, 'keypresses': [{'timestamp': 1619060500469, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1619060500618, 'keycode': 69, 'type': 'keydown'}, {'timestamp': 1619060500631, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1619060500727, 'keycode': 69, 'type': 'keyup'}, {'timestamp': 1619060500864, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1619060500979, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1619060501137, 'keycode': 85, 'type': 'keydown'}, {'timestamp': 1619060501233, 'keycode': 85, 'type': 'keyup'}, {'timestamp': 1619060501273, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1619060501383, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1619060501393, 'keycode': 78, 'type': 'keydown'}, {'timestamp': 1619060501487, 'keycode': 78, 'type': 'keyup'}, {'timestamp': 1619060501881, 'keycode': 32, 'type': 'keydown'}, {'timestamp': 1619060502085, 'keycode': 32, 'type': 'keyup'}, {'timestamp': 1619060502218, 'keycode': 16, 'type': 'keydown'}, {'timestamp': 1619060502414, 'keycode': 57, 'type': 'keydown'}, {'timestamp': 1619060502554, 'keycode': 57, 'type': 'keyup'}, {'timestamp': 1619060502914, 'keycode': 16, 'type': 'keyup'}, {'timestamp': 1619060503469, 'keycode': 65, 'type': 'keydown'}, {'timestamp': 1619060503620, 'keycode': 65, 'type': 'keyup'}, {'timestamp': 1619060503964, 'keycode': 188, 'type': 'keydown'}, {'timestamp': 1619060504068, 'keycode': 188, 'type': 'keyup'}, {'timestamp': 1619060504320, 'keycode': 66, 'type': 'keydown'}, {'timestamp': 1619060504425, 'keycode': 66, 'type': 'keyup'}, {'timestamp': 1619060504475, 'keycode': 188, 'type': 'keydown'}, {'timestamp': 1619060504598, 'keycode': 188, 'type': 'keyup'}, {'timestamp': 1619060505098, 'keycode': 67, 'type': 'keydown'}, {'timestamp': 1619060505196, 'keycode': 67, 'type': 'keyup'}, {'timestamp': 1619060505381, 'keycode': 16, 'type': 'keydown'}, {'timestamp': 1619060505663, 'keycode': 48, 'type': 'keydown'}, {'timestamp': 1619060505744, 'keycode': 48, 'type': 'keyup'}, {'timestamp': 1619060505830, 'keycode': 16, 'type': 'keyup'}, {'timestamp': 1619060506223, 'keycode': 32, 'type': 'keydown'}, {'timestamp': 1619060506331, 'keycode': 32, 'type': 'keyup'}], 'mousepresses': [{'timestamp': 1619060497520, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619060498418, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619060507465, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619060507582, 'mousecode': 1, 'type': 'mouseup'}], 'mousemovement': [{'timestamp': 1619060494678, 'position': {'x': 1808, 'y': 263}}, {'timestamp': 1619060494977, 'position': {'x': 1755, 'y': 268}}, {'timestamp': 1619060495077, 'position': {'x': 1320, 'y': 269}}, {'timestamp': 1619060495178, 'position': {'x': 857, 'y': 235}}, {'timestamp': 1619060495278, 'position': {'x': 819, 'y': 226}}, {'timestamp': 1619060495378, 'position': {'x': 821, 'y': 226}}, {'timestamp': 1619060495577, 'position': {'x': 817, 'y': 223}}, {'timestamp': 1619060495677, 'position': {'x': 803, 'y': 213}}, {'timestamp': 1619060495776, 'position': {'x': 802, 'y': 213}}, {'timestamp': 1619060495880, 'position': {'x': 803, 'y': 213}}, {'timestamp': 1619060496077, 'position': {'x': 796, 'y': 221}}, {'timestamp': 1619060496178, 'position': {'x': 760, 'y': 223}}, {'timestamp': 1619060496278, 'position': {'x': 691, 'y': 224}}, {'timestamp': 1619060496378, 'position': {'x': 678, 'y': 225}}, {'timestamp': 1619060496477, 'position': {'x': 683, 'y': 224}}, {'timestamp': 1619060496577, 'position': {'x': 710, 'y': 220}}, {'timestamp': 1619060496678, 'position': {'x': 711, 'y': 220}}, {'timestamp': 1619060496778, 'position': {'x': 708, 'y': 225}}, {'timestamp': 1619060496877, 'position': {'x': 702, 'y': 224}}, {'timestamp': 1619060496977, 'position': {'x': 701, 'y': 219}}, {'timestamp': 1619060497277, 'position': {'x': 696, 'y': 214}}, {'timestamp': 1619060497382, 'position': {'x': 695, 'y': 213}}, {'timestamp': 1619060497476, 'position': {'x': 696, 'y': 212}}, {'timestamp': 1619060497695, 'position': {'x': 698, 'y': 212}}, {'timestamp': 1619060497776, 'position': {'x': 710, 'y': 211}}, {'timestamp': 1619060497877, 'position': {'x': 717, 'y': 210}}, {'timestamp': 1619060497977, 'position': {'x': 724, 'y': 211}}, {'timestamp': 1619060498077, 'position': {'x': 742, 'y': 212}}, {'timestamp': 1619060498177, 'position': {'x': 744, 'y': 212}}, {'timestamp': 1619060498278, 'position': {'x': 745, 'y': 212}}, {'timestamp': 1619060498477, 'position': {'x': 773, 'y': 211}}, {'timestamp': 1619060498577, 'position': {'x': 866, 'y': 216}}, {'timestamp': 1619060498681, 'position': {'x': 876, 'y': 214}}, {'timestamp': 1619060506778, 'position': {'x': 876, 'y': 215}}, {'timestamp': 1619060506879, 'position': {'x': 817, 'y': 624}}, {'timestamp': 1619060506977, 'position': {'x': 804, 'y': 788}}, {'timestamp': 1619060507078, 'position': {'x': 804, 'y': 772}}, {'timestamp': 1619060507178, 'position': {'x': 799, 'y': 771}}, {'timestamp': 1619060507278, 'position': {'x': 740, 'y': 752}}, {'timestamp': 1619060507378, 'position': {'x': 735, 'y': 751}}], 'task_id': 'python:task:2'}	2
2	17:31:51.09896	{'jsonrpc': '2.0', 'method': '/program/PPP/8', 'params': ['\\ndef recorta(pelicula):\\n    pass\\n'], 'id': 6, 'keypresses': [], 'mousepresses': [{'timestamp': 1619112710628, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619112710775, 'mousecode': 1, 'type': 'mouseup'}], 'mousemovement': [{'timestamp': 1619112708161, 'position': []}, {'timestamp': 1619112708361, 'position': {'x': 1450, 'y': 390}}, {'timestamp': 1619112708461, 'position': {'x': 1111, 'y': 551}}, {'timestamp': 1619112708560, 'position': {'x': 921, 'y': 645}}, {'timestamp': 1619112708660, 'position': {'x': 914, 'y': 654}}, {'timestamp': 1619112708761, 'position': {'x': 855, 'y': 701}}, {'timestamp': 1619112708861, 'position': {'x': 676, 'y': 811}}, {'timestamp': 1619112708961, 'position': {'x': 597, 'y': 852}}, {'timestamp': 1619112709061, 'position': {'x': 617, 'y': 829}}, {'timestamp': 1619112709161, 'position': {'x': 727, 'y': 763}}, {'timestamp': 1619112709262, 'position': {'x': 736, 'y': 754}}, {'timestamp': 1619112709362, 'position': {'x': 723, 'y': 750}}, {'timestamp': 1619112709462, 'position': {'x': 710, 'y': 746}}], 'task_id': 'python:task:4'}	4
3	17:34:14.484893	{'jsonrpc': '2.0', 'method': '/program/PPP/7', 'params': ['\\ndef regresa_tupla(a,b,c):\\n    pass\\n'], 'id': 5, 'keypresses': [], 'mousepresses': [{'timestamp': 1619112854108, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619112854203, 'mousecode': 1, 'type': 'mouseup'}], 'mousemovement': [{'timestamp': 1619112849377, 'position': []}, {'timestamp': 1619112850376, 'position': {'x': 1490, 'y': 262}}, {'timestamp': 1619112850476, 'position': {'x': 1265, 'y': 441}}, {'timestamp': 1619112850577, 'position': {'x': 816, 'y': 723}}, {'timestamp': 1619112850676, 'position': {'x': 740, 'y': 748}}, {'timestamp': 1619112850777, 'position': {'x': 738, 'y': 748}}, {'timestamp': 1619112850875, 'position': {'x': 713, 'y': 749}}, {'timestamp': 1619112850976, 'position': {'x': 697, 'y': 735}}, {'timestamp': 1619112851077, 'position': {'x': 694, 'y': 716}}, {'timestamp': 1619112851277, 'position': {'x': 690, 'y': 735}}, {'timestamp': 1619112851376, 'position': {'x': 690, 'y': 737}}, {'timestamp': 1619112851577, 'position': {'x': 690, 'y': 668}}, {'timestamp': 1619112851676, 'position': {'x': 701, 'y': 277}}, {'timestamp': 1619112851776, 'position': {'x': 704, 'y': 235}}, {'timestamp': 1619112851878, 'position': {'x': 703, 'y': 239}}, {'timestamp': 1619112851976, 'position': {'x': 697, 'y': 235}}, {'timestamp': 1619112852077, 'position': {'x': 696, 'y': 234}}, {'timestamp': 1619112852175, 'position': {'x': 676, 'y': 224}}, {'timestamp': 1619112852277, 'position': {'x': 675, 'y': 223}}, {'timestamp': 1619112852476, 'position': {'x': 675, 'y': 221}}, {'timestamp': 1619112852575, 'position': {'x': 669, 'y': 213}}, {'timestamp': 1619112852875, 'position': {'x': 670, 'y': 220}}, {'timestamp': 1619112852976, 'position': {'x': 673, 'y': 751}}, {'timestamp': 1619112853077, 'position': {'x': 671, 'y': 858}}, {'timestamp': 1619112853276, 'position': {'x': 685, 'y': 830}}, {'timestamp': 1619112853375, 'position': {'x': 691, 'y': 791}}, {'timestamp': 1619112853476, 'position': {'x': 685, 'y': 769}}, {'timestamp': 1619112853577, 'position': {'x': 685, 'y': 768}}, {'timestamp': 1619112853677, 'position': {'x': 682, 'y': 763}}, {'timestamp': 1619112853775, 'position': {'x': 679, 'y': 751}}, {'timestamp': 1619112853878, 'position': {'x': 679, 'y': 749}}, {'timestamp': 1619112854077, 'position': {'x': 679, 'y': 747}}], 'task_id': 'python:task:5'}	2
4	17:35:08.654402	{'jsonrpc': '2.0', 'method': '/program/PPP/7', 'params': ['\\ndef regresa_tupla(a,b,c):\\n    pass\\n'], 'id': 5, 'keypresses': [], 'mousepresses': [{'timestamp': 1619112908193, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619112908295, 'mousecode': 1, 'type': 'mouseup'}], 'mousemovement': [{'timestamp': 1619112902318, 'position': {'x': 906, 'y': 569}}, {'timestamp': 1619112907319, 'position': {'x': 846, 'y': 638}}, {'timestamp': 1619112907419, 'position': {'x': 777, 'y': 721}}, {'timestamp': 1619112907518, 'position': {'x': 766, 'y': 735}}, {'timestamp': 1619112907618, 'position': {'x': 748, 'y': 752}}, {'timestamp': 1619112907718, 'position': {'x': 738, 'y': 756}}, {'timestamp': 1619112907818, 'position': {'x': 723, 'y': 751}}, {'timestamp': 1619112907918, 'position': {'x': 702, 'y': 742}}, {'timestamp': 1619112908022, 'position': {'x': 701, 'y': 742}}], 'task_id': 'python:task:6'}	2
5	17:38:45.546183	{'jsonrpc': '2.0', 'method': '/program/PPP/7', 'params': ['\\ndef regresa_tupla(a,b,c):\\n    pass\\n'], 'id': 5, 'keypresses': [], 'mousepresses': [{'timestamp': 1619113125128, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619113125259, 'mousecode': 1, 'type': 'mouseup'}], 'mousemovement': [{'timestamp': 1619113123437, 'position': {'x': 1315, 'y': 706}}, {'timestamp': 1619113123735, 'position': {'x': 1302, 'y': 714}}, {'timestamp': 1619113123835, 'position': {'x': 1256, 'y': 738}}, {'timestamp': 1619113123935, 'position': {'x': 992, 'y': 857}}, {'timestamp': 1619113124135, 'position': {'x': 837, 'y': 854}}, {'timestamp': 1619113124235, 'position': {'x': 860, 'y': 831}}, {'timestamp': 1619113124335, 'position': {'x': 908, 'y': 794}}, {'timestamp': 1619113124435, 'position': {'x': 921, 'y': 769}}, {'timestamp': 1619113124535, 'position': {'x': 819, 'y': 770}}, {'timestamp': 1619113124635, 'position': {'x': 733, 'y': 775}}, {'timestamp': 1619113124735, 'position': {'x': 716, 'y': 770}}, {'timestamp': 1619113124835, 'position': {'x': 707, 'y': 760}}, {'timestamp': 1619113124935, 'position': {'x': 704, 'y': 750}}, {'timestamp': 1619113125036, 'position': {'x': 704, 'y': 748}}], 'task_id': 'python:task:7'}	2
6	17:39:07.444758	{'jsonrpc': '2.0', 'method': '/program/PPP/7', 'params': ['\\ndef regresa_tupla(a,b,c):\\n    return (a,b,c)\\n'], 'id': 5, 'keypresses': [{'timestamp': 1619113138574, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1619113138707, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1619113138746, 'keycode': 69, 'type': 'keydown'}, {'timestamp': 1619113138867, 'keycode': 69, 'type': 'keyup'}, {'timestamp': 1619113139008, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1619113139107, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1619113139270, 'keycode': 85, 'type': 'keydown'}, {'timestamp': 1619113139337, 'keycode': 85, 'type': 'keyup'}, {'timestamp': 1619113139448, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1619113139534, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1619113139584, 'keycode': 78, 'type': 'keydown'}, {'timestamp': 1619113139661, 'keycode': 78, 'type': 'keyup'}, {'timestamp': 1619113139997, 'keycode': 32, 'type': 'keydown'}, {'timestamp': 1619113140086, 'keycode': 32, 'type': 'keyup'}, {'timestamp': 1619113141260, 'keycode': 16, 'type': 'keydown'}, {'timestamp': 1619113141554, 'keycode': 57, 'type': 'keydown'}, {'timestamp': 1619113141642, 'keycode': 57, 'type': 'keyup'}, {'timestamp': 1619113141884, 'keycode': 16, 'type': 'keyup'}, {'timestamp': 1619113142322, 'keycode': 65, 'type': 'keydown'}, {'timestamp': 1619113142455, 'keycode': 65, 'type': 'keyup'}, {'timestamp': 1619113142623, 'keycode': 188, 'type': 'keydown'}, {'timestamp': 1619113142708, 'keycode': 188, 'type': 'keyup'}, {'timestamp': 1619113143558, 'keycode': 66, 'type': 'keydown'}, {'timestamp': 1619113143623, 'keycode': 66, 'type': 'keyup'}, {'timestamp': 1619113144291, 'keycode': 188, 'type': 'keydown'}, {'timestamp': 1619113144375, 'keycode': 188, 'type': 'keyup'}, {'timestamp': 1619113144687, 'keycode': 67, 'type': 'keydown'}, {'timestamp': 1619113144785, 'keycode': 67, 'type': 'keyup'}, {'timestamp': 1619113144949, 'keycode': 16, 'type': 'keydown'}, {'timestamp': 1619113145124, 'keycode': 48, 'type': 'keydown'}, {'timestamp': 1619113145186, 'keycode': 48, 'type': 'keyup'}, {'timestamp': 1619113145291, 'keycode': 16, 'type': 'keyup'}], 'mousepresses': [{'timestamp': 1619113125128, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619113125259, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619113129272, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619113133411, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619113136881, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619113137429, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619113146994, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619113147135, 'mousecode': 1, 'type': 'mouseup'}], 'mousemovement': [{'timestamp': 1619113123437, 'position': {'x': 1315, 'y': 706}}, {'timestamp': 1619113123735, 'position': {'x': 1302, 'y': 714}}, {'timestamp': 1619113123835, 'position': {'x': 1256, 'y': 738}}, {'timestamp': 1619113123935, 'position': {'x': 992, 'y': 857}}, {'timestamp': 1619113124135, 'position': {'x': 837, 'y': 854}}, {'timestamp': 1619113124235, 'position': {'x': 860, 'y': 831}}, {'timestamp': 1619113124335, 'position': {'x': 908, 'y': 794}}, {'timestamp': 1619113124435, 'position': {'x': 921, 'y': 769}}, {'timestamp': 1619113124535, 'position': {'x': 819, 'y': 770}}, {'timestamp': 1619113124635, 'position': {'x': 733, 'y': 775}}, {'timestamp': 1619113124735, 'position': {'x': 716, 'y': 770}}, {'timestamp': 1619113124835, 'position': {'x': 707, 'y': 760}}, {'timestamp': 1619113124935, 'position': {'x': 704, 'y': 750}}, {'timestamp': 1619113125036, 'position': {'x': 704, 'y': 748}}, {'timestamp': 1619113125435, 'position': {'x': 891, 'y': 751}}, {'timestamp': 1619113125535, 'position': {'x': 905, 'y': 748}}, {'timestamp': 1619113125635, 'position': {'x': 903, 'y': 747}}, {'timestamp': 1619113127138, 'position': {'x': 908, 'y': 747}}, {'timestamp': 1619113127437, 'position': {'x': 907, 'y': 753}}, {'timestamp': 1619113127535, 'position': {'x': 892, 'y': 735}}, {'timestamp': 1619113127637, 'position': {'x': 830, 'y': 630}}, {'timestamp': 1619113127735, 'position': {'x': 747, 'y': 520}}, {'timestamp': 1619113127836, 'position': {'x': 744, 'y': 519}}, {'timestamp': 1619113128035, 'position': {'x': 745, 'y': 522}}, {'timestamp': 1619113128135, 'position': {'x': 746, 'y': 519}}, {'timestamp': 1619113128235, 'position': {'x': 723, 'y': 531}}, {'timestamp': 1619113128336, 'position': {'x': 408, 'y': 663}}, {'timestamp': 1619113128437, 'position': {'x': 232, 'y': 712}}, {'timestamp': 1619113128536, 'position': {'x': 234, 'y': 707}}, {'timestamp': 1619113128635, 'position': {'x': 233, 'y': 686}}, {'timestamp': 1619113128735, 'position': {'x': 206, 'y': 653}}, {'timestamp': 1619113128835, 'position': {'x': 197, 'y': 648}}, {'timestamp': 1619113128936, 'position': {'x': 196, 'y': 647}}, {'timestamp': 1619113129036, 'position': {'x': 186, 'y': 643}}, {'timestamp': 1619113129138, 'position': {'x': 181, 'y': 641}}, {'timestamp': 1619113133635, 'position': {'x': 403, 'y': 280}}, {'timestamp': 1619113133735, 'position': {'x': 657, 'y': 110}}, {'timestamp': 1619113134135, 'position': {'x': 678, 'y': 127}}, {'timestamp': 1619113134235, 'position': {'x': 711, 'y': 160}}, {'timestamp': 1619113134339, 'position': {'x': 716, 'y': 166}}, {'timestamp': 1619113134437, 'position': {'x': 714, 'y': 167}}, {'timestamp': 1619113134535, 'position': {'x': 714, 'y': 166}}, {'timestamp': 1619113135137, 'position': {'x': 713, 'y': 166}}, {'timestamp': 1619113136036, 'position': {'x': 710, 'y': 177}}, {'timestamp': 1619113136137, 'position': {'x': 708, 'y': 192}}, {'timestamp': 1619113136236, 'position': {'x': 698, 'y': 213}}, {'timestamp': 1619113136336, 'position': {'x': 694, 'y': 222}}, {'timestamp': 1619113136435, 'position': {'x': 693, 'y': 222}}, {'timestamp': 1619113136536, 'position': {'x': 673, 'y': 217}}, {'timestamp': 1619113136637, 'position': {'x': 668, 'y': 215}}, {'timestamp': 1619113136738, 'position': {'x': 665, 'y': 215}}, {'timestamp': 1619113137053, 'position': {'x': 674, 'y': 215}}, {'timestamp': 1619113137135, 'position': {'x': 684, 'y': 215}}, {'timestamp': 1619113137238, 'position': {'x': 698, 'y': 214}}, {'timestamp': 1619113137338, 'position': {'x': 702, 'y': 213}}, {'timestamp': 1619113146135, 'position': {'x': 706, 'y': 209}}, {'timestamp': 1619113146235, 'position': {'x': 704, 'y': 312}}, {'timestamp': 1619113146336, 'position': {'x': 655, 'y': 655}}, {'timestamp': 1619113146438, 'position': {'x': 652, 'y': 673}}, {'timestamp': 1619113146536, 'position': {'x': 654, 'y': 681}}, {'timestamp': 1619113146635, 'position': {'x': 665, 'y': 713}}, {'timestamp': 1619113146736, 'position': {'x': 665, 'y': 730}}, {'timestamp': 1619113146836, 'position': {'x': 664, 'y': 741}}, {'timestamp': 1619113146937, 'position': {'x': 665, 'y': 745}}], 'task_id': 'python:task:8'}	2
7	20:38:01.649963	{'jsonrpc': '2.0', 'method': '/program/PPP/7', 'params': ['\\ndef regresa_tupla(a,b,c):\\n    return (a,b,c) '], 'id': 5, 'keypresses': [{'timestamp': 1619123870107, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1619123870247, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1619123870388, 'keycode': 69, 'type': 'keydown'}, {'timestamp': 1619123870514, 'keycode': 69, 'type': 'keyup'}, {'timestamp': 1619123870832, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1619123870960, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1619123871193, 'keycode': 85, 'type': 'keydown'}, {'timestamp': 1619123871301, 'keycode': 85, 'type': 'keyup'}, {'timestamp': 1619123871429, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1619123871570, 'keycode': 78, 'type': 'keydown'}, {'timestamp': 1619123871572, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1619123871648, 'keycode': 78, 'type': 'keyup'}, {'timestamp': 1619123872239, 'keycode': 16, 'type': 'keydown'}, {'timestamp': 1619123872739, 'keycode': 16, 'type': 'keydown'}, {'timestamp': 1619123872771, 'keycode': 16, 'type': 'keydown'}, {'timestamp': 1619123872777, 'keycode': 32, 'type': 'keydown'}, {'timestamp': 1619123873029, 'keycode': 32, 'type': 'keyup'}, {'timestamp': 1619123873226, 'keycode': 57, 'type': 'keydown'}, {'timestamp': 1619123873375, 'keycode': 57, 'type': 'keyup'}, {'timestamp': 1619123873684, 'keycode': 16, 'type': 'keyup'}, {'timestamp': 1619123874126, 'keycode': 65, 'type': 'keydown'}, {'timestamp': 1619123874261, 'keycode': 65, 'type': 'keyup'}, {'timestamp': 1619123874673, 'keycode': 188, 'type': 'keydown'}, {'timestamp': 1619123874755, 'keycode': 188, 'type': 'keyup'}, {'timestamp': 1619123875049, 'keycode': 66, 'type': 'keydown'}, {'timestamp': 1619123875111, 'keycode': 66, 'type': 'keyup'}, {'timestamp': 1619123875791, 'keycode': 188, 'type': 'keydown'}, {'timestamp': 1619123875875, 'keycode': 188, 'type': 'keyup'}, {'timestamp': 1619123876189, 'keycode': 32, 'type': 'keydown'}, {'timestamp': 1619123876343, 'keycode': 32, 'type': 'keyup'}, {'timestamp': 1619123877110, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619123878114, 'keycode': 67, 'type': 'keydown'}, {'timestamp': 1619123878205, 'keycode': 67, 'type': 'keyup'}, {'timestamp': 1619123878341, 'keycode': 16, 'type': 'keydown'}, {'timestamp': 1619123878519, 'keycode': 48, 'type': 'keydown'}, {'timestamp': 1619123878583, 'keycode': 48, 'type': 'keyup'}, {'timestamp': 1619123878664, 'keycode': 16, 'type': 'keyup'}, {'timestamp': 1619123879127, 'keycode': 32, 'type': 'keydown'}, {'timestamp': 1619123879210, 'keycode': 32, 'type': 'keyup'}], 'mousepresses': [{'timestamp': 1619123868567, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619123869043, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619123881148, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619123881255, 'mousecode': 1, 'type': 'mouseup'}], 'mousemovement': [{'timestamp': 1619123866453, 'position': []}, {'timestamp': 1619123866853, 'position': {'x': 691, 'y': 526}}, {'timestamp': 1619123866954, 'position': {'x': 725, 'y': 355}}, {'timestamp': 1619123867054, 'position': {'x': 764, 'y': 244}}, {'timestamp': 1619123867153, 'position': {'x': 793, 'y': 233}}, {'timestamp': 1619123867253, 'position': {'x': 807, 'y': 237}}, {'timestamp': 1619123867453, 'position': {'x': 805, 'y': 238}}, {'timestamp': 1619123867553, 'position': {'x': 776, 'y': 232}}, {'timestamp': 1619123867653, 'position': {'x': 676, 'y': 214}}, {'timestamp': 1619123867753, 'position': {'x': 623, 'y': 218}}, {'timestamp': 1619123867953, 'position': {'x': 617, 'y': 219}}, {'timestamp': 1619123868053, 'position': {'x': 596, 'y': 224}}, {'timestamp': 1619123868155, 'position': {'x': 592, 'y': 221}}, {'timestamp': 1619123868252, 'position': {'x': 592, 'y': 208}}, {'timestamp': 1619123868352, 'position': {'x': 592, 'y': 205}}, {'timestamp': 1619123868453, 'position': {'x': 594, 'y': 204}}, {'timestamp': 1619123868552, 'position': {'x': 595, 'y': 202}}, {'timestamp': 1619123868676, 'position': {'x': 599, 'y': 202}}, {'timestamp': 1619123868753, 'position': {'x': 622, 'y': 206}}, {'timestamp': 1619123868853, 'position': {'x': 679, 'y': 214}}, {'timestamp': 1619123879954, 'position': {'x': 658, 'y': 373}}, {'timestamp': 1619123880053, 'position': {'x': 640, 'y': 551}}, {'timestamp': 1619123880153, 'position': {'x': 632, 'y': 582}}, {'timestamp': 1619123880353, 'position': {'x': 622, 'y': 645}}, {'timestamp': 1619123880453, 'position': {'x': 616, 'y': 703}}, {'timestamp': 1619123880553, 'position': {'x': 616, 'y': 706}}, {'timestamp': 1619123880654, 'position': {'x': 611, 'y': 732}}, {'timestamp': 1619123880754, 'position': {'x': 605, 'y': 749}}, {'timestamp': 1619123880854, 'position': {'x': 605, 'y': 751}}, {'timestamp': 1619123881054, 'position': {'x': 607, 'y': 745}}], 'task_id': 'python:task:9'}	2
8	20:38:13.702157	{'jsonrpc': '2.0', 'method': '/program/PPP/10', 'params': ['\\ndef es_accion(pelicula):\\n    pass\\n'], 'id': 4, 'keypresses': [], 'mousepresses': [{'timestamp': 1619123893111, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619123893232, 'mousecode': 1, 'type': 'mouseup'}], 'mousemovement': [{'timestamp': 1619123887064, 'position': []}, {'timestamp': 1619123888764, 'position': {'x': 240, 'y': 220}}, {'timestamp': 1619123888863, 'position': {'x': 320, 'y': 261}}, {'timestamp': 1619123888963, 'position': {'x': 571, 'y': 352}}, {'timestamp': 1619123889063, 'position': {'x': 657, 'y': 387}}, {'timestamp': 1619123889163, 'position': {'x': 637, 'y': 378}}, {'timestamp': 1619123889363, 'position': {'x': 644, 'y': 380}}, {'timestamp': 1619123889463, 'position': {'x': 632, 'y': 374}}, {'timestamp': 1619123889563, 'position': {'x': 600, 'y': 359}}, {'timestamp': 1619123889663, 'position': {'x': 452, 'y': 303}}, {'timestamp': 1619123889763, 'position': {'x': 102, 'y': 166}}, {'timestamp': 1619123889863, 'position': {'x': 59, 'y': 149}}, {'timestamp': 1619123890263, 'position': {'x': 62, 'y': 149}}, {'timestamp': 1619123890363, 'position': {'x': 93, 'y': 158}}, {'timestamp': 1619123890464, 'position': {'x': 103, 'y': 156}}, {'timestamp': 1619123890764, 'position': {'x': 111, 'y': 167}}, {'timestamp': 1619123890863, 'position': {'x': 124, 'y': 167}}, {'timestamp': 1619123890963, 'position': {'x': 151, 'y': 167}}, {'timestamp': 1619123891063, 'position': {'x': 201, 'y': 168}}, {'timestamp': 1619123891163, 'position': {'x': 292, 'y': 171}}, {'timestamp': 1619123891263, 'position': {'x': 356, 'y': 171}}, {'timestamp': 1619123891363, 'position': {'x': 359, 'y': 171}}, {'timestamp': 1619123891464, 'position': {'x': 362, 'y': 172}}, {'timestamp': 1619123891663, 'position': {'x': 363, 'y': 172}}, {'timestamp': 1619123891764, 'position': {'x': 575, 'y': 385}}, {'timestamp': 1619123891864, 'position': {'x': 1087, 'y': 781}}, {'timestamp': 1619123892063, 'position': {'x': 1095, 'y': 775}}, {'timestamp': 1619123892164, 'position': {'x': 1092, 'y': 772}}, {'timestamp': 1619123892264, 'position': {'x': 923, 'y': 708}}, {'timestamp': 1619123892363, 'position': {'x': 743, 'y': 685}}, {'timestamp': 1619123892463, 'position': {'x': 708, 'y': 699}}, {'timestamp': 1619123892563, 'position': {'x': 641, 'y': 732}}, {'timestamp': 1619123892663, 'position': {'x': 619, 'y': 760}}, {'timestamp': 1619123892763, 'position': {'x': 618, 'y': 763}}, {'timestamp': 1619123892863, 'position': {'x': 618, 'y': 760}}, {'timestamp': 1619123892963, 'position': {'x': 621, 'y': 743}}], 'task_id': 'python:task:10'}	3
9	20:40:05.81761	{'jsonrpc': '2.0', 'method': '/program/PPP/10', 'params': ["\\ndef es_accion(pelicula):\\n    return 'Action' in pelicula[3] \\n"], 'id': 4, 'keypresses': [{'timestamp': 1619123936867, 'keycode': 46, 'type': 'keyup'}, {'timestamp': 1619123944177, 'keycode': 73, 'type': 'keydown'}, {'timestamp': 1619123944294, 'keycode': 73, 'type': 'keyup'}, {'timestamp': 1619123944367, 'keycode': 70, 'type': 'keydown'}, {'timestamp': 1619123944501, 'keycode': 70, 'type': 'keyup'}, {'timestamp': 1619123944508, 'keycode': 32, 'type': 'keydown'}, {'timestamp': 1619123944623, 'keycode': 32, 'type': 'keyup'}, {'timestamp': 1619123945410, 'keycode': 16, 'type': 'keydown'}, {'timestamp': 1619123945910, 'keycode': 16, 'type': 'keydown'}, {'timestamp': 1619123945943, 'keycode': 16, 'type': 'keydown'}, {'timestamp': 1619123945957, 'keycode': 57, 'type': 'keydown'}, {'timestamp': 1619123946057, 'keycode': 57, 'type': 'keyup'}, {'timestamp': 1619123946164, 'keycode': 16, 'type': 'keyup'}, {'timestamp': 1619123948163, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619123970595, 'keycode': 79, 'type': 'keydown'}, {'timestamp': 1619123970720, 'keycode': 79, 'type': 'keyup'}, {'timestamp': 1619123970839, 'keycode': 69, 'type': 'keydown'}, {'timestamp': 1619123970992, 'keycode': 69, 'type': 'keyup'}, {'timestamp': 1619123971007, 'keycode': 76, 'type': 'keydown'}, {'timestamp': 1619123971079, 'keycode': 76, 'type': 'keyup'}, {'timestamp': 1619123971250, 'keycode': 73, 'type': 'keydown'}, {'timestamp': 1619123971317, 'keycode': 73, 'type': 'keyup'}, {'timestamp': 1619123971436, 'keycode': 67, 'type': 'keydown'}, {'timestamp': 1619123971571, 'keycode': 67, 'type': 'keyup'}, {'timestamp': 1619123971758, 'keycode': 85, 'type': 'keydown'}, {'timestamp': 1619123971816, 'keycode': 85, 'type': 'keyup'}, {'timestamp': 1619123971997, 'keycode': 76, 'type': 'keydown'}, {'timestamp': 1619123972069, 'keycode': 76, 'type': 'keyup'}, {'timestamp': 1619123973222, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619123973394, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619123973564, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619123973728, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619123973893, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619123974062, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619123974268, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619123976383, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619123976571, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619123976775, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619123977472, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1619123977617, 'keycode': 69, 'type': 'keydown'}, {'timestamp': 1619123977643, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1619123977752, 'keycode': 69, 'type': 'keyup'}, {'timestamp': 1619123977900, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1619123978052, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1619123978218, 'keycode': 85, 'type': 'keydown'}, {'timestamp': 1619123978315, 'keycode': 85, 'type': 'keyup'}, {'timestamp': 1619123978413, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1619123978495, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1619123978526, 'keycode': 78, 'type': 'keydown'}, {'timestamp': 1619123978596, 'keycode': 78, 'type': 'keyup'}, {'timestamp': 1619123978789, 'keycode': 32, 'type': 'keydown'}, {'timestamp': 1619123978828, 'keycode': 32, 'type': 'keyup'}, {'timestamp': 1619123980061, 'keycode': 222, 'type': 'keydown'}, {'timestamp': 1619123980131, 'keycode': 222, 'type': 'keyup'}, {'timestamp': 1619123980602, 'keycode': 16, 'type': 'keydown'}, {'timestamp': 1619123980698, 'keycode': 16, 'type': 'keyup'}, {'timestamp': 1619123980805, 'keycode': 32, 'type': 'keydown'}, {'timestamp': 1619123980993, 'keycode': 32, 'type': 'keyup'}, {'timestamp': 1619123981154, 'keycode': 16, 'type': 'keydown'}, {'timestamp': 1619123981415, 'keycode': 65, 'type': 'keydown'}, {'timestamp': 1619123981551, 'keycode': 16, 'type': 'keyup'}, {'timestamp': 1619123981584, 'keycode': 65, 'type': 'keyup'}, {'timestamp': 1619123982183, 'keycode': 67, 'type': 'keydown'}, {'timestamp': 1619123982287, 'keycode': 67, 'type': 'keyup'}, {'timestamp': 1619123982845, 'keycode': 73, 'type': 'keydown'}, {'timestamp': 1619123982951, 'keycode': 79, 'type': 'keydown'}, {'timestamp': 1619123983006, 'keycode': 73, 'type': 'keyup'}, {'timestamp': 1619123983051, 'keycode': 79, 'type': 'keyup'}, {'timestamp': 1619123983203, 'keycode': 78, 'type': 'keydown'}, {'timestamp': 1619123983275, 'keycode': 78, 'type': 'keyup'}, {'timestamp': 1619123983639, 'keycode': 32, 'type': 'keydown'}, {'timestamp': 1619123983829, 'keycode': 32, 'type': 'keyup'}, {'timestamp': 1619123984074, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619123984251, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619123984435, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619123984583, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1619123984706, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1619123985299, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619123985493, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619123985827, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1619123985924, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1619123986188, 'keycode': 73, 'type': 'keydown'}, {'timestamp': 1619123986249, 'keycode': 79, 'type': 'keydown'}, {'timestamp': 1619123986291, 'keycode': 73, 'type': 'keyup'}, {'timestamp': 1619123986349, 'keycode': 79, 'type': 'keyup'}, {'timestamp': 1619123986679, 'keycode': 78, 'type': 'keydown'}, {'timestamp': 1619123986758, 'keycode': 78, 'type': 'keyup'}, {'timestamp': 1619123987461, 'keycode': 222, 'type': 'keydown'}, {'timestamp': 1619123987524, 'keycode': 222, 'type': 'keyup'}, {'timestamp': 1619123987619, 'keycode': 32, 'type': 'keydown'}, {'timestamp': 1619123987750, 'keycode': 32, 'type': 'keyup'}, {'timestamp': 1619123988689, 'keycode': 32, 'type': 'keydown'}, {'timestamp': 1619123988846, 'keycode': 32, 'type': 'keyup'}, {'timestamp': 1619123989624, 'keycode': 73, 'type': 'keydown'}, {'timestamp': 1619123989765, 'keycode': 73, 'type': 'keyup'}, {'timestamp': 1619123989819, 'keycode': 78, 'type': 'keydown'}, {'timestamp': 1619123989978, 'keycode': 78, 'type': 'keyup'}, {'timestamp': 1619123990242, 'keycode': 32, 'type': 'keydown'}, {'timestamp': 1619123990340, 'keycode': 32, 'type': 'keyup'}, {'timestamp': 1619123990544, 'keycode': 80, 'type': 'keydown'}, {'timestamp': 1619123990688, 'keycode': 80, 'type': 'keyup'}, {'timestamp': 1619123990810, 'keycode': 69, 'type': 'keydown'}, {'timestamp': 1619123990949, 'keycode': 69, 'type': 'keyup'}, {'timestamp': 1619123990961, 'keycode': 76, 'type': 'keydown'}, {'timestamp': 1619123991061, 'keycode': 76, 'type': 'keyup'}, {'timestamp': 1619123991702, 'keycode': 73, 'type': 'keydown'}, {'timestamp': 1619123991826, 'keycode': 73, 'type': 'keyup'}, {'timestamp': 1619123992159, 'keycode': 67, 'type': 'keydown'}, {'timestamp': 1619123992305, 'keycode': 67, 'type': 'keyup'}, {'timestamp': 1619123992413, 'keycode': 85, 'type': 'keydown'}, {'timestamp': 1619123992496, 'keycode': 85, 'type': 'keyup'}, {'timestamp': 1619123992689, 'keycode': 76, 'type': 'keydown'}, {'timestamp': 1619123992760, 'keycode': 76, 'type': 'keyup'}, {'timestamp': 1619123992876, 'keycode': 65, 'type': 'keydown'}, {'timestamp': 1619123992981, 'keycode': 65, 'type': 'keyup'}, {'timestamp': 1619123994306, 'keycode': 219, 'type': 'keydown'}, {'timestamp': 1619123994402, 'keycode': 219, 'type': 'keyup'}, {'timestamp': 1619123994697, 'keycode': 32, 'type': 'keydown'}, {'timestamp': 1619123994855, 'keycode': 32, 'type': 'keyup'}, {'timestamp': 1619123995350, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619123995798, 'keycode': 221, 'type': 'keydown'}, {'timestamp': 1619123995868, 'keycode': 221, 'type': 'keyup'}, {'timestamp': 1619123996117, 'keycode': 32, 'type': 'keydown'}, {'timestamp': 1619123996248, 'keycode': 32, 'type': 'keyup'}, {'timestamp': 1619123996914, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1619123997085, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1619123999379, 'keycode': 51, 'type': 'keydown'}, {'timestamp': 1619123999461, 'keycode': 51, 'type': 'keyup'}], 'mousepresses': [{'timestamp': 1619123893111, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619123893232, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619123900131, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619123900345, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619123930007, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619123930114, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619123930237, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619123930358, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619123930885, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619123930995, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619123931096, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619123931213, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619124004228, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619124004382, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619124005293, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619124005404, 'mousecode': 1, 'type': 'mouseup'}], 'mousemovement': [{'timestamp': 1619123887064, 'position': []}, {'timestamp': 1619123888764, 'position': {'x': 240, 'y': 220}}, {'timestamp': 1619123888863, 'position': {'x': 320, 'y': 261}}, {'timestamp': 1619123888963, 'position': {'x': 571, 'y': 352}}, {'timestamp': 1619123889063, 'position': {'x': 657, 'y': 387}}, {'timestamp': 1619123889163, 'position': {'x': 637, 'y': 378}}, {'timestamp': 1619123889363, 'position': {'x': 644, 'y': 380}}, {'timestamp': 1619123889463, 'position': {'x': 632, 'y': 374}}, {'timestamp': 1619123889563, 'position': {'x': 600, 'y': 359}}, {'timestamp': 1619123889663, 'position': {'x': 452, 'y': 303}}, {'timestamp': 1619123889763, 'position': {'x': 102, 'y': 166}}, {'timestamp': 1619123889863, 'position': {'x': 59, 'y': 149}}, {'timestamp': 1619123890263, 'position': {'x': 62, 'y': 149}}, {'timestamp': 1619123890363, 'position': {'x': 93, 'y': 158}}, {'timestamp': 1619123890464, 'position': {'x': 103, 'y': 156}}, {'timestamp': 1619123890764, 'position': {'x': 111, 'y': 167}}, {'timestamp': 1619123890863, 'position': {'x': 124, 'y': 167}}, {'timestamp': 1619123890963, 'position': {'x': 151, 'y': 167}}, {'timestamp': 1619123891063, 'position': {'x': 201, 'y': 168}}, {'timestamp': 1619123891163, 'position': {'x': 292, 'y': 171}}, {'timestamp': 1619123891263, 'position': {'x': 356, 'y': 171}}, {'timestamp': 1619123891363, 'position': {'x': 359, 'y': 171}}, {'timestamp': 1619123891464, 'position': {'x': 362, 'y': 172}}, {'timestamp': 1619123891663, 'position': {'x': 363, 'y': 172}}, {'timestamp': 1619123891764, 'position': {'x': 575, 'y': 385}}, {'timestamp': 1619123891864, 'position': {'x': 1087, 'y': 781}}, {'timestamp': 1619123892063, 'position': {'x': 1095, 'y': 775}}, {'timestamp': 1619123892164, 'position': {'x': 1092, 'y': 772}}, {'timestamp': 1619123892264, 'position': {'x': 923, 'y': 708}}, {'timestamp': 1619123892363, 'position': {'x': 743, 'y': 685}}, {'timestamp': 1619123892463, 'position': {'x': 708, 'y': 699}}, {'timestamp': 1619123892563, 'position': {'x': 641, 'y': 732}}, {'timestamp': 1619123892663, 'position': {'x': 619, 'y': 760}}, {'timestamp': 1619123892763, 'position': {'x': 618, 'y': 763}}, {'timestamp': 1619123892863, 'position': {'x': 618, 'y': 760}}, {'timestamp': 1619123892963, 'position': {'x': 621, 'y': 743}}, {'timestamp': 1619123893363, 'position': {'x': 711, 'y': 669}}, {'timestamp': 1619123893464, 'position': {'x': 825, 'y': 571}}, {'timestamp': 1619123893564, 'position': {'x': 830, 'y': 566}}, {'timestamp': 1619123895764, 'position': {'x': 829, 'y': 567}}, {'timestamp': 1619123895863, 'position': {'x': 835, 'y': 570}}, {'timestamp': 1619123895963, 'position': {'x': 863, 'y': 567}}, {'timestamp': 1619123896263, 'position': {'x': 864, 'y': 570}}, {'timestamp': 1619123896363, 'position': {'x': 863, 'y': 569}}, {'timestamp': 1619123896464, 'position': {'x': 827, 'y': 532}}, {'timestamp': 1619123896563, 'position': {'x': 768, 'y': 427}}, {'timestamp': 1619123896663, 'position': {'x': 734, 'y': 324}}, {'timestamp': 1619123896763, 'position': {'x': 690, 'y': 287}}, {'timestamp': 1619123896863, 'position': {'x': 652, 'y': 274}}, {'timestamp': 1619123896963, 'position': {'x': 596, 'y': 238}}, {'timestamp': 1619123897063, 'position': {'x': 581, 'y': 201}}, {'timestamp': 1619123897164, 'position': {'x': 588, 'y': 199}}, {'timestamp': 1619123897264, 'position': {'x': 592, 'y': 202}}, {'timestamp': 1619123897363, 'position': {'x': 488, 'y': 181}}, {'timestamp': 1619123897463, 'position': {'x': 274, 'y': 132}}, {'timestamp': 1619123897564, 'position': {'x': 244, 'y': 127}}, {'timestamp': 1619123897663, 'position': {'x': 213, 'y': 126}}, {'timestamp': 1619123897763, 'position': {'x': 174, 'y': 128}}, {'timestamp': 1619123897864, 'position': {'x': 166, 'y': 132}}, {'timestamp': 1619123897963, 'position': {'x': 165, 'y': 132}}, {'timestamp': 1619123898263, 'position': {'x': 159, 'y': 132}}, {'timestamp': 1619123898363, 'position': {'x': 161, 'y': 140}}, {'timestamp': 1619123898463, 'position': {'x': 131, 'y': 128}}, {'timestamp': 1619123898563, 'position': {'x': 81, 'y': 117}}, {'timestamp': 1619123898664, 'position': {'x': 74, 'y': 115}}, {'timestamp': 1619123899063, 'position': {'x': 110, 'y': 115}}, {'timestamp': 1619123899163, 'position': {'x': 113, 'y': 116}}, {'timestamp': 1619123899364, 'position': {'x': 111, 'y': 114}}, {'timestamp': 1619123910465, 'position': {'x': 94, 'y': 61}}, {'timestamp': 1619123910564, 'position': {'x': 50, 'y': 82}}, {'timestamp': 1619123910664, 'position': {'x': 52, 'y': 100}}, {'timestamp': 1619123910764, 'position': {'x': 172, 'y': 142}}, {'timestamp': 1619123910863, 'position': {'x': 188, 'y': 144}}, {'timestamp': 1619123910964, 'position': {'x': 189, 'y': 144}}, {'timestamp': 1619123911064, 'position': {'x': 189, 'y': 155}}, {'timestamp': 1619123911164, 'position': {'x': 167, 'y': 162}}, {'timestamp': 1619123911263, 'position': {'x': 147, 'y': 179}}, {'timestamp': 1619123911363, 'position': {'x': 132, 'y': 190}}, {'timestamp': 1619123911465, 'position': {'x': 136, 'y': 195}}, {'timestamp': 1619123911564, 'position': {'x': 149, 'y': 181}}, {'timestamp': 1619123911863, 'position': {'x': 154, 'y': 181}}, {'timestamp': 1619123911964, 'position': {'x': 186, 'y': 179}}, {'timestamp': 1619123912065, 'position': {'x': 203, 'y': 174}}, {'timestamp': 1619123912165, 'position': {'x': 248, 'y': 168}}, {'timestamp': 1619123912263, 'position': {'x': 251, 'y': 167}}, {'timestamp': 1619123912663, 'position': {'x': 297, 'y': 161}}, {'timestamp': 1619123912763, 'position': {'x': 380, 'y': 159}}, {'timestamp': 1619123912863, 'position': {'x': 399, 'y': 160}}, {'timestamp': 1619123912964, 'position': {'x': 485, 'y': 167}}, {'timestamp': 1619123913064, 'position': {'x': 505, 'y': 169}}, {'timestamp': 1619123913263, 'position': {'x': 500, 'y': 167}}, {'timestamp': 1619123913363, 'position': {'x': 493, 'y': 164}}, {'timestamp': 1619123913464, 'position': {'x': 428, 'y': 167}}, {'timestamp': 1619123913564, 'position': {'x': 204, 'y': 184}}, {'timestamp': 1619123913665, 'position': {'x': 147, 'y': 202}}, {'timestamp': 1619123913764, 'position': {'x': 146, 'y': 207}}, {'timestamp': 1619123913963, 'position': {'x': 146, 'y': 210}}, {'timestamp': 1619123914063, 'position': {'x': 146, 'y': 214}}, {'timestamp': 1619123914164, 'position': {'x': 146, 'y': 217}}, {'timestamp': 1619123914264, 'position': {'x': 149, 'y': 217}}, {'timestamp': 1619123914365, 'position': {'x': 160, 'y': 220}}, {'timestamp': 1619123914464, 'position': {'x': 148, 'y': 236}}, {'timestamp': 1619123914564, 'position': {'x': 108, 'y': 239}}, {'timestamp': 1619123914664, 'position': {'x': 105, 'y': 239}}, {'timestamp': 1619123914763, 'position': {'x': 98, 'y': 237}}, {'timestamp': 1619123914863, 'position': {'x': 94, 'y': 232}}, {'timestamp': 1619123914963, 'position': {'x': 93, 'y': 230}}, {'timestamp': 1619123915563, 'position': {'x': 94, 'y': 230}}, {'timestamp': 1619123915664, 'position': {'x': 101, 'y': 232}}, {'timestamp': 1619123915764, 'position': {'x': 142, 'y': 238}}, {'timestamp': 1619123915863, 'position': {'x': 175, 'y': 238}}, {'timestamp': 1619123916163, 'position': {'x': 176, 'y': 239}}, {'timestamp': 1619123916264, 'position': {'x': 194, 'y': 239}}, {'timestamp': 1619123916363, 'position': {'x': 238, 'y': 239}}, {'timestamp': 1619123916464, 'position': {'x': 317, 'y': 238}}, {'timestamp': 1619123916563, 'position': {'x': 347, 'y': 238}}, {'timestamp': 1619123916963, 'position': {'x': 351, 'y': 238}}, {'timestamp': 1619123917063, 'position': {'x': 438, 'y': 243}}, {'timestamp': 1619123917163, 'position': {'x': 470, 'y': 246}}, {'timestamp': 1619123917563, 'position': {'x': 398, 'y': 253}}, {'timestamp': 1619123917663, 'position': {'x': 223, 'y': 255}}, {'timestamp': 1619123917763, 'position': {'x': 178, 'y': 261}}, {'timestamp': 1619123917863, 'position': {'x': 134, 'y': 264}}, {'timestamp': 1619123917964, 'position': {'x': 120, 'y': 264}}, {'timestamp': 1619123925463, 'position': {'x': 120, 'y': 263}}, {'timestamp': 1619123925564, 'position': {'x': 171, 'y': 221}}, {'timestamp': 1619123925663, 'position': {'x': 247, 'y': 204}}, {'timestamp': 1619123925764, 'position': {'x': 277, 'y': 220}}, {'timestamp': 1619123925864, 'position': {'x': 281, 'y': 220}}, {'timestamp': 1619123926063, 'position': {'x': 297, 'y': 229}}, {'timestamp': 1619123926164, 'position': {'x': 445, 'y': 274}}, {'timestamp': 1619123926264, 'position': {'x': 500, 'y': 284}}, {'timestamp': 1619123926364, 'position': {'x': 518, 'y': 285}}, {'timestamp': 1619123926465, 'position': {'x': 540, 'y': 291}}, {'timestamp': 1619123926565, 'position': {'x': 503, 'y': 296}}, {'timestamp': 1619123926664, 'position': {'x': 381, 'y': 302}}, {'timestamp': 1619123926764, 'position': {'x': 226, 'y': 332}}, {'timestamp': 1619123926864, 'position': {'x': 115, 'y': 358}}, {'timestamp': 1619123926963, 'position': {'x': 108, 'y': 356}}, {'timestamp': 1619123927063, 'position': {'x': 101, 'y': 349}}, {'timestamp': 1619123927264, 'position': {'x': 98, 'y': 344}}, {'timestamp': 1619123927364, 'position': {'x': 104, 'y': 342}}, {'timestamp': 1619123927464, 'position': {'x': 116, 'y': 347}}, {'timestamp': 1619123927563, 'position': {'x': 152, 'y': 361}}, {'timestamp': 1619123927663, 'position': {'x': 186, 'y': 361}}, {'timestamp': 1619123927763, 'position': {'x': 218, 'y': 355}}, {'timestamp': 1619123927863, 'position': {'x': 252, 'y': 346}}, {'timestamp': 1619123928164, 'position': {'x': 252, 'y': 347}}, {'timestamp': 1619123928264, 'position': {'x': 258, 'y': 360}}, {'timestamp': 1619123928363, 'position': {'x': 278, 'y': 350}}, {'timestamp': 1619123928464, 'position': {'x': 329, 'y': 326}}, {'timestamp': 1619123928564, 'position': {'x': 453, 'y': 292}}, {'timestamp': 1619123928663, 'position': {'x': 548, 'y': 278}}, {'timestamp': 1619123928764, 'position': {'x': 572, 'y': 278}}, {'timestamp': 1619123928863, 'position': {'x': 574, 'y': 278}}, {'timestamp': 1619123928964, 'position': {'x': 600, 'y': 254}}, {'timestamp': 1619123929063, 'position': {'x': 608, 'y': 243}}, {'timestamp': 1619123929363, 'position': {'x': 611, 'y': 237}}, {'timestamp': 1619123929463, 'position': {'x': 612, 'y': 234}}, {'timestamp': 1619123929563, 'position': {'x': 611, 'y': 232}}, {'timestamp': 1619123929664, 'position': {'x': 608, 'y': 222}}, {'timestamp': 1619123929764, 'position': {'x': 599, 'y': 206}}, {'timestamp': 1619123929863, 'position': {'x': 591, 'y': 206}}, {'timestamp': 1619123929963, 'position': {'x': 591, 'y': 208}}, {'timestamp': 1619123930117, 'position': {'x': 593, 'y': 208}}, {'timestamp': 1619123930163, 'position': {'x': 594, 'y': 208}}, {'timestamp': 1619123930463, 'position': {'x': 625, 'y': 212}}, {'timestamp': 1619123930564, 'position': {'x': 660, 'y': 214}}, {'timestamp': 1619123930665, 'position': {'x': 623, 'y': 202}}, {'timestamp': 1619123930764, 'position': {'x': 606, 'y': 199}}, {'timestamp': 1619123931263, 'position': {'x': 639, 'y': 200}}, {'timestamp': 1619123931364, 'position': {'x': 833, 'y': 207}}, {'timestamp': 1619123931464, 'position': {'x': 838, 'y': 206}}, {'timestamp': 1619124000465, 'position': {'x': 824, 'y': 7}}, {'timestamp': 1619124000664, 'position': {'x': 609, 'y': 128}}, {'timestamp': 1619124000765, 'position': {'x': 594, 'y': 153}}, {'timestamp': 1619124000864, 'position': {'x': 561, 'y': 167}}, {'timestamp': 1619124000964, 'position': {'x': 364, 'y': 145}}, {'timestamp': 1619124001064, 'position': {'x': 359, 'y': 147}}, {'timestamp': 1619124001164, 'position': {'x': 307, 'y': 179}}, {'timestamp': 1619124001264, 'position': {'x': 272, 'y': 198}}, {'timestamp': 1619124001364, 'position': {'x': 271, 'y': 161}}, {'timestamp': 1619124001465, 'position': {'x': 336, 'y': 165}}, {'timestamp': 1619124001565, 'position': {'x': 395, 'y': 163}}, {'timestamp': 1619124001664, 'position': {'x': 396, 'y': 163}}, {'timestamp': 1619124001765, 'position': {'x': 411, 'y': 166}}, {'timestamp': 1619124001864, 'position': {'x': 411, 'y': 171}}, {'timestamp': 1619124001964, 'position': {'x': 405, 'y': 184}}, {'timestamp': 1619124002564, 'position': {'x': 388, 'y': 211}}, {'timestamp': 1619124002664, 'position': {'x': 288, 'y': 278}}, {'timestamp': 1619124002764, 'position': {'x': 174, 'y': 261}}, {'timestamp': 1619124002864, 'position': {'x': 147, 'y': 229}}, {'timestamp': 1619124002964, 'position': {'x': 150, 'y': 195}}, {'timestamp': 1619124003064, 'position': {'x': 147, 'y': 191}}, {'timestamp': 1619124003164, 'position': {'x': 155, 'y': 200}}, {'timestamp': 1619124003264, 'position': {'x': 300, 'y': 222}}, {'timestamp': 1619124003365, 'position': {'x': 333, 'y': 196}}, {'timestamp': 1619124003464, 'position': {'x': 428, 'y': 213}}, {'timestamp': 1619124003564, 'position': {'x': 705, 'y': 216}}, {'timestamp': 1619124003664, 'position': {'x': 723, 'y': 208}}, {'timestamp': 1619124003764, 'position': {'x': 725, 'y': 209}}, {'timestamp': 1619124003864, 'position': {'x': 794, 'y': 203}}, {'timestamp': 1619124003964, 'position': {'x': 812, 'y': 200}}, {'timestamp': 1619124004163, 'position': {'x': 812, 'y': 199}}, {'timestamp': 1619124004564, 'position': {'x': 849, 'y': 210}}, {'timestamp': 1619124004663, 'position': {'x': 827, 'y': 586}}, {'timestamp': 1619124004764, 'position': {'x': 755, 'y': 785}}, {'timestamp': 1619124004863, 'position': {'x': 723, 'y': 759}}, {'timestamp': 1619124004964, 'position': {'x': 707, 'y': 740}}, {'timestamp': 1619124005064, 'position': {'x': 658, 'y': 746}}, {'timestamp': 1619124005164, 'position': {'x': 630, 'y': 748}}], 'task_id': 'python:task:11'}	3
10	20:41:18.081178	{'jsonrpc': '2.0', 'method': '/program/PPP/8', 'params': ['\\ndef recorta(pelicula):\\n    return pelicula[:3]\\n'], 'id': 6, 'keypresses': [{'timestamp': 1619124053961, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1619124054113, 'keycode': 69, 'type': 'keydown'}, {'timestamp': 1619124054150, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1619124054213, 'keycode': 69, 'type': 'keyup'}, {'timestamp': 1619124054358, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1619124054462, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1619124054752, 'keycode': 85, 'type': 'keydown'}, {'timestamp': 1619124054854, 'keycode': 85, 'type': 'keyup'}, {'timestamp': 1619124054945, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1619124055047, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1619124055096, 'keycode': 78, 'type': 'keydown'}, {'timestamp': 1619124055181, 'keycode': 78, 'type': 'keyup'}, {'timestamp': 1619124055965, 'keycode': 32, 'type': 'keydown'}, {'timestamp': 1619124056120, 'keycode': 32, 'type': 'keyup'}, {'timestamp': 1619124057276, 'keycode': 80, 'type': 'keydown'}, {'timestamp': 1619124057360, 'keycode': 80, 'type': 'keyup'}, {'timestamp': 1619124057500, 'keycode': 69, 'type': 'keydown'}, {'timestamp': 1619124057583, 'keycode': 69, 'type': 'keyup'}, {'timestamp': 1619124057628, 'keycode': 76, 'type': 'keydown'}, {'timestamp': 1619124057699, 'keycode': 76, 'type': 'keyup'}, {'timestamp': 1619124057870, 'keycode': 73, 'type': 'keydown'}, {'timestamp': 1619124057940, 'keycode': 73, 'type': 'keyup'}, {'timestamp': 1619124058073, 'keycode': 67, 'type': 'keydown'}, {'timestamp': 1619124058208, 'keycode': 67, 'type': 'keyup'}, {'timestamp': 1619124058299, 'keycode': 85, 'type': 'keydown'}, {'timestamp': 1619124058360, 'keycode': 85, 'type': 'keyup'}, {'timestamp': 1619124058574, 'keycode': 186, 'type': 'keydown'}, {'timestamp': 1619124058577, 'keycode': 76, 'type': 'keydown'}, {'timestamp': 1619124058620, 'keycode': 76, 'type': 'keyup'}, {'timestamp': 1619124058623, 'keycode': 186, 'type': 'keyup'}, {'timestamp': 1619124058717, 'keycode': 65, 'type': 'keydown'}, {'timestamp': 1619124058848, 'keycode': 65, 'type': 'keyup'}, {'timestamp': 1619124059454, 'keycode': 219, 'type': 'keydown'}, {'timestamp': 1619124059537, 'keycode': 219, 'type': 'keyup'}, {'timestamp': 1619124060296, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1619124060473, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1619124060641, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1619124061145, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1619124061407, 'keycode': 46, 'type': 'keyup'}, {'timestamp': 1619124061669, 'keycode': 39, 'type': 'keyup'}, {'timestamp': 1619124061856, 'keycode': 39, 'type': 'keyup'}, {'timestamp': 1619124062052, 'keycode': 39, 'type': 'keyup'}, {'timestamp': 1619124071020, 'keycode': 16, 'type': 'keydown'}, {'timestamp': 1619124071360, 'keycode': 186, 'type': 'keydown'}, {'timestamp': 1619124071451, 'keycode': 186, 'type': 'keyup'}, {'timestamp': 1619124071586, 'keycode': 16, 'type': 'keyup'}, {'timestamp': 1619124073078, 'keycode': 51, 'type': 'keydown'}, {'timestamp': 1619124073164, 'keycode': 51, 'type': 'keyup'}, {'timestamp': 1619124075200, 'keycode': 221, 'type': 'keydown'}, {'timestamp': 1619124075259, 'keycode': 221, 'type': 'keyup'}], 'mousepresses': [{'timestamp': 1619124051637, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619124051741, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619124051849, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619124051978, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619124077589, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619124077716, 'mousecode': 1, 'type': 'mouseup'}], 'mousemovement': [{'timestamp': 1619124020820, 'position': []}, {'timestamp': 1619124021020, 'position': {'x': 1414, 'y': 365}}, {'timestamp': 1619124021521, 'position': {'x': 1417, 'y': 367}}, {'timestamp': 1619124021621, 'position': {'x': 1418, 'y': 367}}, {'timestamp': 1619124022220, 'position': {'x': 1419, 'y': 368}}, {'timestamp': 1619124022321, 'position': {'x': 1427, 'y': 413}}, {'timestamp': 1619124022421, 'position': {'x': 1430, 'y': 421}}, {'timestamp': 1619124022520, 'position': {'x': 1441, 'y': 423}}, {'timestamp': 1619124022621, 'position': {'x': 1451, 'y': 428}}, {'timestamp': 1619124024921, 'position': {'x': 1450, 'y': 428}}, {'timestamp': 1619124025021, 'position': {'x': 1447, 'y': 424}}, {'timestamp': 1619124025120, 'position': {'x': 1441, 'y': 419}}, {'timestamp': 1619124050222, 'position': {'x': 1431, 'y': 411}}, {'timestamp': 1619124050322, 'position': {'x': 1393, 'y': 486}}, {'timestamp': 1619124050421, 'position': {'x': 1388, 'y': 488}}, {'timestamp': 1619124050521, 'position': {'x': 1359, 'y': 495}}, {'timestamp': 1619124050620, 'position': {'x': 1166, 'y': 408}}, {'timestamp': 1619124050721, 'position': {'x': 905, 'y': 288}}, {'timestamp': 1619124050821, 'position': {'x': 886, 'y': 295}}, {'timestamp': 1619124050921, 'position': {'x': 820, 'y': 296}}, {'timestamp': 1619124051021, 'position': {'x': 685, 'y': 259}}, {'timestamp': 1619124051121, 'position': {'x': 664, 'y': 247}}, {'timestamp': 1619124051220, 'position': {'x': 647, 'y': 216}}, {'timestamp': 1619124051320, 'position': {'x': 625, 'y': 205}}, {'timestamp': 1619124051420, 'position': {'x': 600, 'y': 198}}, {'timestamp': 1619124051521, 'position': {'x': 594, 'y': 197}}, {'timestamp': 1619124052120, 'position': {'x': 699, 'y': 214}}, {'timestamp': 1619124052220, 'position': {'x': 718, 'y': 218}}, {'timestamp': 1619124076420, 'position': {'x': 718, 'y': 219}}, {'timestamp': 1619124076520, 'position': {'x': 647, 'y': 459}}, {'timestamp': 1619124076620, 'position': {'x': 628, 'y': 571}}, {'timestamp': 1619124076721, 'position': {'x': 631, 'y': 588}}, {'timestamp': 1619124076821, 'position': {'x': 639, 'y': 617}}, {'timestamp': 1619124076921, 'position': {'x': 649, 'y': 710}}, {'timestamp': 1619124077021, 'position': {'x': 647, 'y': 762}}, {'timestamp': 1619124077121, 'position': {'x': 644, 'y': 759}}, {'timestamp': 1619124077220, 'position': {'x': 638, 'y': 756}}, {'timestamp': 1619124077321, 'position': {'x': 629, 'y': 742}}], 'task_id': 'python:task:12'}	4
11	20:43:29.291439	{'jsonrpc': '2.0', 'method': '/program/PPP/6', 'params': ['\\ndef regresa_lista():\\n    return ["Tom", 2.23, 12]\\n'], 'id': 8, 'keypresses': [{'timestamp': 1619124171773, 'keycode': 91, 'type': 'keydown'}, {'timestamp': 1619124172452, 'keycode': 67, 'type': 'keyup'}, {'timestamp': 1619124172486, 'keycode': 91, 'type': 'keyup'}, {'timestamp': 1619124174504, 'keycode': 91, 'type': 'keydown'}, {'timestamp': 1619124177916, 'keycode': 17, 'type': 'keydown'}, {'timestamp': 1619124178301, 'keycode': 17, 'type': 'keyup'}, {'timestamp': 1619124179166, 'keycode': 17, 'type': 'keydown'}, {'timestamp': 1619124179250, 'keycode': 86, 'type': 'keydown'}, {'timestamp': 1619124179425, 'keycode': 86, 'type': 'keyup'}, {'timestamp': 1619124179552, 'keycode': 17, 'type': 'keyup'}, {'timestamp': 1619124185278, 'keycode': 17, 'type': 'keydown'}, {'timestamp': 1619124185777, 'keycode': 17, 'type': 'keydown'}, {'timestamp': 1619124185811, 'keycode': 17, 'type': 'keydown'}, {'timestamp': 1619124185843, 'keycode': 17, 'type': 'keydown'}, {'timestamp': 1619124185877, 'keycode': 17, 'type': 'keydown'}, {'timestamp': 1619124185910, 'keycode': 17, 'type': 'keydown'}, {'timestamp': 1619124185940, 'keycode': 17, 'type': 'keyup'}, {'timestamp': 1619124186163, 'keycode': 91, 'type': 'keydown'}, {'timestamp': 1619124186581, 'keycode': 67, 'type': 'keyup'}, {'timestamp': 1619124186608, 'keycode': 91, 'type': 'keyup'}, {'timestamp': 1619124188684, 'keycode': 91, 'type': 'keydown'}, {'timestamp': 1619124195837, 'keycode': 16, 'type': 'keydown'}, {'timestamp': 1619124196024, 'keycode': 37, 'type': 'keydown'}, {'timestamp': 1619124196110, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1619124196371, 'keycode': 37, 'type': 'keydown'}, {'timestamp': 1619124196454, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1619124196910, 'keycode': 16, 'type': 'keyup'}, {'timestamp': 1619124198474, 'keycode': 91, 'type': 'keydown'}, {'timestamp': 1619124198858, 'keycode': 91, 'type': 'keyup'}, {'timestamp': 1619124203039, 'keycode': 17, 'type': 'keydown'}, {'timestamp': 1619124203465, 'keycode': 67, 'type': 'keydown'}, {'timestamp': 1619124203628, 'keycode': 67, 'type': 'keyup'}, {'timestamp': 1619124203662, 'keycode': 17, 'type': 'keyup'}, {'timestamp': 1619124205678, 'keycode': 17, 'type': 'keydown'}, {'timestamp': 1619124205800, 'keycode': 17, 'type': 'keyup'}, {'timestamp': 1619124206307, 'keycode': 17, 'type': 'keydown'}, {'timestamp': 1619124206426, 'keycode': 86, 'type': 'keydown'}, {'timestamp': 1619124206620, 'keycode': 86, 'type': 'keyup'}, {'timestamp': 1619124206667, 'keycode': 17, 'type': 'keyup'}], 'mousepresses': [{'timestamp': 1619124169910, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619124170580, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619124173517, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619124173634, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619124173741, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619124173837, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619124176704, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619124176826, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619124178816, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619124178952, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619124179004, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619124179127, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619124181477, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619124182273, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619124182848, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619124182978, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619124183463, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619124184812, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619124187292, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619124187408, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619124187860, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619124188628, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619124193829, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619124194533, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619124200122, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619124200221, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619124201082, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619124202768, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619124204251, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619124204372, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619124204859, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619124206331, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619124206977, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619124207147, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619124208666, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619124208809, 'mousecode': 1, 'type': 'mouseup'}], 'mousemovement': [{'timestamp': 1619124146145, 'position': []}, {'timestamp': 1619124149246, 'position': {'x': 1432, 'y': 387}}, {'timestamp': 1619124149346, 'position': {'x': 1293, 'y': 231}}, {'timestamp': 1619124149445, 'position': {'x': 1274, 'y': 199}}, {'timestamp': 1619124149546, 'position': {'x': 1258, 'y': 196}}, {'timestamp': 1619124149645, 'position': {'x': 1247, 'y': 207}}, {'timestamp': 1619124149745, 'position': {'x': 1252, 'y': 220}}, {'timestamp': 1619124149846, 'position': {'x': 1278, 'y': 214}}, {'timestamp': 1619124149946, 'position': {'x': 1322, 'y': 212}}, {'timestamp': 1619124151545, 'position': {'x': 1320, 'y': 209}}, {'timestamp': 1619124158946, 'position': {'x': 1320, 'y': 200}}, {'timestamp': 1619124159046, 'position': {'x': 1307, 'y': 173}}, {'timestamp': 1619124159146, 'position': {'x': 1295, 'y': 135}}, {'timestamp': 1619124159247, 'position': {'x': 1291, 'y': 118}}, {'timestamp': 1619124159846, 'position': {'x': 1291, 'y': 120}}, {'timestamp': 1619124159945, 'position': {'x': 1286, 'y': 126}}, {'timestamp': 1619124160045, 'position': {'x': 1280, 'y': 133}}, {'timestamp': 1619124160145, 'position': {'x': 1279, 'y': 134}}, {'timestamp': 1619124160446, 'position': {'x': 1279, 'y': 137}}, {'timestamp': 1619124160546, 'position': {'x': 1280, 'y': 142}}, {'timestamp': 1619124160646, 'position': {'x': 1277, 'y': 148}}, {'timestamp': 1619124162245, 'position': {'x': 1267, 'y': 155}}, {'timestamp': 1619124162545, 'position': {'x': 1267, 'y': 156}}, {'timestamp': 1619124162645, 'position': {'x': 1264, 'y': 165}}, {'timestamp': 1619124162746, 'position': {'x': 1264, 'y': 166}}, {'timestamp': 1619124162946, 'position': {'x': 1263, 'y': 169}}, {'timestamp': 1619124163046, 'position': {'x': 1257, 'y': 179}}, {'timestamp': 1619124163845, 'position': {'x': 1255, 'y': 179}}, {'timestamp': 1619124163946, 'position': {'x': 1252, 'y': 177}}, {'timestamp': 1619124164146, 'position': {'x': 1170, 'y': 290}}, {'timestamp': 1619124164246, 'position': {'x': 882, 'y': 743}}, {'timestamp': 1619124164345, 'position': {'x': 855, 'y': 785}}, {'timestamp': 1619124164446, 'position': {'x': 813, 'y': 732}}, {'timestamp': 1619124164546, 'position': {'x': 782, 'y': 614}}, {'timestamp': 1619124164646, 'position': {'x': 718, 'y': 331}}, {'timestamp': 1619124164745, 'position': {'x': 678, 'y': 242}}, {'timestamp': 1619124164845, 'position': {'x': 650, 'y': 260}}, {'timestamp': 1619124164946, 'position': {'x': 551, 'y': 249}}, {'timestamp': 1619124165046, 'position': {'x': 377, 'y': 204}}, {'timestamp': 1619124165146, 'position': {'x': 385, 'y': 205}}, {'timestamp': 1619124165346, 'position': {'x': 373, 'y': 202}}, {'timestamp': 1619124165447, 'position': {'x': 311, 'y': 195}}, {'timestamp': 1619124165546, 'position': {'x': 230, 'y': 169}}, {'timestamp': 1619124165646, 'position': {'x': 180, 'y': 155}}, {'timestamp': 1619124165746, 'position': {'x': 146, 'y': 154}}, {'timestamp': 1619124165846, 'position': {'x': 142, 'y': 155}}, {'timestamp': 1619124165946, 'position': {'x': 114, 'y': 175}}, {'timestamp': 1619124166046, 'position': {'x': 117, 'y': 180}}, {'timestamp': 1619124166146, 'position': {'x': 154, 'y': 185}}, {'timestamp': 1619124166246, 'position': {'x': 248, 'y': 176}}, {'timestamp': 1619124166346, 'position': {'x': 364, 'y': 164}}, {'timestamp': 1619124166446, 'position': {'x': 456, 'y': 165}}, {'timestamp': 1619124166546, 'position': {'x': 521, 'y': 185}}, {'timestamp': 1619124166645, 'position': {'x': 513, 'y': 185}}, {'timestamp': 1619124166746, 'position': {'x': 516, 'y': 186}}, {'timestamp': 1619124166845, 'position': {'x': 534, 'y': 194}}, {'timestamp': 1619124166946, 'position': {'x': 589, 'y': 204}}, {'timestamp': 1619124167046, 'position': {'x': 633, 'y': 208}}, {'timestamp': 1619124167145, 'position': {'x': 632, 'y': 208}}, {'timestamp': 1619124167246, 'position': {'x': 625, 'y': 206}}, {'timestamp': 1619124167346, 'position': {'x': 625, 'y': 205}}, {'timestamp': 1619124168047, 'position': {'x': 621, 'y': 204}}, {'timestamp': 1619124168146, 'position': {'x': 602, 'y': 196}}, {'timestamp': 1619124168346, 'position': {'x': 601, 'y': 196}}, {'timestamp': 1619124168445, 'position': {'x': 609, 'y': 203}}, {'timestamp': 1619124168546, 'position': {'x': 628, 'y': 204}}, {'timestamp': 1619124168645, 'position': {'x': 651, 'y': 209}}, {'timestamp': 1619124168746, 'position': {'x': 629, 'y': 209}}, {'timestamp': 1619124168846, 'position': {'x': 518, 'y': 209}}, {'timestamp': 1619124168946, 'position': {'x': 365, 'y': 203}}, {'timestamp': 1619124169047, 'position': {'x': 245, 'y': 198}}, {'timestamp': 1619124169146, 'position': {'x': 194, 'y': 192}}, {'timestamp': 1619124169246, 'position': {'x': 152, 'y': 186}}, {'timestamp': 1619124169347, 'position': {'x': 151, 'y': 183}}, {'timestamp': 1619124169446, 'position': {'x': 152, 'y': 173}}, {'timestamp': 1619124169546, 'position': {'x': 152, 'y': 172}}, {'timestamp': 1619124169647, 'position': {'x': 154, 'y': 172}}, {'timestamp': 1619124169746, 'position': {'x': 155, 'y': 172}}, {'timestamp': 1619124169846, 'position': {'x': 158, 'y': 173}}, {'timestamp': 1619124170046, 'position': {'x': 159, 'y': 173}}, {'timestamp': 1619124170147, 'position': {'x': 222, 'y': 175}}, {'timestamp': 1619124170246, 'position': {'x': 347, 'y': 181}}, {'timestamp': 1619124170346, 'position': {'x': 380, 'y': 185}}, {'timestamp': 1619124172546, 'position': {'x': 359, 'y': 184}}, {'timestamp': 1619124172645, 'position': {'x': 355, 'y': 188}}, {'timestamp': 1619124172745, 'position': {'x': 420, 'y': 203}}, {'timestamp': 1619124172845, 'position': {'x': 605, 'y': 214}}, {'timestamp': 1619124172945, 'position': {'x': 619, 'y': 212}}, {'timestamp': 1619124173045, 'position': {'x': 619, 'y': 211}}, {'timestamp': 1619124173145, 'position': {'x': 656, 'y': 211}}, {'timestamp': 1619124173246, 'position': {'x': 658, 'y': 211}}, {'timestamp': 1619124173346, 'position': {'x': 658, 'y': 207}}, {'timestamp': 1619124173445, 'position': {'x': 656, 'y': 205}}, {'timestamp': 1619124173946, 'position': {'x': 766, 'y': 223}}, {'timestamp': 1619124174046, 'position': {'x': 823, 'y': 235}}, {'timestamp': 1619124174847, 'position': {'x': 822, 'y': 235}}, {'timestamp': 1619124176046, 'position': {'x': 661, 'y': 205}}, {'timestamp': 1619124176145, 'position': {'x': 656, 'y': 205}}, {'timestamp': 1619124176245, 'position': {'x': 647, 'y': 203}}, {'timestamp': 1619124176346, 'position': {'x': 648, 'y': 203}}, {'timestamp': 1619124176446, 'position': {'x': 677, 'y': 238}}, {'timestamp': 1619124176546, 'position': {'x': 663, 'y': 243}}, {'timestamp': 1619124176745, 'position': {'x': 664, 'y': 243}}, {'timestamp': 1619124176946, 'position': {'x': 654, 'y': 222}}, {'timestamp': 1619124177046, 'position': {'x': 651, 'y': 215}}, {'timestamp': 1619124178146, 'position': {'x': 650, 'y': 214}}, {'timestamp': 1619124178247, 'position': {'x': 642, 'y': 208}}, {'timestamp': 1619124178347, 'position': {'x': 642, 'y': 207}}, {'timestamp': 1619124178546, 'position': {'x': 641, 'y': 207}}, {'timestamp': 1619124178646, 'position': {'x': 651, 'y': 199}}, {'timestamp': 1619124178745, 'position': {'x': 651, 'y': 198}}, {'timestamp': 1619124179245, 'position': {'x': 666, 'y': 201}}, {'timestamp': 1619124179346, 'position': {'x': 713, 'y': 213}}, {'timestamp': 1619124179446, 'position': {'x': 712, 'y': 217}}, {'timestamp': 1619124179546, 'position': {'x': 702, 'y': 232}}, {'timestamp': 1619124179645, 'position': {'x': 692, 'y': 249}}, {'timestamp': 1619124179745, 'position': {'x': 691, 'y': 249}}, {'timestamp': 1619124179846, 'position': {'x': 656, 'y': 222}}, {'timestamp': 1619124179946, 'position': {'x': 628, 'y': 203}}, {'timestamp': 1619124180046, 'position': {'x': 627, 'y': 202}}, {'timestamp': 1619124180145, 'position': {'x': 602, 'y': 198}}, {'timestamp': 1619124180246, 'position': {'x': 255, 'y': 179}}, {'timestamp': 1619124180345, 'position': {'x': 204, 'y': 179}}, {'timestamp': 1619124180446, 'position': {'x': 175, 'y': 186}}, {'timestamp': 1619124180547, 'position': {'x': 135, 'y': 180}}, {'timestamp': 1619124180746, 'position': {'x': 141, 'y': 175}}, {'timestamp': 1619124180846, 'position': {'x': 147, 'y': 173}}, {'timestamp': 1619124180947, 'position': {'x': 148, 'y': 173}}, {'timestamp': 1619124181046, 'position': {'x': 152, 'y': 175}}, {'timestamp': 1619124181146, 'position': {'x': 155, 'y': 177}}, {'timestamp': 1619124181346, 'position': {'x': 158, 'y': 177}}, {'timestamp': 1619124181447, 'position': {'x': 159, 'y': 178}}, {'timestamp': 1619124181746, 'position': {'x': 191, 'y': 176}}, {'timestamp': 1619124181847, 'position': {'x': 271, 'y': 180}}, {'timestamp': 1619124181947, 'position': {'x': 350, 'y': 186}}, {'timestamp': 1619124182046, 'position': {'x': 356, 'y': 188}}, {'timestamp': 1619124182446, 'position': {'x': 355, 'y': 189}}, {'timestamp': 1619124182546, 'position': {'x': 303, 'y': 186}}, {'timestamp': 1619124182647, 'position': {'x': 291, 'y': 179}}, {'timestamp': 1619124182746, 'position': {'x': 285, 'y': 177}}, {'timestamp': 1619124182846, 'position': {'x': 276, 'y': 177}}, {'timestamp': 1619124183045, 'position': {'x': 278, 'y': 182}}, {'timestamp': 1619124183146, 'position': {'x': 282, 'y': 187}}, {'timestamp': 1619124183246, 'position': {'x': 279, 'y': 176}}, {'timestamp': 1619124183346, 'position': {'x': 279, 'y': 173}}, {'timestamp': 1619124183546, 'position': {'x': 277, 'y': 173}}, {'timestamp': 1619124183646, 'position': {'x': 256, 'y': 176}}, {'timestamp': 1619124183746, 'position': {'x': 188, 'y': 175}}, {'timestamp': 1619124183845, 'position': {'x': 172, 'y': 175}}, {'timestamp': 1619124183945, 'position': {'x': 152, 'y': 177}}, {'timestamp': 1619124184045, 'position': {'x': 147, 'y': 177}}, {'timestamp': 1619124184146, 'position': {'x': 145, 'y': 178}}, {'timestamp': 1619124184245, 'position': {'x': 144, 'y': 178}}, {'timestamp': 1619124184346, 'position': {'x': 153, 'y': 179}}, {'timestamp': 1619124184446, 'position': {'x': 158, 'y': 180}}, {'timestamp': 1619124186745, 'position': {'x': 287, 'y': 180}}, {'timestamp': 1619124186845, 'position': {'x': 480, 'y': 179}}, {'timestamp': 1619124186945, 'position': {'x': 494, 'y': 177}}, {'timestamp': 1619124187045, 'position': {'x': 586, 'y': 191}}, {'timestamp': 1619124187146, 'position': {'x': 716, 'y': 223}}, {'timestamp': 1619124187246, 'position': {'x': 679, 'y': 223}}, {'timestamp': 1619124187345, 'position': {'x': 676, 'y': 225}}, {'timestamp': 1619124187446, 'position': {'x': 668, 'y': 219}}, {'timestamp': 1619124187547, 'position': {'x': 635, 'y': 202}}, {'timestamp': 1619124188047, 'position': {'x': 676, 'y': 200}}, {'timestamp': 1619124188146, 'position': {'x': 711, 'y': 200}}, {'timestamp': 1619124188245, 'position': {'x': 747, 'y': 202}}, {'timestamp': 1619124188346, 'position': {'x': 757, 'y': 202}}, {'timestamp': 1619124192645, 'position': {'x': 681, 'y': 209}}, {'timestamp': 1619124192746, 'position': {'x': 680, 'y': 209}}, {'timestamp': 1619124192846, 'position': {'x': 598, 'y': 197}}, {'timestamp': 1619124192945, 'position': {'x': 584, 'y': 194}}, {'timestamp': 1619124193046, 'position': {'x': 428, 'y': 181}}, {'timestamp': 1619124193145, 'position': {'x': 305, 'y': 175}}, {'timestamp': 1619124193246, 'position': {'x': 260, 'y': 177}}, {'timestamp': 1619124193346, 'position': {'x': 204, 'y': 174}}, {'timestamp': 1619124193445, 'position': {'x': 164, 'y': 171}}, {'timestamp': 1619124193545, 'position': {'x': 161, 'y': 172}}, {'timestamp': 1619124193645, 'position': {'x': 158, 'y': 174}}, {'timestamp': 1619124193945, 'position': {'x': 159, 'y': 175}}, {'timestamp': 1619124194046, 'position': {'x': 205, 'y': 175}}, {'timestamp': 1619124194146, 'position': {'x': 281, 'y': 179}}, {'timestamp': 1619124194246, 'position': {'x': 317, 'y': 180}}, {'timestamp': 1619124194345, 'position': {'x': 331, 'y': 182}}, {'timestamp': 1619124194746, 'position': {'x': 330, 'y': 183}}, {'timestamp': 1619124194846, 'position': {'x': 331, 'y': 185}}, {'timestamp': 1619124194946, 'position': {'x': 381, 'y': 184}}, {'timestamp': 1619124198346, 'position': {'x': 382, 'y': 132}}, {'timestamp': 1619124199545, 'position': {'x': 377, 'y': 126}}, {'timestamp': 1619124199645, 'position': {'x': 357, 'y': 98}}, {'timestamp': 1619124199745, 'position': {'x': 352, 'y': 95}}, {'timestamp': 1619124199845, 'position': {'x': 329, 'y': 120}}, {'timestamp': 1619124199946, 'position': {'x': 309, 'y': 188}}, {'timestamp': 1619124200045, 'position': {'x': 309, 'y': 189}}, {'timestamp': 1619124200345, 'position': {'x': 301, 'y': 185}}, {'timestamp': 1619124200445, 'position': {'x': 282, 'y': 185}}, {'timestamp': 1619124200546, 'position': {'x': 231, 'y': 181}}, {'timestamp': 1619124200646, 'position': {'x': 176, 'y': 178}}, {'timestamp': 1619124200746, 'position': {'x': 154, 'y': 176}}, {'timestamp': 1619124200846, 'position': {'x': 159, 'y': 176}}, {'timestamp': 1619124200946, 'position': {'x': 160, 'y': 176}}, {'timestamp': 1619124201146, 'position': {'x': 164, 'y': 176}}, {'timestamp': 1619124201245, 'position': {'x': 176, 'y': 176}}, {'timestamp': 1619124201345, 'position': {'x': 215, 'y': 179}}, {'timestamp': 1619124201445, 'position': {'x': 224, 'y': 180}}, {'timestamp': 1619124201545, 'position': {'x': 260, 'y': 182}}, {'timestamp': 1619124201645, 'position': {'x': 265, 'y': 182}}, {'timestamp': 1619124201745, 'position': {'x': 271, 'y': 182}}, {'timestamp': 1619124201845, 'position': {'x': 276, 'y': 182}}, {'timestamp': 1619124201945, 'position': {'x': 278, 'y': 181}}, {'timestamp': 1619124202246, 'position': {'x': 277, 'y': 181}}, {'timestamp': 1619124202346, 'position': {'x': 273, 'y': 181}}, {'timestamp': 1619124203645, 'position': {'x': 382, 'y': 179}}, {'timestamp': 1619124203745, 'position': {'x': 473, 'y': 181}}, {'timestamp': 1619124203845, 'position': {'x': 548, 'y': 189}}, {'timestamp': 1619124203945, 'position': {'x': 655, 'y': 197}}, {'timestamp': 1619124204146, 'position': {'x': 653, 'y': 222}}, {'timestamp': 1619124204245, 'position': {'x': 652, 'y': 230}}, {'timestamp': 1619124204445, 'position': {'x': 641, 'y': 215}}, {'timestamp': 1619124204546, 'position': {'x': 635, 'y': 208}}, {'timestamp': 1619124204645, 'position': {'x': 635, 'y': 207}}, {'timestamp': 1619124204745, 'position': {'x': 634, 'y': 207}}, {'timestamp': 1619124204846, 'position': {'x': 636, 'y': 204}}, {'timestamp': 1619124204945, 'position': {'x': 637, 'y': 204}}, {'timestamp': 1619124205046, 'position': {'x': 656, 'y': 204}}, {'timestamp': 1619124205145, 'position': {'x': 711, 'y': 205}}, {'timestamp': 1619124205246, 'position': {'x': 762, 'y': 208}}, {'timestamp': 1619124205346, 'position': {'x': 765, 'y': 208}}, {'timestamp': 1619124205846, 'position': {'x': 741, 'y': 204}}, {'timestamp': 1619124205945, 'position': {'x': 729, 'y': 202}}, {'timestamp': 1619124206045, 'position': {'x': 724, 'y': 202}}, {'timestamp': 1619124206146, 'position': {'x': 723, 'y': 202}}, {'timestamp': 1619124206446, 'position': {'x': 729, 'y': 208}}, {'timestamp': 1619124206545, 'position': {'x': 736, 'y': 224}}, {'timestamp': 1619124206646, 'position': {'x': 734, 'y': 235}}, {'timestamp': 1619124206745, 'position': {'x': 724, 'y': 243}}, {'timestamp': 1619124206846, 'position': {'x': 705, 'y': 251}}, {'timestamp': 1619124207246, 'position': {'x': 698, 'y': 341}}, {'timestamp': 1619124207345, 'position': {'x': 760, 'y': 464}}, {'timestamp': 1619124207445, 'position': {'x': 777, 'y': 454}}, {'timestamp': 1619124207546, 'position': {'x': 773, 'y': 426}}, {'timestamp': 1619124207647, 'position': {'x': 805, 'y': 420}}, {'timestamp': 1619124207747, 'position': {'x': 882, 'y': 464}}, {'timestamp': 1619124207846, 'position': {'x': 811, 'y': 520}}, {'timestamp': 1619124207946, 'position': {'x': 681, 'y': 737}}, {'timestamp': 1619124208046, 'position': {'x': 682, 'y': 773}}, {'timestamp': 1619124208145, 'position': {'x': 660, 'y': 767}}, {'timestamp': 1619124208245, 'position': {'x': 639, 'y': 751}}, {'timestamp': 1619124208346, 'position': {'x': 638, 'y': 750}}, {'timestamp': 1619124208447, 'position': {'x': 638, 'y': 749}}], 'task_id': 'python:task:13'}	5
12	06:35:54.650592	{'jsonrpc': '2.0', 'method': '/program/PPP/12', 'params': ['\\n# Funcion que ordena una lista, puedes utilizar sort()\\ndef solution(lista):\\n    if lista is not None:\\n        lista.sort()\\n    return lista\\n'], 'id': 7, 'keypresses': [{'timestamp': 1619159673347, 'keycode': 73, 'type': 'keydown'}, {'timestamp': 1619159673460, 'keycode': 73, 'type': 'keyup'}, {'timestamp': 1619159674162, 'keycode': 70, 'type': 'keydown'}, {'timestamp': 1619159674286, 'keycode': 70, 'type': 'keyup'}, {'timestamp': 1619159674385, 'keycode': 32, 'type': 'keydown'}, {'timestamp': 1619159674519, 'keycode': 32, 'type': 'keyup'}, {'timestamp': 1619159675472, 'keycode': 76, 'type': 'keydown'}, {'timestamp': 1619159675586, 'keycode': 76, 'type': 'keyup'}, {'timestamp': 1619159675745, 'keycode': 73, 'type': 'keydown'}, {'timestamp': 1619159675821, 'keycode': 73, 'type': 'keyup'}, {'timestamp': 1619159676520, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619159676714, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619159678701, 'keycode': 76, 'type': 'keydown'}, {'timestamp': 1619159678823, 'keycode': 76, 'type': 'keyup'}, {'timestamp': 1619159678981, 'keycode': 73, 'type': 'keydown'}, {'timestamp': 1619159679051, 'keycode': 73, 'type': 'keyup'}, {'timestamp': 1619159679122, 'keycode': 83, 'type': 'keydown'}, {'timestamp': 1619159679224, 'keycode': 83, 'type': 'keyup'}, {'timestamp': 1619159679922, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1619159680116, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1619159680120, 'keycode': 69, 'type': 'keydown'}, {'timestamp': 1619159680264, 'keycode': 69, 'type': 'keyup'}, {'timestamp': 1619159680389, 'keycode': 32, 'type': 'keydown'}, {'timestamp': 1619159680494, 'keycode': 32, 'type': 'keyup'}, {'timestamp': 1619159681343, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619159681510, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619159681688, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619159681863, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619159682050, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619159682252, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619159689481, 'keycode': 76, 'type': 'keydown'}, {'timestamp': 1619159689589, 'keycode': 76, 'type': 'keyup'}, {'timestamp': 1619159689764, 'keycode': 73, 'type': 'keydown'}, {'timestamp': 1619159689852, 'keycode': 73, 'type': 'keyup'}, {'timestamp': 1619159689959, 'keycode': 83, 'type': 'keydown'}, {'timestamp': 1619159690104, 'keycode': 83, 'type': 'keyup'}, {'timestamp': 1619159690709, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1619159690826, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1619159690966, 'keycode': 65, 'type': 'keydown'}, {'timestamp': 1619159691135, 'keycode': 65, 'type': 'keyup'}, {'timestamp': 1619159691217, 'keycode': 32, 'type': 'keydown'}, {'timestamp': 1619159691254, 'keycode': 32, 'type': 'keyup'}, {'timestamp': 1619159692178, 'keycode': 73, 'type': 'keydown'}, {'timestamp': 1619159692271, 'keycode': 73, 'type': 'keyup'}, {'timestamp': 1619159692482, 'keycode': 83, 'type': 'keydown'}, {'timestamp': 1619159692575, 'keycode': 83, 'type': 'keyup'}, {'timestamp': 1619159692619, 'keycode': 32, 'type': 'keydown'}, {'timestamp': 1619159692737, 'keycode': 32, 'type': 'keyup'}, {'timestamp': 1619159692905, 'keycode': 78, 'type': 'keydown'}, {'timestamp': 1619159692979, 'keycode': 78, 'type': 'keyup'}, {'timestamp': 1619159693451, 'keycode': 79, 'type': 'keydown'}, {'timestamp': 1619159693539, 'keycode': 79, 'type': 'keyup'}, {'timestamp': 1619159693734, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1619159693861, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1619159693864, 'keycode': 32, 'type': 'keydown'}, {'timestamp': 1619159693969, 'keycode': 32, 'type': 'keyup'}, {'timestamp': 1619159694108, 'keycode': 16, 'type': 'keydown'}, {'timestamp': 1619159694279, 'keycode': 78, 'type': 'keydown'}, {'timestamp': 1619159694366, 'keycode': 78, 'type': 'keyup'}, {'timestamp': 1619159694518, 'keycode': 16, 'type': 'keyup'}, {'timestamp': 1619159694745, 'keycode': 79, 'type': 'keydown'}, {'timestamp': 1619159694858, 'keycode': 79, 'type': 'keyup'}, {'timestamp': 1619159696156, 'keycode': 78, 'type': 'keydown'}, {'timestamp': 1619159696242, 'keycode': 78, 'type': 'keyup'}, {'timestamp': 1619159696378, 'keycode': 69, 'type': 'keydown'}, {'timestamp': 1619159696518, 'keycode': 69, 'type': 'keyup'}, {'timestamp': 1619159697234, 'keycode': 16, 'type': 'keydown'}, {'timestamp': 1619159698339, 'keycode': 186, 'type': 'keydown'}, {'timestamp': 1619159698415, 'keycode': 186, 'type': 'keyup'}, {'timestamp': 1619159698527, 'keycode': 16, 'type': 'keyup'}, {'timestamp': 1619159698974, 'keycode': 13, 'type': 'keydown'}, {'timestamp': 1619159699080, 'keycode': 13, 'type': 'keyup'}, {'timestamp': 1619159701169, 'keycode': 76, 'type': 'keydown'}, {'timestamp': 1619159701265, 'keycode': 76, 'type': 'keyup'}, {'timestamp': 1619159701416, 'keycode': 73, 'type': 'keydown'}, {'timestamp': 1619159701481, 'keycode': 73, 'type': 'keyup'}, {'timestamp': 1619159701582, 'keycode': 83, 'type': 'keydown'}, {'timestamp': 1619159701708, 'keycode': 83, 'type': 'keyup'}, {'timestamp': 1619159701858, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1619159701930, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1619159702071, 'keycode': 65, 'type': 'keydown'}, {'timestamp': 1619159702147, 'keycode': 65, 'type': 'keyup'}, {'timestamp': 1619159703359, 'keycode': 188, 'type': 'keydown'}, {'timestamp': 1619159703438, 'keycode': 188, 'type': 'keyup'}, {'timestamp': 1619159704671, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619159705449, 'keycode': 190, 'type': 'keydown'}, {'timestamp': 1619159705543, 'keycode': 190, 'type': 'keyup'}, {'timestamp': 1619159705915, 'keycode': 83, 'type': 'keydown'}, {'timestamp': 1619159706099, 'keycode': 83, 'type': 'keyup'}, {'timestamp': 1619159706321, 'keycode': 79, 'type': 'keydown'}, {'timestamp': 1619159706423, 'keycode': 79, 'type': 'keyup'}, {'timestamp': 1619159706991, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1619159707175, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1619159707192, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1619159707291, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1619159707604, 'keycode': 16, 'type': 'keydown'}, {'timestamp': 1619159708047, 'keycode': 57, 'type': 'keydown'}, {'timestamp': 1619159708142, 'keycode': 48, 'type': 'keydown'}, {'timestamp': 1619159708199, 'keycode': 57, 'type': 'keyup'}, {'timestamp': 1619159708238, 'keycode': 48, 'type': 'keyup'}, {'timestamp': 1619159708265, 'keycode': 16, 'type': 'keyup'}, {'timestamp': 1619159709057, 'keycode': 13, 'type': 'keydown'}, {'timestamp': 1619159709191, 'keycode': 13, 'type': 'keyup'}, {'timestamp': 1619159709989, 'keycode': 38, 'type': 'keyup'}, {'timestamp': 1619159712001, 'keycode': 40, 'type': 'keyup'}, {'timestamp': 1619159712292, 'keycode': 38, 'type': 'keyup'}, {'timestamp': 1619159712998, 'keycode': 40, 'type': 'keyup'}, {'timestamp': 1619159717026, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1619159717187, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1619159717216, 'keycode': 69, 'type': 'keydown'}, {'timestamp': 1619159717334, 'keycode': 69, 'type': 'keyup'}, {'timestamp': 1619159717492, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1619159717641, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1619159717837, 'keycode': 85, 'type': 'keydown'}, {'timestamp': 1619159717936, 'keycode': 85, 'type': 'keyup'}, {'timestamp': 1619159717995, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1619159718076, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1619159718137, 'keycode': 78, 'type': 'keydown'}, {'timestamp': 1619159718211, 'keycode': 78, 'type': 'keyup'}, {'timestamp': 1619159718427, 'keycode': 32, 'type': 'keydown'}, {'timestamp': 1619159718532, 'keycode': 32, 'type': 'keyup'}, {'timestamp': 1619159719330, 'keycode': 76, 'type': 'keydown'}, {'timestamp': 1619159719422, 'keycode': 76, 'type': 'keyup'}, {'timestamp': 1619159719612, 'keycode': 73, 'type': 'keydown'}, {'timestamp': 1619159719690, 'keycode': 73, 'type': 'keyup'}, {'timestamp': 1619159719718, 'keycode': 83, 'type': 'keydown'}, {'timestamp': 1619159719822, 'keycode': 83, 'type': 'keyup'}, {'timestamp': 1619159720016, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1619159720136, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1619159720272, 'keycode': 65, 'type': 'keydown'}, {'timestamp': 1619159720407, 'keycode': 65, 'type': 'keyup'}, {'timestamp': 1619159721660, 'keycode': 13, 'type': 'keydown'}, {'timestamp': 1619159721816, 'keycode': 13, 'type': 'keyup'}, {'timestamp': 1619159722270, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619159723024, 'keycode': 69, 'type': 'keydown'}, {'timestamp': 1619159723132, 'keycode': 69, 'type': 'keyup'}, {'timestamp': 1619159723273, 'keycode': 76, 'type': 'keydown'}, {'timestamp': 1619159723352, 'keycode': 76, 'type': 'keyup'}, {'timestamp': 1619159723372, 'keycode': 83, 'type': 'keydown'}, {'timestamp': 1619159723462, 'keycode': 83, 'type': 'keyup'}, {'timestamp': 1619159723592, 'keycode': 69, 'type': 'keydown'}, {'timestamp': 1619159723660, 'keycode': 69, 'type': 'keyup'}, {'timestamp': 1619159724036, 'keycode': 16, 'type': 'keydown'}, {'timestamp': 1619159725220, 'keycode': 186, 'type': 'keydown'}, {'timestamp': 1619159725282, 'keycode': 186, 'type': 'keyup'}, {'timestamp': 1619159725455, 'keycode': 16, 'type': 'keyup'}, {'timestamp': 1619159725737, 'keycode': 13, 'type': 'keydown'}, {'timestamp': 1619159725860, 'keycode': 13, 'type': 'keyup'}, {'timestamp': 1619159726689, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1619159726833, 'keycode': 69, 'type': 'keydown'}, {'timestamp': 1619159726837, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1619159726942, 'keycode': 69, 'type': 'keyup'}, {'timestamp': 1619159727073, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1619159727214, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1619159727426, 'keycode': 85, 'type': 'keydown'}, {'timestamp': 1619159727521, 'keycode': 85, 'type': 'keyup'}, {'timestamp': 1619159727707, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1619159727818, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1619159727874, 'keycode': 78, 'type': 'keydown'}, {'timestamp': 1619159727949, 'keycode': 78, 'type': 'keyup'}, {'timestamp': 1619159728182, 'keycode': 32, 'type': 'keydown'}, {'timestamp': 1619159728243, 'keycode': 32, 'type': 'keyup'}, {'timestamp': 1619159738792, 'keycode': 16, 'type': 'keydown'}, {'timestamp': 1619159739190, 'keycode': 38, 'type': 'keyup'}, {'timestamp': 1619159739852, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1619159740051, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1619159740249, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1619159740434, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1619159740661, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1619159741181, 'keycode': 38, 'type': 'keyup'}, {'timestamp': 1619159741438, 'keycode': 16, 'type': 'keyup'}, {'timestamp': 1619159741813, 'keycode': 46, 'type': 'keyup'}, {'timestamp': 1619159743518, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1619159743738, 'keycode': 69, 'type': 'keydown'}, {'timestamp': 1619159743782, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1619159743878, 'keycode': 69, 'type': 'keyup'}, {'timestamp': 1619159744683, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1619159744820, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1619159744957, 'keycode': 85, 'type': 'keydown'}, {'timestamp': 1619159745043, 'keycode': 85, 'type': 'keyup'}, {'timestamp': 1619159745120, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1619159745236, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1619159745380, 'keycode': 78, 'type': 'keydown'}, {'timestamp': 1619159745510, 'keycode': 78, 'type': 'keyup'}, {'timestamp': 1619159745749, 'keycode': 32, 'type': 'keydown'}, {'timestamp': 1619159745825, 'keycode': 32, 'type': 'keyup'}, {'timestamp': 1619159747424, 'keycode': 76, 'type': 'keydown'}, {'timestamp': 1619159747508, 'keycode': 76, 'type': 'keyup'}, {'timestamp': 1619159747682, 'keycode': 73, 'type': 'keydown'}, {'timestamp': 1619159747742, 'keycode': 73, 'type': 'keyup'}, {'timestamp': 1619159747810, 'keycode': 83, 'type': 'keydown'}, {'timestamp': 1619159747907, 'keycode': 83, 'type': 'keyup'}, {'timestamp': 1619159748107, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1619159748219, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1619159748347, 'keycode': 65, 'type': 'keydown'}, {'timestamp': 1619159748441, 'keycode': 65, 'type': 'keyup'}], 'mousepresses': [{'timestamp': 1619159635714, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619159635887, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619159670146, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619159671751, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619159754048, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619159754194, 'mousecode': 1, 'type': 'mouseup'}], 'mousemovement': [{'timestamp': 1619159617802, 'position': []}, {'timestamp': 1619159618402, 'position': {'x': 976, 'y': 387}}, {'timestamp': 1619159618504, 'position': {'x': 981, 'y': 384}}, {'timestamp': 1619159618702, 'position': {'x': 991, 'y': 385}}, {'timestamp': 1619159618801, 'position': {'x': 982, 'y': 376}}, {'timestamp': 1619159618901, 'position': {'x': 564, 'y': 299}}, {'timestamp': 1619159619002, 'position': {'x': 187, 'y': 252}}, {'timestamp': 1619159619202, 'position': {'x': 185, 'y': 249}}, {'timestamp': 1619159619301, 'position': {'x': 189, 'y': 241}}, {'timestamp': 1619159619404, 'position': {'x': 192, 'y': 240}}, {'timestamp': 1619159619602, 'position': {'x': 193, 'y': 238}}, {'timestamp': 1619159619702, 'position': {'x': 221, 'y': 200}}, {'timestamp': 1619159619801, 'position': {'x': 256, 'y': 170}}, {'timestamp': 1619159619906, 'position': {'x': 259, 'y': 172}}, {'timestamp': 1619159620001, 'position': {'x': 281, 'y': 174}}, {'timestamp': 1619159620104, 'position': {'x': 301, 'y': 174}}, {'timestamp': 1619159620501, 'position': {'x': 297, 'y': 169}}, {'timestamp': 1619159620602, 'position': {'x': 292, 'y': 165}}, {'timestamp': 1619159620702, 'position': {'x': 290, 'y': 163}}, {'timestamp': 1619159620804, 'position': {'x': 285, 'y': 161}}, {'timestamp': 1619159621101, 'position': {'x': 299, 'y': 160}}, {'timestamp': 1619159621202, 'position': {'x': 312, 'y': 157}}, {'timestamp': 1619159621301, 'position': {'x': 320, 'y': 155}}, {'timestamp': 1619159621402, 'position': {'x': 336, 'y': 155}}, {'timestamp': 1619159621502, 'position': {'x': 365, 'y': 156}}, {'timestamp': 1619159621601, 'position': {'x': 395, 'y': 154}}, {'timestamp': 1619159621705, 'position': {'x': 397, 'y': 152}}, {'timestamp': 1619159622001, 'position': {'x': 403, 'y': 154}}, {'timestamp': 1619159622101, 'position': {'x': 428, 'y': 159}}, {'timestamp': 1619159622201, 'position': {'x': 460, 'y': 163}}, {'timestamp': 1619159622301, 'position': {'x': 485, 'y': 165}}, {'timestamp': 1619159622401, 'position': {'x': 514, 'y': 166}}, {'timestamp': 1619159622501, 'position': {'x': 528, 'y': 166}}, {'timestamp': 1619159622601, 'position': {'x': 413, 'y': 167}}, {'timestamp': 1619159622701, 'position': {'x': 69, 'y': 189}}, {'timestamp': 1619159622803, 'position': {'x': 35, 'y': 194}}, {'timestamp': 1619159622905, 'position': {'x': 36, 'y': 194}}, {'timestamp': 1619159623001, 'position': {'x': 76, 'y': 181}}, {'timestamp': 1619159623102, 'position': {'x': 99, 'y': 178}}, {'timestamp': 1619159623301, 'position': {'x': 110, 'y': 179}}, {'timestamp': 1619159623402, 'position': {'x': 122, 'y': 180}}, {'timestamp': 1619159623501, 'position': {'x': 127, 'y': 181}}, {'timestamp': 1619159623602, 'position': {'x': 140, 'y': 182}}, {'timestamp': 1619159623702, 'position': {'x': 154, 'y': 183}}, {'timestamp': 1619159623802, 'position': {'x': 172, 'y': 184}}, {'timestamp': 1619159623902, 'position': {'x': 179, 'y': 185}}, {'timestamp': 1619159624002, 'position': {'x': 181, 'y': 185}}, {'timestamp': 1619159624203, 'position': {'x': 165, 'y': 181}}, {'timestamp': 1619159624501, 'position': {'x': 178, 'y': 183}}, {'timestamp': 1619159624602, 'position': {'x': 187, 'y': 187}}, {'timestamp': 1619159624801, 'position': {'x': 177, 'y': 196}}, {'timestamp': 1619159624901, 'position': {'x': 172, 'y': 215}}, {'timestamp': 1619159625001, 'position': {'x': 170, 'y': 230}}, {'timestamp': 1619159625101, 'position': {'x': 160, 'y': 232}}, {'timestamp': 1619159625202, 'position': {'x': 157, 'y': 235}}, {'timestamp': 1619159625304, 'position': {'x': 157, 'y': 236}}, {'timestamp': 1619159625501, 'position': {'x': 156, 'y': 247}}, {'timestamp': 1619159625601, 'position': {'x': 150, 'y': 273}}, {'timestamp': 1619159625701, 'position': {'x': 149, 'y': 274}}, {'timestamp': 1619159625802, 'position': {'x': 142, 'y': 273}}, {'timestamp': 1619159625901, 'position': {'x': 133, 'y': 261}}, {'timestamp': 1619159626001, 'position': {'x': 118, 'y': 246}}, {'timestamp': 1619159626102, 'position': {'x': 101, 'y': 237}}, {'timestamp': 1619159626203, 'position': {'x': 99, 'y': 236}}, {'timestamp': 1619159626301, 'position': {'x': 101, 'y': 234}}, {'timestamp': 1619159626401, 'position': {'x': 113, 'y': 232}}, {'timestamp': 1619159626501, 'position': {'x': 134, 'y': 231}}, {'timestamp': 1619159626600, 'position': {'x': 160, 'y': 228}}, {'timestamp': 1619159626701, 'position': {'x': 160, 'y': 227}}, {'timestamp': 1619159626901, 'position': {'x': 161, 'y': 227}}, {'timestamp': 1619159627001, 'position': {'x': 180, 'y': 231}}, {'timestamp': 1619159627101, 'position': {'x': 243, 'y': 233}}, {'timestamp': 1619159627203, 'position': {'x': 277, 'y': 232}}, {'timestamp': 1619159627401, 'position': {'x': 279, 'y': 232}}, {'timestamp': 1619159627500, 'position': {'x': 284, 'y': 234}}, {'timestamp': 1619159627600, 'position': {'x': 298, 'y': 230}}, {'timestamp': 1619159627701, 'position': {'x': 315, 'y': 227}}, {'timestamp': 1619159627801, 'position': {'x': 315, 'y': 225}}, {'timestamp': 1619159627900, 'position': {'x': 309, 'y': 220}}, {'timestamp': 1619159628000, 'position': {'x': 307, 'y': 220}}, {'timestamp': 1619159628100, 'position': {'x': 314, 'y': 220}}, {'timestamp': 1619159628203, 'position': {'x': 318, 'y': 220}}, {'timestamp': 1619159628300, 'position': {'x': 317, 'y': 221}}, {'timestamp': 1619159628600, 'position': {'x': 340, 'y': 217}}, {'timestamp': 1619159628700, 'position': {'x': 347, 'y': 217}}, {'timestamp': 1619159628900, 'position': {'x': 370, 'y': 217}}, {'timestamp': 1619159629000, 'position': {'x': 407, 'y': 218}}, {'timestamp': 1619159629104, 'position': {'x': 417, 'y': 216}}, {'timestamp': 1619159629300, 'position': {'x': 418, 'y': 217}}, {'timestamp': 1619159629400, 'position': {'x': 445, 'y': 216}}, {'timestamp': 1619159629500, 'position': {'x': 489, 'y': 217}}, {'timestamp': 1619159629600, 'position': {'x': 513, 'y': 217}}, {'timestamp': 1619159629703, 'position': {'x': 532, 'y': 217}}, {'timestamp': 1619159629900, 'position': {'x': 521, 'y': 216}}, {'timestamp': 1619159630001, 'position': {'x': 500, 'y': 217}}, {'timestamp': 1619159630099, 'position': {'x': 520, 'y': 217}}, {'timestamp': 1619159630200, 'position': {'x': 566, 'y': 219}}, {'timestamp': 1619159630299, 'position': {'x': 562, 'y': 218}}, {'timestamp': 1619159630400, 'position': {'x': 316, 'y': 215}}, {'timestamp': 1619159630500, 'position': {'x': 62, 'y': 249}}, {'timestamp': 1619159630600, 'position': {'x': 63, 'y': 250}}, {'timestamp': 1619159630699, 'position': {'x': 58, 'y': 265}}, {'timestamp': 1619159630800, 'position': {'x': 77, 'y': 280}}, {'timestamp': 1619159630902, 'position': {'x': 89, 'y': 282}}, {'timestamp': 1619159631099, 'position': {'x': 97, 'y': 281}}, {'timestamp': 1619159631199, 'position': {'x': 114, 'y': 274}}, {'timestamp': 1619159631299, 'position': {'x': 89, 'y': 263}}, {'timestamp': 1619159631399, 'position': {'x': 67, 'y': 275}}, {'timestamp': 1619159631499, 'position': {'x': 108, 'y': 283}}, {'timestamp': 1619159631599, 'position': {'x': 124, 'y': 276}}, {'timestamp': 1619159631699, 'position': {'x': 123, 'y': 277}}, {'timestamp': 1619159631799, 'position': {'x': 121, 'y': 277}}, {'timestamp': 1619159631899, 'position': {'x': 111, 'y': 274}}, {'timestamp': 1619159632004, 'position': {'x': 110, 'y': 274}}, {'timestamp': 1619159632099, 'position': {'x': 110, 'y': 273}}, {'timestamp': 1619159632199, 'position': {'x': 110, 'y': 269}}, {'timestamp': 1619159632299, 'position': {'x': 148, 'y': 270}}, {'timestamp': 1619159632400, 'position': {'x': 168, 'y': 269}}, {'timestamp': 1619159632499, 'position': {'x': 164, 'y': 266}}, {'timestamp': 1619159632607, 'position': {'x': 153, 'y': 261}}, {'timestamp': 1619159632699, 'position': {'x': 145, 'y': 260}}, {'timestamp': 1619159632799, 'position': {'x': 126, 'y': 262}}, {'timestamp': 1619159632899, 'position': {'x': 140, 'y': 262}}, {'timestamp': 1619159632999, 'position': {'x': 147, 'y': 260}}, {'timestamp': 1619159633099, 'position': {'x': 118, 'y': 256}}, {'timestamp': 1619159633199, 'position': {'x': 108, 'y': 255}}, {'timestamp': 1619159633301, 'position': {'x': 115, 'y': 256}}, {'timestamp': 1619159633399, 'position': {'x': 125, 'y': 258}}, {'timestamp': 1619159633499, 'position': {'x': 141, 'y': 258}}, {'timestamp': 1619159633599, 'position': {'x': 160, 'y': 254}}, {'timestamp': 1619159633699, 'position': {'x': 164, 'y': 254}}, {'timestamp': 1619159633799, 'position': {'x': 166, 'y': 254}}, {'timestamp': 1619159633902, 'position': {'x': 168, 'y': 254}}, {'timestamp': 1619159633999, 'position': {'x': 175, 'y': 255}}, {'timestamp': 1619159634099, 'position': {'x': 181, 'y': 258}}, {'timestamp': 1619159634201, 'position': {'x': 183, 'y': 259}}, {'timestamp': 1619159634299, 'position': {'x': 198, 'y': 262}}, {'timestamp': 1619159634399, 'position': {'x': 810, 'y': 252}}, {'timestamp': 1619159634502, 'position': {'x': 837, 'y': 247}}, {'timestamp': 1619159634699, 'position': {'x': 836, 'y': 245}}, {'timestamp': 1619159634798, 'position': {'x': 822, 'y': 233}}, {'timestamp': 1619159634899, 'position': {'x': 798, 'y': 221}}, {'timestamp': 1619159634999, 'position': {'x': 795, 'y': 220}}, {'timestamp': 1619159635099, 'position': {'x': 792, 'y': 217}}, {'timestamp': 1619159635199, 'position': {'x': 766, 'y': 219}}, {'timestamp': 1619159635299, 'position': {'x': 746, 'y': 227}}, {'timestamp': 1619159635499, 'position': {'x': 739, 'y': 227}}, {'timestamp': 1619159635599, 'position': {'x': 738, 'y': 230}}, {'timestamp': 1619159635701, 'position': {'x': 736, 'y': 234}}, {'timestamp': 1619159636001, 'position': {'x': 739, 'y': 235}}, {'timestamp': 1619159651697, 'position': {'x': 740, 'y': 232}}, {'timestamp': 1619159651797, 'position': {'x': 769, 'y': 71}}, {'timestamp': 1619159651897, 'position': {'x': 749, 'y': 88}}, {'timestamp': 1619159651997, 'position': {'x': 714, 'y': 121}}, {'timestamp': 1619159652097, 'position': {'x': 605, 'y': 179}}, {'timestamp': 1619159652201, 'position': {'x': 565, 'y': 197}}, {'timestamp': 1619159652398, 'position': {'x': 574, 'y': 194}}, {'timestamp': 1619159652497, 'position': {'x': 525, 'y': 209}}, {'timestamp': 1619159652597, 'position': {'x': 252, 'y': 228}}, {'timestamp': 1619159652699, 'position': {'x': 254, 'y': 226}}, {'timestamp': 1619159652797, 'position': {'x': 259, 'y': 222}}, {'timestamp': 1619159652897, 'position': {'x': 214, 'y': 191}}, {'timestamp': 1619159652997, 'position': {'x': 174, 'y': 181}}, {'timestamp': 1619159653097, 'position': {'x': 163, 'y': 196}}, {'timestamp': 1619159653197, 'position': {'x': 163, 'y': 189}}, {'timestamp': 1619159653297, 'position': {'x': 163, 'y': 173}}, {'timestamp': 1619159653397, 'position': {'x': 191, 'y': 188}}, {'timestamp': 1619159653497, 'position': {'x': 449, 'y': 211}}, {'timestamp': 1619159653597, 'position': {'x': 664, 'y': 194}}, {'timestamp': 1619159653696, 'position': {'x': 664, 'y': 189}}, {'timestamp': 1619159653797, 'position': {'x': 434, 'y': 147}}, {'timestamp': 1619159653901, 'position': {'x': 306, 'y': 134}}, {'timestamp': 1619159653997, 'position': {'x': 295, 'y': 135}}, {'timestamp': 1619159654097, 'position': {'x': 256, 'y': 149}}, {'timestamp': 1619159654197, 'position': {'x': 254, 'y': 149}}, {'timestamp': 1619159654297, 'position': {'x': 250, 'y': 145}}, {'timestamp': 1619159654396, 'position': {'x': 209, 'y': 157}}, {'timestamp': 1619159654497, 'position': {'x': 197, 'y': 156}}, {'timestamp': 1619159654596, 'position': {'x': 204, 'y': 157}}, {'timestamp': 1619159654697, 'position': {'x': 247, 'y': 155}}, {'timestamp': 1619159654797, 'position': {'x': 235, 'y': 157}}, {'timestamp': 1619159654897, 'position': {'x': 267, 'y': 155}}, {'timestamp': 1619159654996, 'position': {'x': 265, 'y': 156}}, {'timestamp': 1619159655099, 'position': {'x': 267, 'y': 156}}, {'timestamp': 1619159655396, 'position': {'x': 260, 'y': 164}}, {'timestamp': 1619159655497, 'position': {'x': 201, 'y': 244}}, {'timestamp': 1619159655597, 'position': {'x': 186, 'y': 256}}, {'timestamp': 1619159655697, 'position': {'x': 174, 'y': 257}}, {'timestamp': 1619159655796, 'position': {'x': 166, 'y': 267}}, {'timestamp': 1619159655897, 'position': {'x': 165, 'y': 256}}, {'timestamp': 1619159655997, 'position': {'x': 138, 'y': 246}}, {'timestamp': 1619159656097, 'position': {'x': 128, 'y': 275}}, {'timestamp': 1619159656197, 'position': {'x': 145, 'y': 269}}, {'timestamp': 1619159656296, 'position': {'x': 132, 'y': 241}}, {'timestamp': 1619159656396, 'position': {'x': 117, 'y': 280}}, {'timestamp': 1619159656496, 'position': {'x': 146, 'y': 282}}, {'timestamp': 1619159656596, 'position': {'x': 141, 'y': 237}}, {'timestamp': 1619159656696, 'position': {'x': 117, 'y': 276}}, {'timestamp': 1619159656796, 'position': {'x': 143, 'y': 291}}, {'timestamp': 1619159656897, 'position': {'x': 138, 'y': 236}}, {'timestamp': 1619159656996, 'position': {'x': 104, 'y': 295}}, {'timestamp': 1619159657097, 'position': {'x': 138, 'y': 299}}, {'timestamp': 1619159657198, 'position': {'x': 125, 'y': 300}}, {'timestamp': 1619159658296, 'position': {'x': 123, 'y': 291}}, {'timestamp': 1619159658397, 'position': {'x': 133, 'y': 275}}, {'timestamp': 1619159658498, 'position': {'x': 132, 'y': 264}}, {'timestamp': 1619159658596, 'position': {'x': 128, 'y': 262}}, {'timestamp': 1619159658697, 'position': {'x': 121, 'y': 261}}, {'timestamp': 1619159660496, 'position': {'x': 125, 'y': 256}}, {'timestamp': 1619159660696, 'position': {'x': 120, 'y': 269}}, {'timestamp': 1619159660796, 'position': {'x': 123, 'y': 272}}, {'timestamp': 1619159660896, 'position': {'x': 125, 'y': 263}}, {'timestamp': 1619159660996, 'position': {'x': 125, 'y': 262}}, {'timestamp': 1619159661096, 'position': {'x': 131, 'y': 249}}, {'timestamp': 1619159661196, 'position': {'x': 135, 'y': 223}}, {'timestamp': 1619159661298, 'position': {'x': 141, 'y': 202}}, {'timestamp': 1619159661496, 'position': {'x': 140, 'y': 210}}, {'timestamp': 1619159661597, 'position': {'x': 129, 'y': 222}}, {'timestamp': 1619159661696, 'position': {'x': 133, 'y': 220}}, {'timestamp': 1619159661797, 'position': {'x': 158, 'y': 217}}, {'timestamp': 1619159661896, 'position': {'x': 161, 'y': 216}}, {'timestamp': 1619159661998, 'position': {'x': 166, 'y': 216}}, {'timestamp': 1619159662096, 'position': {'x': 177, 'y': 217}}, {'timestamp': 1619159662196, 'position': {'x': 267, 'y': 216}}, {'timestamp': 1619159662296, 'position': {'x': 205, 'y': 212}}, {'timestamp': 1619159662396, 'position': {'x': 219, 'y': 216}}, {'timestamp': 1619159662496, 'position': {'x': 212, 'y': 214}}, {'timestamp': 1619159662598, 'position': {'x': 219, 'y': 216}}, {'timestamp': 1619159662696, 'position': {'x': 237, 'y': 219}}, {'timestamp': 1619159662797, 'position': {'x': 251, 'y': 218}}, {'timestamp': 1619159662896, 'position': {'x': 280, 'y': 219}}, {'timestamp': 1619159662996, 'position': {'x': 293, 'y': 218}}, {'timestamp': 1619159663096, 'position': {'x': 320, 'y': 216}}, {'timestamp': 1619159663196, 'position': {'x': 338, 'y': 216}}, {'timestamp': 1619159663296, 'position': {'x': 373, 'y': 218}}, {'timestamp': 1619159663396, 'position': {'x': 364, 'y': 214}}, {'timestamp': 1619159663496, 'position': {'x': 358, 'y': 220}}, {'timestamp': 1619159663596, 'position': {'x': 365, 'y': 216}}, {'timestamp': 1619159663697, 'position': {'x': 355, 'y': 217}}, {'timestamp': 1619159663797, 'position': {'x': 364, 'y': 215}}, {'timestamp': 1619159663897, 'position': {'x': 354, 'y': 213}}, {'timestamp': 1619159663996, 'position': {'x': 347, 'y': 221}}, {'timestamp': 1619159664096, 'position': {'x': 349, 'y': 220}}, {'timestamp': 1619159664196, 'position': {'x': 342, 'y': 228}}, {'timestamp': 1619159664296, 'position': {'x': 197, 'y': 293}}, {'timestamp': 1619159664396, 'position': {'x': 178, 'y': 286}}, {'timestamp': 1619159664496, 'position': {'x': 160, 'y': 284}}, {'timestamp': 1619159664601, 'position': {'x': 148, 'y': 286}}, {'timestamp': 1619159664696, 'position': {'x': 154, 'y': 285}}, {'timestamp': 1619159664796, 'position': {'x': 151, 'y': 283}}, {'timestamp': 1619159664896, 'position': {'x': 131, 'y': 289}}, {'timestamp': 1619159664996, 'position': {'x': 140, 'y': 289}}, {'timestamp': 1619159665097, 'position': {'x': 145, 'y': 289}}, {'timestamp': 1619159665196, 'position': {'x': 148, 'y': 286}}, {'timestamp': 1619159665296, 'position': {'x': 156, 'y': 285}}, {'timestamp': 1619159665396, 'position': {'x': 153, 'y': 289}}, {'timestamp': 1619159665496, 'position': {'x': 158, 'y': 288}}, {'timestamp': 1619159665597, 'position': {'x': 160, 'y': 286}}, {'timestamp': 1619159665799, 'position': {'x': 160, 'y': 287}}, {'timestamp': 1619159665896, 'position': {'x': 154, 'y': 292}}, {'timestamp': 1619159665996, 'position': {'x': 87, 'y': 302}}, {'timestamp': 1619159666096, 'position': {'x': 83, 'y': 295}}, {'timestamp': 1619159666196, 'position': {'x': 79, 'y': 295}}, {'timestamp': 1619159666296, 'position': {'x': 69, 'y': 297}}, {'timestamp': 1619159666396, 'position': {'x': 63, 'y': 297}}, {'timestamp': 1619159666496, 'position': {'x': 72, 'y': 308}}, {'timestamp': 1619159666596, 'position': {'x': 77, 'y': 296}}, {'timestamp': 1619159666696, 'position': {'x': 70, 'y': 300}}, {'timestamp': 1619159666796, 'position': {'x': 76, 'y': 303}}, {'timestamp': 1619159666896, 'position': {'x': 74, 'y': 302}}, {'timestamp': 1619159666996, 'position': {'x': 74, 'y': 303}}, {'timestamp': 1619159667096, 'position': {'x': 74, 'y': 304}}, {'timestamp': 1619159667297, 'position': {'x': 75, 'y': 304}}, {'timestamp': 1619159667399, 'position': {'x': 74, 'y': 305}}, {'timestamp': 1619159667496, 'position': {'x': 87, 'y': 307}}, {'timestamp': 1619159667596, 'position': {'x': 97, 'y': 305}}, {'timestamp': 1619159667696, 'position': {'x': 145, 'y': 296}}, {'timestamp': 1619159667797, 'position': {'x': 157, 'y': 288}}, {'timestamp': 1619159667896, 'position': {'x': 141, 'y': 273}}, {'timestamp': 1619159667996, 'position': {'x': 129, 'y': 272}}, {'timestamp': 1619159668099, 'position': {'x': 115, 'y': 271}}, {'timestamp': 1619159668196, 'position': {'x': 114, 'y': 269}}, {'timestamp': 1619159668296, 'position': {'x': 115, 'y': 266}}, {'timestamp': 1619159668397, 'position': {'x': 117, 'y': 264}}, {'timestamp': 1619159668496, 'position': {'x': 113, 'y': 256}}, {'timestamp': 1619159668596, 'position': {'x': 112, 'y': 243}}, {'timestamp': 1619159668696, 'position': {'x': 150, 'y': 244}}, {'timestamp': 1619159668797, 'position': {'x': 171, 'y': 242}}, {'timestamp': 1619159668896, 'position': {'x': 169, 'y': 241}}, {'timestamp': 1619159668996, 'position': {'x': 704, 'y': 237}}, {'timestamp': 1619159669096, 'position': {'x': 889, 'y': 226}}, {'timestamp': 1619159669196, 'position': {'x': 867, 'y': 225}}, {'timestamp': 1619159669296, 'position': {'x': 834, 'y': 225}}, {'timestamp': 1619159669396, 'position': {'x': 788, 'y': 223}}, {'timestamp': 1619159669496, 'position': {'x': 774, 'y': 222}}, {'timestamp': 1619159669597, 'position': {'x': 784, 'y': 218}}, {'timestamp': 1619159669699, 'position': {'x': 787, 'y': 216}}, {'timestamp': 1619159669797, 'position': {'x': 775, 'y': 218}}, {'timestamp': 1619159669897, 'position': {'x': 749, 'y': 224}}, {'timestamp': 1619159670000, 'position': {'x': 733, 'y': 226}}, {'timestamp': 1619159670397, 'position': {'x': 732, 'y': 226}}, {'timestamp': 1619159670497, 'position': {'x': 718, 'y': 225}}, {'timestamp': 1619159670597, 'position': {'x': 708, 'y': 225}}, {'timestamp': 1619159670696, 'position': {'x': 703, 'y': 224}}, {'timestamp': 1619159670798, 'position': {'x': 702, 'y': 223}}, {'timestamp': 1619159670898, 'position': {'x': 701, 'y': 223}}, {'timestamp': 1619159670996, 'position': {'x': 700, 'y': 223}}, {'timestamp': 1619159671098, 'position': {'x': 698, 'y': 224}}, {'timestamp': 1619159671296, 'position': {'x': 697, 'y': 223}}, {'timestamp': 1619159671396, 'position': {'x': 696, 'y': 223}}, {'timestamp': 1619159671496, 'position': {'x': 694, 'y': 224}}, {'timestamp': 1619159671896, 'position': {'x': 778, 'y': 219}}, {'timestamp': 1619159671996, 'position': {'x': 891, 'y': 211}}, {'timestamp': 1619159752795, 'position': {'x': 921, 'y': 55}}, {'timestamp': 1619159752895, 'position': {'x': 893, 'y': 519}}, {'timestamp': 1619159752996, 'position': {'x': 917, 'y': 690}}, {'timestamp': 1619159753095, 'position': {'x': 899, 'y': 678}}, {'timestamp': 1619159753195, 'position': {'x': 707, 'y': 733}}, {'timestamp': 1619159753295, 'position': {'x': 648, 'y': 776}}, {'timestamp': 1619159753395, 'position': {'x': 646, 'y': 776}}, {'timestamp': 1619159753495, 'position': {'x': 693, 'y': 767}}, {'timestamp': 1619159753598, 'position': {'x': 702, 'y': 762}}, {'timestamp': 1619159753695, 'position': {'x': 702, 'y': 761}}, {'timestamp': 1619159753796, 'position': {'x': 702, 'y': 752}}], 'task_id': 'python:task:14'}	7
13	06:36:52.94784	{'jsonrpc': '2.0', 'method': '/program/PPP/12', 'params': ['\\n# Funcion que ordena una lista, puedes utilizar sort()\\ndef solution(lista):\\n    if lista is not None:\\n        lista.sort()\\n        return lista\\n    else:    \\n        return None\\n'], 'id': 7, 'keypresses': [{'timestamp': 1619159673347, 'keycode': 73, 'type': 'keydown'}, {'timestamp': 1619159673460, 'keycode': 73, 'type': 'keyup'}, {'timestamp': 1619159674162, 'keycode': 70, 'type': 'keydown'}, {'timestamp': 1619159674286, 'keycode': 70, 'type': 'keyup'}, {'timestamp': 1619159674385, 'keycode': 32, 'type': 'keydown'}, {'timestamp': 1619159674519, 'keycode': 32, 'type': 'keyup'}, {'timestamp': 1619159675472, 'keycode': 76, 'type': 'keydown'}, {'timestamp': 1619159675586, 'keycode': 76, 'type': 'keyup'}, {'timestamp': 1619159675745, 'keycode': 73, 'type': 'keydown'}, {'timestamp': 1619159675821, 'keycode': 73, 'type': 'keyup'}, {'timestamp': 1619159676520, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619159676714, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619159678701, 'keycode': 76, 'type': 'keydown'}, {'timestamp': 1619159678823, 'keycode': 76, 'type': 'keyup'}, {'timestamp': 1619159678981, 'keycode': 73, 'type': 'keydown'}, {'timestamp': 1619159679051, 'keycode': 73, 'type': 'keyup'}, {'timestamp': 1619159679122, 'keycode': 83, 'type': 'keydown'}, {'timestamp': 1619159679224, 'keycode': 83, 'type': 'keyup'}, {'timestamp': 1619159679922, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1619159680116, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1619159680120, 'keycode': 69, 'type': 'keydown'}, {'timestamp': 1619159680264, 'keycode': 69, 'type': 'keyup'}, {'timestamp': 1619159680389, 'keycode': 32, 'type': 'keydown'}, {'timestamp': 1619159680494, 'keycode': 32, 'type': 'keyup'}, {'timestamp': 1619159681343, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619159681510, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619159681688, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619159681863, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619159682050, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619159682252, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619159689481, 'keycode': 76, 'type': 'keydown'}, {'timestamp': 1619159689589, 'keycode': 76, 'type': 'keyup'}, {'timestamp': 1619159689764, 'keycode': 73, 'type': 'keydown'}, {'timestamp': 1619159689852, 'keycode': 73, 'type': 'keyup'}, {'timestamp': 1619159689959, 'keycode': 83, 'type': 'keydown'}, {'timestamp': 1619159690104, 'keycode': 83, 'type': 'keyup'}, {'timestamp': 1619159690709, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1619159690826, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1619159690966, 'keycode': 65, 'type': 'keydown'}, {'timestamp': 1619159691135, 'keycode': 65, 'type': 'keyup'}, {'timestamp': 1619159691217, 'keycode': 32, 'type': 'keydown'}, {'timestamp': 1619159691254, 'keycode': 32, 'type': 'keyup'}, {'timestamp': 1619159692178, 'keycode': 73, 'type': 'keydown'}, {'timestamp': 1619159692271, 'keycode': 73, 'type': 'keyup'}, {'timestamp': 1619159692482, 'keycode': 83, 'type': 'keydown'}, {'timestamp': 1619159692575, 'keycode': 83, 'type': 'keyup'}, {'timestamp': 1619159692619, 'keycode': 32, 'type': 'keydown'}, {'timestamp': 1619159692737, 'keycode': 32, 'type': 'keyup'}, {'timestamp': 1619159692905, 'keycode': 78, 'type': 'keydown'}, {'timestamp': 1619159692979, 'keycode': 78, 'type': 'keyup'}, {'timestamp': 1619159693451, 'keycode': 79, 'type': 'keydown'}, {'timestamp': 1619159693539, 'keycode': 79, 'type': 'keyup'}, {'timestamp': 1619159693734, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1619159693861, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1619159693864, 'keycode': 32, 'type': 'keydown'}, {'timestamp': 1619159693969, 'keycode': 32, 'type': 'keyup'}, {'timestamp': 1619159694108, 'keycode': 16, 'type': 'keydown'}, {'timestamp': 1619159694279, 'keycode': 78, 'type': 'keydown'}, {'timestamp': 1619159694366, 'keycode': 78, 'type': 'keyup'}, {'timestamp': 1619159694518, 'keycode': 16, 'type': 'keyup'}, {'timestamp': 1619159694745, 'keycode': 79, 'type': 'keydown'}, {'timestamp': 1619159694858, 'keycode': 79, 'type': 'keyup'}, {'timestamp': 1619159696156, 'keycode': 78, 'type': 'keydown'}, {'timestamp': 1619159696242, 'keycode': 78, 'type': 'keyup'}, {'timestamp': 1619159696378, 'keycode': 69, 'type': 'keydown'}, {'timestamp': 1619159696518, 'keycode': 69, 'type': 'keyup'}, {'timestamp': 1619159697234, 'keycode': 16, 'type': 'keydown'}, {'timestamp': 1619159698339, 'keycode': 186, 'type': 'keydown'}, {'timestamp': 1619159698415, 'keycode': 186, 'type': 'keyup'}, {'timestamp': 1619159698527, 'keycode': 16, 'type': 'keyup'}, {'timestamp': 1619159698974, 'keycode': 13, 'type': 'keydown'}, {'timestamp': 1619159699080, 'keycode': 13, 'type': 'keyup'}, {'timestamp': 1619159701169, 'keycode': 76, 'type': 'keydown'}, {'timestamp': 1619159701265, 'keycode': 76, 'type': 'keyup'}, {'timestamp': 1619159701416, 'keycode': 73, 'type': 'keydown'}, {'timestamp': 1619159701481, 'keycode': 73, 'type': 'keyup'}, {'timestamp': 1619159701582, 'keycode': 83, 'type': 'keydown'}, {'timestamp': 1619159701708, 'keycode': 83, 'type': 'keyup'}, {'timestamp': 1619159701858, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1619159701930, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1619159702071, 'keycode': 65, 'type': 'keydown'}, {'timestamp': 1619159702147, 'keycode': 65, 'type': 'keyup'}, {'timestamp': 1619159703359, 'keycode': 188, 'type': 'keydown'}, {'timestamp': 1619159703438, 'keycode': 188, 'type': 'keyup'}, {'timestamp': 1619159704671, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619159705449, 'keycode': 190, 'type': 'keydown'}, {'timestamp': 1619159705543, 'keycode': 190, 'type': 'keyup'}, {'timestamp': 1619159705915, 'keycode': 83, 'type': 'keydown'}, {'timestamp': 1619159706099, 'keycode': 83, 'type': 'keyup'}, {'timestamp': 1619159706321, 'keycode': 79, 'type': 'keydown'}, {'timestamp': 1619159706423, 'keycode': 79, 'type': 'keyup'}, {'timestamp': 1619159706991, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1619159707175, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1619159707192, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1619159707291, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1619159707604, 'keycode': 16, 'type': 'keydown'}, {'timestamp': 1619159708047, 'keycode': 57, 'type': 'keydown'}, {'timestamp': 1619159708142, 'keycode': 48, 'type': 'keydown'}, {'timestamp': 1619159708199, 'keycode': 57, 'type': 'keyup'}, {'timestamp': 1619159708238, 'keycode': 48, 'type': 'keyup'}, {'timestamp': 1619159708265, 'keycode': 16, 'type': 'keyup'}, {'timestamp': 1619159709057, 'keycode': 13, 'type': 'keydown'}, {'timestamp': 1619159709191, 'keycode': 13, 'type': 'keyup'}, {'timestamp': 1619159709989, 'keycode': 38, 'type': 'keyup'}, {'timestamp': 1619159712001, 'keycode': 40, 'type': 'keyup'}, {'timestamp': 1619159712292, 'keycode': 38, 'type': 'keyup'}, {'timestamp': 1619159712998, 'keycode': 40, 'type': 'keyup'}, {'timestamp': 1619159717026, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1619159717187, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1619159717216, 'keycode': 69, 'type': 'keydown'}, {'timestamp': 1619159717334, 'keycode': 69, 'type': 'keyup'}, {'timestamp': 1619159717492, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1619159717641, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1619159717837, 'keycode': 85, 'type': 'keydown'}, {'timestamp': 1619159717936, 'keycode': 85, 'type': 'keyup'}, {'timestamp': 1619159717995, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1619159718076, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1619159718137, 'keycode': 78, 'type': 'keydown'}, {'timestamp': 1619159718211, 'keycode': 78, 'type': 'keyup'}, {'timestamp': 1619159718427, 'keycode': 32, 'type': 'keydown'}, {'timestamp': 1619159718532, 'keycode': 32, 'type': 'keyup'}, {'timestamp': 1619159719330, 'keycode': 76, 'type': 'keydown'}, {'timestamp': 1619159719422, 'keycode': 76, 'type': 'keyup'}, {'timestamp': 1619159719612, 'keycode': 73, 'type': 'keydown'}, {'timestamp': 1619159719690, 'keycode': 73, 'type': 'keyup'}, {'timestamp': 1619159719718, 'keycode': 83, 'type': 'keydown'}, {'timestamp': 1619159719822, 'keycode': 83, 'type': 'keyup'}, {'timestamp': 1619159720016, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1619159720136, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1619159720272, 'keycode': 65, 'type': 'keydown'}, {'timestamp': 1619159720407, 'keycode': 65, 'type': 'keyup'}, {'timestamp': 1619159721660, 'keycode': 13, 'type': 'keydown'}, {'timestamp': 1619159721816, 'keycode': 13, 'type': 'keyup'}, {'timestamp': 1619159722270, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619159723024, 'keycode': 69, 'type': 'keydown'}, {'timestamp': 1619159723132, 'keycode': 69, 'type': 'keyup'}, {'timestamp': 1619159723273, 'keycode': 76, 'type': 'keydown'}, {'timestamp': 1619159723352, 'keycode': 76, 'type': 'keyup'}, {'timestamp': 1619159723372, 'keycode': 83, 'type': 'keydown'}, {'timestamp': 1619159723462, 'keycode': 83, 'type': 'keyup'}, {'timestamp': 1619159723592, 'keycode': 69, 'type': 'keydown'}, {'timestamp': 1619159723660, 'keycode': 69, 'type': 'keyup'}, {'timestamp': 1619159724036, 'keycode': 16, 'type': 'keydown'}, {'timestamp': 1619159725220, 'keycode': 186, 'type': 'keydown'}, {'timestamp': 1619159725282, 'keycode': 186, 'type': 'keyup'}, {'timestamp': 1619159725455, 'keycode': 16, 'type': 'keyup'}, {'timestamp': 1619159725737, 'keycode': 13, 'type': 'keydown'}, {'timestamp': 1619159725860, 'keycode': 13, 'type': 'keyup'}, {'timestamp': 1619159726689, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1619159726833, 'keycode': 69, 'type': 'keydown'}, {'timestamp': 1619159726837, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1619159726942, 'keycode': 69, 'type': 'keyup'}, {'timestamp': 1619159727073, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1619159727214, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1619159727426, 'keycode': 85, 'type': 'keydown'}, {'timestamp': 1619159727521, 'keycode': 85, 'type': 'keyup'}, {'timestamp': 1619159727707, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1619159727818, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1619159727874, 'keycode': 78, 'type': 'keydown'}, {'timestamp': 1619159727949, 'keycode': 78, 'type': 'keyup'}, {'timestamp': 1619159728182, 'keycode': 32, 'type': 'keydown'}, {'timestamp': 1619159728243, 'keycode': 32, 'type': 'keyup'}, {'timestamp': 1619159738792, 'keycode': 16, 'type': 'keydown'}, {'timestamp': 1619159739190, 'keycode': 38, 'type': 'keyup'}, {'timestamp': 1619159739852, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1619159740051, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1619159740249, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1619159740434, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1619159740661, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1619159741181, 'keycode': 38, 'type': 'keyup'}, {'timestamp': 1619159741438, 'keycode': 16, 'type': 'keyup'}, {'timestamp': 1619159741813, 'keycode': 46, 'type': 'keyup'}, {'timestamp': 1619159743518, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1619159743738, 'keycode': 69, 'type': 'keydown'}, {'timestamp': 1619159743782, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1619159743878, 'keycode': 69, 'type': 'keyup'}, {'timestamp': 1619159744683, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1619159744820, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1619159744957, 'keycode': 85, 'type': 'keydown'}, {'timestamp': 1619159745043, 'keycode': 85, 'type': 'keyup'}, {'timestamp': 1619159745120, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1619159745236, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1619159745380, 'keycode': 78, 'type': 'keydown'}, {'timestamp': 1619159745510, 'keycode': 78, 'type': 'keyup'}, {'timestamp': 1619159745749, 'keycode': 32, 'type': 'keydown'}, {'timestamp': 1619159745825, 'keycode': 32, 'type': 'keyup'}, {'timestamp': 1619159747424, 'keycode': 76, 'type': 'keydown'}, {'timestamp': 1619159747508, 'keycode': 76, 'type': 'keyup'}, {'timestamp': 1619159747682, 'keycode': 73, 'type': 'keydown'}, {'timestamp': 1619159747742, 'keycode': 73, 'type': 'keyup'}, {'timestamp': 1619159747810, 'keycode': 83, 'type': 'keydown'}, {'timestamp': 1619159747907, 'keycode': 83, 'type': 'keyup'}, {'timestamp': 1619159748107, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1619159748219, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1619159748347, 'keycode': 65, 'type': 'keydown'}, {'timestamp': 1619159748441, 'keycode': 65, 'type': 'keyup'}, {'timestamp': 1619159785900, 'keycode': 8, 'type': 'keydown'}, {'timestamp': 1619159785959, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619159786127, 'keycode': 8, 'type': 'keydown'}, {'timestamp': 1619159786207, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619159788889, 'keycode': 16, 'type': 'keydown'}, {'timestamp': 1619159789272, 'keycode': 78, 'type': 'keydown'}, {'timestamp': 1619159789374, 'keycode': 78, 'type': 'keyup'}, {'timestamp': 1619159789376, 'keycode': 16, 'type': 'keyup'}, {'timestamp': 1619159789578, 'keycode': 79, 'type': 'keydown'}, {'timestamp': 1619159789703, 'keycode': 79, 'type': 'keyup'}, {'timestamp': 1619159789797, 'keycode': 78, 'type': 'keydown'}, {'timestamp': 1619159789896, 'keycode': 78, 'type': 'keyup'}, {'timestamp': 1619159790048, 'keycode': 69, 'type': 'keydown'}, {'timestamp': 1619159790160, 'keycode': 69, 'type': 'keyup'}, {'timestamp': 1619159790993, 'keycode': 38, 'type': 'keyup'}, {'timestamp': 1619159791517, 'keycode': 39, 'type': 'keyup'}, {'timestamp': 1619159791697, 'keycode': 39, 'type': 'keyup'}, {'timestamp': 1619159791864, 'keycode': 39, 'type': 'keyup'}, {'timestamp': 1619159792055, 'keycode': 39, 'type': 'keyup'}, {'timestamp': 1619159792496, 'keycode': 39, 'type': 'keyup'}, {'timestamp': 1619159792797, 'keycode': 13, 'type': 'keydown'}, {'timestamp': 1619159792903, 'keycode': 13, 'type': 'keyup'}, {'timestamp': 1619159793727, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1619159794466, 'keycode': 69, 'type': 'keydown'}, {'timestamp': 1619159794598, 'keycode': 69, 'type': 'keyup'}, {'timestamp': 1619159794787, 'keycode': 76, 'type': 'keydown'}, {'timestamp': 1619159794866, 'keycode': 76, 'type': 'keyup'}, {'timestamp': 1619159794871, 'keycode': 83, 'type': 'keydown'}, {'timestamp': 1619159794963, 'keycode': 83, 'type': 'keyup'}, {'timestamp': 1619159795095, 'keycode': 69, 'type': 'keydown'}, {'timestamp': 1619159795189, 'keycode': 69, 'type': 'keyup'}, {'timestamp': 1619159795683, 'keycode': 16, 'type': 'keydown'}, {'timestamp': 1619159796204, 'keycode': 186, 'type': 'keydown'}, {'timestamp': 1619159796268, 'keycode': 186, 'type': 'keyup'}, {'timestamp': 1619159796313, 'keycode': 16, 'type': 'keyup'}, {'timestamp': 1619159796976, 'keycode': 40, 'type': 'keyup'}, {'timestamp': 1619159797202, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1619159797381, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1619159797553, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1619159797729, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1619159798110, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1619159798521, 'keycode': 9, 'type': 'keyup'}, {'timestamp': 1619159798629, 'keycode': 9, 'type': 'keyup'}, {'timestamp': 1619159799516, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619159800507, 'keycode': 38, 'type': 'keyup'}, {'timestamp': 1619159800898, 'keycode': 38, 'type': 'keyup'}, {'timestamp': 1619159803058, 'keycode': 35, 'type': 'keyup'}, {'timestamp': 1619159803398, 'keycode': 13, 'type': 'keydown'}, {'timestamp': 1619159803467, 'keycode': 13, 'type': 'keyup'}, {'timestamp': 1619159804306, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1619159804478, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1619159804492, 'keycode': 69, 'type': 'keydown'}, {'timestamp': 1619159804610, 'keycode': 69, 'type': 'keyup'}, {'timestamp': 1619159804797, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1619159804933, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1619159805163, 'keycode': 85, 'type': 'keydown'}, {'timestamp': 1619159805260, 'keycode': 85, 'type': 'keyup'}, {'timestamp': 1619159805363, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1619159805470, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1619159805504, 'keycode': 78, 'type': 'keydown'}, {'timestamp': 1619159805585, 'keycode': 78, 'type': 'keyup'}, {'timestamp': 1619159805749, 'keycode': 32, 'type': 'keydown'}, {'timestamp': 1619159805839, 'keycode': 32, 'type': 'keyup'}, {'timestamp': 1619159809762, 'keycode': 76, 'type': 'keydown'}, {'timestamp': 1619159809863, 'keycode': 76, 'type': 'keyup'}, {'timestamp': 1619159809999, 'keycode': 73, 'type': 'keydown'}, {'timestamp': 1619159810081, 'keycode': 73, 'type': 'keyup'}, {'timestamp': 1619159810179, 'keycode': 83, 'type': 'keydown'}, {'timestamp': 1619159810322, 'keycode': 83, 'type': 'keyup'}, {'timestamp': 1619159810407, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1619159810476, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1619159810548, 'keycode': 65, 'type': 'keydown'}, {'timestamp': 1619159810613, 'keycode': 65, 'type': 'keyup'}], 'mousepresses': [{'timestamp': 1619159635714, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619159635887, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619159670146, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619159671751, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619159754048, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619159754194, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619159787967, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619159788072, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619159788178, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619159788299, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619159812374, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619159812471, 'mousecode': 1, 'type': 'mouseup'}], 'mousemovement': [{'timestamp': 1619159617802, 'position': []}, {'timestamp': 1619159618402, 'position': {'x': 976, 'y': 387}}, {'timestamp': 1619159618504, 'position': {'x': 981, 'y': 384}}, {'timestamp': 1619159618702, 'position': {'x': 991, 'y': 385}}, {'timestamp': 1619159618801, 'position': {'x': 982, 'y': 376}}, {'timestamp': 1619159618901, 'position': {'x': 564, 'y': 299}}, {'timestamp': 1619159619002, 'position': {'x': 187, 'y': 252}}, {'timestamp': 1619159619202, 'position': {'x': 185, 'y': 249}}, {'timestamp': 1619159619301, 'position': {'x': 189, 'y': 241}}, {'timestamp': 1619159619404, 'position': {'x': 192, 'y': 240}}, {'timestamp': 1619159619602, 'position': {'x': 193, 'y': 238}}, {'timestamp': 1619159619702, 'position': {'x': 221, 'y': 200}}, {'timestamp': 1619159619801, 'position': {'x': 256, 'y': 170}}, {'timestamp': 1619159619906, 'position': {'x': 259, 'y': 172}}, {'timestamp': 1619159620001, 'position': {'x': 281, 'y': 174}}, {'timestamp': 1619159620104, 'position': {'x': 301, 'y': 174}}, {'timestamp': 1619159620501, 'position': {'x': 297, 'y': 169}}, {'timestamp': 1619159620602, 'position': {'x': 292, 'y': 165}}, {'timestamp': 1619159620702, 'position': {'x': 290, 'y': 163}}, {'timestamp': 1619159620804, 'position': {'x': 285, 'y': 161}}, {'timestamp': 1619159621101, 'position': {'x': 299, 'y': 160}}, {'timestamp': 1619159621202, 'position': {'x': 312, 'y': 157}}, {'timestamp': 1619159621301, 'position': {'x': 320, 'y': 155}}, {'timestamp': 1619159621402, 'position': {'x': 336, 'y': 155}}, {'timestamp': 1619159621502, 'position': {'x': 365, 'y': 156}}, {'timestamp': 1619159621601, 'position': {'x': 395, 'y': 154}}, {'timestamp': 1619159621705, 'position': {'x': 397, 'y': 152}}, {'timestamp': 1619159622001, 'position': {'x': 403, 'y': 154}}, {'timestamp': 1619159622101, 'position': {'x': 428, 'y': 159}}, {'timestamp': 1619159622201, 'position': {'x': 460, 'y': 163}}, {'timestamp': 1619159622301, 'position': {'x': 485, 'y': 165}}, {'timestamp': 1619159622401, 'position': {'x': 514, 'y': 166}}, {'timestamp': 1619159622501, 'position': {'x': 528, 'y': 166}}, {'timestamp': 1619159622601, 'position': {'x': 413, 'y': 167}}, {'timestamp': 1619159622701, 'position': {'x': 69, 'y': 189}}, {'timestamp': 1619159622803, 'position': {'x': 35, 'y': 194}}, {'timestamp': 1619159622905, 'position': {'x': 36, 'y': 194}}, {'timestamp': 1619159623001, 'position': {'x': 76, 'y': 181}}, {'timestamp': 1619159623102, 'position': {'x': 99, 'y': 178}}, {'timestamp': 1619159623301, 'position': {'x': 110, 'y': 179}}, {'timestamp': 1619159623402, 'position': {'x': 122, 'y': 180}}, {'timestamp': 1619159623501, 'position': {'x': 127, 'y': 181}}, {'timestamp': 1619159623602, 'position': {'x': 140, 'y': 182}}, {'timestamp': 1619159623702, 'position': {'x': 154, 'y': 183}}, {'timestamp': 1619159623802, 'position': {'x': 172, 'y': 184}}, {'timestamp': 1619159623902, 'position': {'x': 179, 'y': 185}}, {'timestamp': 1619159624002, 'position': {'x': 181, 'y': 185}}, {'timestamp': 1619159624203, 'position': {'x': 165, 'y': 181}}, {'timestamp': 1619159624501, 'position': {'x': 178, 'y': 183}}, {'timestamp': 1619159624602, 'position': {'x': 187, 'y': 187}}, {'timestamp': 1619159624801, 'position': {'x': 177, 'y': 196}}, {'timestamp': 1619159624901, 'position': {'x': 172, 'y': 215}}, {'timestamp': 1619159625001, 'position': {'x': 170, 'y': 230}}, {'timestamp': 1619159625101, 'position': {'x': 160, 'y': 232}}, {'timestamp': 1619159625202, 'position': {'x': 157, 'y': 235}}, {'timestamp': 1619159625304, 'position': {'x': 157, 'y': 236}}, {'timestamp': 1619159625501, 'position': {'x': 156, 'y': 247}}, {'timestamp': 1619159625601, 'position': {'x': 150, 'y': 273}}, {'timestamp': 1619159625701, 'position': {'x': 149, 'y': 274}}, {'timestamp': 1619159625802, 'position': {'x': 142, 'y': 273}}, {'timestamp': 1619159625901, 'position': {'x': 133, 'y': 261}}, {'timestamp': 1619159626001, 'position': {'x': 118, 'y': 246}}, {'timestamp': 1619159626102, 'position': {'x': 101, 'y': 237}}, {'timestamp': 1619159626203, 'position': {'x': 99, 'y': 236}}, {'timestamp': 1619159626301, 'position': {'x': 101, 'y': 234}}, {'timestamp': 1619159626401, 'position': {'x': 113, 'y': 232}}, {'timestamp': 1619159626501, 'position': {'x': 134, 'y': 231}}, {'timestamp': 1619159626600, 'position': {'x': 160, 'y': 228}}, {'timestamp': 1619159626701, 'position': {'x': 160, 'y': 227}}, {'timestamp': 1619159626901, 'position': {'x': 161, 'y': 227}}, {'timestamp': 1619159627001, 'position': {'x': 180, 'y': 231}}, {'timestamp': 1619159627101, 'position': {'x': 243, 'y': 233}}, {'timestamp': 1619159627203, 'position': {'x': 277, 'y': 232}}, {'timestamp': 1619159627401, 'position': {'x': 279, 'y': 232}}, {'timestamp': 1619159627500, 'position': {'x': 284, 'y': 234}}, {'timestamp': 1619159627600, 'position': {'x': 298, 'y': 230}}, {'timestamp': 1619159627701, 'position': {'x': 315, 'y': 227}}, {'timestamp': 1619159627801, 'position': {'x': 315, 'y': 225}}, {'timestamp': 1619159627900, 'position': {'x': 309, 'y': 220}}, {'timestamp': 1619159628000, 'position': {'x': 307, 'y': 220}}, {'timestamp': 1619159628100, 'position': {'x': 314, 'y': 220}}, {'timestamp': 1619159628203, 'position': {'x': 318, 'y': 220}}, {'timestamp': 1619159628300, 'position': {'x': 317, 'y': 221}}, {'timestamp': 1619159628600, 'position': {'x': 340, 'y': 217}}, {'timestamp': 1619159628700, 'position': {'x': 347, 'y': 217}}, {'timestamp': 1619159628900, 'position': {'x': 370, 'y': 217}}, {'timestamp': 1619159629000, 'position': {'x': 407, 'y': 218}}, {'timestamp': 1619159629104, 'position': {'x': 417, 'y': 216}}, {'timestamp': 1619159629300, 'position': {'x': 418, 'y': 217}}, {'timestamp': 1619159629400, 'position': {'x': 445, 'y': 216}}, {'timestamp': 1619159629500, 'position': {'x': 489, 'y': 217}}, {'timestamp': 1619159629600, 'position': {'x': 513, 'y': 217}}, {'timestamp': 1619159629703, 'position': {'x': 532, 'y': 217}}, {'timestamp': 1619159629900, 'position': {'x': 521, 'y': 216}}, {'timestamp': 1619159630001, 'position': {'x': 500, 'y': 217}}, {'timestamp': 1619159630099, 'position': {'x': 520, 'y': 217}}, {'timestamp': 1619159630200, 'position': {'x': 566, 'y': 219}}, {'timestamp': 1619159630299, 'position': {'x': 562, 'y': 218}}, {'timestamp': 1619159630400, 'position': {'x': 316, 'y': 215}}, {'timestamp': 1619159630500, 'position': {'x': 62, 'y': 249}}, {'timestamp': 1619159630600, 'position': {'x': 63, 'y': 250}}, {'timestamp': 1619159630699, 'position': {'x': 58, 'y': 265}}, {'timestamp': 1619159630800, 'position': {'x': 77, 'y': 280}}, {'timestamp': 1619159630902, 'position': {'x': 89, 'y': 282}}, {'timestamp': 1619159631099, 'position': {'x': 97, 'y': 281}}, {'timestamp': 1619159631199, 'position': {'x': 114, 'y': 274}}, {'timestamp': 1619159631299, 'position': {'x': 89, 'y': 263}}, {'timestamp': 1619159631399, 'position': {'x': 67, 'y': 275}}, {'timestamp': 1619159631499, 'position': {'x': 108, 'y': 283}}, {'timestamp': 1619159631599, 'position': {'x': 124, 'y': 276}}, {'timestamp': 1619159631699, 'position': {'x': 123, 'y': 277}}, {'timestamp': 1619159631799, 'position': {'x': 121, 'y': 277}}, {'timestamp': 1619159631899, 'position': {'x': 111, 'y': 274}}, {'timestamp': 1619159632004, 'position': {'x': 110, 'y': 274}}, {'timestamp': 1619159632099, 'position': {'x': 110, 'y': 273}}, {'timestamp': 1619159632199, 'position': {'x': 110, 'y': 269}}, {'timestamp': 1619159632299, 'position': {'x': 148, 'y': 270}}, {'timestamp': 1619159632400, 'position': {'x': 168, 'y': 269}}, {'timestamp': 1619159632499, 'position': {'x': 164, 'y': 266}}, {'timestamp': 1619159632607, 'position': {'x': 153, 'y': 261}}, {'timestamp': 1619159632699, 'position': {'x': 145, 'y': 260}}, {'timestamp': 1619159632799, 'position': {'x': 126, 'y': 262}}, {'timestamp': 1619159632899, 'position': {'x': 140, 'y': 262}}, {'timestamp': 1619159632999, 'position': {'x': 147, 'y': 260}}, {'timestamp': 1619159633099, 'position': {'x': 118, 'y': 256}}, {'timestamp': 1619159633199, 'position': {'x': 108, 'y': 255}}, {'timestamp': 1619159633301, 'position': {'x': 115, 'y': 256}}, {'timestamp': 1619159633399, 'position': {'x': 125, 'y': 258}}, {'timestamp': 1619159633499, 'position': {'x': 141, 'y': 258}}, {'timestamp': 1619159633599, 'position': {'x': 160, 'y': 254}}, {'timestamp': 1619159633699, 'position': {'x': 164, 'y': 254}}, {'timestamp': 1619159633799, 'position': {'x': 166, 'y': 254}}, {'timestamp': 1619159633902, 'position': {'x': 168, 'y': 254}}, {'timestamp': 1619159633999, 'position': {'x': 175, 'y': 255}}, {'timestamp': 1619159634099, 'position': {'x': 181, 'y': 258}}, {'timestamp': 1619159634201, 'position': {'x': 183, 'y': 259}}, {'timestamp': 1619159634299, 'position': {'x': 198, 'y': 262}}, {'timestamp': 1619159634399, 'position': {'x': 810, 'y': 252}}, {'timestamp': 1619159634502, 'position': {'x': 837, 'y': 247}}, {'timestamp': 1619159634699, 'position': {'x': 836, 'y': 245}}, {'timestamp': 1619159634798, 'position': {'x': 822, 'y': 233}}, {'timestamp': 1619159634899, 'position': {'x': 798, 'y': 221}}, {'timestamp': 1619159634999, 'position': {'x': 795, 'y': 220}}, {'timestamp': 1619159635099, 'position': {'x': 792, 'y': 217}}, {'timestamp': 1619159635199, 'position': {'x': 766, 'y': 219}}, {'timestamp': 1619159635299, 'position': {'x': 746, 'y': 227}}, {'timestamp': 1619159635499, 'position': {'x': 739, 'y': 227}}, {'timestamp': 1619159635599, 'position': {'x': 738, 'y': 230}}, {'timestamp': 1619159635701, 'position': {'x': 736, 'y': 234}}, {'timestamp': 1619159636001, 'position': {'x': 739, 'y': 235}}, {'timestamp': 1619159651697, 'position': {'x': 740, 'y': 232}}, {'timestamp': 1619159651797, 'position': {'x': 769, 'y': 71}}, {'timestamp': 1619159651897, 'position': {'x': 749, 'y': 88}}, {'timestamp': 1619159651997, 'position': {'x': 714, 'y': 121}}, {'timestamp': 1619159652097, 'position': {'x': 605, 'y': 179}}, {'timestamp': 1619159652201, 'position': {'x': 565, 'y': 197}}, {'timestamp': 1619159652398, 'position': {'x': 574, 'y': 194}}, {'timestamp': 1619159652497, 'position': {'x': 525, 'y': 209}}, {'timestamp': 1619159652597, 'position': {'x': 252, 'y': 228}}, {'timestamp': 1619159652699, 'position': {'x': 254, 'y': 226}}, {'timestamp': 1619159652797, 'position': {'x': 259, 'y': 222}}, {'timestamp': 1619159652897, 'position': {'x': 214, 'y': 191}}, {'timestamp': 1619159652997, 'position': {'x': 174, 'y': 181}}, {'timestamp': 1619159653097, 'position': {'x': 163, 'y': 196}}, {'timestamp': 1619159653197, 'position': {'x': 163, 'y': 189}}, {'timestamp': 1619159653297, 'position': {'x': 163, 'y': 173}}, {'timestamp': 1619159653397, 'position': {'x': 191, 'y': 188}}, {'timestamp': 1619159653497, 'position': {'x': 449, 'y': 211}}, {'timestamp': 1619159653597, 'position': {'x': 664, 'y': 194}}, {'timestamp': 1619159653696, 'position': {'x': 664, 'y': 189}}, {'timestamp': 1619159653797, 'position': {'x': 434, 'y': 147}}, {'timestamp': 1619159653901, 'position': {'x': 306, 'y': 134}}, {'timestamp': 1619159653997, 'position': {'x': 295, 'y': 135}}, {'timestamp': 1619159654097, 'position': {'x': 256, 'y': 149}}, {'timestamp': 1619159654197, 'position': {'x': 254, 'y': 149}}, {'timestamp': 1619159654297, 'position': {'x': 250, 'y': 145}}, {'timestamp': 1619159654396, 'position': {'x': 209, 'y': 157}}, {'timestamp': 1619159654497, 'position': {'x': 197, 'y': 156}}, {'timestamp': 1619159654596, 'position': {'x': 204, 'y': 157}}, {'timestamp': 1619159654697, 'position': {'x': 247, 'y': 155}}, {'timestamp': 1619159654797, 'position': {'x': 235, 'y': 157}}, {'timestamp': 1619159654897, 'position': {'x': 267, 'y': 155}}, {'timestamp': 1619159654996, 'position': {'x': 265, 'y': 156}}, {'timestamp': 1619159655099, 'position': {'x': 267, 'y': 156}}, {'timestamp': 1619159655396, 'position': {'x': 260, 'y': 164}}, {'timestamp': 1619159655497, 'position': {'x': 201, 'y': 244}}, {'timestamp': 1619159655597, 'position': {'x': 186, 'y': 256}}, {'timestamp': 1619159655697, 'position': {'x': 174, 'y': 257}}, {'timestamp': 1619159655796, 'position': {'x': 166, 'y': 267}}, {'timestamp': 1619159655897, 'position': {'x': 165, 'y': 256}}, {'timestamp': 1619159655997, 'position': {'x': 138, 'y': 246}}, {'timestamp': 1619159656097, 'position': {'x': 128, 'y': 275}}, {'timestamp': 1619159656197, 'position': {'x': 145, 'y': 269}}, {'timestamp': 1619159656296, 'position': {'x': 132, 'y': 241}}, {'timestamp': 1619159656396, 'position': {'x': 117, 'y': 280}}, {'timestamp': 1619159656496, 'position': {'x': 146, 'y': 282}}, {'timestamp': 1619159656596, 'position': {'x': 141, 'y': 237}}, {'timestamp': 1619159656696, 'position': {'x': 117, 'y': 276}}, {'timestamp': 1619159656796, 'position': {'x': 143, 'y': 291}}, {'timestamp': 1619159656897, 'position': {'x': 138, 'y': 236}}, {'timestamp': 1619159656996, 'position': {'x': 104, 'y': 295}}, {'timestamp': 1619159657097, 'position': {'x': 138, 'y': 299}}, {'timestamp': 1619159657198, 'position': {'x': 125, 'y': 300}}, {'timestamp': 1619159658296, 'position': {'x': 123, 'y': 291}}, {'timestamp': 1619159658397, 'position': {'x': 133, 'y': 275}}, {'timestamp': 1619159658498, 'position': {'x': 132, 'y': 264}}, {'timestamp': 1619159658596, 'position': {'x': 128, 'y': 262}}, {'timestamp': 1619159658697, 'position': {'x': 121, 'y': 261}}, {'timestamp': 1619159660496, 'position': {'x': 125, 'y': 256}}, {'timestamp': 1619159660696, 'position': {'x': 120, 'y': 269}}, {'timestamp': 1619159660796, 'position': {'x': 123, 'y': 272}}, {'timestamp': 1619159660896, 'position': {'x': 125, 'y': 263}}, {'timestamp': 1619159660996, 'position': {'x': 125, 'y': 262}}, {'timestamp': 1619159661096, 'position': {'x': 131, 'y': 249}}, {'timestamp': 1619159661196, 'position': {'x': 135, 'y': 223}}, {'timestamp': 1619159661298, 'position': {'x': 141, 'y': 202}}, {'timestamp': 1619159661496, 'position': {'x': 140, 'y': 210}}, {'timestamp': 1619159661597, 'position': {'x': 129, 'y': 222}}, {'timestamp': 1619159661696, 'position': {'x': 133, 'y': 220}}, {'timestamp': 1619159661797, 'position': {'x': 158, 'y': 217}}, {'timestamp': 1619159661896, 'position': {'x': 161, 'y': 216}}, {'timestamp': 1619159661998, 'position': {'x': 166, 'y': 216}}, {'timestamp': 1619159662096, 'position': {'x': 177, 'y': 217}}, {'timestamp': 1619159662196, 'position': {'x': 267, 'y': 216}}, {'timestamp': 1619159662296, 'position': {'x': 205, 'y': 212}}, {'timestamp': 1619159662396, 'position': {'x': 219, 'y': 216}}, {'timestamp': 1619159662496, 'position': {'x': 212, 'y': 214}}, {'timestamp': 1619159662598, 'position': {'x': 219, 'y': 216}}, {'timestamp': 1619159662696, 'position': {'x': 237, 'y': 219}}, {'timestamp': 1619159662797, 'position': {'x': 251, 'y': 218}}, {'timestamp': 1619159662896, 'position': {'x': 280, 'y': 219}}, {'timestamp': 1619159662996, 'position': {'x': 293, 'y': 218}}, {'timestamp': 1619159663096, 'position': {'x': 320, 'y': 216}}, {'timestamp': 1619159663196, 'position': {'x': 338, 'y': 216}}, {'timestamp': 1619159663296, 'position': {'x': 373, 'y': 218}}, {'timestamp': 1619159663396, 'position': {'x': 364, 'y': 214}}, {'timestamp': 1619159663496, 'position': {'x': 358, 'y': 220}}, {'timestamp': 1619159663596, 'position': {'x': 365, 'y': 216}}, {'timestamp': 1619159663697, 'position': {'x': 355, 'y': 217}}, {'timestamp': 1619159663797, 'position': {'x': 364, 'y': 215}}, {'timestamp': 1619159663897, 'position': {'x': 354, 'y': 213}}, {'timestamp': 1619159663996, 'position': {'x': 347, 'y': 221}}, {'timestamp': 1619159664096, 'position': {'x': 349, 'y': 220}}, {'timestamp': 1619159664196, 'position': {'x': 342, 'y': 228}}, {'timestamp': 1619159664296, 'position': {'x': 197, 'y': 293}}, {'timestamp': 1619159664396, 'position': {'x': 178, 'y': 286}}, {'timestamp': 1619159664496, 'position': {'x': 160, 'y': 284}}, {'timestamp': 1619159664601, 'position': {'x': 148, 'y': 286}}, {'timestamp': 1619159664696, 'position': {'x': 154, 'y': 285}}, {'timestamp': 1619159664796, 'position': {'x': 151, 'y': 283}}, {'timestamp': 1619159664896, 'position': {'x': 131, 'y': 289}}, {'timestamp': 1619159664996, 'position': {'x': 140, 'y': 289}}, {'timestamp': 1619159665097, 'position': {'x': 145, 'y': 289}}, {'timestamp': 1619159665196, 'position': {'x': 148, 'y': 286}}, {'timestamp': 1619159665296, 'position': {'x': 156, 'y': 285}}, {'timestamp': 1619159665396, 'position': {'x': 153, 'y': 289}}, {'timestamp': 1619159665496, 'position': {'x': 158, 'y': 288}}, {'timestamp': 1619159665597, 'position': {'x': 160, 'y': 286}}, {'timestamp': 1619159665799, 'position': {'x': 160, 'y': 287}}, {'timestamp': 1619159665896, 'position': {'x': 154, 'y': 292}}, {'timestamp': 1619159665996, 'position': {'x': 87, 'y': 302}}, {'timestamp': 1619159666096, 'position': {'x': 83, 'y': 295}}, {'timestamp': 1619159666196, 'position': {'x': 79, 'y': 295}}, {'timestamp': 1619159666296, 'position': {'x': 69, 'y': 297}}, {'timestamp': 1619159666396, 'position': {'x': 63, 'y': 297}}, {'timestamp': 1619159666496, 'position': {'x': 72, 'y': 308}}, {'timestamp': 1619159666596, 'position': {'x': 77, 'y': 296}}, {'timestamp': 1619159666696, 'position': {'x': 70, 'y': 300}}, {'timestamp': 1619159666796, 'position': {'x': 76, 'y': 303}}, {'timestamp': 1619159666896, 'position': {'x': 74, 'y': 302}}, {'timestamp': 1619159666996, 'position': {'x': 74, 'y': 303}}, {'timestamp': 1619159667096, 'position': {'x': 74, 'y': 304}}, {'timestamp': 1619159667297, 'position': {'x': 75, 'y': 304}}, {'timestamp': 1619159667399, 'position': {'x': 74, 'y': 305}}, {'timestamp': 1619159667496, 'position': {'x': 87, 'y': 307}}, {'timestamp': 1619159667596, 'position': {'x': 97, 'y': 305}}, {'timestamp': 1619159667696, 'position': {'x': 145, 'y': 296}}, {'timestamp': 1619159667797, 'position': {'x': 157, 'y': 288}}, {'timestamp': 1619159667896, 'position': {'x': 141, 'y': 273}}, {'timestamp': 1619159667996, 'position': {'x': 129, 'y': 272}}, {'timestamp': 1619159668099, 'position': {'x': 115, 'y': 271}}, {'timestamp': 1619159668196, 'position': {'x': 114, 'y': 269}}, {'timestamp': 1619159668296, 'position': {'x': 115, 'y': 266}}, {'timestamp': 1619159668397, 'position': {'x': 117, 'y': 264}}, {'timestamp': 1619159668496, 'position': {'x': 113, 'y': 256}}, {'timestamp': 1619159668596, 'position': {'x': 112, 'y': 243}}, {'timestamp': 1619159668696, 'position': {'x': 150, 'y': 244}}, {'timestamp': 1619159668797, 'position': {'x': 171, 'y': 242}}, {'timestamp': 1619159668896, 'position': {'x': 169, 'y': 241}}, {'timestamp': 1619159668996, 'position': {'x': 704, 'y': 237}}, {'timestamp': 1619159669096, 'position': {'x': 889, 'y': 226}}, {'timestamp': 1619159669196, 'position': {'x': 867, 'y': 225}}, {'timestamp': 1619159669296, 'position': {'x': 834, 'y': 225}}, {'timestamp': 1619159669396, 'position': {'x': 788, 'y': 223}}, {'timestamp': 1619159669496, 'position': {'x': 774, 'y': 222}}, {'timestamp': 1619159669597, 'position': {'x': 784, 'y': 218}}, {'timestamp': 1619159669699, 'position': {'x': 787, 'y': 216}}, {'timestamp': 1619159669797, 'position': {'x': 775, 'y': 218}}, {'timestamp': 1619159669897, 'position': {'x': 749, 'y': 224}}, {'timestamp': 1619159670000, 'position': {'x': 733, 'y': 226}}, {'timestamp': 1619159670397, 'position': {'x': 732, 'y': 226}}, {'timestamp': 1619159670497, 'position': {'x': 718, 'y': 225}}, {'timestamp': 1619159670597, 'position': {'x': 708, 'y': 225}}, {'timestamp': 1619159670696, 'position': {'x': 703, 'y': 224}}, {'timestamp': 1619159670798, 'position': {'x': 702, 'y': 223}}, {'timestamp': 1619159670898, 'position': {'x': 701, 'y': 223}}, {'timestamp': 1619159670996, 'position': {'x': 700, 'y': 223}}, {'timestamp': 1619159671098, 'position': {'x': 698, 'y': 224}}, {'timestamp': 1619159671296, 'position': {'x': 697, 'y': 223}}, {'timestamp': 1619159671396, 'position': {'x': 696, 'y': 223}}, {'timestamp': 1619159671496, 'position': {'x': 694, 'y': 224}}, {'timestamp': 1619159671896, 'position': {'x': 778, 'y': 219}}, {'timestamp': 1619159671996, 'position': {'x': 891, 'y': 211}}, {'timestamp': 1619159752795, 'position': {'x': 921, 'y': 55}}, {'timestamp': 1619159752895, 'position': {'x': 893, 'y': 519}}, {'timestamp': 1619159752996, 'position': {'x': 917, 'y': 690}}, {'timestamp': 1619159753095, 'position': {'x': 899, 'y': 678}}, {'timestamp': 1619159753195, 'position': {'x': 707, 'y': 733}}, {'timestamp': 1619159753295, 'position': {'x': 648, 'y': 776}}, {'timestamp': 1619159753395, 'position': {'x': 646, 'y': 776}}, {'timestamp': 1619159753495, 'position': {'x': 693, 'y': 767}}, {'timestamp': 1619159753598, 'position': {'x': 702, 'y': 762}}, {'timestamp': 1619159753695, 'position': {'x': 702, 'y': 761}}, {'timestamp': 1619159753796, 'position': {'x': 702, 'y': 752}}, {'timestamp': 1619159754395, 'position': {'x': 860, 'y': 512}}, {'timestamp': 1619159754495, 'position': {'x': 823, 'y': 413}}, {'timestamp': 1619159754596, 'position': {'x': 806, 'y': 383}}, {'timestamp': 1619159754895, 'position': {'x': 626, 'y': 419}}, {'timestamp': 1619159754995, 'position': {'x': 442, 'y': 460}}, {'timestamp': 1619159755099, 'position': {'x': 457, 'y': 456}}, {'timestamp': 1619159755295, 'position': {'x': 458, 'y': 455}}, {'timestamp': 1619159755396, 'position': {'x': 449, 'y': 450}}, {'timestamp': 1619159755496, 'position': {'x': 445, 'y': 446}}, {'timestamp': 1619159755599, 'position': {'x': 435, 'y': 439}}, {'timestamp': 1619159755695, 'position': {'x': 415, 'y': 425}}, {'timestamp': 1619159755798, 'position': {'x': 421, 'y': 409}}, {'timestamp': 1619159755995, 'position': {'x': 416, 'y': 404}}, {'timestamp': 1619159756095, 'position': {'x': 250, 'y': 255}}, {'timestamp': 1619159756196, 'position': {'x': 212, 'y': 188}}, {'timestamp': 1619159756295, 'position': {'x': 213, 'y': 187}}, {'timestamp': 1619159756395, 'position': {'x': 215, 'y': 189}}, {'timestamp': 1619159756499, 'position': {'x': 218, 'y': 196}}, {'timestamp': 1619159756595, 'position': {'x': 217, 'y': 201}}, {'timestamp': 1619159756695, 'position': {'x': 221, 'y': 231}}, {'timestamp': 1619159756795, 'position': {'x': 290, 'y': 341}}, {'timestamp': 1619159756898, 'position': {'x': 294, 'y': 349}}, {'timestamp': 1619159756995, 'position': {'x': 291, 'y': 350}}, {'timestamp': 1619159757095, 'position': {'x': 281, 'y': 350}}, {'timestamp': 1619159757195, 'position': {'x': 259, 'y': 363}}, {'timestamp': 1619159757295, 'position': {'x': 221, 'y': 365}}, {'timestamp': 1619159757395, 'position': {'x': 207, 'y': 367}}, {'timestamp': 1619159757495, 'position': {'x': 205, 'y': 363}}, {'timestamp': 1619159757595, 'position': {'x': 179, 'y': 358}}, {'timestamp': 1619159757695, 'position': {'x': 157, 'y': 355}}, {'timestamp': 1619159757795, 'position': {'x': 140, 'y': 350}}, {'timestamp': 1619159757895, 'position': {'x': 133, 'y': 347}}, {'timestamp': 1619159757995, 'position': {'x': 132, 'y': 344}}, {'timestamp': 1619159758095, 'position': {'x': 133, 'y': 341}}, {'timestamp': 1619159758196, 'position': {'x': 134, 'y': 337}}, {'timestamp': 1619159758295, 'position': {'x': 136, 'y': 334}}, {'timestamp': 1619159758495, 'position': {'x': 140, 'y': 333}}, {'timestamp': 1619159758595, 'position': {'x': 207, 'y': 334}}, {'timestamp': 1619159758695, 'position': {'x': 242, 'y': 334}}, {'timestamp': 1619159759095, 'position': {'x': 287, 'y': 338}}, {'timestamp': 1619159759195, 'position': {'x': 219, 'y': 334}}, {'timestamp': 1619159759297, 'position': {'x': 156, 'y': 330}}, {'timestamp': 1619159759395, 'position': {'x': 260, 'y': 338}}, {'timestamp': 1619159759495, 'position': {'x': 259, 'y': 337}}, {'timestamp': 1619159759595, 'position': {'x': 172, 'y': 327}}, {'timestamp': 1619159759695, 'position': {'x': 222, 'y': 330}}, {'timestamp': 1619159759798, 'position': {'x': 212, 'y': 329}}, {'timestamp': 1619159759995, 'position': {'x': 418, 'y': 333}}, {'timestamp': 1619159760095, 'position': {'x': 871, 'y': 311}}, {'timestamp': 1619159760195, 'position': {'x': 877, 'y': 305}}, {'timestamp': 1619159760295, 'position': {'x': 885, 'y': 277}}, {'timestamp': 1619159760395, 'position': {'x': 830, 'y': 214}}, {'timestamp': 1619159760499, 'position': {'x': 819, 'y': 204}}, {'timestamp': 1619159760695, 'position': {'x': 808, 'y': 205}}, {'timestamp': 1619159760799, 'position': {'x': 792, 'y': 209}}, {'timestamp': 1619159760895, 'position': {'x': 783, 'y': 206}}, {'timestamp': 1619159760996, 'position': {'x': 781, 'y': 204}}, {'timestamp': 1619159761796, 'position': {'x': 781, 'y': 206}}, {'timestamp': 1619159761897, 'position': {'x': 780, 'y': 209}}, {'timestamp': 1619159763197, 'position': {'x': 779, 'y': 213}}, {'timestamp': 1619159763295, 'position': {'x': 773, 'y': 219}}, {'timestamp': 1619159763396, 'position': {'x': 757, 'y': 223}}, {'timestamp': 1619159763496, 'position': {'x': 748, 'y': 224}}, {'timestamp': 1619159763598, 'position': {'x': 747, 'y': 224}}, {'timestamp': 1619159764295, 'position': {'x': 747, 'y': 229}}, {'timestamp': 1619159764396, 'position': {'x': 747, 'y': 235}}, {'timestamp': 1619159764499, 'position': {'x': 747, 'y': 236}}, {'timestamp': 1619159764795, 'position': {'x': 739, 'y': 237}}, {'timestamp': 1619159764898, 'position': {'x': 736, 'y': 239}}, {'timestamp': 1619159766995, 'position': {'x': 737, 'y': 240}}, {'timestamp': 1619159767095, 'position': {'x': 753, 'y': 247}}, {'timestamp': 1619159767195, 'position': {'x': 743, 'y': 253}}, {'timestamp': 1619159767295, 'position': {'x': 742, 'y': 256}}, {'timestamp': 1619159767397, 'position': {'x': 743, 'y': 256}}, {'timestamp': 1619159768595, 'position': {'x': 739, 'y': 264}}, {'timestamp': 1619159768695, 'position': {'x': 618, 'y': 396}}, {'timestamp': 1619159768798, 'position': {'x': 604, 'y': 406}}, {'timestamp': 1619159768895, 'position': {'x': 606, 'y': 411}}, {'timestamp': 1619159768995, 'position': {'x': 606, 'y': 409}}, {'timestamp': 1619159769097, 'position': {'x': 663, 'y': 329}}, {'timestamp': 1619159769195, 'position': {'x': 724, 'y': 215}}, {'timestamp': 1619159769296, 'position': {'x': 744, 'y': 208}}, {'timestamp': 1619159769395, 'position': {'x': 781, 'y': 241}}, {'timestamp': 1619159769495, 'position': {'x': 762, 'y': 331}}, {'timestamp': 1619159769596, 'position': {'x': 683, 'y': 274}}, {'timestamp': 1619159769696, 'position': {'x': 671, 'y': 152}}, {'timestamp': 1619159769795, 'position': {'x': 777, 'y': 190}}, {'timestamp': 1619159769895, 'position': {'x': 779, 'y': 264}}, {'timestamp': 1619159769996, 'position': {'x': 657, 'y': 219}}, {'timestamp': 1619159770095, 'position': {'x': 693, 'y': 186}}, {'timestamp': 1619159770195, 'position': {'x': 795, 'y': 266}}, {'timestamp': 1619159770295, 'position': {'x': 775, 'y': 254}}, {'timestamp': 1619159770398, 'position': {'x': 775, 'y': 253}}, {'timestamp': 1619159770695, 'position': {'x': 774, 'y': 253}}, {'timestamp': 1619159770797, 'position': {'x': 774, 'y': 250}}, {'timestamp': 1619159772295, 'position': {'x': 774, 'y': 249}}, {'timestamp': 1619159772397, 'position': {'x': 775, 'y': 244}}, {'timestamp': 1619159772696, 'position': {'x': 774, 'y': 247}}, {'timestamp': 1619159772797, 'position': {'x': 772, 'y': 248}}, {'timestamp': 1619159772998, 'position': {'x': 771, 'y': 248}}, {'timestamp': 1619159787495, 'position': {'x': 756, 'y': 261}}, {'timestamp': 1619159787595, 'position': {'x': 744, 'y': 287}}, {'timestamp': 1619159787695, 'position': {'x': 753, 'y': 270}}, {'timestamp': 1619159787798, 'position': {'x': 759, 'y': 263}}, {'timestamp': 1619159788397, 'position': {'x': 789, 'y': 262}}, {'timestamp': 1619159788498, 'position': {'x': 799, 'y': 261}}, {'timestamp': 1619159811295, 'position': {'x': 883, 'y': 160}}, {'timestamp': 1619159811395, 'position': {'x': 903, 'y': 154}}, {'timestamp': 1619159811495, 'position': {'x': 781, 'y': 539}}, {'timestamp': 1619159811595, 'position': {'x': 677, 'y': 923}}, {'timestamp': 1619159811695, 'position': {'x': 674, 'y': 918}}, {'timestamp': 1619159811794, 'position': {'x': 677, 'y': 892}}, {'timestamp': 1619159811895, 'position': {'x': 681, 'y': 868}}, {'timestamp': 1619159811995, 'position': {'x': 714, 'y': 771}}, {'timestamp': 1619159812096, 'position': {'x': 717, 'y': 755}}, {'timestamp': 1619159812196, 'position': {'x': 716, 'y': 753}}, {'timestamp': 1619159812297, 'position': {'x': 715, 'y': 753}}], 'task_id': 'python:task:15'}	7
14	06:37:16.197109	{'jsonrpc': '2.0', 'method': '/program/PPP/12', 'params': ['\\n# Funcion que ordena una lista, puedes utilizar sort()\\ndef solution(lista):\\n    if lista is not None:\\n        lista.sort()\\n        return lista\\n    else:    \\n        return []\\n'], 'id': 7, 'keypresses': [{'timestamp': 1619159673347, 'keycode': 73, 'type': 'keydown'}, {'timestamp': 1619159673460, 'keycode': 73, 'type': 'keyup'}, {'timestamp': 1619159674162, 'keycode': 70, 'type': 'keydown'}, {'timestamp': 1619159674286, 'keycode': 70, 'type': 'keyup'}, {'timestamp': 1619159674385, 'keycode': 32, 'type': 'keydown'}, {'timestamp': 1619159674519, 'keycode': 32, 'type': 'keyup'}, {'timestamp': 1619159675472, 'keycode': 76, 'type': 'keydown'}, {'timestamp': 1619159675586, 'keycode': 76, 'type': 'keyup'}, {'timestamp': 1619159675745, 'keycode': 73, 'type': 'keydown'}, {'timestamp': 1619159675821, 'keycode': 73, 'type': 'keyup'}, {'timestamp': 1619159676520, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619159676714, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619159678701, 'keycode': 76, 'type': 'keydown'}, {'timestamp': 1619159678823, 'keycode': 76, 'type': 'keyup'}, {'timestamp': 1619159678981, 'keycode': 73, 'type': 'keydown'}, {'timestamp': 1619159679051, 'keycode': 73, 'type': 'keyup'}, {'timestamp': 1619159679122, 'keycode': 83, 'type': 'keydown'}, {'timestamp': 1619159679224, 'keycode': 83, 'type': 'keyup'}, {'timestamp': 1619159679922, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1619159680116, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1619159680120, 'keycode': 69, 'type': 'keydown'}, {'timestamp': 1619159680264, 'keycode': 69, 'type': 'keyup'}, {'timestamp': 1619159680389, 'keycode': 32, 'type': 'keydown'}, {'timestamp': 1619159680494, 'keycode': 32, 'type': 'keyup'}, {'timestamp': 1619159681343, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619159681510, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619159681688, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619159681863, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619159682050, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619159682252, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619159689481, 'keycode': 76, 'type': 'keydown'}, {'timestamp': 1619159689589, 'keycode': 76, 'type': 'keyup'}, {'timestamp': 1619159689764, 'keycode': 73, 'type': 'keydown'}, {'timestamp': 1619159689852, 'keycode': 73, 'type': 'keyup'}, {'timestamp': 1619159689959, 'keycode': 83, 'type': 'keydown'}, {'timestamp': 1619159690104, 'keycode': 83, 'type': 'keyup'}, {'timestamp': 1619159690709, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1619159690826, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1619159690966, 'keycode': 65, 'type': 'keydown'}, {'timestamp': 1619159691135, 'keycode': 65, 'type': 'keyup'}, {'timestamp': 1619159691217, 'keycode': 32, 'type': 'keydown'}, {'timestamp': 1619159691254, 'keycode': 32, 'type': 'keyup'}, {'timestamp': 1619159692178, 'keycode': 73, 'type': 'keydown'}, {'timestamp': 1619159692271, 'keycode': 73, 'type': 'keyup'}, {'timestamp': 1619159692482, 'keycode': 83, 'type': 'keydown'}, {'timestamp': 1619159692575, 'keycode': 83, 'type': 'keyup'}, {'timestamp': 1619159692619, 'keycode': 32, 'type': 'keydown'}, {'timestamp': 1619159692737, 'keycode': 32, 'type': 'keyup'}, {'timestamp': 1619159692905, 'keycode': 78, 'type': 'keydown'}, {'timestamp': 1619159692979, 'keycode': 78, 'type': 'keyup'}, {'timestamp': 1619159693451, 'keycode': 79, 'type': 'keydown'}, {'timestamp': 1619159693539, 'keycode': 79, 'type': 'keyup'}, {'timestamp': 1619159693734, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1619159693861, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1619159693864, 'keycode': 32, 'type': 'keydown'}, {'timestamp': 1619159693969, 'keycode': 32, 'type': 'keyup'}, {'timestamp': 1619159694108, 'keycode': 16, 'type': 'keydown'}, {'timestamp': 1619159694279, 'keycode': 78, 'type': 'keydown'}, {'timestamp': 1619159694366, 'keycode': 78, 'type': 'keyup'}, {'timestamp': 1619159694518, 'keycode': 16, 'type': 'keyup'}, {'timestamp': 1619159694745, 'keycode': 79, 'type': 'keydown'}, {'timestamp': 1619159694858, 'keycode': 79, 'type': 'keyup'}, {'timestamp': 1619159696156, 'keycode': 78, 'type': 'keydown'}, {'timestamp': 1619159696242, 'keycode': 78, 'type': 'keyup'}, {'timestamp': 1619159696378, 'keycode': 69, 'type': 'keydown'}, {'timestamp': 1619159696518, 'keycode': 69, 'type': 'keyup'}, {'timestamp': 1619159697234, 'keycode': 16, 'type': 'keydown'}, {'timestamp': 1619159698339, 'keycode': 186, 'type': 'keydown'}, {'timestamp': 1619159698415, 'keycode': 186, 'type': 'keyup'}, {'timestamp': 1619159698527, 'keycode': 16, 'type': 'keyup'}, {'timestamp': 1619159698974, 'keycode': 13, 'type': 'keydown'}, {'timestamp': 1619159699080, 'keycode': 13, 'type': 'keyup'}, {'timestamp': 1619159701169, 'keycode': 76, 'type': 'keydown'}, {'timestamp': 1619159701265, 'keycode': 76, 'type': 'keyup'}, {'timestamp': 1619159701416, 'keycode': 73, 'type': 'keydown'}, {'timestamp': 1619159701481, 'keycode': 73, 'type': 'keyup'}, {'timestamp': 1619159701582, 'keycode': 83, 'type': 'keydown'}, {'timestamp': 1619159701708, 'keycode': 83, 'type': 'keyup'}, {'timestamp': 1619159701858, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1619159701930, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1619159702071, 'keycode': 65, 'type': 'keydown'}, {'timestamp': 1619159702147, 'keycode': 65, 'type': 'keyup'}, {'timestamp': 1619159703359, 'keycode': 188, 'type': 'keydown'}, {'timestamp': 1619159703438, 'keycode': 188, 'type': 'keyup'}, {'timestamp': 1619159704671, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619159705449, 'keycode': 190, 'type': 'keydown'}, {'timestamp': 1619159705543, 'keycode': 190, 'type': 'keyup'}, {'timestamp': 1619159705915, 'keycode': 83, 'type': 'keydown'}, {'timestamp': 1619159706099, 'keycode': 83, 'type': 'keyup'}, {'timestamp': 1619159706321, 'keycode': 79, 'type': 'keydown'}, {'timestamp': 1619159706423, 'keycode': 79, 'type': 'keyup'}, {'timestamp': 1619159706991, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1619159707175, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1619159707192, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1619159707291, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1619159707604, 'keycode': 16, 'type': 'keydown'}, {'timestamp': 1619159708047, 'keycode': 57, 'type': 'keydown'}, {'timestamp': 1619159708142, 'keycode': 48, 'type': 'keydown'}, {'timestamp': 1619159708199, 'keycode': 57, 'type': 'keyup'}, {'timestamp': 1619159708238, 'keycode': 48, 'type': 'keyup'}, {'timestamp': 1619159708265, 'keycode': 16, 'type': 'keyup'}, {'timestamp': 1619159709057, 'keycode': 13, 'type': 'keydown'}, {'timestamp': 1619159709191, 'keycode': 13, 'type': 'keyup'}, {'timestamp': 1619159709989, 'keycode': 38, 'type': 'keyup'}, {'timestamp': 1619159712001, 'keycode': 40, 'type': 'keyup'}, {'timestamp': 1619159712292, 'keycode': 38, 'type': 'keyup'}, {'timestamp': 1619159712998, 'keycode': 40, 'type': 'keyup'}, {'timestamp': 1619159717026, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1619159717187, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1619159717216, 'keycode': 69, 'type': 'keydown'}, {'timestamp': 1619159717334, 'keycode': 69, 'type': 'keyup'}, {'timestamp': 1619159717492, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1619159717641, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1619159717837, 'keycode': 85, 'type': 'keydown'}, {'timestamp': 1619159717936, 'keycode': 85, 'type': 'keyup'}, {'timestamp': 1619159717995, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1619159718076, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1619159718137, 'keycode': 78, 'type': 'keydown'}, {'timestamp': 1619159718211, 'keycode': 78, 'type': 'keyup'}, {'timestamp': 1619159718427, 'keycode': 32, 'type': 'keydown'}, {'timestamp': 1619159718532, 'keycode': 32, 'type': 'keyup'}, {'timestamp': 1619159719330, 'keycode': 76, 'type': 'keydown'}, {'timestamp': 1619159719422, 'keycode': 76, 'type': 'keyup'}, {'timestamp': 1619159719612, 'keycode': 73, 'type': 'keydown'}, {'timestamp': 1619159719690, 'keycode': 73, 'type': 'keyup'}, {'timestamp': 1619159719718, 'keycode': 83, 'type': 'keydown'}, {'timestamp': 1619159719822, 'keycode': 83, 'type': 'keyup'}, {'timestamp': 1619159720016, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1619159720136, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1619159720272, 'keycode': 65, 'type': 'keydown'}, {'timestamp': 1619159720407, 'keycode': 65, 'type': 'keyup'}, {'timestamp': 1619159721660, 'keycode': 13, 'type': 'keydown'}, {'timestamp': 1619159721816, 'keycode': 13, 'type': 'keyup'}, {'timestamp': 1619159722270, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619159723024, 'keycode': 69, 'type': 'keydown'}, {'timestamp': 1619159723132, 'keycode': 69, 'type': 'keyup'}, {'timestamp': 1619159723273, 'keycode': 76, 'type': 'keydown'}, {'timestamp': 1619159723352, 'keycode': 76, 'type': 'keyup'}, {'timestamp': 1619159723372, 'keycode': 83, 'type': 'keydown'}, {'timestamp': 1619159723462, 'keycode': 83, 'type': 'keyup'}, {'timestamp': 1619159723592, 'keycode': 69, 'type': 'keydown'}, {'timestamp': 1619159723660, 'keycode': 69, 'type': 'keyup'}, {'timestamp': 1619159724036, 'keycode': 16, 'type': 'keydown'}, {'timestamp': 1619159725220, 'keycode': 186, 'type': 'keydown'}, {'timestamp': 1619159725282, 'keycode': 186, 'type': 'keyup'}, {'timestamp': 1619159725455, 'keycode': 16, 'type': 'keyup'}, {'timestamp': 1619159725737, 'keycode': 13, 'type': 'keydown'}, {'timestamp': 1619159725860, 'keycode': 13, 'type': 'keyup'}, {'timestamp': 1619159726689, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1619159726833, 'keycode': 69, 'type': 'keydown'}, {'timestamp': 1619159726837, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1619159726942, 'keycode': 69, 'type': 'keyup'}, {'timestamp': 1619159727073, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1619159727214, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1619159727426, 'keycode': 85, 'type': 'keydown'}, {'timestamp': 1619159727521, 'keycode': 85, 'type': 'keyup'}, {'timestamp': 1619159727707, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1619159727818, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1619159727874, 'keycode': 78, 'type': 'keydown'}, {'timestamp': 1619159727949, 'keycode': 78, 'type': 'keyup'}, {'timestamp': 1619159728182, 'keycode': 32, 'type': 'keydown'}, {'timestamp': 1619159728243, 'keycode': 32, 'type': 'keyup'}, {'timestamp': 1619159738792, 'keycode': 16, 'type': 'keydown'}, {'timestamp': 1619159739190, 'keycode': 38, 'type': 'keyup'}, {'timestamp': 1619159739852, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1619159740051, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1619159740249, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1619159740434, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1619159740661, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1619159741181, 'keycode': 38, 'type': 'keyup'}, {'timestamp': 1619159741438, 'keycode': 16, 'type': 'keyup'}, {'timestamp': 1619159741813, 'keycode': 46, 'type': 'keyup'}, {'timestamp': 1619159743518, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1619159743738, 'keycode': 69, 'type': 'keydown'}, {'timestamp': 1619159743782, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1619159743878, 'keycode': 69, 'type': 'keyup'}, {'timestamp': 1619159744683, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1619159744820, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1619159744957, 'keycode': 85, 'type': 'keydown'}, {'timestamp': 1619159745043, 'keycode': 85, 'type': 'keyup'}, {'timestamp': 1619159745120, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1619159745236, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1619159745380, 'keycode': 78, 'type': 'keydown'}, {'timestamp': 1619159745510, 'keycode': 78, 'type': 'keyup'}, {'timestamp': 1619159745749, 'keycode': 32, 'type': 'keydown'}, {'timestamp': 1619159745825, 'keycode': 32, 'type': 'keyup'}, {'timestamp': 1619159747424, 'keycode': 76, 'type': 'keydown'}, {'timestamp': 1619159747508, 'keycode': 76, 'type': 'keyup'}, {'timestamp': 1619159747682, 'keycode': 73, 'type': 'keydown'}, {'timestamp': 1619159747742, 'keycode': 73, 'type': 'keyup'}, {'timestamp': 1619159747810, 'keycode': 83, 'type': 'keydown'}, {'timestamp': 1619159747907, 'keycode': 83, 'type': 'keyup'}, {'timestamp': 1619159748107, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1619159748219, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1619159748347, 'keycode': 65, 'type': 'keydown'}, {'timestamp': 1619159748441, 'keycode': 65, 'type': 'keyup'}, {'timestamp': 1619159785900, 'keycode': 8, 'type': 'keydown'}, {'timestamp': 1619159785959, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619159786127, 'keycode': 8, 'type': 'keydown'}, {'timestamp': 1619159786207, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619159788889, 'keycode': 16, 'type': 'keydown'}, {'timestamp': 1619159789272, 'keycode': 78, 'type': 'keydown'}, {'timestamp': 1619159789374, 'keycode': 78, 'type': 'keyup'}, {'timestamp': 1619159789376, 'keycode': 16, 'type': 'keyup'}, {'timestamp': 1619159789578, 'keycode': 79, 'type': 'keydown'}, {'timestamp': 1619159789703, 'keycode': 79, 'type': 'keyup'}, {'timestamp': 1619159789797, 'keycode': 78, 'type': 'keydown'}, {'timestamp': 1619159789896, 'keycode': 78, 'type': 'keyup'}, {'timestamp': 1619159790048, 'keycode': 69, 'type': 'keydown'}, {'timestamp': 1619159790160, 'keycode': 69, 'type': 'keyup'}, {'timestamp': 1619159790993, 'keycode': 38, 'type': 'keyup'}, {'timestamp': 1619159791517, 'keycode': 39, 'type': 'keyup'}, {'timestamp': 1619159791697, 'keycode': 39, 'type': 'keyup'}, {'timestamp': 1619159791864, 'keycode': 39, 'type': 'keyup'}, {'timestamp': 1619159792055, 'keycode': 39, 'type': 'keyup'}, {'timestamp': 1619159792496, 'keycode': 39, 'type': 'keyup'}, {'timestamp': 1619159792797, 'keycode': 13, 'type': 'keydown'}, {'timestamp': 1619159792903, 'keycode': 13, 'type': 'keyup'}, {'timestamp': 1619159793727, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1619159794466, 'keycode': 69, 'type': 'keydown'}, {'timestamp': 1619159794598, 'keycode': 69, 'type': 'keyup'}, {'timestamp': 1619159794787, 'keycode': 76, 'type': 'keydown'}, {'timestamp': 1619159794866, 'keycode': 76, 'type': 'keyup'}, {'timestamp': 1619159794871, 'keycode': 83, 'type': 'keydown'}, {'timestamp': 1619159794963, 'keycode': 83, 'type': 'keyup'}, {'timestamp': 1619159795095, 'keycode': 69, 'type': 'keydown'}, {'timestamp': 1619159795189, 'keycode': 69, 'type': 'keyup'}, {'timestamp': 1619159795683, 'keycode': 16, 'type': 'keydown'}, {'timestamp': 1619159796204, 'keycode': 186, 'type': 'keydown'}, {'timestamp': 1619159796268, 'keycode': 186, 'type': 'keyup'}, {'timestamp': 1619159796313, 'keycode': 16, 'type': 'keyup'}, {'timestamp': 1619159796976, 'keycode': 40, 'type': 'keyup'}, {'timestamp': 1619159797202, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1619159797381, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1619159797553, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1619159797729, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1619159798110, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1619159798521, 'keycode': 9, 'type': 'keyup'}, {'timestamp': 1619159798629, 'keycode': 9, 'type': 'keyup'}, {'timestamp': 1619159799516, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619159800507, 'keycode': 38, 'type': 'keyup'}, {'timestamp': 1619159800898, 'keycode': 38, 'type': 'keyup'}, {'timestamp': 1619159803058, 'keycode': 35, 'type': 'keyup'}, {'timestamp': 1619159803398, 'keycode': 13, 'type': 'keydown'}, {'timestamp': 1619159803467, 'keycode': 13, 'type': 'keyup'}, {'timestamp': 1619159804306, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1619159804478, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1619159804492, 'keycode': 69, 'type': 'keydown'}, {'timestamp': 1619159804610, 'keycode': 69, 'type': 'keyup'}, {'timestamp': 1619159804797, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1619159804933, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1619159805163, 'keycode': 85, 'type': 'keydown'}, {'timestamp': 1619159805260, 'keycode': 85, 'type': 'keyup'}, {'timestamp': 1619159805363, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1619159805470, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1619159805504, 'keycode': 78, 'type': 'keydown'}, {'timestamp': 1619159805585, 'keycode': 78, 'type': 'keyup'}, {'timestamp': 1619159805749, 'keycode': 32, 'type': 'keydown'}, {'timestamp': 1619159805839, 'keycode': 32, 'type': 'keyup'}, {'timestamp': 1619159809762, 'keycode': 76, 'type': 'keydown'}, {'timestamp': 1619159809863, 'keycode': 76, 'type': 'keyup'}, {'timestamp': 1619159809999, 'keycode': 73, 'type': 'keydown'}, {'timestamp': 1619159810081, 'keycode': 73, 'type': 'keyup'}, {'timestamp': 1619159810179, 'keycode': 83, 'type': 'keydown'}, {'timestamp': 1619159810322, 'keycode': 83, 'type': 'keyup'}, {'timestamp': 1619159810407, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1619159810476, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1619159810548, 'keycode': 65, 'type': 'keydown'}, {'timestamp': 1619159810613, 'keycode': 65, 'type': 'keyup'}, {'timestamp': 1619159830930, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1619159831223, 'keycode': 46, 'type': 'keyup'}, {'timestamp': 1619159831411, 'keycode': 46, 'type': 'keyup'}, {'timestamp': 1619159831588, 'keycode': 46, 'type': 'keyup'}, {'timestamp': 1619159831835, 'keycode': 46, 'type': 'keyup'}, {'timestamp': 1619159832598, 'keycode': 219, 'type': 'keydown'}, {'timestamp': 1619159832720, 'keycode': 219, 'type': 'keyup'}, {'timestamp': 1619159832856, 'keycode': 221, 'type': 'keydown'}, {'timestamp': 1619159832923, 'keycode': 221, 'type': 'keyup'}], 'mousepresses': [{'timestamp': 1619159635714, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619159635887, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619159670146, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619159671751, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619159754048, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619159754194, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619159787967, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619159788072, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619159788178, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619159788299, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619159812374, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619159812471, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619159822740, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619159822861, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619159829928, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619159830024, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619159834111, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619159834244, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619159835692, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619159835791, 'mousecode': 1, 'type': 'mouseup'}], 'mousemovement': [{'timestamp': 1619159617802, 'position': []}, {'timestamp': 1619159618402, 'position': {'x': 976, 'y': 387}}, {'timestamp': 1619159618504, 'position': {'x': 981, 'y': 384}}, {'timestamp': 1619159618702, 'position': {'x': 991, 'y': 385}}, {'timestamp': 1619159618801, 'position': {'x': 982, 'y': 376}}, {'timestamp': 1619159618901, 'position': {'x': 564, 'y': 299}}, {'timestamp': 1619159619002, 'position': {'x': 187, 'y': 252}}, {'timestamp': 1619159619202, 'position': {'x': 185, 'y': 249}}, {'timestamp': 1619159619301, 'position': {'x': 189, 'y': 241}}, {'timestamp': 1619159619404, 'position': {'x': 192, 'y': 240}}, {'timestamp': 1619159619602, 'position': {'x': 193, 'y': 238}}, {'timestamp': 1619159619702, 'position': {'x': 221, 'y': 200}}, {'timestamp': 1619159619801, 'position': {'x': 256, 'y': 170}}, {'timestamp': 1619159619906, 'position': {'x': 259, 'y': 172}}, {'timestamp': 1619159620001, 'position': {'x': 281, 'y': 174}}, {'timestamp': 1619159620104, 'position': {'x': 301, 'y': 174}}, {'timestamp': 1619159620501, 'position': {'x': 297, 'y': 169}}, {'timestamp': 1619159620602, 'position': {'x': 292, 'y': 165}}, {'timestamp': 1619159620702, 'position': {'x': 290, 'y': 163}}, {'timestamp': 1619159620804, 'position': {'x': 285, 'y': 161}}, {'timestamp': 1619159621101, 'position': {'x': 299, 'y': 160}}, {'timestamp': 1619159621202, 'position': {'x': 312, 'y': 157}}, {'timestamp': 1619159621301, 'position': {'x': 320, 'y': 155}}, {'timestamp': 1619159621402, 'position': {'x': 336, 'y': 155}}, {'timestamp': 1619159621502, 'position': {'x': 365, 'y': 156}}, {'timestamp': 1619159621601, 'position': {'x': 395, 'y': 154}}, {'timestamp': 1619159621705, 'position': {'x': 397, 'y': 152}}, {'timestamp': 1619159622001, 'position': {'x': 403, 'y': 154}}, {'timestamp': 1619159622101, 'position': {'x': 428, 'y': 159}}, {'timestamp': 1619159622201, 'position': {'x': 460, 'y': 163}}, {'timestamp': 1619159622301, 'position': {'x': 485, 'y': 165}}, {'timestamp': 1619159622401, 'position': {'x': 514, 'y': 166}}, {'timestamp': 1619159622501, 'position': {'x': 528, 'y': 166}}, {'timestamp': 1619159622601, 'position': {'x': 413, 'y': 167}}, {'timestamp': 1619159622701, 'position': {'x': 69, 'y': 189}}, {'timestamp': 1619159622803, 'position': {'x': 35, 'y': 194}}, {'timestamp': 1619159622905, 'position': {'x': 36, 'y': 194}}, {'timestamp': 1619159623001, 'position': {'x': 76, 'y': 181}}, {'timestamp': 1619159623102, 'position': {'x': 99, 'y': 178}}, {'timestamp': 1619159623301, 'position': {'x': 110, 'y': 179}}, {'timestamp': 1619159623402, 'position': {'x': 122, 'y': 180}}, {'timestamp': 1619159623501, 'position': {'x': 127, 'y': 181}}, {'timestamp': 1619159623602, 'position': {'x': 140, 'y': 182}}, {'timestamp': 1619159623702, 'position': {'x': 154, 'y': 183}}, {'timestamp': 1619159623802, 'position': {'x': 172, 'y': 184}}, {'timestamp': 1619159623902, 'position': {'x': 179, 'y': 185}}, {'timestamp': 1619159624002, 'position': {'x': 181, 'y': 185}}, {'timestamp': 1619159624203, 'position': {'x': 165, 'y': 181}}, {'timestamp': 1619159624501, 'position': {'x': 178, 'y': 183}}, {'timestamp': 1619159624602, 'position': {'x': 187, 'y': 187}}, {'timestamp': 1619159624801, 'position': {'x': 177, 'y': 196}}, {'timestamp': 1619159624901, 'position': {'x': 172, 'y': 215}}, {'timestamp': 1619159625001, 'position': {'x': 170, 'y': 230}}, {'timestamp': 1619159625101, 'position': {'x': 160, 'y': 232}}, {'timestamp': 1619159625202, 'position': {'x': 157, 'y': 235}}, {'timestamp': 1619159625304, 'position': {'x': 157, 'y': 236}}, {'timestamp': 1619159625501, 'position': {'x': 156, 'y': 247}}, {'timestamp': 1619159625601, 'position': {'x': 150, 'y': 273}}, {'timestamp': 1619159625701, 'position': {'x': 149, 'y': 274}}, {'timestamp': 1619159625802, 'position': {'x': 142, 'y': 273}}, {'timestamp': 1619159625901, 'position': {'x': 133, 'y': 261}}, {'timestamp': 1619159626001, 'position': {'x': 118, 'y': 246}}, {'timestamp': 1619159626102, 'position': {'x': 101, 'y': 237}}, {'timestamp': 1619159626203, 'position': {'x': 99, 'y': 236}}, {'timestamp': 1619159626301, 'position': {'x': 101, 'y': 234}}, {'timestamp': 1619159626401, 'position': {'x': 113, 'y': 232}}, {'timestamp': 1619159626501, 'position': {'x': 134, 'y': 231}}, {'timestamp': 1619159626600, 'position': {'x': 160, 'y': 228}}, {'timestamp': 1619159626701, 'position': {'x': 160, 'y': 227}}, {'timestamp': 1619159626901, 'position': {'x': 161, 'y': 227}}, {'timestamp': 1619159627001, 'position': {'x': 180, 'y': 231}}, {'timestamp': 1619159627101, 'position': {'x': 243, 'y': 233}}, {'timestamp': 1619159627203, 'position': {'x': 277, 'y': 232}}, {'timestamp': 1619159627401, 'position': {'x': 279, 'y': 232}}, {'timestamp': 1619159627500, 'position': {'x': 284, 'y': 234}}, {'timestamp': 1619159627600, 'position': {'x': 298, 'y': 230}}, {'timestamp': 1619159627701, 'position': {'x': 315, 'y': 227}}, {'timestamp': 1619159627801, 'position': {'x': 315, 'y': 225}}, {'timestamp': 1619159627900, 'position': {'x': 309, 'y': 220}}, {'timestamp': 1619159628000, 'position': {'x': 307, 'y': 220}}, {'timestamp': 1619159628100, 'position': {'x': 314, 'y': 220}}, {'timestamp': 1619159628203, 'position': {'x': 318, 'y': 220}}, {'timestamp': 1619159628300, 'position': {'x': 317, 'y': 221}}, {'timestamp': 1619159628600, 'position': {'x': 340, 'y': 217}}, {'timestamp': 1619159628700, 'position': {'x': 347, 'y': 217}}, {'timestamp': 1619159628900, 'position': {'x': 370, 'y': 217}}, {'timestamp': 1619159629000, 'position': {'x': 407, 'y': 218}}, {'timestamp': 1619159629104, 'position': {'x': 417, 'y': 216}}, {'timestamp': 1619159629300, 'position': {'x': 418, 'y': 217}}, {'timestamp': 1619159629400, 'position': {'x': 445, 'y': 216}}, {'timestamp': 1619159629500, 'position': {'x': 489, 'y': 217}}, {'timestamp': 1619159629600, 'position': {'x': 513, 'y': 217}}, {'timestamp': 1619159629703, 'position': {'x': 532, 'y': 217}}, {'timestamp': 1619159629900, 'position': {'x': 521, 'y': 216}}, {'timestamp': 1619159630001, 'position': {'x': 500, 'y': 217}}, {'timestamp': 1619159630099, 'position': {'x': 520, 'y': 217}}, {'timestamp': 1619159630200, 'position': {'x': 566, 'y': 219}}, {'timestamp': 1619159630299, 'position': {'x': 562, 'y': 218}}, {'timestamp': 1619159630400, 'position': {'x': 316, 'y': 215}}, {'timestamp': 1619159630500, 'position': {'x': 62, 'y': 249}}, {'timestamp': 1619159630600, 'position': {'x': 63, 'y': 250}}, {'timestamp': 1619159630699, 'position': {'x': 58, 'y': 265}}, {'timestamp': 1619159630800, 'position': {'x': 77, 'y': 280}}, {'timestamp': 1619159630902, 'position': {'x': 89, 'y': 282}}, {'timestamp': 1619159631099, 'position': {'x': 97, 'y': 281}}, {'timestamp': 1619159631199, 'position': {'x': 114, 'y': 274}}, {'timestamp': 1619159631299, 'position': {'x': 89, 'y': 263}}, {'timestamp': 1619159631399, 'position': {'x': 67, 'y': 275}}, {'timestamp': 1619159631499, 'position': {'x': 108, 'y': 283}}, {'timestamp': 1619159631599, 'position': {'x': 124, 'y': 276}}, {'timestamp': 1619159631699, 'position': {'x': 123, 'y': 277}}, {'timestamp': 1619159631799, 'position': {'x': 121, 'y': 277}}, {'timestamp': 1619159631899, 'position': {'x': 111, 'y': 274}}, {'timestamp': 1619159632004, 'position': {'x': 110, 'y': 274}}, {'timestamp': 1619159632099, 'position': {'x': 110, 'y': 273}}, {'timestamp': 1619159632199, 'position': {'x': 110, 'y': 269}}, {'timestamp': 1619159632299, 'position': {'x': 148, 'y': 270}}, {'timestamp': 1619159632400, 'position': {'x': 168, 'y': 269}}, {'timestamp': 1619159632499, 'position': {'x': 164, 'y': 266}}, {'timestamp': 1619159632607, 'position': {'x': 153, 'y': 261}}, {'timestamp': 1619159632699, 'position': {'x': 145, 'y': 260}}, {'timestamp': 1619159632799, 'position': {'x': 126, 'y': 262}}, {'timestamp': 1619159632899, 'position': {'x': 140, 'y': 262}}, {'timestamp': 1619159632999, 'position': {'x': 147, 'y': 260}}, {'timestamp': 1619159633099, 'position': {'x': 118, 'y': 256}}, {'timestamp': 1619159633199, 'position': {'x': 108, 'y': 255}}, {'timestamp': 1619159633301, 'position': {'x': 115, 'y': 256}}, {'timestamp': 1619159633399, 'position': {'x': 125, 'y': 258}}, {'timestamp': 1619159633499, 'position': {'x': 141, 'y': 258}}, {'timestamp': 1619159633599, 'position': {'x': 160, 'y': 254}}, {'timestamp': 1619159633699, 'position': {'x': 164, 'y': 254}}, {'timestamp': 1619159633799, 'position': {'x': 166, 'y': 254}}, {'timestamp': 1619159633902, 'position': {'x': 168, 'y': 254}}, {'timestamp': 1619159633999, 'position': {'x': 175, 'y': 255}}, {'timestamp': 1619159634099, 'position': {'x': 181, 'y': 258}}, {'timestamp': 1619159634201, 'position': {'x': 183, 'y': 259}}, {'timestamp': 1619159634299, 'position': {'x': 198, 'y': 262}}, {'timestamp': 1619159634399, 'position': {'x': 810, 'y': 252}}, {'timestamp': 1619159634502, 'position': {'x': 837, 'y': 247}}, {'timestamp': 1619159634699, 'position': {'x': 836, 'y': 245}}, {'timestamp': 1619159634798, 'position': {'x': 822, 'y': 233}}, {'timestamp': 1619159634899, 'position': {'x': 798, 'y': 221}}, {'timestamp': 1619159634999, 'position': {'x': 795, 'y': 220}}, {'timestamp': 1619159635099, 'position': {'x': 792, 'y': 217}}, {'timestamp': 1619159635199, 'position': {'x': 766, 'y': 219}}, {'timestamp': 1619159635299, 'position': {'x': 746, 'y': 227}}, {'timestamp': 1619159635499, 'position': {'x': 739, 'y': 227}}, {'timestamp': 1619159635599, 'position': {'x': 738, 'y': 230}}, {'timestamp': 1619159635701, 'position': {'x': 736, 'y': 234}}, {'timestamp': 1619159636001, 'position': {'x': 739, 'y': 235}}, {'timestamp': 1619159651697, 'position': {'x': 740, 'y': 232}}, {'timestamp': 1619159651797, 'position': {'x': 769, 'y': 71}}, {'timestamp': 1619159651897, 'position': {'x': 749, 'y': 88}}, {'timestamp': 1619159651997, 'position': {'x': 714, 'y': 121}}, {'timestamp': 1619159652097, 'position': {'x': 605, 'y': 179}}, {'timestamp': 1619159652201, 'position': {'x': 565, 'y': 197}}, {'timestamp': 1619159652398, 'position': {'x': 574, 'y': 194}}, {'timestamp': 1619159652497, 'position': {'x': 525, 'y': 209}}, {'timestamp': 1619159652597, 'position': {'x': 252, 'y': 228}}, {'timestamp': 1619159652699, 'position': {'x': 254, 'y': 226}}, {'timestamp': 1619159652797, 'position': {'x': 259, 'y': 222}}, {'timestamp': 1619159652897, 'position': {'x': 214, 'y': 191}}, {'timestamp': 1619159652997, 'position': {'x': 174, 'y': 181}}, {'timestamp': 1619159653097, 'position': {'x': 163, 'y': 196}}, {'timestamp': 1619159653197, 'position': {'x': 163, 'y': 189}}, {'timestamp': 1619159653297, 'position': {'x': 163, 'y': 173}}, {'timestamp': 1619159653397, 'position': {'x': 191, 'y': 188}}, {'timestamp': 1619159653497, 'position': {'x': 449, 'y': 211}}, {'timestamp': 1619159653597, 'position': {'x': 664, 'y': 194}}, {'timestamp': 1619159653696, 'position': {'x': 664, 'y': 189}}, {'timestamp': 1619159653797, 'position': {'x': 434, 'y': 147}}, {'timestamp': 1619159653901, 'position': {'x': 306, 'y': 134}}, {'timestamp': 1619159653997, 'position': {'x': 295, 'y': 135}}, {'timestamp': 1619159654097, 'position': {'x': 256, 'y': 149}}, {'timestamp': 1619159654197, 'position': {'x': 254, 'y': 149}}, {'timestamp': 1619159654297, 'position': {'x': 250, 'y': 145}}, {'timestamp': 1619159654396, 'position': {'x': 209, 'y': 157}}, {'timestamp': 1619159654497, 'position': {'x': 197, 'y': 156}}, {'timestamp': 1619159654596, 'position': {'x': 204, 'y': 157}}, {'timestamp': 1619159654697, 'position': {'x': 247, 'y': 155}}, {'timestamp': 1619159654797, 'position': {'x': 235, 'y': 157}}, {'timestamp': 1619159654897, 'position': {'x': 267, 'y': 155}}, {'timestamp': 1619159654996, 'position': {'x': 265, 'y': 156}}, {'timestamp': 1619159655099, 'position': {'x': 267, 'y': 156}}, {'timestamp': 1619159655396, 'position': {'x': 260, 'y': 164}}, {'timestamp': 1619159655497, 'position': {'x': 201, 'y': 244}}, {'timestamp': 1619159655597, 'position': {'x': 186, 'y': 256}}, {'timestamp': 1619159655697, 'position': {'x': 174, 'y': 257}}, {'timestamp': 1619159655796, 'position': {'x': 166, 'y': 267}}, {'timestamp': 1619159655897, 'position': {'x': 165, 'y': 256}}, {'timestamp': 1619159655997, 'position': {'x': 138, 'y': 246}}, {'timestamp': 1619159656097, 'position': {'x': 128, 'y': 275}}, {'timestamp': 1619159656197, 'position': {'x': 145, 'y': 269}}, {'timestamp': 1619159656296, 'position': {'x': 132, 'y': 241}}, {'timestamp': 1619159656396, 'position': {'x': 117, 'y': 280}}, {'timestamp': 1619159656496, 'position': {'x': 146, 'y': 282}}, {'timestamp': 1619159656596, 'position': {'x': 141, 'y': 237}}, {'timestamp': 1619159656696, 'position': {'x': 117, 'y': 276}}, {'timestamp': 1619159656796, 'position': {'x': 143, 'y': 291}}, {'timestamp': 1619159656897, 'position': {'x': 138, 'y': 236}}, {'timestamp': 1619159656996, 'position': {'x': 104, 'y': 295}}, {'timestamp': 1619159657097, 'position': {'x': 138, 'y': 299}}, {'timestamp': 1619159657198, 'position': {'x': 125, 'y': 300}}, {'timestamp': 1619159658296, 'position': {'x': 123, 'y': 291}}, {'timestamp': 1619159658397, 'position': {'x': 133, 'y': 275}}, {'timestamp': 1619159658498, 'position': {'x': 132, 'y': 264}}, {'timestamp': 1619159658596, 'position': {'x': 128, 'y': 262}}, {'timestamp': 1619159658697, 'position': {'x': 121, 'y': 261}}, {'timestamp': 1619159660496, 'position': {'x': 125, 'y': 256}}, {'timestamp': 1619159660696, 'position': {'x': 120, 'y': 269}}, {'timestamp': 1619159660796, 'position': {'x': 123, 'y': 272}}, {'timestamp': 1619159660896, 'position': {'x': 125, 'y': 263}}, {'timestamp': 1619159660996, 'position': {'x': 125, 'y': 262}}, {'timestamp': 1619159661096, 'position': {'x': 131, 'y': 249}}, {'timestamp': 1619159661196, 'position': {'x': 135, 'y': 223}}, {'timestamp': 1619159661298, 'position': {'x': 141, 'y': 202}}, {'timestamp': 1619159661496, 'position': {'x': 140, 'y': 210}}, {'timestamp': 1619159661597, 'position': {'x': 129, 'y': 222}}, {'timestamp': 1619159661696, 'position': {'x': 133, 'y': 220}}, {'timestamp': 1619159661797, 'position': {'x': 158, 'y': 217}}, {'timestamp': 1619159661896, 'position': {'x': 161, 'y': 216}}, {'timestamp': 1619159661998, 'position': {'x': 166, 'y': 216}}, {'timestamp': 1619159662096, 'position': {'x': 177, 'y': 217}}, {'timestamp': 1619159662196, 'position': {'x': 267, 'y': 216}}, {'timestamp': 1619159662296, 'position': {'x': 205, 'y': 212}}, {'timestamp': 1619159662396, 'position': {'x': 219, 'y': 216}}, {'timestamp': 1619159662496, 'position': {'x': 212, 'y': 214}}, {'timestamp': 1619159662598, 'position': {'x': 219, 'y': 216}}, {'timestamp': 1619159662696, 'position': {'x': 237, 'y': 219}}, {'timestamp': 1619159662797, 'position': {'x': 251, 'y': 218}}, {'timestamp': 1619159662896, 'position': {'x': 280, 'y': 219}}, {'timestamp': 1619159662996, 'position': {'x': 293, 'y': 218}}, {'timestamp': 1619159663096, 'position': {'x': 320, 'y': 216}}, {'timestamp': 1619159663196, 'position': {'x': 338, 'y': 216}}, {'timestamp': 1619159663296, 'position': {'x': 373, 'y': 218}}, {'timestamp': 1619159663396, 'position': {'x': 364, 'y': 214}}, {'timestamp': 1619159663496, 'position': {'x': 358, 'y': 220}}, {'timestamp': 1619159663596, 'position': {'x': 365, 'y': 216}}, {'timestamp': 1619159663697, 'position': {'x': 355, 'y': 217}}, {'timestamp': 1619159663797, 'position': {'x': 364, 'y': 215}}, {'timestamp': 1619159663897, 'position': {'x': 354, 'y': 213}}, {'timestamp': 1619159663996, 'position': {'x': 347, 'y': 221}}, {'timestamp': 1619159664096, 'position': {'x': 349, 'y': 220}}, {'timestamp': 1619159664196, 'position': {'x': 342, 'y': 228}}, {'timestamp': 1619159664296, 'position': {'x': 197, 'y': 293}}, {'timestamp': 1619159664396, 'position': {'x': 178, 'y': 286}}, {'timestamp': 1619159664496, 'position': {'x': 160, 'y': 284}}, {'timestamp': 1619159664601, 'position': {'x': 148, 'y': 286}}, {'timestamp': 1619159664696, 'position': {'x': 154, 'y': 285}}, {'timestamp': 1619159664796, 'position': {'x': 151, 'y': 283}}, {'timestamp': 1619159664896, 'position': {'x': 131, 'y': 289}}, {'timestamp': 1619159664996, 'position': {'x': 140, 'y': 289}}, {'timestamp': 1619159665097, 'position': {'x': 145, 'y': 289}}, {'timestamp': 1619159665196, 'position': {'x': 148, 'y': 286}}, {'timestamp': 1619159665296, 'position': {'x': 156, 'y': 285}}, {'timestamp': 1619159665396, 'position': {'x': 153, 'y': 289}}, {'timestamp': 1619159665496, 'position': {'x': 158, 'y': 288}}, {'timestamp': 1619159665597, 'position': {'x': 160, 'y': 286}}, {'timestamp': 1619159665799, 'position': {'x': 160, 'y': 287}}, {'timestamp': 1619159665896, 'position': {'x': 154, 'y': 292}}, {'timestamp': 1619159665996, 'position': {'x': 87, 'y': 302}}, {'timestamp': 1619159666096, 'position': {'x': 83, 'y': 295}}, {'timestamp': 1619159666196, 'position': {'x': 79, 'y': 295}}, {'timestamp': 1619159666296, 'position': {'x': 69, 'y': 297}}, {'timestamp': 1619159666396, 'position': {'x': 63, 'y': 297}}, {'timestamp': 1619159666496, 'position': {'x': 72, 'y': 308}}, {'timestamp': 1619159666596, 'position': {'x': 77, 'y': 296}}, {'timestamp': 1619159666696, 'position': {'x': 70, 'y': 300}}, {'timestamp': 1619159666796, 'position': {'x': 76, 'y': 303}}, {'timestamp': 1619159666896, 'position': {'x': 74, 'y': 302}}, {'timestamp': 1619159666996, 'position': {'x': 74, 'y': 303}}, {'timestamp': 1619159667096, 'position': {'x': 74, 'y': 304}}, {'timestamp': 1619159667297, 'position': {'x': 75, 'y': 304}}, {'timestamp': 1619159667399, 'position': {'x': 74, 'y': 305}}, {'timestamp': 1619159667496, 'position': {'x': 87, 'y': 307}}, {'timestamp': 1619159667596, 'position': {'x': 97, 'y': 305}}, {'timestamp': 1619159667696, 'position': {'x': 145, 'y': 296}}, {'timestamp': 1619159667797, 'position': {'x': 157, 'y': 288}}, {'timestamp': 1619159667896, 'position': {'x': 141, 'y': 273}}, {'timestamp': 1619159667996, 'position': {'x': 129, 'y': 272}}, {'timestamp': 1619159668099, 'position': {'x': 115, 'y': 271}}, {'timestamp': 1619159668196, 'position': {'x': 114, 'y': 269}}, {'timestamp': 1619159668296, 'position': {'x': 115, 'y': 266}}, {'timestamp': 1619159668397, 'position': {'x': 117, 'y': 264}}, {'timestamp': 1619159668496, 'position': {'x': 113, 'y': 256}}, {'timestamp': 1619159668596, 'position': {'x': 112, 'y': 243}}, {'timestamp': 1619159668696, 'position': {'x': 150, 'y': 244}}, {'timestamp': 1619159668797, 'position': {'x': 171, 'y': 242}}, {'timestamp': 1619159668896, 'position': {'x': 169, 'y': 241}}, {'timestamp': 1619159668996, 'position': {'x': 704, 'y': 237}}, {'timestamp': 1619159669096, 'position': {'x': 889, 'y': 226}}, {'timestamp': 1619159669196, 'position': {'x': 867, 'y': 225}}, {'timestamp': 1619159669296, 'position': {'x': 834, 'y': 225}}, {'timestamp': 1619159669396, 'position': {'x': 788, 'y': 223}}, {'timestamp': 1619159669496, 'position': {'x': 774, 'y': 222}}, {'timestamp': 1619159669597, 'position': {'x': 784, 'y': 218}}, {'timestamp': 1619159669699, 'position': {'x': 787, 'y': 216}}, {'timestamp': 1619159669797, 'position': {'x': 775, 'y': 218}}, {'timestamp': 1619159669897, 'position': {'x': 749, 'y': 224}}, {'timestamp': 1619159670000, 'position': {'x': 733, 'y': 226}}, {'timestamp': 1619159670397, 'position': {'x': 732, 'y': 226}}, {'timestamp': 1619159670497, 'position': {'x': 718, 'y': 225}}, {'timestamp': 1619159670597, 'position': {'x': 708, 'y': 225}}, {'timestamp': 1619159670696, 'position': {'x': 703, 'y': 224}}, {'timestamp': 1619159670798, 'position': {'x': 702, 'y': 223}}, {'timestamp': 1619159670898, 'position': {'x': 701, 'y': 223}}, {'timestamp': 1619159670996, 'position': {'x': 700, 'y': 223}}, {'timestamp': 1619159671098, 'position': {'x': 698, 'y': 224}}, {'timestamp': 1619159671296, 'position': {'x': 697, 'y': 223}}, {'timestamp': 1619159671396, 'position': {'x': 696, 'y': 223}}, {'timestamp': 1619159671496, 'position': {'x': 694, 'y': 224}}, {'timestamp': 1619159671896, 'position': {'x': 778, 'y': 219}}, {'timestamp': 1619159671996, 'position': {'x': 891, 'y': 211}}, {'timestamp': 1619159752795, 'position': {'x': 921, 'y': 55}}, {'timestamp': 1619159752895, 'position': {'x': 893, 'y': 519}}, {'timestamp': 1619159752996, 'position': {'x': 917, 'y': 690}}, {'timestamp': 1619159753095, 'position': {'x': 899, 'y': 678}}, {'timestamp': 1619159753195, 'position': {'x': 707, 'y': 733}}, {'timestamp': 1619159753295, 'position': {'x': 648, 'y': 776}}, {'timestamp': 1619159753395, 'position': {'x': 646, 'y': 776}}, {'timestamp': 1619159753495, 'position': {'x': 693, 'y': 767}}, {'timestamp': 1619159753598, 'position': {'x': 702, 'y': 762}}, {'timestamp': 1619159753695, 'position': {'x': 702, 'y': 761}}, {'timestamp': 1619159753796, 'position': {'x': 702, 'y': 752}}, {'timestamp': 1619159754395, 'position': {'x': 860, 'y': 512}}, {'timestamp': 1619159754495, 'position': {'x': 823, 'y': 413}}, {'timestamp': 1619159754596, 'position': {'x': 806, 'y': 383}}, {'timestamp': 1619159754895, 'position': {'x': 626, 'y': 419}}, {'timestamp': 1619159754995, 'position': {'x': 442, 'y': 460}}, {'timestamp': 1619159755099, 'position': {'x': 457, 'y': 456}}, {'timestamp': 1619159755295, 'position': {'x': 458, 'y': 455}}, {'timestamp': 1619159755396, 'position': {'x': 449, 'y': 450}}, {'timestamp': 1619159755496, 'position': {'x': 445, 'y': 446}}, {'timestamp': 1619159755599, 'position': {'x': 435, 'y': 439}}, {'timestamp': 1619159755695, 'position': {'x': 415, 'y': 425}}, {'timestamp': 1619159755798, 'position': {'x': 421, 'y': 409}}, {'timestamp': 1619159755995, 'position': {'x': 416, 'y': 404}}, {'timestamp': 1619159756095, 'position': {'x': 250, 'y': 255}}, {'timestamp': 1619159756196, 'position': {'x': 212, 'y': 188}}, {'timestamp': 1619159756295, 'position': {'x': 213, 'y': 187}}, {'timestamp': 1619159756395, 'position': {'x': 215, 'y': 189}}, {'timestamp': 1619159756499, 'position': {'x': 218, 'y': 196}}, {'timestamp': 1619159756595, 'position': {'x': 217, 'y': 201}}, {'timestamp': 1619159756695, 'position': {'x': 221, 'y': 231}}, {'timestamp': 1619159756795, 'position': {'x': 290, 'y': 341}}, {'timestamp': 1619159756898, 'position': {'x': 294, 'y': 349}}, {'timestamp': 1619159756995, 'position': {'x': 291, 'y': 350}}, {'timestamp': 1619159757095, 'position': {'x': 281, 'y': 350}}, {'timestamp': 1619159757195, 'position': {'x': 259, 'y': 363}}, {'timestamp': 1619159757295, 'position': {'x': 221, 'y': 365}}, {'timestamp': 1619159757395, 'position': {'x': 207, 'y': 367}}, {'timestamp': 1619159757495, 'position': {'x': 205, 'y': 363}}, {'timestamp': 1619159757595, 'position': {'x': 179, 'y': 358}}, {'timestamp': 1619159757695, 'position': {'x': 157, 'y': 355}}, {'timestamp': 1619159757795, 'position': {'x': 140, 'y': 350}}, {'timestamp': 1619159757895, 'position': {'x': 133, 'y': 347}}, {'timestamp': 1619159757995, 'position': {'x': 132, 'y': 344}}, {'timestamp': 1619159758095, 'position': {'x': 133, 'y': 341}}, {'timestamp': 1619159758196, 'position': {'x': 134, 'y': 337}}, {'timestamp': 1619159758295, 'position': {'x': 136, 'y': 334}}, {'timestamp': 1619159758495, 'position': {'x': 140, 'y': 333}}, {'timestamp': 1619159758595, 'position': {'x': 207, 'y': 334}}, {'timestamp': 1619159758695, 'position': {'x': 242, 'y': 334}}, {'timestamp': 1619159759095, 'position': {'x': 287, 'y': 338}}, {'timestamp': 1619159759195, 'position': {'x': 219, 'y': 334}}, {'timestamp': 1619159759297, 'position': {'x': 156, 'y': 330}}, {'timestamp': 1619159759395, 'position': {'x': 260, 'y': 338}}, {'timestamp': 1619159759495, 'position': {'x': 259, 'y': 337}}, {'timestamp': 1619159759595, 'position': {'x': 172, 'y': 327}}, {'timestamp': 1619159759695, 'position': {'x': 222, 'y': 330}}, {'timestamp': 1619159759798, 'position': {'x': 212, 'y': 329}}, {'timestamp': 1619159759995, 'position': {'x': 418, 'y': 333}}, {'timestamp': 1619159760095, 'position': {'x': 871, 'y': 311}}, {'timestamp': 1619159760195, 'position': {'x': 877, 'y': 305}}, {'timestamp': 1619159760295, 'position': {'x': 885, 'y': 277}}, {'timestamp': 1619159760395, 'position': {'x': 830, 'y': 214}}, {'timestamp': 1619159760499, 'position': {'x': 819, 'y': 204}}, {'timestamp': 1619159760695, 'position': {'x': 808, 'y': 205}}, {'timestamp': 1619159760799, 'position': {'x': 792, 'y': 209}}, {'timestamp': 1619159760895, 'position': {'x': 783, 'y': 206}}, {'timestamp': 1619159760996, 'position': {'x': 781, 'y': 204}}, {'timestamp': 1619159761796, 'position': {'x': 781, 'y': 206}}, {'timestamp': 1619159761897, 'position': {'x': 780, 'y': 209}}, {'timestamp': 1619159763197, 'position': {'x': 779, 'y': 213}}, {'timestamp': 1619159763295, 'position': {'x': 773, 'y': 219}}, {'timestamp': 1619159763396, 'position': {'x': 757, 'y': 223}}, {'timestamp': 1619159763496, 'position': {'x': 748, 'y': 224}}, {'timestamp': 1619159763598, 'position': {'x': 747, 'y': 224}}, {'timestamp': 1619159764295, 'position': {'x': 747, 'y': 229}}, {'timestamp': 1619159764396, 'position': {'x': 747, 'y': 235}}, {'timestamp': 1619159764499, 'position': {'x': 747, 'y': 236}}, {'timestamp': 1619159764795, 'position': {'x': 739, 'y': 237}}, {'timestamp': 1619159764898, 'position': {'x': 736, 'y': 239}}, {'timestamp': 1619159766995, 'position': {'x': 737, 'y': 240}}, {'timestamp': 1619159767095, 'position': {'x': 753, 'y': 247}}, {'timestamp': 1619159767195, 'position': {'x': 743, 'y': 253}}, {'timestamp': 1619159767295, 'position': {'x': 742, 'y': 256}}, {'timestamp': 1619159767397, 'position': {'x': 743, 'y': 256}}, {'timestamp': 1619159768595, 'position': {'x': 739, 'y': 264}}, {'timestamp': 1619159768695, 'position': {'x': 618, 'y': 396}}, {'timestamp': 1619159768798, 'position': {'x': 604, 'y': 406}}, {'timestamp': 1619159768895, 'position': {'x': 606, 'y': 411}}, {'timestamp': 1619159768995, 'position': {'x': 606, 'y': 409}}, {'timestamp': 1619159769097, 'position': {'x': 663, 'y': 329}}, {'timestamp': 1619159769195, 'position': {'x': 724, 'y': 215}}, {'timestamp': 1619159769296, 'position': {'x': 744, 'y': 208}}, {'timestamp': 1619159769395, 'position': {'x': 781, 'y': 241}}, {'timestamp': 1619159769495, 'position': {'x': 762, 'y': 331}}, {'timestamp': 1619159769596, 'position': {'x': 683, 'y': 274}}, {'timestamp': 1619159769696, 'position': {'x': 671, 'y': 152}}, {'timestamp': 1619159769795, 'position': {'x': 777, 'y': 190}}, {'timestamp': 1619159769895, 'position': {'x': 779, 'y': 264}}, {'timestamp': 1619159769996, 'position': {'x': 657, 'y': 219}}, {'timestamp': 1619159770095, 'position': {'x': 693, 'y': 186}}, {'timestamp': 1619159770195, 'position': {'x': 795, 'y': 266}}, {'timestamp': 1619159770295, 'position': {'x': 775, 'y': 254}}, {'timestamp': 1619159770398, 'position': {'x': 775, 'y': 253}}, {'timestamp': 1619159770695, 'position': {'x': 774, 'y': 253}}, {'timestamp': 1619159770797, 'position': {'x': 774, 'y': 250}}, {'timestamp': 1619159772295, 'position': {'x': 774, 'y': 249}}, {'timestamp': 1619159772397, 'position': {'x': 775, 'y': 244}}, {'timestamp': 1619159772696, 'position': {'x': 774, 'y': 247}}, {'timestamp': 1619159772797, 'position': {'x': 772, 'y': 248}}, {'timestamp': 1619159772998, 'position': {'x': 771, 'y': 248}}, {'timestamp': 1619159787495, 'position': {'x': 756, 'y': 261}}, {'timestamp': 1619159787595, 'position': {'x': 744, 'y': 287}}, {'timestamp': 1619159787695, 'position': {'x': 753, 'y': 270}}, {'timestamp': 1619159787798, 'position': {'x': 759, 'y': 263}}, {'timestamp': 1619159788397, 'position': {'x': 789, 'y': 262}}, {'timestamp': 1619159788498, 'position': {'x': 799, 'y': 261}}, {'timestamp': 1619159811295, 'position': {'x': 883, 'y': 160}}, {'timestamp': 1619159811395, 'position': {'x': 903, 'y': 154}}, {'timestamp': 1619159811495, 'position': {'x': 781, 'y': 539}}, {'timestamp': 1619159811595, 'position': {'x': 677, 'y': 923}}, {'timestamp': 1619159811695, 'position': {'x': 674, 'y': 918}}, {'timestamp': 1619159811794, 'position': {'x': 677, 'y': 892}}, {'timestamp': 1619159811895, 'position': {'x': 681, 'y': 868}}, {'timestamp': 1619159811995, 'position': {'x': 714, 'y': 771}}, {'timestamp': 1619159812096, 'position': {'x': 717, 'y': 755}}, {'timestamp': 1619159812196, 'position': {'x': 716, 'y': 753}}, {'timestamp': 1619159812297, 'position': {'x': 715, 'y': 753}}, {'timestamp': 1619159812595, 'position': {'x': 626, 'y': 839}}, {'timestamp': 1619159812696, 'position': {'x': 542, 'y': 881}}, {'timestamp': 1619159812794, 'position': {'x': 539, 'y': 873}}, {'timestamp': 1619159812896, 'position': {'x': 537, 'y': 872}}, {'timestamp': 1619159813395, 'position': {'x': 545, 'y': 850}}, {'timestamp': 1619159813495, 'position': {'x': 584, 'y': 831}}, {'timestamp': 1619159813595, 'position': {'x': 616, 'y': 836}}, {'timestamp': 1619159813695, 'position': {'x': 632, 'y': 831}}, {'timestamp': 1619159813795, 'position': {'x': 604, 'y': 691}}, {'timestamp': 1619159813895, 'position': {'x': 507, 'y': 404}}, {'timestamp': 1619159814000, 'position': {'x': 481, 'y': 377}}, {'timestamp': 1619159814095, 'position': {'x': 480, 'y': 376}}, {'timestamp': 1619159814198, 'position': {'x': 489, 'y': 378}}, {'timestamp': 1619159814395, 'position': {'x': 489, 'y': 381}}, {'timestamp': 1619159814495, 'position': {'x': 472, 'y': 382}}, {'timestamp': 1619159814595, 'position': {'x': 438, 'y': 380}}, {'timestamp': 1619159814695, 'position': {'x': 436, 'y': 379}}, {'timestamp': 1619159815395, 'position': {'x': 429, 'y': 370}}, {'timestamp': 1619159815495, 'position': {'x': 365, 'y': 372}}, {'timestamp': 1619159815598, 'position': {'x': 329, 'y': 367}}, {'timestamp': 1619159815694, 'position': {'x': 333, 'y': 370}}, {'timestamp': 1619159815795, 'position': {'x': 322, 'y': 368}}, {'timestamp': 1619159815895, 'position': {'x': 285, 'y': 364}}, {'timestamp': 1619159815995, 'position': {'x': 247, 'y': 364}}, {'timestamp': 1619159816095, 'position': {'x': 244, 'y': 366}}, {'timestamp': 1619159816195, 'position': {'x': 243, 'y': 366}}, {'timestamp': 1619159816298, 'position': {'x': 244, 'y': 364}}, {'timestamp': 1619159816495, 'position': {'x': 230, 'y': 371}}, {'timestamp': 1619159816595, 'position': {'x': 183, 'y': 372}}, {'timestamp': 1619159816695, 'position': {'x': 182, 'y': 371}}, {'timestamp': 1619159816999, 'position': {'x': 193, 'y': 368}}, {'timestamp': 1619159817195, 'position': {'x': 192, 'y': 369}}, {'timestamp': 1619159817295, 'position': {'x': 193, 'y': 370}}, {'timestamp': 1619159817395, 'position': {'x': 193, 'y': 369}}, {'timestamp': 1619159818095, 'position': {'x': 196, 'y': 365}}, {'timestamp': 1619159818195, 'position': {'x': 198, 'y': 362}}, {'timestamp': 1619159818298, 'position': {'x': 204, 'y': 358}}, {'timestamp': 1619159818494, 'position': {'x': 200, 'y': 361}}, {'timestamp': 1619159818598, 'position': {'x': 200, 'y': 364}}, {'timestamp': 1619159818695, 'position': {'x': 201, 'y': 364}}, {'timestamp': 1619159818797, 'position': {'x': 201, 'y': 363}}, {'timestamp': 1619159819594, 'position': {'x': 201, 'y': 351}}, {'timestamp': 1619159819698, 'position': {'x': 210, 'y': 348}}, {'timestamp': 1619159819895, 'position': {'x': 211, 'y': 353}}, {'timestamp': 1619159819994, 'position': {'x': 212, 'y': 352}}, {'timestamp': 1619159820095, 'position': {'x': 211, 'y': 349}}, {'timestamp': 1619159820299, 'position': {'x': 211, 'y': 348}}, {'timestamp': 1619159820596, 'position': {'x': 210, 'y': 346}}, {'timestamp': 1619159820695, 'position': {'x': 210, 'y': 345}}, {'timestamp': 1619159820795, 'position': {'x': 219, 'y': 331}}, {'timestamp': 1619159820895, 'position': {'x': 308, 'y': 302}}, {'timestamp': 1619159820996, 'position': {'x': 442, 'y': 301}}, {'timestamp': 1619159821395, 'position': {'x': 493, 'y': 297}}, {'timestamp': 1619159821496, 'position': {'x': 586, 'y': 284}}, {'timestamp': 1619159821595, 'position': {'x': 598, 'y': 283}}, {'timestamp': 1619159821697, 'position': {'x': 595, 'y': 283}}, {'timestamp': 1619159821795, 'position': {'x': 615, 'y': 289}}, {'timestamp': 1619159821896, 'position': {'x': 414, 'y': 262}}, {'timestamp': 1619159821997, 'position': {'x': 199, 'y': 235}}, {'timestamp': 1619159822194, 'position': {'x': 153, 'y': 218}}, {'timestamp': 1619159822297, 'position': {'x': 23, 'y': 132}}, {'timestamp': 1619159822396, 'position': {'x': 41, 'y': 122}}, {'timestamp': 1619159822496, 'position': {'x': 66, 'y': 108}}, {'timestamp': 1619159822596, 'position': {'x': 80, 'y': 115}}, {'timestamp': 1619159822697, 'position': {'x': 95, 'y': 120}}, {'timestamp': 1619159822995, 'position': {'x': 98, 'y': 123}}, {'timestamp': 1619159823095, 'position': {'x': 114, 'y': 158}}, {'timestamp': 1619159823195, 'position': {'x': 148, 'y': 208}}, {'timestamp': 1619159823295, 'position': {'x': 190, 'y': 221}}, {'timestamp': 1619159823399, 'position': {'x': 187, 'y': 215}}, {'timestamp': 1619159823595, 'position': {'x': 191, 'y': 220}}, {'timestamp': 1619159823695, 'position': {'x': 183, 'y': 234}}, {'timestamp': 1619159823795, 'position': {'x': 152, 'y': 277}}, {'timestamp': 1619159823895, 'position': {'x': 110, 'y': 311}}, {'timestamp': 1619159823996, 'position': {'x': 109, 'y': 313}}, {'timestamp': 1619159824096, 'position': {'x': 119, 'y': 304}}, {'timestamp': 1619159824196, 'position': {'x': 144, 'y': 301}}, {'timestamp': 1619159824296, 'position': {'x': 148, 'y': 296}}, {'timestamp': 1619159824395, 'position': {'x': 155, 'y': 280}}, {'timestamp': 1619159824497, 'position': {'x': 156, 'y': 276}}, {'timestamp': 1619159824695, 'position': {'x': 157, 'y': 275}}, {'timestamp': 1619159824795, 'position': {'x': 168, 'y': 263}}, {'timestamp': 1619159824895, 'position': {'x': 169, 'y': 252}}, {'timestamp': 1619159824999, 'position': {'x': 162, 'y': 242}}, {'timestamp': 1619159825094, 'position': {'x': 164, 'y': 244}}, {'timestamp': 1619159825195, 'position': {'x': 173, 'y': 237}}, {'timestamp': 1619159825295, 'position': {'x': 307, 'y': 222}}, {'timestamp': 1619159825396, 'position': {'x': 336, 'y': 221}}, {'timestamp': 1619159825794, 'position': {'x': 319, 'y': 221}}, {'timestamp': 1619159825896, 'position': {'x': 199, 'y': 214}}, {'timestamp': 1619159825995, 'position': {'x': 197, 'y': 213}}, {'timestamp': 1619159826099, 'position': {'x': 196, 'y': 212}}, {'timestamp': 1619159826195, 'position': {'x': 194, 'y': 212}}, {'timestamp': 1619159826295, 'position': {'x': 183, 'y': 213}}, {'timestamp': 1619159826395, 'position': {'x': 184, 'y': 214}}, {'timestamp': 1619159826495, 'position': {'x': 203, 'y': 214}}, {'timestamp': 1619159826596, 'position': {'x': 231, 'y': 212}}, {'timestamp': 1619159826796, 'position': {'x': 228, 'y': 212}}, {'timestamp': 1619159826894, 'position': {'x': 237, 'y': 207}}, {'timestamp': 1619159826995, 'position': {'x': 389, 'y': 222}}, {'timestamp': 1619159827096, 'position': {'x': 419, 'y': 221}}, {'timestamp': 1619159827295, 'position': {'x': 416, 'y': 224}}, {'timestamp': 1619159827395, 'position': {'x': 437, 'y': 225}}, {'timestamp': 1619159827494, 'position': {'x': 470, 'y': 228}}, {'timestamp': 1619159827596, 'position': {'x': 478, 'y': 229}}, {'timestamp': 1619159827695, 'position': {'x': 501, 'y': 227}}, {'timestamp': 1619159827795, 'position': {'x': 523, 'y': 223}}, {'timestamp': 1619159827895, 'position': {'x': 529, 'y': 222}}, {'timestamp': 1619159827995, 'position': {'x': 539, 'y': 223}}, {'timestamp': 1619159828095, 'position': {'x': 550, 'y': 223}}, {'timestamp': 1619159828195, 'position': {'x': 546, 'y': 220}}, {'timestamp': 1619159828295, 'position': {'x': 505, 'y': 212}}, {'timestamp': 1619159828394, 'position': {'x': 504, 'y': 225}}, {'timestamp': 1619159828495, 'position': {'x': 542, 'y': 228}}, {'timestamp': 1619159828594, 'position': {'x': 509, 'y': 218}}, {'timestamp': 1619159828694, 'position': {'x': 533, 'y': 231}}, {'timestamp': 1619159828795, 'position': {'x': 528, 'y': 214}}, {'timestamp': 1619159828895, 'position': {'x': 534, 'y': 228}}, {'timestamp': 1619159828995, 'position': {'x': 662, 'y': 266}}, {'timestamp': 1619159829094, 'position': {'x': 688, 'y': 273}}, {'timestamp': 1619159829194, 'position': {'x': 711, 'y': 279}}, {'timestamp': 1619159829294, 'position': {'x': 736, 'y': 290}}, {'timestamp': 1619159829395, 'position': {'x': 743, 'y': 291}}, {'timestamp': 1619159829495, 'position': {'x': 756, 'y': 293}}, {'timestamp': 1619159829595, 'position': {'x': 777, 'y': 296}}, {'timestamp': 1619159829698, 'position': {'x': 778, 'y': 296}}, {'timestamp': 1619159829794, 'position': {'x': 776, 'y': 292}}, {'timestamp': 1619159833795, 'position': {'x': 773, 'y': 194}}, {'timestamp': 1619159833895, 'position': {'x': 731, 'y': 401}}, {'timestamp': 1619159833997, 'position': {'x': 708, 'y': 488}}, {'timestamp': 1619159834095, 'position': {'x': 716, 'y': 488}}, {'timestamp': 1619159834195, 'position': {'x': 728, 'y': 492}}, {'timestamp': 1619159834295, 'position': {'x': 726, 'y': 502}}, {'timestamp': 1619159834395, 'position': {'x': 725, 'y': 506}}, {'timestamp': 1619159834594, 'position': {'x': 727, 'y': 536}}, {'timestamp': 1619159834695, 'position': {'x': 727, 'y': 701}}, {'timestamp': 1619159834795, 'position': {'x': 726, 'y': 701}}, {'timestamp': 1619159834897, 'position': {'x': 711, 'y': 663}}, {'timestamp': 1619159835098, 'position': {'x': 711, 'y': 646}}, {'timestamp': 1619159835195, 'position': {'x': 716, 'y': 691}}, {'timestamp': 1619159835295, 'position': {'x': 711, 'y': 723}}, {'timestamp': 1619159835396, 'position': {'x': 710, 'y': 723}}, {'timestamp': 1619159835495, 'position': {'x': 702, 'y': 737}}, {'timestamp': 1619159835595, 'position': {'x': 698, 'y': 748}}], 'task_id': 'python:task:16'}	7
15	06:38:38.940952	{'jsonrpc': '2.0', 'method': '/program/PPP/12', 'params': ['\\n# Funcion que ordena una lista, puedes utilizar sort()\\ndef solution(lista):\\n    print(lista)\\n'], 'id': 7, 'keypresses': [{'timestamp': 1619159905799, 'keycode': 80, 'type': 'keydown'}, {'timestamp': 1619159905930, 'keycode': 80, 'type': 'keyup'}, {'timestamp': 1619159905990, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1619159906141, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1619159907073, 'keycode': 73, 'type': 'keydown'}, {'timestamp': 1619159907149, 'keycode': 73, 'type': 'keyup'}, {'timestamp': 1619159907294, 'keycode': 78, 'type': 'keydown'}, {'timestamp': 1619159907372, 'keycode': 78, 'type': 'keyup'}, {'timestamp': 1619159907458, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1619159907569, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1619159907796, 'keycode': 16, 'type': 'keydown'}, {'timestamp': 1619159907963, 'keycode': 57, 'type': 'keydown'}, {'timestamp': 1619159908055, 'keycode': 57, 'type': 'keyup'}, {'timestamp': 1619159909148, 'keycode': 229, 'type': 'keydown'}, {'timestamp': 1619159909215, 'keycode': 222, 'type': 'keyup'}, {'timestamp': 1619159909393, 'keycode': 16, 'type': 'keyup'}, {'timestamp': 1619159909647, 'keycode': 229, 'type': 'keydown'}, {'timestamp': 1619159909733, 'keycode': 74, 'type': 'keyup'}, {'timestamp': 1619159910088, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619159910401, 'keycode': 72, 'type': 'keydown'}, {'timestamp': 1619159910512, 'keycode': 72, 'type': 'keyup'}, {'timestamp': 1619159911130, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619159911532, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619159911950, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1619159912774, 'keycode': 76, 'type': 'keydown'}, {'timestamp': 1619159912849, 'keycode': 76, 'type': 'keyup'}, {'timestamp': 1619159913009, 'keycode': 73, 'type': 'keydown'}, {'timestamp': 1619159913076, 'keycode': 73, 'type': 'keyup'}, {'timestamp': 1619159913166, 'keycode': 83, 'type': 'keydown'}, {'timestamp': 1619159913244, 'keycode': 83, 'type': 'keyup'}, {'timestamp': 1619159913421, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1619159913485, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1619159913630, 'keycode': 65, 'type': 'keydown'}, {'timestamp': 1619159913719, 'keycode': 65, 'type': 'keyup'}, {'timestamp': 1619159914362, 'keycode': 16, 'type': 'keydown'}, {'timestamp': 1619159915106, 'keycode': 48, 'type': 'keydown'}, {'timestamp': 1619159915159, 'keycode': 48, 'type': 'keyup'}, {'timestamp': 1619159915247, 'keycode': 16, 'type': 'keyup'}], 'mousepresses': [{'timestamp': 1619159903474, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619159904010, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619159918301, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619159918452, 'mousecode': 1, 'type': 'mouseup'}], 'mousemovement': [{'timestamp': 1619159851026, 'position': []}, {'timestamp': 1619159857824, 'position': {'x': 153, 'y': 34}}, {'timestamp': 1619159857924, 'position': {'x': 174, 'y': 29}}, {'timestamp': 1619159858025, 'position': {'x': 144, 'y': 89}}, {'timestamp': 1619159858124, 'position': {'x': 57, 'y': 164}}, {'timestamp': 1619159858224, 'position': {'x': 70, 'y': 147}}, {'timestamp': 1619159858325, 'position': {'x': 97, 'y': 184}}, {'timestamp': 1619159858425, 'position': {'x': 85, 'y': 173}}, {'timestamp': 1619159858524, 'position': {'x': 96, 'y': 183}}, {'timestamp': 1619159858624, 'position': {'x': 109, 'y': 169}}, {'timestamp': 1619159858724, 'position': {'x': 98, 'y': 187}}, {'timestamp': 1619159858825, 'position': {'x': 105, 'y': 177}}, {'timestamp': 1619159858925, 'position': {'x': 102, 'y': 182}}, {'timestamp': 1619159859027, 'position': {'x': 106, 'y': 186}}, {'timestamp': 1619159896625, 'position': {'x': 106, 'y': 185}}, {'timestamp': 1619159896724, 'position': {'x': 85, 'y': 0}}, {'timestamp': 1619159896825, 'position': {'x': 28, 'y': 58}}, {'timestamp': 1619159896924, 'position': {'x': 36, 'y': 63}}, {'timestamp': 1619159897025, 'position': {'x': 35, 'y': 28}}, {'timestamp': 1619159897125, 'position': {'x': 26, 'y': 43}}, {'timestamp': 1619159897224, 'position': {'x': 151, 'y': 135}}, {'timestamp': 1619159897326, 'position': {'x': 617, 'y': 299}}, {'timestamp': 1619159897425, 'position': {'x': 631, 'y': 300}}, {'timestamp': 1619159897626, 'position': {'x': 653, 'y': 303}}, {'timestamp': 1619159897725, 'position': {'x': 697, 'y': 281}}, {'timestamp': 1619159897825, 'position': {'x': 726, 'y': 258}}, {'timestamp': 1619159897926, 'position': {'x': 738, 'y': 228}}, {'timestamp': 1619159898024, 'position': {'x': 734, 'y': 211}}, {'timestamp': 1619159898125, 'position': {'x': 722, 'y': 219}}, {'timestamp': 1619159898224, 'position': {'x': 618, 'y': 237}}, {'timestamp': 1619159898324, 'position': {'x': 411, 'y': 256}}, {'timestamp': 1619159898426, 'position': {'x': 402, 'y': 256}}, {'timestamp': 1619159898527, 'position': {'x': 403, 'y': 256}}, {'timestamp': 1619159898624, 'position': {'x': 394, 'y': 263}}, {'timestamp': 1619159898727, 'position': {'x': 228, 'y': 279}}, {'timestamp': 1619159898826, 'position': {'x': 190, 'y': 277}}, {'timestamp': 1619159899025, 'position': {'x': 189, 'y': 277}}, {'timestamp': 1619159899125, 'position': {'x': 158, 'y': 279}}, {'timestamp': 1619159899226, 'position': {'x': 149, 'y': 267}}, {'timestamp': 1619159899327, 'position': {'x': 142, 'y': 262}}, {'timestamp': 1619159899724, 'position': {'x': 389, 'y': 266}}, {'timestamp': 1619159899826, 'position': {'x': 925, 'y': 286}}, {'timestamp': 1619159899929, 'position': {'x': 1001, 'y': 270}}, {'timestamp': 1619159900024, 'position': {'x': 956, 'y': 279}}, {'timestamp': 1619159900124, 'position': {'x': 960, 'y': 276}}, {'timestamp': 1619159900224, 'position': {'x': 1001, 'y': 276}}, {'timestamp': 1619159900324, 'position': {'x': 1041, 'y': 271}}, {'timestamp': 1619159900425, 'position': {'x': 1047, 'y': 268}}, {'timestamp': 1619159900526, 'position': {'x': 1037, 'y': 266}}, {'timestamp': 1619159900624, 'position': {'x': 1004, 'y': 267}}, {'timestamp': 1619159900729, 'position': {'x': 996, 'y': 267}}, {'timestamp': 1619159900825, 'position': {'x': 993, 'y': 266}}, {'timestamp': 1619159900924, 'position': {'x': 973, 'y': 267}}, {'timestamp': 1619159901024, 'position': {'x': 927, 'y': 258}}, {'timestamp': 1619159901125, 'position': {'x': 807, 'y': 249}}, {'timestamp': 1619159901226, 'position': {'x': 778, 'y': 249}}, {'timestamp': 1619159901326, 'position': {'x': 761, 'y': 251}}, {'timestamp': 1619159901524, 'position': {'x': 748, 'y': 250}}, {'timestamp': 1619159901624, 'position': {'x': 426, 'y': 185}}, {'timestamp': 1619159901725, 'position': {'x': 194, 'y': 159}}, {'timestamp': 1619159901824, 'position': {'x': 217, 'y': 157}}, {'timestamp': 1619159901924, 'position': {'x': 217, 'y': 120}}, {'timestamp': 1619159902024, 'position': {'x': 194, 'y': 79}}, {'timestamp': 1619159902124, 'position': {'x': 192, 'y': 95}}, {'timestamp': 1619159902224, 'position': {'x': 210, 'y': 91}}, {'timestamp': 1619159902324, 'position': {'x': 205, 'y': 91}}, {'timestamp': 1619159902424, 'position': {'x': 396, 'y': 147}}, {'timestamp': 1619159902524, 'position': {'x': 875, 'y': 215}}, {'timestamp': 1619159902624, 'position': {'x': 841, 'y': 216}}, {'timestamp': 1619159902724, 'position': {'x': 776, 'y': 215}}, {'timestamp': 1619159902824, 'position': {'x': 658, 'y': 223}}, {'timestamp': 1619159902924, 'position': {'x': 661, 'y': 224}}, {'timestamp': 1619159903024, 'position': {'x': 702, 'y': 229}}, {'timestamp': 1619159903127, 'position': {'x': 699, 'y': 227}}, {'timestamp': 1619159903225, 'position': {'x': 695, 'y': 227}}, {'timestamp': 1619159903324, 'position': {'x': 693, 'y': 224}}, {'timestamp': 1619159903643, 'position': {'x': 711, 'y': 225}}, {'timestamp': 1619159903724, 'position': {'x': 736, 'y': 226}}, {'timestamp': 1619159903824, 'position': {'x': 740, 'y': 226}}, {'timestamp': 1619159903925, 'position': {'x': 746, 'y': 227}}, {'timestamp': 1619159904125, 'position': {'x': 742, 'y': 230}}, {'timestamp': 1619159916222, 'position': {'x': 743, 'y': 174}}, {'timestamp': 1619159916322, 'position': {'x': 771, 'y': 261}}, {'timestamp': 1619159916422, 'position': {'x': 757, 'y': 593}}, {'timestamp': 1619159916522, 'position': {'x': 751, 'y': 831}}, {'timestamp': 1619159916623, 'position': {'x': 743, 'y': 860}}, {'timestamp': 1619159916722, 'position': {'x': 728, 'y': 829}}, {'timestamp': 1619159916822, 'position': {'x': 721, 'y': 791}}, {'timestamp': 1619159916922, 'position': {'x': 731, 'y': 808}}, {'timestamp': 1619159917022, 'position': {'x': 743, 'y': 810}}, {'timestamp': 1619159917122, 'position': {'x': 677, 'y': 775}}, {'timestamp': 1619159917222, 'position': {'x': 754, 'y': 765}}, {'timestamp': 1619159917322, 'position': {'x': 747, 'y': 754}}, {'timestamp': 1619159917423, 'position': {'x': 742, 'y': 752}}, {'timestamp': 1619159917523, 'position': {'x': 726, 'y': 747}}, {'timestamp': 1619159917626, 'position': {'x': 724, 'y': 747}}], 'task_id': 'python:task:17'}	7
16	03:34:20.619925	{'jsonrpc': '2.0', 'method': '/program/PPP/13', 'params': ['\\ndef producto(l1,l2):\\n    pass\\n'], 'id': 10, 'keypresses': [], 'mousepresses': [{'timestamp': 1619580850286, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619580850437, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619580853192, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619580853341, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619580854793, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619580854951, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1619580860086, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1619580860188, 'mousecode': 1, 'type': 'mouseup'}], 'mousemovement': [{'timestamp': 1619580842513, 'position': []}, {'timestamp': 1619580847711, 'position': {'x': 514, 'y': 608}}, {'timestamp': 1619580847811, 'position': {'x': 1033, 'y': 529}}, {'timestamp': 1619580847911, 'position': {'x': 1571, 'y': 472}}, {'timestamp': 1619580848011, 'position': {'x': 1620, 'y': 458}}, {'timestamp': 1619580848112, 'position': {'x': 1618, 'y': 443}}, {'timestamp': 1619580848211, 'position': {'x': 1605, 'y': 418}}, {'timestamp': 1619580848311, 'position': {'x': 1600, 'y': 405}}, {'timestamp': 1619580848411, 'position': {'x': 1595, 'y': 395}}, {'timestamp': 1619580848511, 'position': {'x': 1585, 'y': 373}}, {'timestamp': 1619580848613, 'position': {'x': 1574, 'y': 350}}, {'timestamp': 1619580848712, 'position': {'x': 1573, 'y': 345}}, {'timestamp': 1619580849813, 'position': {'x': 1538, 'y': 253}}, {'timestamp': 1619580849913, 'position': {'x': 1532, 'y': 214}}, {'timestamp': 1619580850013, 'position': {'x': 1532, 'y': 198}}, {'timestamp': 1619580850113, 'position': {'x': 1525, 'y': 166}}, {'timestamp': 1619580850213, 'position': {'x': 1526, 'y': 142}}, {'timestamp': 1619580850313, 'position': {'x': 1526, 'y': 141}}, {'timestamp': 1619580850513, 'position': {'x': 1527, 'y': 141}}, {'timestamp': 1619580850611, 'position': {'x': 1527, 'y': 142}}, {'timestamp': 1619580852013, 'position': {'x': 1526, 'y': 142}}, {'timestamp': 1619580852113, 'position': {'x': 1304, 'y': 151}}, {'timestamp': 1619580852213, 'position': {'x': 719, 'y': 122}}, {'timestamp': 1619580852313, 'position': {'x': 708, 'y': 115}}, {'timestamp': 1619580852513, 'position': {'x': 692, 'y': 119}}, {'timestamp': 1619580852613, 'position': {'x': 398, 'y': 100}}, {'timestamp': 1619580852711, 'position': {'x': 165, 'y': 98}}, {'timestamp': 1619580852813, 'position': {'x': 141, 'y': 104}}, {'timestamp': 1619580852913, 'position': {'x': 146, 'y': 104}}, {'timestamp': 1619580853013, 'position': {'x': 218, 'y': 109}}, {'timestamp': 1619580853111, 'position': {'x': 220, 'y': 109}}, {'timestamp': 1619580853214, 'position': {'x': 220, 'y': 110}}, {'timestamp': 1619580853713, 'position': {'x': 184, 'y': 110}}, {'timestamp': 1619580853813, 'position': {'x': 121, 'y': 106}}, {'timestamp': 1619580853912, 'position': {'x': 120, 'y': 106}}, {'timestamp': 1619580854111, 'position': {'x': 114, 'y': 109}}, {'timestamp': 1619580854212, 'position': {'x': 107, 'y': 110}}, {'timestamp': 1619580854312, 'position': {'x': 105, 'y': 110}}, {'timestamp': 1619580854513, 'position': {'x': 98, 'y': 111}}, {'timestamp': 1619580859211, 'position': {'x': 105, 'y': 134}}, {'timestamp': 1619580859311, 'position': {'x': 381, 'y': 609}}, {'timestamp': 1619580859413, 'position': {'x': 466, 'y': 717}}, {'timestamp': 1619580859511, 'position': {'x': 469, 'y': 698}}, {'timestamp': 1619580859612, 'position': {'x': 692, 'y': 709}}, {'timestamp': 1619580859713, 'position': {'x': 795, 'y': 743}}, {'timestamp': 1619580859812, 'position': {'x': 799, 'y': 747}}, {'timestamp': 1619580859913, 'position': {'x': 766, 'y': 741}}, {'timestamp': 1619580860013, 'position': {'x': 728, 'y': 742}}, {'timestamp': 1619580860113, 'position': {'x': 729, 'y': 743}}], 'task_id': 'python:task:18'}	8
17	18:21:04.191927	{'jsonrpc': '2.0', 'method': '/program/PPP/12', 'params': ['\\n# Funcion que ordena una lista, puedes utilizar sort()\\ndef solution(lista):\\n    pass\\n'], 'id': 7, 'keypresses': [{'timestamp': 1620494027883, 'keycode': 91, 'type': 'keydown'}, {'timestamp': 1620494027902, 'keycode': 18, 'type': 'keydown'}, {'timestamp': 1620494028358, 'keycode': 73, 'type': 'keydown'}, {'timestamp': 1620494028438, 'keycode': 73, 'type': 'keyup'}, {'timestamp': 1620494029042, 'keycode': 18, 'type': 'keyup'}, {'timestamp': 1620494029046, 'keycode': 91, 'type': 'keyup'}, {'timestamp': 1620494030542, 'keycode': 91, 'type': 'keydown'}, {'timestamp': 1620494030545, 'keycode': 17, 'type': 'keydown'}, {'timestamp': 1620494031056, 'keycode': 17, 'type': 'keydown'}, {'timestamp': 1620494031087, 'keycode': 17, 'type': 'keydown'}, {'timestamp': 1620494031102, 'keycode': 73, 'type': 'keydown'}, {'timestamp': 1620494031176, 'keycode': 73, 'type': 'keyup'}, {'timestamp': 1620494031595, 'keycode': 17, 'type': 'keyup'}, {'timestamp': 1620494031596, 'keycode': 91, 'type': 'keyup'}, {'timestamp': 1620494040736, 'keycode': 16, 'type': 'keydown'}, {'timestamp': 1620494040741, 'keycode': 17, 'type': 'keydown'}, {'timestamp': 1620494041112, 'keycode': 73, 'type': 'keydown'}, {'timestamp': 1620494041182, 'keycode': 73, 'type': 'keyup'}, {'timestamp': 1620494041295, 'keycode': 17, 'type': 'keyup'}, {'timestamp': 1620494041306, 'keycode': 16, 'type': 'keyup'}], 'mousepresses': [{'timestamp': 1620494006967, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1620494007112, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1620494039892, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1620494039967, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1620494050157, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1620494050316, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1620498063219, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1620498063354, 'mousecode': 1, 'type': 'mouseup'}], 'mousemovement': [{'timestamp': 1620494001664, 'position': []}, {'timestamp': 1620494001960, 'position': {'x': 901, 'y': 460}}, {'timestamp': 1620494002060, 'position': {'x': 894, 'y': 397}}, {'timestamp': 1620494002161, 'position': {'x': 743, 'y': 252}}, {'timestamp': 1620494002260, 'position': {'x': 698, 'y': 50}}, {'timestamp': 1620494002360, 'position': {'x': 694, 'y': 4}}, {'timestamp': 1620494002861, 'position': {'x': 692, 'y': 17}}, {'timestamp': 1620494002960, 'position': {'x': 670, 'y': 178}}, {'timestamp': 1620494003073, 'position': {'x': 651, 'y': 217}}, {'timestamp': 1620494004061, 'position': {'x': 651, 'y': 218}}, {'timestamp': 1620494004160, 'position': {'x': 649, 'y': 268}}, {'timestamp': 1620494004260, 'position': {'x': 665, 'y': 356}}, {'timestamp': 1620494004360, 'position': {'x': 688, 'y': 443}}, {'timestamp': 1620494004460, 'position': {'x': 702, 'y': 481}}, {'timestamp': 1620494004560, 'position': {'x': 815, 'y': 457}}, {'timestamp': 1620494004661, 'position': {'x': 893, 'y': 437}}, {'timestamp': 1620494004760, 'position': {'x': 1165, 'y': 400}}, {'timestamp': 1620494004862, 'position': {'x': 1462, 'y': 342}}, {'timestamp': 1620494004960, 'position': {'x': 1424, 'y': 340}}, {'timestamp': 1620494005060, 'position': {'x': 1024, 'y': 322}}, {'timestamp': 1620494005161, 'position': {'x': 906, 'y': 300}}, {'timestamp': 1620494005260, 'position': {'x': 907, 'y': 340}}, {'timestamp': 1620494005360, 'position': {'x': 859, 'y': 556}}, {'timestamp': 1620494005460, 'position': {'x': 814, 'y': 607}}, {'timestamp': 1620494005561, 'position': {'x': 773, 'y': 579}}, {'timestamp': 1620494005660, 'position': {'x': 726, 'y': 546}}, {'timestamp': 1620494006260, 'position': {'x': 715, 'y': 555}}, {'timestamp': 1620494006360, 'position': {'x': 682, 'y': 573}}, {'timestamp': 1620494006460, 'position': {'x': 631, 'y': 571}}, {'timestamp': 1620494006561, 'position': {'x': 594, 'y': 580}}, {'timestamp': 1620494006660, 'position': {'x': 594, 'y': 586}}, {'timestamp': 1620494006760, 'position': {'x': 597, 'y': 598}}, {'timestamp': 1620494007061, 'position': {'x': 598, 'y': 598}}, {'timestamp': 1620494007261, 'position': {'x': 705, 'y': 511}}, {'timestamp': 1620494007360, 'position': {'x': 789, 'y': 455}}, {'timestamp': 1620494007460, 'position': {'x': 793, 'y': 447}}, {'timestamp': 1620494008160, 'position': {'x': 751, 'y': 402}}, {'timestamp': 1620494008261, 'position': {'x': 464, 'y': 5}}, {'timestamp': 1620494008660, 'position': {'x': 381, 'y': 75}}, {'timestamp': 1620494008761, 'position': {'x': 336, 'y': 184}}, {'timestamp': 1620494008862, 'position': {'x': 334, 'y': 190}}, {'timestamp': 1620494010861, 'position': {'x': 332, 'y': 255}}, {'timestamp': 1620494010961, 'position': {'x': 329, 'y': 285}}, {'timestamp': 1620494021959, 'position': {'x': 404, 'y': 191}}, {'timestamp': 1620494022059, 'position': {'x': 440, 'y': 145}}, {'timestamp': 1620494023159, 'position': {'x': 533, 'y': 209}}, {'timestamp': 1620494023259, 'position': {'x': 1194, 'y': 390}}, {'timestamp': 1620494023359, 'position': {'x': 1370, 'y': 411}}, {'timestamp': 1620494023459, 'position': {'x': 1202, 'y': 353}}, {'timestamp': 1620494023561, 'position': {'x': 1092, 'y': 319}}, {'timestamp': 1620494023661, 'position': {'x': 1048, 'y': 308}}, {'timestamp': 1620494023759, 'position': {'x': 979, 'y': 305}}, {'timestamp': 1620494023861, 'position': {'x': 960, 'y': 298}}, {'timestamp': 1620494024065, 'position': {'x': 959, 'y': 298}}, {'timestamp': 1620494032359, 'position': {'x': 1118, 'y': 186}}, {'timestamp': 1620494032460, 'position': {'x': 1402, 'y': 16}}, {'timestamp': 1620494039960, 'position': {'x': 388, 'y': 523}}, {'timestamp': 1620494040061, 'position': {'x': 376, 'y': 503}}, {'timestamp': 1620494040160, 'position': {'x': 388, 'y': 470}}, {'timestamp': 1620494043062, 'position': {'x': 392, 'y': 464}}, {'timestamp': 1620494043160, 'position': {'x': 811, 'y': 273}}, {'timestamp': 1620494044663, 'position': {'x': 866, 'y': 323}}, {'timestamp': 1620494044874, 'position': {'x': 866, 'y': 322}}, {'timestamp': 1620494044961, 'position': {'x': 870, 'y': 318}}, {'timestamp': 1620494045060, 'position': {'x': 885, 'y': 317}}, {'timestamp': 1620494045168, 'position': {'x': 888, 'y': 317}}, {'timestamp': 1620494045263, 'position': {'x': 895, 'y': 314}}, {'timestamp': 1620494045372, 'position': {'x': 896, 'y': 314}}, {'timestamp': 1620494046059, 'position': {'x': 888, 'y': 317}}, {'timestamp': 1620494046260, 'position': {'x': 893, 'y': 317}}, {'timestamp': 1620494046370, 'position': {'x': 895, 'y': 317}}, {'timestamp': 1620494046464, 'position': {'x': 896, 'y': 316}}, {'timestamp': 1620494048459, 'position': {'x': 1205, 'y': 370}}, {'timestamp': 1620494048559, 'position': {'x': 952, 'y': 557}}, {'timestamp': 1620494048659, 'position': {'x': 623, 'y': 663}}, {'timestamp': 1620494048765, 'position': {'x': 614, 'y': 668}}, {'timestamp': 1620494048860, 'position': {'x': 536, 'y': 703}}, {'timestamp': 1620494048960, 'position': {'x': 449, 'y': 743}}, {'timestamp': 1620494049059, 'position': {'x': 441, 'y': 765}}, {'timestamp': 1620494049160, 'position': {'x': 441, 'y': 769}}, {'timestamp': 1620494049260, 'position': {'x': 465, 'y': 745}}, {'timestamp': 1620494049359, 'position': {'x': 466, 'y': 744}}, {'timestamp': 1620494050459, 'position': {'x': 510, 'y': 705}}, {'timestamp': 1620494050564, 'position': {'x': 551, 'y': 612}}, {'timestamp': 1620494050661, 'position': {'x': 617, 'y': 517}}, {'timestamp': 1620494050760, 'position': {'x': 621, 'y': 509}}, {'timestamp': 1620494051663, 'position': {'x': 632, 'y': 502}}, {'timestamp': 1620494051762, 'position': {'x': 890, 'y': 370}}, {'timestamp': 1620494051859, 'position': {'x': 1194, 'y': 258}}, {'timestamp': 1620494055059, 'position': {'x': 1214, 'y': 314}}, {'timestamp': 1620494055174, 'position': {'x': 1213, 'y': 315}}, {'timestamp': 1620494055470, 'position': {'x': 1214, 'y': 315}}, {'timestamp': 1620494055564, 'position': {'x': 1217, 'y': 315}}, {'timestamp': 1620494060359, 'position': {'x': 1013, 'y': 487}}, {'timestamp': 1620494060460, 'position': {'x': 1010, 'y': 459}}, {'timestamp': 1620494060559, 'position': {'x': 1028, 'y': 433}}, {'timestamp': 1620494060659, 'position': {'x': 1031, 'y': 430}}, {'timestamp': 1620494060759, 'position': {'x': 1064, 'y': 404}}, {'timestamp': 1620494060859, 'position': {'x': 1067, 'y': 400}}, {'timestamp': 1620494060959, 'position': {'x': 1067, 'y': 399}}, {'timestamp': 1620494184860, 'position': {'x': 493, 'y': 460}}, {'timestamp': 1620494184962, 'position': {'x': 219, 'y': 550}}, {'timestamp': 1620494185067, 'position': {'x': 225, 'y': 582}}, {'timestamp': 1620494185162, 'position': {'x': 226, 'y': 616}}, {'timestamp': 1620494185268, 'position': {'x': 226, 'y': 623}}, {'timestamp': 1620494185364, 'position': {'x': 328, 'y': 654}}, {'timestamp': 1620494185460, 'position': {'x': 538, 'y': 724}}, {'timestamp': 1620494185572, 'position': {'x': 577, 'y': 748}}, {'timestamp': 1620494185662, 'position': {'x': 576, 'y': 748}}, {'timestamp': 1620494185762, 'position': {'x': 500, 'y': 770}}, {'timestamp': 1620494949059, 'position': {'x': 615, 'y': 589}}, {'timestamp': 1620494949161, 'position': {'x': 764, 'y': 434}}, {'timestamp': 1620496677467, 'position': {'x': 482, 'y': 716}}, {'timestamp': 1620496677563, 'position': {'x': 470, 'y': 529}}, {'timestamp': 1620496677661, 'position': {'x': 457, 'y': 66}}, {'timestamp': 1620496677769, 'position': {'x': 457, 'y': 2}}, {'timestamp': 1620498060760, 'position': {'x': 345, 'y': 45}}, {'timestamp': 1620498060869, 'position': {'x': 230, 'y': 35}}, {'timestamp': 1620498060962, 'position': {'x': 235, 'y': 35}}, {'timestamp': 1620498061060, 'position': {'x': 434, 'y': 50}}, {'timestamp': 1620498061168, 'position': {'x': 487, 'y': 52}}, {'timestamp': 1620498061260, 'position': {'x': 462, 'y': 59}}, {'timestamp': 1620498061366, 'position': {'x': 190, 'y': 22}}, {'timestamp': 1620498061463, 'position': {'x': 97, 'y': 4}}, {'timestamp': 1620498062462, 'position': {'x': 383, 'y': 558}}, {'timestamp': 1620498062566, 'position': {'x': 435, 'y': 686}}, {'timestamp': 1620498062661, 'position': {'x': 426, 'y': 682}}, {'timestamp': 1620498062764, 'position': {'x': 411, 'y': 701}}, {'timestamp': 1620498062860, 'position': {'x': 391, 'y': 714}}, {'timestamp': 1620498062961, 'position': {'x': 381, 'y': 723}}, {'timestamp': 1620498063061, 'position': {'x': 380, 'y': 727}}, {'timestamp': 1620498063165, 'position': {'x': 380, 'y': 732}}], 'task_id': 'python:task:23'}	7
18	18:43:04.648749	{'jsonrpc': '2.0', 'method': '/program/PPP/12', 'params': ['\\n# Funcion que ordena una lista, puedes utilizar sort()\\ndef solution(lista):\\n    pass\\n'], 'id': 7, 'keypresses': [], 'mousepresses': [{'timestamp': 1620499383949, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1620499384045, 'mousecode': 1, 'type': 'mouseup'}], 'mousemovement': [{'timestamp': 1620499379201, 'position': []}, {'timestamp': 1620499382598, 'position': {'x': 691, 'y': 181}}, {'timestamp': 1620499382699, 'position': {'x': 665, 'y': 260}}, {'timestamp': 1620499382800, 'position': {'x': 616, 'y': 343}}, {'timestamp': 1620499382900, 'position': {'x': 576, 'y': 382}}, {'timestamp': 1620499382999, 'position': {'x': 564, 'y': 388}}, {'timestamp': 1620499383099, 'position': {'x': 548, 'y': 354}}, {'timestamp': 1620499383199, 'position': {'x': 559, 'y': 374}}, {'timestamp': 1620499383300, 'position': {'x': 611, 'y': 694}}, {'timestamp': 1620499383399, 'position': {'x': 617, 'y': 673}}, {'timestamp': 1620499383499, 'position': {'x': 626, 'y': 645}}, {'timestamp': 1620499383599, 'position': {'x': 620, 'y': 594}}, {'timestamp': 1620499383699, 'position': {'x': 618, 'y': 592}}, {'timestamp': 1620499383799, 'position': {'x': 617, 'y': 593}}, {'timestamp': 1620499383899, 'position': {'x': 610, 'y': 604}}], 'task_id': 'python:task:1'}	7
19	02:58:07.718572	{'jsonrpc': '2.0', 'method': '/program/PPP/7', 'params': ['\\ndef regresa_tupla(a,b,c):\\n    return (a,b,c)\\n'], 'id': 5, 'keypresses': [{'timestamp': 1621479475764, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1621479476100, 'keycode': 46, 'type': 'keyup'}, {'timestamp': 1621479476280, 'keycode': 46, 'type': 'keyup'}, {'timestamp': 1621479476469, 'keycode': 46, 'type': 'keyup'}, {'timestamp': 1621479476659, 'keycode': 46, 'type': 'keyup'}, {'timestamp': 1621479477478, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1621479477575, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1621479477824, 'keycode': 69, 'type': 'keydown'}, {'timestamp': 1621479477991, 'keycode': 69, 'type': 'keyup'}, {'timestamp': 1621479478132, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1621479478248, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1621479478377, 'keycode': 85, 'type': 'keydown'}, {'timestamp': 1621479478466, 'keycode': 85, 'type': 'keyup'}, {'timestamp': 1621479478514, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1621479478607, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1621479478636, 'keycode': 78, 'type': 'keydown'}, {'timestamp': 1621479478722, 'keycode': 78, 'type': 'keyup'}, {'timestamp': 1621479478872, 'keycode': 32, 'type': 'keydown'}, {'timestamp': 1621479478979, 'keycode': 32, 'type': 'keyup'}, {'timestamp': 1621479483440, 'keycode': 17, 'type': 'keydown'}, {'timestamp': 1621479483796, 'keycode': 67, 'type': 'keydown'}, {'timestamp': 1621479483945, 'keycode': 67, 'type': 'keyup'}, {'timestamp': 1621479483977, 'keycode': 17, 'type': 'keyup'}, {'timestamp': 1621479485140, 'keycode': 17, 'type': 'keydown'}, {'timestamp': 1621479485231, 'keycode': 86, 'type': 'keydown'}, {'timestamp': 1621479485380, 'keycode': 86, 'type': 'keyup'}, {'timestamp': 1621479485399, 'keycode': 17, 'type': 'keyup'}], 'mousepresses': [{'timestamp': 1621479474321, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1621479474458, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1621479474558, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1621479474645, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1621479480813, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1621479482687, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1621479484780, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1621479484923, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1621479486172, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1621479486274, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1621479487649, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1621479487791, 'mousecode': 1, 'type': 'mouseup'}], 'mousemovement': [{'timestamp': 1621479451850, 'position': {'x': 436, 'y': 481}}, {'timestamp': 1621479451950, 'position': {'x': 633, 'y': 486}}, {'timestamp': 1621479452050, 'position': {'x': 668, 'y': 431}}, {'timestamp': 1621479452150, 'position': {'x': 668, 'y': 428}}, {'timestamp': 1621479452249, 'position': {'x': 735, 'y': 30}}, {'timestamp': 1621479452450, 'position': {'x': 576, 'y': 297}}, {'timestamp': 1621479452550, 'position': {'x': 892, 'y': 543}}, {'timestamp': 1621479452649, 'position': {'x': 914, 'y': 447}}, {'timestamp': 1621479452750, 'position': {'x': 924, 'y': 433}}, {'timestamp': 1621479452850, 'position': {'x': 924, 'y': 432}}, {'timestamp': 1621479452950, 'position': {'x': 921, 'y': 438}}, {'timestamp': 1621479453050, 'position': {'x': 907, 'y': 478}}, {'timestamp': 1621479453149, 'position': {'x': 968, 'y': 446}}, {'timestamp': 1621479453249, 'position': {'x': 965, 'y': 443}}, {'timestamp': 1621479453350, 'position': {'x': 971, 'y': 486}}, {'timestamp': 1621479453549, 'position': {'x': 966, 'y': 496}}, {'timestamp': 1621479453650, 'position': {'x': 964, 'y': 500}}, {'timestamp': 1621479453750, 'position': {'x': 962, 'y': 496}}, {'timestamp': 1621479453850, 'position': {'x': 963, 'y': 492}}, {'timestamp': 1621479453950, 'position': {'x': 1305, 'y': 488}}, {'timestamp': 1621479454049, 'position': {'x': 1564, 'y': 497}}, {'timestamp': 1621479454149, 'position': {'x': 1529, 'y': 461}}, {'timestamp': 1621479454249, 'position': {'x': 1535, 'y': 429}}, {'timestamp': 1621479454350, 'position': {'x': 1634, 'y': 339}}, {'timestamp': 1621479454450, 'position': {'x': 1636, 'y': 337}}, {'timestamp': 1621479454551, 'position': {'x': 1637, 'y': 291}}, {'timestamp': 1621479454649, 'position': {'x': 1617, 'y': 289}}, {'timestamp': 1621479454750, 'position': {'x': 1604, 'y': 289}}, {'timestamp': 1621479454850, 'position': {'x': 1580, 'y': 305}}, {'timestamp': 1621479454959, 'position': {'x': 1582, 'y': 308}}, {'timestamp': 1621479455150, 'position': {'x': 1579, 'y': 317}}, {'timestamp': 1621479455249, 'position': {'x': 1498, 'y': 311}}, {'timestamp': 1621479455349, 'position': {'x': 1385, 'y': 299}}, {'timestamp': 1621479455449, 'position': {'x': 1356, 'y': 303}}, {'timestamp': 1621479455550, 'position': {'x': 1393, 'y': 305}}, {'timestamp': 1621479455650, 'position': {'x': 1372, 'y': 312}}, {'timestamp': 1621479455750, 'position': {'x': 1344, 'y': 328}}, {'timestamp': 1621479455850, 'position': {'x': 1347, 'y': 352}}, {'timestamp': 1621479455950, 'position': {'x': 1372, 'y': 411}}, {'timestamp': 1621479456051, 'position': {'x': 1282, 'y': 562}}, {'timestamp': 1621479456150, 'position': {'x': 860, 'y': 715}}, {'timestamp': 1621479456250, 'position': {'x': 541, 'y': 488}}, {'timestamp': 1621479456350, 'position': {'x': 847, 'y': 326}}, {'timestamp': 1621479456450, 'position': {'x': 923, 'y': 443}}, {'timestamp': 1621479456549, 'position': {'x': 923, 'y': 442}}, {'timestamp': 1621479456653, 'position': {'x': 917, 'y': 426}}, {'timestamp': 1621479457350, 'position': {'x': 850, 'y': 468}}, {'timestamp': 1621479457450, 'position': {'x': 751, 'y': 559}}, {'timestamp': 1621479457550, 'position': {'x': 717, 'y': 567}}, {'timestamp': 1621479457650, 'position': {'x': 647, 'y': 604}}, {'timestamp': 1621479457749, 'position': {'x': 608, 'y': 639}}, {'timestamp': 1621479457850, 'position': {'x': 589, 'y': 670}}, {'timestamp': 1621479457950, 'position': {'x': 592, 'y': 665}}, {'timestamp': 1621479458050, 'position': {'x': 638, 'y': 636}}, {'timestamp': 1621479458149, 'position': {'x': 644, 'y': 632}}, {'timestamp': 1621479458250, 'position': {'x': 665, 'y': 370}}, {'timestamp': 1621479458350, 'position': {'x': 664, 'y': 257}}, {'timestamp': 1621479458453, 'position': {'x': 662, 'y': 261}}, {'timestamp': 1621479458549, 'position': {'x': 661, 'y': 261}}, {'timestamp': 1621479458749, 'position': {'x': 659, 'y': 264}}, {'timestamp': 1621479458850, 'position': {'x': 652, 'y': 268}}, {'timestamp': 1621479458949, 'position': {'x': 505, 'y': 275}}, {'timestamp': 1621479459050, 'position': {'x': 491, 'y': 273}}, {'timestamp': 1621479459149, 'position': {'x': 685, 'y': 270}}, {'timestamp': 1621479459249, 'position': {'x': 682, 'y': 261}}, {'timestamp': 1621479459350, 'position': {'x': 641, 'y': 241}}, {'timestamp': 1621479459450, 'position': {'x': 429, 'y': 228}}, {'timestamp': 1621479459549, 'position': {'x': 210, 'y': 211}}, {'timestamp': 1621479459749, 'position': {'x': 192, 'y': 199}}, {'timestamp': 1621479459849, 'position': {'x': 180, 'y': 190}}, {'timestamp': 1621479459949, 'position': {'x': 136, 'y': 179}}, {'timestamp': 1621479460049, 'position': {'x': 123, 'y': 175}}, {'timestamp': 1621479460149, 'position': {'x': 107, 'y': 172}}, {'timestamp': 1621479460249, 'position': {'x': 99, 'y': 169}}, {'timestamp': 1621479460350, 'position': {'x': 121, 'y': 169}}, {'timestamp': 1621479460450, 'position': {'x': 159, 'y': 167}}, {'timestamp': 1621479460550, 'position': {'x': 166, 'y': 167}}, {'timestamp': 1621479460649, 'position': {'x': 189, 'y': 167}}, {'timestamp': 1621479460750, 'position': {'x': 231, 'y': 169}}, {'timestamp': 1621479460850, 'position': {'x': 239, 'y': 169}}, {'timestamp': 1621479460949, 'position': {'x': 252, 'y': 167}}, {'timestamp': 1621479461050, 'position': {'x': 253, 'y': 167}}, {'timestamp': 1621479461150, 'position': {'x': 265, 'y': 167}}, {'timestamp': 1621479461250, 'position': {'x': 267, 'y': 167}}, {'timestamp': 1621479461350, 'position': {'x': 282, 'y': 169}}, {'timestamp': 1621479461450, 'position': {'x': 311, 'y': 169}}, {'timestamp': 1621479461550, 'position': {'x': 362, 'y': 168}}, {'timestamp': 1621479461650, 'position': {'x': 429, 'y': 170}}, {'timestamp': 1621479461749, 'position': {'x': 465, 'y': 170}}, {'timestamp': 1621479462150, 'position': {'x': 460, 'y': 170}}, {'timestamp': 1621479462250, 'position': {'x': 452, 'y': 170}}, {'timestamp': 1621479462349, 'position': {'x': 411, 'y': 173}}, {'timestamp': 1621479462449, 'position': {'x': 409, 'y': 173}}, {'timestamp': 1621479462549, 'position': {'x': 377, 'y': 173}}, {'timestamp': 1621479462650, 'position': {'x': 358, 'y': 167}}, {'timestamp': 1621479462750, 'position': {'x': 388, 'y': 160}}, {'timestamp': 1621479462849, 'position': {'x': 441, 'y': 161}}, {'timestamp': 1621479462950, 'position': {'x': 416, 'y': 172}}, {'timestamp': 1621479463049, 'position': {'x': 150, 'y': 206}}, {'timestamp': 1621479463149, 'position': {'x': 29, 'y': 210}}, {'timestamp': 1621479463249, 'position': {'x': 30, 'y': 209}}, {'timestamp': 1621479463349, 'position': {'x': 90, 'y': 201}}, {'timestamp': 1621479463449, 'position': {'x': 111, 'y': 199}}, {'timestamp': 1621479463551, 'position': {'x': 123, 'y': 198}}, {'timestamp': 1621479463650, 'position': {'x': 145, 'y': 196}}, {'timestamp': 1621479463749, 'position': {'x': 191, 'y': 194}}, {'timestamp': 1621479463849, 'position': {'x': 211, 'y': 193}}, {'timestamp': 1621479463950, 'position': {'x': 245, 'y': 189}}, {'timestamp': 1621479464050, 'position': {'x': 250, 'y': 189}}, {'timestamp': 1621479464149, 'position': {'x': 311, 'y': 189}}, {'timestamp': 1621479464349, 'position': {'x': 308, 'y': 192}}, {'timestamp': 1621479464449, 'position': {'x': 317, 'y': 197}}, {'timestamp': 1621479464549, 'position': {'x': 282, 'y': 155}}, {'timestamp': 1621479464649, 'position': {'x': 244, 'y': 157}}, {'timestamp': 1621479464750, 'position': {'x': 317, 'y': 178}}, {'timestamp': 1621479464849, 'position': {'x': 312, 'y': 173}}, {'timestamp': 1621479464949, 'position': {'x': 310, 'y': 177}}, {'timestamp': 1621479465349, 'position': {'x': 307, 'y': 175}}, {'timestamp': 1621479465750, 'position': {'x': 307, 'y': 198}}, {'timestamp': 1621479465849, 'position': {'x': 341, 'y': 316}}, {'timestamp': 1621479465950, 'position': {'x': 396, 'y': 300}}, {'timestamp': 1621479466049, 'position': {'x': 402, 'y': 243}}, {'timestamp': 1621479466149, 'position': {'x': 346, 'y': 131}}, {'timestamp': 1621479466250, 'position': {'x': 219, 'y': 131}}, {'timestamp': 1621479466351, 'position': {'x': 158, 'y': 312}}, {'timestamp': 1621479466449, 'position': {'x': 258, 'y': 476}}, {'timestamp': 1621479466550, 'position': {'x': 334, 'y': 342}}, {'timestamp': 1621479466649, 'position': {'x': 255, 'y': 255}}, {'timestamp': 1621479466749, 'position': {'x': 136, 'y': 562}}, {'timestamp': 1621479466850, 'position': {'x': 510, 'y': 526}}, {'timestamp': 1621479466949, 'position': {'x': 142, 'y': 214}}, {'timestamp': 1621479467049, 'position': {'x': 44, 'y': 562}}, {'timestamp': 1621479467149, 'position': {'x': 561, 'y': 520}}, {'timestamp': 1621479467249, 'position': {'x': 260, 'y': 176}}, {'timestamp': 1621479467349, 'position': {'x': 29, 'y': 339}}, {'timestamp': 1621479467449, 'position': {'x': 376, 'y': 268}}, {'timestamp': 1621479467550, 'position': {'x': 217, 'y': 234}}, {'timestamp': 1621479467650, 'position': {'x': 298, 'y': 351}}, {'timestamp': 1621479467749, 'position': {'x': 335, 'y': 285}}, {'timestamp': 1621479467851, 'position': {'x': 238, 'y': 246}}, {'timestamp': 1621479467950, 'position': {'x': 226, 'y': 326}}, {'timestamp': 1621479468050, 'position': {'x': 282, 'y': 172}}, {'timestamp': 1621479468150, 'position': {'x': 112, 'y': 271}}, {'timestamp': 1621479468251, 'position': {'x': 273, 'y': 416}}, {'timestamp': 1621479468349, 'position': {'x': 309, 'y': 276}}, {'timestamp': 1621479468450, 'position': {'x': 183, 'y': 426}}, {'timestamp': 1621479468550, 'position': {'x': 357, 'y': 393}}, {'timestamp': 1621479468650, 'position': {'x': 197, 'y': 216}}, {'timestamp': 1621479468750, 'position': {'x': 164, 'y': 516}}, {'timestamp': 1621479468850, 'position': {'x': 300, 'y': 392}}, {'timestamp': 1621479468950, 'position': {'x': 182, 'y': 271}}, {'timestamp': 1621479469050, 'position': {'x': 257, 'y': 381}}, {'timestamp': 1621479469150, 'position': {'x': 285, 'y': 226}}, {'timestamp': 1621479469250, 'position': {'x': 138, 'y': 440}}, {'timestamp': 1621479469350, 'position': {'x': 270, 'y': 255}}, {'timestamp': 1621479469449, 'position': {'x': 34, 'y': 309}}, {'timestamp': 1621479469549, 'position': {'x': 192, 'y': 440}}, {'timestamp': 1621479469649, 'position': {'x': 179, 'y': 360}}, {'timestamp': 1621479469752, 'position': {'x': 173, 'y': 344}}, {'timestamp': 1621479469950, 'position': {'x': 244, 'y': 308}}, {'timestamp': 1621479470050, 'position': {'x': 543, 'y': 260}}, {'timestamp': 1621479470163, 'position': {'x': 542, 'y': 260}}, {'timestamp': 1621479470450, 'position': {'x': 523, 'y': 254}}, {'timestamp': 1621479470549, 'position': {'x': 467, 'y': 214}}, {'timestamp': 1621479470651, 'position': {'x': 336, 'y': 246}}, {'timestamp': 1621479470749, 'position': {'x': 405, 'y': 404}}, {'timestamp': 1621479470849, 'position': {'x': 529, 'y': 182}}, {'timestamp': 1621479470950, 'position': {'x': 77, 'y': 84}}, {'timestamp': 1621479471050, 'position': {'x': 249, 'y': 350}}, {'timestamp': 1621479471149, 'position': {'x': 427, 'y': 217}}, {'timestamp': 1621479471250, 'position': {'x': 152, 'y': 190}}, {'timestamp': 1621479471349, 'position': {'x': 341, 'y': 267}}, {'timestamp': 1621479471449, 'position': {'x': 244, 'y': 108}}, {'timestamp': 1621479471550, 'position': {'x': 104, 'y': 176}}, {'timestamp': 1621479471649, 'position': {'x': 235, 'y': 129}}, {'timestamp': 1621479471749, 'position': {'x': 144, 'y': 142}}, {'timestamp': 1621479471849, 'position': {'x': 300, 'y': 276}}, {'timestamp': 1621479471949, 'position': {'x': 153, 'y': 148}}, {'timestamp': 1621479472050, 'position': {'x': 0, 'y': 99}}, {'timestamp': 1621479472149, 'position': {'x': 136, 'y': 103}}, {'timestamp': 1621479472250, 'position': {'x': 121, 'y': 97}}, {'timestamp': 1621479472350, 'position': {'x': 76, 'y': 114}}, {'timestamp': 1621479472451, 'position': {'x': 195, 'y': 139}}, {'timestamp': 1621479472550, 'position': {'x': 94, 'y': 83}}, {'timestamp': 1621479472651, 'position': {'x': 36, 'y': 179}}, {'timestamp': 1621479472750, 'position': {'x': 162, 'y': 122}}, {'timestamp': 1621479472850, 'position': {'x': 101, 'y': 104}}, {'timestamp': 1621479472950, 'position': {'x': 237, 'y': 79}}, {'timestamp': 1621479473050, 'position': {'x': 205, 'y': 4}}, {'timestamp': 1621479473350, 'position': {'x': 237, 'y': 4}}, {'timestamp': 1621479473450, 'position': {'x': 520, 'y': 29}}, {'timestamp': 1621479473549, 'position': {'x': 546, 'y': 32}}, {'timestamp': 1621479473649, 'position': {'x': 615, 'y': 38}}, {'timestamp': 1621479473749, 'position': {'x': 609, 'y': 132}}, {'timestamp': 1621479473850, 'position': {'x': 611, 'y': 202}}, {'timestamp': 1621479473949, 'position': {'x': 611, 'y': 200}}, {'timestamp': 1621479474049, 'position': {'x': 611, 'y': 202}}, {'timestamp': 1621479474149, 'position': {'x': 600, 'y': 204}}, {'timestamp': 1621479474465, 'position': {'x': 601, 'y': 203}}, {'timestamp': 1621479474561, 'position': {'x': 602, 'y': 202}}, {'timestamp': 1621479474750, 'position': {'x': 602, 'y': 203}}, {'timestamp': 1621479474850, 'position': {'x': 703, 'y': 193}}, {'timestamp': 1621479474950, 'position': {'x': 758, 'y': 190}}, {'timestamp': 1621479479751, 'position': {'x': 711, 'y': 161}}, {'timestamp': 1621479479862, 'position': {'x': 652, 'y': 128}}, {'timestamp': 1621479479950, 'position': {'x': 682, 'y': 149}}, {'timestamp': 1621479480050, 'position': {'x': 632, 'y': 254}}, {'timestamp': 1621479480150, 'position': {'x': 644, 'y': 249}}, {'timestamp': 1621479480250, 'position': {'x': 644, 'y': 240}}, {'timestamp': 1621479480350, 'position': {'x': 647, 'y': 210}}, {'timestamp': 1621479480450, 'position': {'x': 669, 'y': 190}}, {'timestamp': 1621479480550, 'position': {'x': 671, 'y': 185}}, {'timestamp': 1621479480750, 'position': {'x': 671, 'y': 186}}, {'timestamp': 1621479480949, 'position': {'x': 673, 'y': 186}}, {'timestamp': 1621479481051, 'position': {'x': 735, 'y': 180}}, {'timestamp': 1621479481149, 'position': {'x': 747, 'y': 179}}, {'timestamp': 1621479481450, 'position': {'x': 738, 'y': 185}}, {'timestamp': 1621479481549, 'position': {'x': 733, 'y': 186}}, {'timestamp': 1621479481649, 'position': {'x': 728, 'y': 188}}, {'timestamp': 1621479481750, 'position': {'x': 726, 'y': 188}}, {'timestamp': 1621479481849, 'position': {'x': 720, 'y': 189}}, {'timestamp': 1621479482049, 'position': {'x': 716, 'y': 190}}, {'timestamp': 1621479482151, 'position': {'x': 714, 'y': 190}}, {'timestamp': 1621479482250, 'position': {'x': 713, 'y': 190}}, {'timestamp': 1621479482350, 'position': {'x': 712, 'y': 190}}, {'timestamp': 1621479482750, 'position': {'x': 756, 'y': 171}}, {'timestamp': 1621479482850, 'position': {'x': 968, 'y': 115}}, {'timestamp': 1621479482949, 'position': {'x': 974, 'y': 115}}, {'timestamp': 1621479483750, 'position': {'x': 972, 'y': 117}}, {'timestamp': 1621479483850, 'position': {'x': 801, 'y': 196}}, {'timestamp': 1621479483950, 'position': {'x': 736, 'y': 220}}, {'timestamp': 1621479484050, 'position': {'x': 713, 'y': 217}}, {'timestamp': 1621479484165, 'position': {'x': 670, 'y': 220}}, {'timestamp': 1621479484350, 'position': {'x': 664, 'y': 218}}, {'timestamp': 1621479484461, 'position': {'x': 664, 'y': 217}}, {'timestamp': 1621479484549, 'position': {'x': 664, 'y': 215}}, {'timestamp': 1621479484650, 'position': {'x': 661, 'y': 210}}, {'timestamp': 1621479484756, 'position': {'x': 658, 'y': 201}}, {'timestamp': 1621479485050, 'position': {'x': 747, 'y': 216}}, {'timestamp': 1621479485150, 'position': {'x': 937, 'y': 273}}, {'timestamp': 1621479485450, 'position': {'x': 936, 'y': 283}}, {'timestamp': 1621479485550, 'position': {'x': 891, 'y': 340}}, {'timestamp': 1621479485650, 'position': {'x': 736, 'y': 287}}, {'timestamp': 1621479485750, 'position': {'x': 686, 'y': 197}}, {'timestamp': 1621479485850, 'position': {'x': 702, 'y': 374}}, {'timestamp': 1621479485950, 'position': {'x': 692, 'y': 269}}, {'timestamp': 1621479486050, 'position': {'x': 681, 'y': 407}}, {'timestamp': 1621479486150, 'position': {'x': 741, 'y': 401}}, {'timestamp': 1621479486250, 'position': {'x': 740, 'y': 401}}, {'timestamp': 1621479486349, 'position': {'x': 735, 'y': 410}}, {'timestamp': 1621479486449, 'position': {'x': 823, 'y': 405}}, {'timestamp': 1621479486551, 'position': {'x': 769, 'y': 611}}, {'timestamp': 1621479486649, 'position': {'x': 676, 'y': 779}}, {'timestamp': 1621479487050, 'position': {'x': 612, 'y': 786}}, {'timestamp': 1621479487150, 'position': {'x': 595, 'y': 773}}, {'timestamp': 1621479487251, 'position': {'x': 596, 'y': 769}}, {'timestamp': 1621479487351, 'position': {'x': 603, 'y': 761}}, {'timestamp': 1621479487450, 'position': {'x': 610, 'y': 750}}], 'task_id': 'python:task:1'}	2
20	04:36:52.439005	{'jsonrpc': '2.0', 'method': '/program/PPP/7', 'params': ['\\ndef regresa_tupla(a,b,c):\\n    return (a,b,c)\\n'], 'id': 5, 'keypresses': [{'timestamp': 1621571801065, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1621571801248, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1621571801329, 'keycode': 69, 'type': 'keydown'}, {'timestamp': 1621571801444, 'keycode': 69, 'type': 'keyup'}, {'timestamp': 1621571801589, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1621571801698, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1621571802014, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1621571802165, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1621571802194, 'keycode': 85, 'type': 'keydown'}, {'timestamp': 1621571802329, 'keycode': 85, 'type': 'keyup'}, {'timestamp': 1621571802505, 'keycode': 78, 'type': 'keydown'}, {'timestamp': 1621571802597, 'keycode': 78, 'type': 'keyup'}, {'timestamp': 1621571803237, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1621571803413, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1621571803585, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1621571804348, 'keycode': 85, 'type': 'keydown'}, {'timestamp': 1621571804423, 'keycode': 85, 'type': 'keyup'}, {'timestamp': 1621571804622, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1621571804725, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1621571804856, 'keycode': 78, 'type': 'keydown'}, {'timestamp': 1621571804936, 'keycode': 78, 'type': 'keyup'}, {'timestamp': 1621571805046, 'keycode': 32, 'type': 'keydown'}, {'timestamp': 1621571805120, 'keycode': 32, 'type': 'keyup'}, {'timestamp': 1621571805989, 'keycode': 16, 'type': 'keydown'}, {'timestamp': 1621571806284, 'keycode': 57, 'type': 'keydown'}, {'timestamp': 1621571806361, 'keycode': 48, 'type': 'keydown'}, {'timestamp': 1621571806417, 'keycode': 57, 'type': 'keyup'}, {'timestamp': 1621571806441, 'keycode': 48, 'type': 'keyup'}, {'timestamp': 1621571806519, 'keycode': 16, 'type': 'keyup'}, {'timestamp': 1621571807050, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1621571807264, 'keycode': 65, 'type': 'keydown'}, {'timestamp': 1621571807370, 'keycode': 65, 'type': 'keyup'}, {'timestamp': 1621571808202, 'keycode': 188, 'type': 'keydown'}, {'timestamp': 1621571808281, 'keycode': 188, 'type': 'keyup'}, {'timestamp': 1621571808623, 'keycode': 66, 'type': 'keydown'}, {'timestamp': 1621571808681, 'keycode': 66, 'type': 'keyup'}, {'timestamp': 1621571809262, 'keycode': 188, 'type': 'keydown'}, {'timestamp': 1621571809331, 'keycode': 188, 'type': 'keyup'}, {'timestamp': 1621571810314, 'keycode': 67, 'type': 'keydown'}, {'timestamp': 1621571810403, 'keycode': 67, 'type': 'keyup'}], 'mousepresses': [{'timestamp': 1621571799721, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1621571799857, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1621571799918, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1621571800011, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1621571811137, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1621571811231, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1621571812039, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1621571812147, 'mousecode': 1, 'type': 'mouseup'}], 'mousemovement': [{'timestamp': 1621571797262, 'position': {'x': 1408, 'y': 228}}, {'timestamp': 1621571797361, 'position': {'x': 1409, 'y': 227}}, {'timestamp': 1621571797462, 'position': {'x': 1408, 'y': 226}}, {'timestamp': 1621571797565, 'position': {'x': 1408, 'y': 225}}, {'timestamp': 1621571797661, 'position': {'x': 1406, 'y': 222}}, {'timestamp': 1621571797762, 'position': {'x': 1399, 'y': 225}}, {'timestamp': 1621571797861, 'position': {'x': 1353, 'y': 276}}, {'timestamp': 1621571797961, 'position': {'x': 855, 'y': 449}}, {'timestamp': 1621571798062, 'position': {'x': 665, 'y': 391}}, {'timestamp': 1621571798161, 'position': {'x': 670, 'y': 332}}, {'timestamp': 1621571798261, 'position': {'x': 676, 'y': 330}}, {'timestamp': 1621571798361, 'position': {'x': 684, 'y': 291}}, {'timestamp': 1621571798463, 'position': {'x': 679, 'y': 283}}, {'timestamp': 1621571798562, 'position': {'x': 674, 'y': 265}}, {'timestamp': 1621571798662, 'position': {'x': 653, 'y': 235}}, {'timestamp': 1621571798763, 'position': {'x': 652, 'y': 229}}, {'timestamp': 1621571798961, 'position': {'x': 648, 'y': 224}}, {'timestamp': 1621571799062, 'position': {'x': 638, 'y': 218}}, {'timestamp': 1621571799162, 'position': {'x': 621, 'y': 214}}, {'timestamp': 1621571799461, 'position': {'x': 621, 'y': 208}}, {'timestamp': 1621571799665, 'position': {'x': 619, 'y': 207}}, {'timestamp': 1621571799861, 'position': {'x': 618, 'y': 206}}, {'timestamp': 1621571800162, 'position': {'x': 620, 'y': 206}}, {'timestamp': 1621571800262, 'position': {'x': 635, 'y': 206}}, {'timestamp': 1621571800361, 'position': {'x': 646, 'y': 204}}, {'timestamp': 1621571810762, 'position': {'x': 564, 'y': 144}}, {'timestamp': 1621571810862, 'position': {'x': 567, 'y': 285}}, {'timestamp': 1621571810962, 'position': {'x': 594, 'y': 365}}, {'timestamp': 1621571811061, 'position': {'x': 665, 'y': 379}}, {'timestamp': 1621571811161, 'position': {'x': 696, 'y': 382}}, {'timestamp': 1621571811461, 'position': {'x': 679, 'y': 483}}, {'timestamp': 1621571811562, 'position': {'x': 564, 'y': 785}}, {'timestamp': 1621571811761, 'position': {'x': 626, 'y': 747}}, {'timestamp': 1621571811861, 'position': {'x': 630, 'y': 735}}, {'timestamp': 1621571811961, 'position': {'x': 631, 'y': 734}}], 'task_id': 'python:task:4'}	2
21	14:06:29.600898	{'jsonrpc': '2.0', 'method': '/program/PPP/8', 'params': ['\\ndef recorta(pelicula):\\n    re\\n'], 'id': 6, 'keypresses': [{'timestamp': 1622297179543, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1622297179829, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1622297180207, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1622297180730, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1622297183694, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1622297183716, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1622297183991, 'keycode': 69, 'type': 'keydown'}, {'timestamp': 1622297184011, 'keycode': 69, 'type': 'keyup'}], 'mousepresses': [{'timestamp': 1622297135333, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1622297135334, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1622297176956, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1622297176961, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1622297178077, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1622297178082, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1622297189348, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1622297189350, 'mousecode': 1, 'type': 'mouseup'}], 'mousemovement': [{'timestamp': 1622297084965, 'position': []}, {'timestamp': 1622297135354, 'position': {'x': 588, 'y': 121}}, {'timestamp': 1622297176980, 'position': {'x': 195, 'y': 202}}, {'timestamp': 1622297178092, 'position': {'x': 173, 'y': 215}}], 'task_id': 'python:task:5'}	35
22	02:05:29.964646	{'jsonrpc': '2.0', 'method': '/program/PPP/12', 'params': ['\\n# Funcion que ordena una lista, puedes utilizar sort()\\ndef solution(lista):\\n    pass\\n'], 'id': 7, 'keypresses': [], 'mousepresses': [{'timestamp': 1628647528512, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1628647528626, 'mousecode': 1, 'type': 'mouseup'}], 'mousemovement': [{'timestamp': 1628647520426, 'position': []}, {'timestamp': 1628647520718, 'position': {'x': 1165, 'y': 340}}, {'timestamp': 1628647521020, 'position': {'x': 1147, 'y': 334}}, {'timestamp': 1628647521119, 'position': {'x': 681, 'y': 221}}, {'timestamp': 1628647521219, 'position': {'x': 169, 'y': 225}}, {'timestamp': 1628647521319, 'position': {'x': 233, 'y': 263}}, {'timestamp': 1628647521420, 'position': {'x': 229, 'y': 203}}, {'timestamp': 1628647521519, 'position': {'x': 188, 'y': 208}}, {'timestamp': 1628647521619, 'position': {'x': 225, 'y': 217}}, {'timestamp': 1628647521719, 'position': {'x': 225, 'y': 153}}, {'timestamp': 1628647521819, 'position': {'x': 227, 'y': 137}}, {'timestamp': 1628647521919, 'position': {'x': 225, 'y': 215}}, {'timestamp': 1628647522020, 'position': {'x': 263, 'y': 196}}, {'timestamp': 1628647522119, 'position': {'x': 252, 'y': 186}}, {'timestamp': 1628647522219, 'position': {'x': 255, 'y': 427}}, {'timestamp': 1628647522319, 'position': {'x': 340, 'y': 569}}, {'timestamp': 1628647522419, 'position': {'x': 341, 'y': 583}}, {'timestamp': 1628647522520, 'position': {'x': 340, 'y': 583}}, {'timestamp': 1628647524118, 'position': {'x': 352, 'y': 404}}, {'timestamp': 1628647524219, 'position': {'x': 336, 'y': 122}}, {'timestamp': 1628647524325, 'position': {'x': 335, 'y': 121}}, {'timestamp': 1628647524719, 'position': {'x': 343, 'y': 122}}, {'timestamp': 1628647524819, 'position': {'x': 644, 'y': 150}}, {'timestamp': 1628647524919, 'position': {'x': 881, 'y': 215}}, {'timestamp': 1628647525019, 'position': {'x': 962, 'y': 247}}, {'timestamp': 1628647525120, 'position': {'x': 904, 'y': 210}}, {'timestamp': 1628647525220, 'position': {'x': 606, 'y': 276}}, {'timestamp': 1628647525319, 'position': {'x': 658, 'y': 340}}, {'timestamp': 1628647525426, 'position': {'x': 665, 'y': 354}}, {'timestamp': 1628647525719, 'position': {'x': 597, 'y': 284}}, {'timestamp': 1628647525819, 'position': {'x': 379, 'y': 166}}, {'timestamp': 1628647525919, 'position': {'x': 327, 'y': 392}}, {'timestamp': 1628647526019, 'position': {'x': 524, 'y': 533}}, {'timestamp': 1628647526118, 'position': {'x': 382, 'y': 366}}, {'timestamp': 1628647526219, 'position': {'x': 621, 'y': 580}}, {'timestamp': 1628647526319, 'position': {'x': 722, 'y': 617}}, {'timestamp': 1628647526419, 'position': {'x': 721, 'y': 615}}, {'timestamp': 1628647526520, 'position': {'x': 722, 'y': 593}}, {'timestamp': 1628647526619, 'position': {'x': 714, 'y': 643}}, {'timestamp': 1628647526719, 'position': {'x': 704, 'y': 592}}, {'timestamp': 1628647526819, 'position': {'x': 669, 'y': 460}}, {'timestamp': 1628647526918, 'position': {'x': 675, 'y': 363}}, {'timestamp': 1628647527019, 'position': {'x': 670, 'y': 336}}, {'timestamp': 1628647527120, 'position': {'x': 646, 'y': 305}}, {'timestamp': 1628647527219, 'position': {'x': 629, 'y': 267}}, {'timestamp': 1628647527319, 'position': {'x': 642, 'y': 225}}, {'timestamp': 1628647527418, 'position': {'x': 712, 'y': 215}}, {'timestamp': 1628647527519, 'position': {'x': 705, 'y': 256}}, {'timestamp': 1628647527619, 'position': {'x': 564, 'y': 631}}, {'timestamp': 1628647527719, 'position': {'x': 547, 'y': 718}}, {'timestamp': 1628647527819, 'position': {'x': 549, 'y': 771}}, {'timestamp': 1628647527919, 'position': {'x': 553, 'y': 786}}, {'timestamp': 1628647528119, 'position': {'x': 569, 'y': 763}}, {'timestamp': 1628647528319, 'position': {'x': 569, 'y': 760}}, {'timestamp': 1628647528419, 'position': {'x': 575, 'y': 742}}, {'timestamp': 1628647528519, 'position': {'x': 575, 'y': 741}}], 'task_id': 'python:task:6'}	7
23	02:06:12.000373	{'jsonrpc': '2.0', 'method': '/program/PPP/12', 'params': ['\\n# Funcion que ordena una lista, puedes utilizar sort()\\ndef solution(lista):\\n    lista.sort()\\n    return lista\\n'], 'id': 7, 'keypresses': [{'timestamp': 1628647551593, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1628647554131, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1628647554293, 'keycode': 69, 'type': 'keydown'}, {'timestamp': 1628647554297, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1628647554391, 'keycode': 69, 'type': 'keyup'}, {'timestamp': 1628647554528, 'keycode': 83, 'type': 'keydown'}, {'timestamp': 1628647554638, 'keycode': 83, 'type': 'keyup'}, {'timestamp': 1628647555121, 'keycode': 85, 'type': 'keydown'}, {'timestamp': 1628647555203, 'keycode': 85, 'type': 'keyup'}, {'timestamp': 1628647555397, 'keycode': 76, 'type': 'keydown'}, {'timestamp': 1628647555474, 'keycode': 76, 'type': 'keyup'}, {'timestamp': 1628647555567, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1628647555656, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1628647555770, 'keycode': 65, 'type': 'keydown'}, {'timestamp': 1628647555930, 'keycode': 65, 'type': 'keyup'}, {'timestamp': 1628647555960, 'keycode': 68, 'type': 'keydown'}, {'timestamp': 1628647556072, 'keycode': 68, 'type': 'keyup'}, {'timestamp': 1628647556104, 'keycode': 79, 'type': 'keydown'}, {'timestamp': 1628647556180, 'keycode': 79, 'type': 'keyup'}, {'timestamp': 1628647556295, 'keycode': 32, 'type': 'keydown'}, {'timestamp': 1628647556346, 'keycode': 32, 'type': 'keyup'}, {'timestamp': 1628647558197, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1628647558406, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1628647558576, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1628647558744, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1628647558911, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1628647559076, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1628647559248, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1628647559431, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1628647559724, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1628647560165, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1628647560533, 'keycode': 76, 'type': 'keydown'}, {'timestamp': 1628647560608, 'keycode': 76, 'type': 'keyup'}, {'timestamp': 1628647560752, 'keycode': 73, 'type': 'keydown'}, {'timestamp': 1628647560821, 'keycode': 73, 'type': 'keyup'}, {'timestamp': 1628647560878, 'keycode': 83, 'type': 'keydown'}, {'timestamp': 1628647560945, 'keycode': 83, 'type': 'keyup'}, {'timestamp': 1628647561091, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1628647561188, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1628647561316, 'keycode': 65, 'type': 'keydown'}, {'timestamp': 1628647561454, 'keycode': 65, 'type': 'keyup'}, {'timestamp': 1628647561799, 'keycode': 190, 'type': 'keydown'}, {'timestamp': 1628647561888, 'keycode': 190, 'type': 'keyup'}, {'timestamp': 1628647562083, 'keycode': 83, 'type': 'keydown'}, {'timestamp': 1628647562204, 'keycode': 83, 'type': 'keyup'}, {'timestamp': 1628647562485, 'keycode': 79, 'type': 'keydown'}, {'timestamp': 1628647562562, 'keycode': 79, 'type': 'keyup'}, {'timestamp': 1628647562705, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1628647562801, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1628647562925, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1628647563007, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1628647563269, 'keycode': 16, 'type': 'keydown'}, {'timestamp': 1628647563409, 'keycode': 57, 'type': 'keydown'}, {'timestamp': 1628647563477, 'keycode': 48, 'type': 'keydown'}, {'timestamp': 1628647563532, 'keycode': 57, 'type': 'keyup'}, {'timestamp': 1628647563576, 'keycode': 48, 'type': 'keyup'}, {'timestamp': 1628647563605, 'keycode': 16, 'type': 'keyup'}, {'timestamp': 1628647564263, 'keycode': 13, 'type': 'keydown'}, {'timestamp': 1628647564337, 'keycode': 13, 'type': 'keyup'}, {'timestamp': 1628647565182, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1628647565332, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1628647565423, 'keycode': 69, 'type': 'keydown'}, {'timestamp': 1628647565542, 'keycode': 69, 'type': 'keyup'}, {'timestamp': 1628647565710, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1628647565823, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1628647565975, 'keycode': 85, 'type': 'keydown'}, {'timestamp': 1628647566067, 'keycode': 85, 'type': 'keyup'}, {'timestamp': 1628647566143, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1628647566229, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1628647566280, 'keycode': 78, 'type': 'keydown'}, {'timestamp': 1628647566359, 'keycode': 78, 'type': 'keyup'}, {'timestamp': 1628647566511, 'keycode': 32, 'type': 'keydown'}, {'timestamp': 1628647566589, 'keycode': 32, 'type': 'keyup'}, {'timestamp': 1628647567741, 'keycode': 76, 'type': 'keydown'}, {'timestamp': 1628647567814, 'keycode': 76, 'type': 'keyup'}, {'timestamp': 1628647568014, 'keycode': 73, 'type': 'keydown'}, {'timestamp': 1628647568076, 'keycode': 73, 'type': 'keyup'}, {'timestamp': 1628647568127, 'keycode': 83, 'type': 'keydown'}, {'timestamp': 1628647568206, 'keycode': 83, 'type': 'keyup'}, {'timestamp': 1628647568364, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1628647568447, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1628647568580, 'keycode': 65, 'type': 'keydown'}, {'timestamp': 1628647568673, 'keycode': 65, 'type': 'keyup'}], 'mousepresses': [{'timestamp': 1628647528512, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1628647528626, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1628647533216, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1628647533296, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1628647539603, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1628647539727, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1628647539828, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1628647539925, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1628647570531, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1628647570658, 'mousecode': 1, 'type': 'mouseup'}], 'mousemovement': [{'timestamp': 1628647520426, 'position': []}, {'timestamp': 1628647520718, 'position': {'x': 1165, 'y': 340}}, {'timestamp': 1628647521020, 'position': {'x': 1147, 'y': 334}}, {'timestamp': 1628647521119, 'position': {'x': 681, 'y': 221}}, {'timestamp': 1628647521219, 'position': {'x': 169, 'y': 225}}, {'timestamp': 1628647521319, 'position': {'x': 233, 'y': 263}}, {'timestamp': 1628647521420, 'position': {'x': 229, 'y': 203}}, {'timestamp': 1628647521519, 'position': {'x': 188, 'y': 208}}, {'timestamp': 1628647521619, 'position': {'x': 225, 'y': 217}}, {'timestamp': 1628647521719, 'position': {'x': 225, 'y': 153}}, {'timestamp': 1628647521819, 'position': {'x': 227, 'y': 137}}, {'timestamp': 1628647521919, 'position': {'x': 225, 'y': 215}}, {'timestamp': 1628647522020, 'position': {'x': 263, 'y': 196}}, {'timestamp': 1628647522119, 'position': {'x': 252, 'y': 186}}, {'timestamp': 1628647522219, 'position': {'x': 255, 'y': 427}}, {'timestamp': 1628647522319, 'position': {'x': 340, 'y': 569}}, {'timestamp': 1628647522419, 'position': {'x': 341, 'y': 583}}, {'timestamp': 1628647522520, 'position': {'x': 340, 'y': 583}}, {'timestamp': 1628647524118, 'position': {'x': 352, 'y': 404}}, {'timestamp': 1628647524219, 'position': {'x': 336, 'y': 122}}, {'timestamp': 1628647524325, 'position': {'x': 335, 'y': 121}}, {'timestamp': 1628647524719, 'position': {'x': 343, 'y': 122}}, {'timestamp': 1628647524819, 'position': {'x': 644, 'y': 150}}, {'timestamp': 1628647524919, 'position': {'x': 881, 'y': 215}}, {'timestamp': 1628647525019, 'position': {'x': 962, 'y': 247}}, {'timestamp': 1628647525120, 'position': {'x': 904, 'y': 210}}, {'timestamp': 1628647525220, 'position': {'x': 606, 'y': 276}}, {'timestamp': 1628647525319, 'position': {'x': 658, 'y': 340}}, {'timestamp': 1628647525426, 'position': {'x': 665, 'y': 354}}, {'timestamp': 1628647525719, 'position': {'x': 597, 'y': 284}}, {'timestamp': 1628647525819, 'position': {'x': 379, 'y': 166}}, {'timestamp': 1628647525919, 'position': {'x': 327, 'y': 392}}, {'timestamp': 1628647526019, 'position': {'x': 524, 'y': 533}}, {'timestamp': 1628647526118, 'position': {'x': 382, 'y': 366}}, {'timestamp': 1628647526219, 'position': {'x': 621, 'y': 580}}, {'timestamp': 1628647526319, 'position': {'x': 722, 'y': 617}}, {'timestamp': 1628647526419, 'position': {'x': 721, 'y': 615}}, {'timestamp': 1628647526520, 'position': {'x': 722, 'y': 593}}, {'timestamp': 1628647526619, 'position': {'x': 714, 'y': 643}}, {'timestamp': 1628647526719, 'position': {'x': 704, 'y': 592}}, {'timestamp': 1628647526819, 'position': {'x': 669, 'y': 460}}, {'timestamp': 1628647526918, 'position': {'x': 675, 'y': 363}}, {'timestamp': 1628647527019, 'position': {'x': 670, 'y': 336}}, {'timestamp': 1628647527120, 'position': {'x': 646, 'y': 305}}, {'timestamp': 1628647527219, 'position': {'x': 629, 'y': 267}}, {'timestamp': 1628647527319, 'position': {'x': 642, 'y': 225}}, {'timestamp': 1628647527418, 'position': {'x': 712, 'y': 215}}, {'timestamp': 1628647527519, 'position': {'x': 705, 'y': 256}}, {'timestamp': 1628647527619, 'position': {'x': 564, 'y': 631}}, {'timestamp': 1628647527719, 'position': {'x': 547, 'y': 718}}, {'timestamp': 1628647527819, 'position': {'x': 549, 'y': 771}}, {'timestamp': 1628647527919, 'position': {'x': 553, 'y': 786}}, {'timestamp': 1628647528119, 'position': {'x': 569, 'y': 763}}, {'timestamp': 1628647528319, 'position': {'x': 569, 'y': 760}}, {'timestamp': 1628647528419, 'position': {'x': 575, 'y': 742}}, {'timestamp': 1628647528519, 'position': {'x': 575, 'y': 741}}, {'timestamp': 1628647528719, 'position': {'x': 664, 'y': 724}}, {'timestamp': 1628647528819, 'position': {'x': 852, 'y': 688}}, {'timestamp': 1628647529519, 'position': {'x': 851, 'y': 688}}, {'timestamp': 1628647529619, 'position': {'x': 738, 'y': 649}}, {'timestamp': 1628647529719, 'position': {'x': 312, 'y': 309}}, {'timestamp': 1628647529818, 'position': {'x': 184, 'y': 291}}, {'timestamp': 1628647529918, 'position': {'x': 268, 'y': 464}}, {'timestamp': 1628647530020, 'position': {'x': 288, 'y': 370}}, {'timestamp': 1628647530119, 'position': {'x': 174, 'y': 357}}, {'timestamp': 1628647530219, 'position': {'x': 244, 'y': 400}}, {'timestamp': 1628647530319, 'position': {'x': 244, 'y': 299}}, {'timestamp': 1628647530419, 'position': {'x': 240, 'y': 270}}, {'timestamp': 1628647530519, 'position': {'x': 315, 'y': 323}}, {'timestamp': 1628647530619, 'position': {'x': 374, 'y': 272}}, {'timestamp': 1628647530719, 'position': {'x': 315, 'y': 298}}, {'timestamp': 1628647530819, 'position': {'x': 466, 'y': 310}}, {'timestamp': 1628647530919, 'position': {'x': 389, 'y': 305}}, {'timestamp': 1628647531019, 'position': {'x': 438, 'y': 329}}, {'timestamp': 1628647531119, 'position': {'x': 457, 'y': 356}}, {'timestamp': 1628647531520, 'position': {'x': 471, 'y': 306}}, {'timestamp': 1628647531620, 'position': {'x': 487, 'y': 292}}, {'timestamp': 1628647531725, 'position': {'x': 495, 'y': 282}}, {'timestamp': 1628647532019, 'position': {'x': 487, 'y': 282}}, {'timestamp': 1628647532119, 'position': {'x': 291, 'y': 297}}, {'timestamp': 1628647532219, 'position': {'x': 200, 'y': 276}}, {'timestamp': 1628647532318, 'position': {'x': 194, 'y': 271}}, {'timestamp': 1628647532419, 'position': {'x': 192, 'y': 274}}, {'timestamp': 1628647532519, 'position': {'x': 183, 'y': 272}}, {'timestamp': 1628647532619, 'position': {'x': 131, 'y': 140}}, {'timestamp': 1628647532719, 'position': {'x': 110, 'y': 49}}, {'timestamp': 1628647532818, 'position': {'x': 103, 'y': 70}}, {'timestamp': 1628647532919, 'position': {'x': 102, 'y': 83}}, {'timestamp': 1628647533019, 'position': {'x': 105, 'y': 101}}, {'timestamp': 1628647533119, 'position': {'x': 105, 'y': 105}}, {'timestamp': 1628647533219, 'position': {'x': 107, 'y': 111}}, {'timestamp': 1628647533619, 'position': {'x': 107, 'y': 113}}, {'timestamp': 1628647533719, 'position': {'x': 95, 'y': 157}}, {'timestamp': 1628647533818, 'position': {'x': 86, 'y': 188}}, {'timestamp': 1628647533919, 'position': {'x': 85, 'y': 183}}, {'timestamp': 1628647534020, 'position': {'x': 84, 'y': 179}}, {'timestamp': 1628647534219, 'position': {'x': 87, 'y': 179}}, {'timestamp': 1628647534319, 'position': {'x': 91, 'y': 176}}, {'timestamp': 1628647534420, 'position': {'x': 106, 'y': 170}}, {'timestamp': 1628647534519, 'position': {'x': 124, 'y': 170}}, {'timestamp': 1628647534619, 'position': {'x': 144, 'y': 171}}, {'timestamp': 1628647534720, 'position': {'x': 184, 'y': 176}}, {'timestamp': 1628647534819, 'position': {'x': 232, 'y': 181}}, {'timestamp': 1628647534920, 'position': {'x': 271, 'y': 182}}, {'timestamp': 1628647535019, 'position': {'x': 276, 'y': 181}}, {'timestamp': 1628647535119, 'position': {'x': 304, 'y': 181}}, {'timestamp': 1628647535219, 'position': {'x': 305, 'y': 181}}, {'timestamp': 1628647535520, 'position': {'x': 303, 'y': 192}}, {'timestamp': 1628647535619, 'position': {'x': 303, 'y': 200}}, {'timestamp': 1628647535719, 'position': {'x': 285, 'y': 241}}, {'timestamp': 1628647535820, 'position': {'x': 231, 'y': 319}}, {'timestamp': 1628647535919, 'position': {'x': 190, 'y': 332}}, {'timestamp': 1628647536019, 'position': {'x': 176, 'y': 323}}, {'timestamp': 1628647536119, 'position': {'x': 173, 'y': 323}}, {'timestamp': 1628647536219, 'position': {'x': 167, 'y': 325}}, {'timestamp': 1628647536319, 'position': {'x': 151, 'y': 328}}, {'timestamp': 1628647536420, 'position': {'x': 137, 'y': 323}}, {'timestamp': 1628647536520, 'position': {'x': 132, 'y': 322}}, {'timestamp': 1628647536620, 'position': {'x': 131, 'y': 322}}, {'timestamp': 1628647536719, 'position': {'x': 116, 'y': 331}}, {'timestamp': 1628647536829, 'position': {'x': 115, 'y': 332}}, {'timestamp': 1628647536919, 'position': {'x': 117, 'y': 309}}, {'timestamp': 1628647537019, 'position': {'x': 139, 'y': 254}}, {'timestamp': 1628647537119, 'position': {'x': 141, 'y': 252}}, {'timestamp': 1628647537219, 'position': {'x': 145, 'y': 246}}, {'timestamp': 1628647537319, 'position': {'x': 151, 'y': 245}}, {'timestamp': 1628647537419, 'position': {'x': 179, 'y': 248}}, {'timestamp': 1628647537519, 'position': {'x': 200, 'y': 229}}, {'timestamp': 1628647537619, 'position': {'x': 221, 'y': 202}}, {'timestamp': 1628647537719, 'position': {'x': 244, 'y': 178}}, {'timestamp': 1628647537819, 'position': {'x': 258, 'y': 174}}, {'timestamp': 1628647537919, 'position': {'x': 279, 'y': 169}}, {'timestamp': 1628647538019, 'position': {'x': 290, 'y': 165}}, {'timestamp': 1628647538120, 'position': {'x': 315, 'y': 162}}, {'timestamp': 1628647538219, 'position': {'x': 333, 'y': 164}}, {'timestamp': 1628647538320, 'position': {'x': 365, 'y': 173}}, {'timestamp': 1628647538419, 'position': {'x': 421, 'y': 186}}, {'timestamp': 1628647538519, 'position': {'x': 568, 'y': 225}}, {'timestamp': 1628647538620, 'position': {'x': 590, 'y': 229}}, {'timestamp': 1628647538719, 'position': {'x': 588, 'y': 229}}, {'timestamp': 1628647538819, 'position': {'x': 584, 'y': 225}}, {'timestamp': 1628647538919, 'position': {'x': 570, 'y': 214}}, {'timestamp': 1628647539020, 'position': {'x': 569, 'y': 214}}, {'timestamp': 1628647539119, 'position': {'x': 565, 'y': 214}}, {'timestamp': 1628647539220, 'position': {'x': 561, 'y': 214}}, {'timestamp': 1628647539319, 'position': {'x': 559, 'y': 214}}, {'timestamp': 1628647540119, 'position': {'x': 690, 'y': 221}}, {'timestamp': 1628647540220, 'position': {'x': 905, 'y': 232}}, {'timestamp': 1628647540319, 'position': {'x': 842, 'y': 225}}, {'timestamp': 1628647540420, 'position': {'x': 718, 'y': 207}}, {'timestamp': 1628647540519, 'position': {'x': 688, 'y': 327}}, {'timestamp': 1628647540620, 'position': {'x': 688, 'y': 304}}, {'timestamp': 1628647540719, 'position': {'x': 677, 'y': 261}}, {'timestamp': 1628647540819, 'position': {'x': 682, 'y': 279}}, {'timestamp': 1628647541320, 'position': {'x': 666, 'y': 289}}, {'timestamp': 1628647541428, 'position': {'x': 666, 'y': 291}}, {'timestamp': 1628647542820, 'position': {'x': 657, 'y': 286}}, {'timestamp': 1628647542919, 'position': {'x': 651, 'y': 285}}, {'timestamp': 1628647543029, 'position': {'x': 650, 'y': 284}}, {'timestamp': 1628647543220, 'position': {'x': 649, 'y': 284}}, {'timestamp': 1628647543419, 'position': {'x': 647, 'y': 310}}, {'timestamp': 1628647569520, 'position': {'x': 638, 'y': 499}}, {'timestamp': 1628647569620, 'position': {'x': 633, 'y': 618}}, {'timestamp': 1628647569720, 'position': {'x': 629, 'y': 615}}, {'timestamp': 1628647569820, 'position': {'x': 585, 'y': 659}}, {'timestamp': 1628647569919, 'position': {'x': 531, 'y': 779}}, {'timestamp': 1628647570020, 'position': {'x': 538, 'y': 809}}, {'timestamp': 1628647570119, 'position': {'x': 533, 'y': 817}}, {'timestamp': 1628647570219, 'position': {'x': 547, 'y': 769}}, {'timestamp': 1628647570319, 'position': {'x': 551, 'y': 758}}], 'task_id': 'python:task:7'}	7
24	02:06:54.051885	{'jsonrpc': '2.0', 'method': '/program/PPP/12', 'params': ['\\n# Funcion que ordena una lista, puedes utilizar sort()\\ndef solution(lista):\\n    if lista:\\n        lista.sort()\\n        return lista\\n    else:\\n        return []\\n'], 'id': 7, 'keypresses': [{'timestamp': 1628647551593, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1628647554131, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1628647554293, 'keycode': 69, 'type': 'keydown'}, {'timestamp': 1628647554297, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1628647554391, 'keycode': 69, 'type': 'keyup'}, {'timestamp': 1628647554528, 'keycode': 83, 'type': 'keydown'}, {'timestamp': 1628647554638, 'keycode': 83, 'type': 'keyup'}, {'timestamp': 1628647555121, 'keycode': 85, 'type': 'keydown'}, {'timestamp': 1628647555203, 'keycode': 85, 'type': 'keyup'}, {'timestamp': 1628647555397, 'keycode': 76, 'type': 'keydown'}, {'timestamp': 1628647555474, 'keycode': 76, 'type': 'keyup'}, {'timestamp': 1628647555567, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1628647555656, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1628647555770, 'keycode': 65, 'type': 'keydown'}, {'timestamp': 1628647555930, 'keycode': 65, 'type': 'keyup'}, {'timestamp': 1628647555960, 'keycode': 68, 'type': 'keydown'}, {'timestamp': 1628647556072, 'keycode': 68, 'type': 'keyup'}, {'timestamp': 1628647556104, 'keycode': 79, 'type': 'keydown'}, {'timestamp': 1628647556180, 'keycode': 79, 'type': 'keyup'}, {'timestamp': 1628647556295, 'keycode': 32, 'type': 'keydown'}, {'timestamp': 1628647556346, 'keycode': 32, 'type': 'keyup'}, {'timestamp': 1628647558197, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1628647558406, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1628647558576, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1628647558744, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1628647558911, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1628647559076, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1628647559248, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1628647559431, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1628647559724, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1628647560165, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1628647560533, 'keycode': 76, 'type': 'keydown'}, {'timestamp': 1628647560608, 'keycode': 76, 'type': 'keyup'}, {'timestamp': 1628647560752, 'keycode': 73, 'type': 'keydown'}, {'timestamp': 1628647560821, 'keycode': 73, 'type': 'keyup'}, {'timestamp': 1628647560878, 'keycode': 83, 'type': 'keydown'}, {'timestamp': 1628647560945, 'keycode': 83, 'type': 'keyup'}, {'timestamp': 1628647561091, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1628647561188, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1628647561316, 'keycode': 65, 'type': 'keydown'}, {'timestamp': 1628647561454, 'keycode': 65, 'type': 'keyup'}, {'timestamp': 1628647561799, 'keycode': 190, 'type': 'keydown'}, {'timestamp': 1628647561888, 'keycode': 190, 'type': 'keyup'}, {'timestamp': 1628647562083, 'keycode': 83, 'type': 'keydown'}, {'timestamp': 1628647562204, 'keycode': 83, 'type': 'keyup'}, {'timestamp': 1628647562485, 'keycode': 79, 'type': 'keydown'}, {'timestamp': 1628647562562, 'keycode': 79, 'type': 'keyup'}, {'timestamp': 1628647562705, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1628647562801, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1628647562925, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1628647563007, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1628647563269, 'keycode': 16, 'type': 'keydown'}, {'timestamp': 1628647563409, 'keycode': 57, 'type': 'keydown'}, {'timestamp': 1628647563477, 'keycode': 48, 'type': 'keydown'}, {'timestamp': 1628647563532, 'keycode': 57, 'type': 'keyup'}, {'timestamp': 1628647563576, 'keycode': 48, 'type': 'keyup'}, {'timestamp': 1628647563605, 'keycode': 16, 'type': 'keyup'}, {'timestamp': 1628647564263, 'keycode': 13, 'type': 'keydown'}, {'timestamp': 1628647564337, 'keycode': 13, 'type': 'keyup'}, {'timestamp': 1628647565182, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1628647565332, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1628647565423, 'keycode': 69, 'type': 'keydown'}, {'timestamp': 1628647565542, 'keycode': 69, 'type': 'keyup'}, {'timestamp': 1628647565710, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1628647565823, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1628647565975, 'keycode': 85, 'type': 'keydown'}, {'timestamp': 1628647566067, 'keycode': 85, 'type': 'keyup'}, {'timestamp': 1628647566143, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1628647566229, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1628647566280, 'keycode': 78, 'type': 'keydown'}, {'timestamp': 1628647566359, 'keycode': 78, 'type': 'keyup'}, {'timestamp': 1628647566511, 'keycode': 32, 'type': 'keydown'}, {'timestamp': 1628647566589, 'keycode': 32, 'type': 'keyup'}, {'timestamp': 1628647567741, 'keycode': 76, 'type': 'keydown'}, {'timestamp': 1628647567814, 'keycode': 76, 'type': 'keyup'}, {'timestamp': 1628647568014, 'keycode': 73, 'type': 'keydown'}, {'timestamp': 1628647568076, 'keycode': 73, 'type': 'keyup'}, {'timestamp': 1628647568127, 'keycode': 83, 'type': 'keydown'}, {'timestamp': 1628647568206, 'keycode': 83, 'type': 'keyup'}, {'timestamp': 1628647568364, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1628647568447, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1628647568580, 'keycode': 65, 'type': 'keydown'}, {'timestamp': 1628647568673, 'keycode': 65, 'type': 'keyup'}, {'timestamp': 1628647589607, 'keycode': 39, 'type': 'keyup'}, {'timestamp': 1628647590675, 'keycode': 13, 'type': 'keydown'}, {'timestamp': 1628647590776, 'keycode': 13, 'type': 'keyup'}, {'timestamp': 1628647591103, 'keycode': 38, 'type': 'keyup'}, {'timestamp': 1628647591974, 'keycode': 73, 'type': 'keydown'}, {'timestamp': 1628647592060, 'keycode': 73, 'type': 'keyup'}, {'timestamp': 1628647592381, 'keycode': 70, 'type': 'keydown'}, {'timestamp': 1628647592512, 'keycode': 70, 'type': 'keyup'}, {'timestamp': 1628647592632, 'keycode': 32, 'type': 'keydown'}, {'timestamp': 1628647592678, 'keycode': 32, 'type': 'keyup'}, {'timestamp': 1628647593116, 'keycode': 76, 'type': 'keydown'}, {'timestamp': 1628647593210, 'keycode': 76, 'type': 'keyup'}, {'timestamp': 1628647593335, 'keycode': 79, 'type': 'keydown'}, {'timestamp': 1628647593419, 'keycode': 79, 'type': 'keyup'}, {'timestamp': 1628647594075, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1628647594596, 'keycode': 79, 'type': 'keydown'}, {'timestamp': 1628647594697, 'keycode': 79, 'type': 'keyup'}, {'timestamp': 1628647594770, 'keycode': 83, 'type': 'keydown'}, {'timestamp': 1628647594868, 'keycode': 83, 'type': 'keyup'}, {'timestamp': 1628647595032, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1628647595175, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1628647595291, 'keycode': 65, 'type': 'keydown'}, {'timestamp': 1628647595441, 'keycode': 65, 'type': 'keyup'}, {'timestamp': 1628647596222, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1628647596396, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1628647596569, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1628647596844, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1628647597473, 'keycode': 73, 'type': 'keydown'}, {'timestamp': 1628647597554, 'keycode': 73, 'type': 'keyup'}, {'timestamp': 1628647597623, 'keycode': 83, 'type': 'keydown'}, {'timestamp': 1628647597695, 'keycode': 83, 'type': 'keyup'}, {'timestamp': 1628647597859, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1628647597961, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1628647598098, 'keycode': 65, 'type': 'keydown'}, {'timestamp': 1628647598203, 'keycode': 65, 'type': 'keyup'}, {'timestamp': 1628647598366, 'keycode': 16, 'type': 'keydown'}, {'timestamp': 1628647598619, 'keycode': 186, 'type': 'keydown'}, {'timestamp': 1628647598690, 'keycode': 186, 'type': 'keyup'}, {'timestamp': 1628647598795, 'keycode': 16, 'type': 'keyup'}, {'timestamp': 1628647599334, 'keycode': 40, 'type': 'keyup'}, {'timestamp': 1628647599736, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1628647599910, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1628647600071, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1628647600234, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1628647600403, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1628647600569, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1628647600735, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1628647600908, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1628647601098, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1628647601444, 'keycode': 9, 'type': 'keyup'}, {'timestamp': 1628647601687, 'keycode': 40, 'type': 'keyup'}, {'timestamp': 1628647601900, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1628647602075, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1628647602239, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1628647602419, 'keycode': 37, 'type': 'keyup'}, {'timestamp': 1628647603401, 'keycode': 9, 'type': 'keyup'}, {'timestamp': 1628647603866, 'keycode': 35, 'type': 'keyup'}, {'timestamp': 1628647604226, 'keycode': 13, 'type': 'keydown'}, {'timestamp': 1628647604319, 'keycode': 13, 'type': 'keyup'}, {'timestamp': 1628647604793, 'keycode': 8, 'type': 'keyup'}, {'timestamp': 1628647605692, 'keycode': 69, 'type': 'keydown'}, {'timestamp': 1628647605839, 'keycode': 69, 'type': 'keyup'}, {'timestamp': 1628647605921, 'keycode': 76, 'type': 'keydown'}, {'timestamp': 1628647606001, 'keycode': 76, 'type': 'keyup'}, {'timestamp': 1628647606048, 'keycode': 83, 'type': 'keydown'}, {'timestamp': 1628647606115, 'keycode': 83, 'type': 'keyup'}, {'timestamp': 1628647606240, 'keycode': 69, 'type': 'keydown'}, {'timestamp': 1628647606309, 'keycode': 69, 'type': 'keyup'}, {'timestamp': 1628647606475, 'keycode': 16, 'type': 'keydown'}, {'timestamp': 1628647606831, 'keycode': 186, 'type': 'keydown'}, {'timestamp': 1628647606896, 'keycode': 186, 'type': 'keyup'}, {'timestamp': 1628647606939, 'keycode': 16, 'type': 'keyup'}, {'timestamp': 1628647607661, 'keycode': 13, 'type': 'keydown'}, {'timestamp': 1628647607740, 'keycode': 13, 'type': 'keyup'}, {'timestamp': 1628647608731, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1628647608877, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1628647608935, 'keycode': 69, 'type': 'keydown'}, {'timestamp': 1628647609061, 'keycode': 69, 'type': 'keyup'}, {'timestamp': 1628647609200, 'keycode': 84, 'type': 'keydown'}, {'timestamp': 1628647609313, 'keycode': 84, 'type': 'keyup'}, {'timestamp': 1628647609454, 'keycode': 85, 'type': 'keydown'}, {'timestamp': 1628647609530, 'keycode': 85, 'type': 'keyup'}, {'timestamp': 1628647609583, 'keycode': 82, 'type': 'keydown'}, {'timestamp': 1628647609662, 'keycode': 82, 'type': 'keyup'}, {'timestamp': 1628647609715, 'keycode': 78, 'type': 'keydown'}, {'timestamp': 1628647609789, 'keycode': 78, 'type': 'keyup'}, {'timestamp': 1628647610211, 'keycode': 32, 'type': 'keydown'}, {'timestamp': 1628647610309, 'keycode': 32, 'type': 'keyup'}, {'timestamp': 1628647610903, 'keycode': 219, 'type': 'keydown'}, {'timestamp': 1628647611004, 'keycode': 219, 'type': 'keyup'}, {'timestamp': 1628647611144, 'keycode': 221, 'type': 'keydown'}, {'timestamp': 1628647611209, 'keycode': 221, 'type': 'keyup'}], 'mousepresses': [{'timestamp': 1628647528512, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1628647528626, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1628647533216, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1628647533296, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1628647539603, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1628647539727, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1628647539828, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1628647539925, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1628647570531, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1628647570658, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1628647579117, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1628647579220, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1628647588115, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1628647588194, 'mousecode': 1, 'type': 'mouseup'}, {'timestamp': 1628647612763, 'mousecode': 1, 'type': 'mousedown'}, {'timestamp': 1628647612842, 'mousecode': 1, 'type': 'mouseup'}], 'mousemovement': [{'timestamp': 1628647520426, 'position': []}, {'timestamp': 1628647520718, 'position': {'x': 1165, 'y': 340}}, {'timestamp': 1628647521020, 'position': {'x': 1147, 'y': 334}}, {'timestamp': 1628647521119, 'position': {'x': 681, 'y': 221}}, {'timestamp': 1628647521219, 'position': {'x': 169, 'y': 225}}, {'timestamp': 1628647521319, 'position': {'x': 233, 'y': 263}}, {'timestamp': 1628647521420, 'position': {'x': 229, 'y': 203}}, {'timestamp': 1628647521519, 'position': {'x': 188, 'y': 208}}, {'timestamp': 1628647521619, 'position': {'x': 225, 'y': 217}}, {'timestamp': 1628647521719, 'position': {'x': 225, 'y': 153}}, {'timestamp': 1628647521819, 'position': {'x': 227, 'y': 137}}, {'timestamp': 1628647521919, 'position': {'x': 225, 'y': 215}}, {'timestamp': 1628647522020, 'position': {'x': 263, 'y': 196}}, {'timestamp': 1628647522119, 'position': {'x': 252, 'y': 186}}, {'timestamp': 1628647522219, 'position': {'x': 255, 'y': 427}}, {'timestamp': 1628647522319, 'position': {'x': 340, 'y': 569}}, {'timestamp': 1628647522419, 'position': {'x': 341, 'y': 583}}, {'timestamp': 1628647522520, 'position': {'x': 340, 'y': 583}}, {'timestamp': 1628647524118, 'position': {'x': 352, 'y': 404}}, {'timestamp': 1628647524219, 'position': {'x': 336, 'y': 122}}, {'timestamp': 1628647524325, 'position': {'x': 335, 'y': 121}}, {'timestamp': 1628647524719, 'position': {'x': 343, 'y': 122}}, {'timestamp': 1628647524819, 'position': {'x': 644, 'y': 150}}, {'timestamp': 1628647524919, 'position': {'x': 881, 'y': 215}}, {'timestamp': 1628647525019, 'position': {'x': 962, 'y': 247}}, {'timestamp': 1628647525120, 'position': {'x': 904, 'y': 210}}, {'timestamp': 1628647525220, 'position': {'x': 606, 'y': 276}}, {'timestamp': 1628647525319, 'position': {'x': 658, 'y': 340}}, {'timestamp': 1628647525426, 'position': {'x': 665, 'y': 354}}, {'timestamp': 1628647525719, 'position': {'x': 597, 'y': 284}}, {'timestamp': 1628647525819, 'position': {'x': 379, 'y': 166}}, {'timestamp': 1628647525919, 'position': {'x': 327, 'y': 392}}, {'timestamp': 1628647526019, 'position': {'x': 524, 'y': 533}}, {'timestamp': 1628647526118, 'position': {'x': 382, 'y': 366}}, {'timestamp': 1628647526219, 'position': {'x': 621, 'y': 580}}, {'timestamp': 1628647526319, 'position': {'x': 722, 'y': 617}}, {'timestamp': 1628647526419, 'position': {'x': 721, 'y': 615}}, {'timestamp': 1628647526520, 'position': {'x': 722, 'y': 593}}, {'timestamp': 1628647526619, 'position': {'x': 714, 'y': 643}}, {'timestamp': 1628647526719, 'position': {'x': 704, 'y': 592}}, {'timestamp': 1628647526819, 'position': {'x': 669, 'y': 460}}, {'timestamp': 1628647526918, 'position': {'x': 675, 'y': 363}}, {'timestamp': 1628647527019, 'position': {'x': 670, 'y': 336}}, {'timestamp': 1628647527120, 'position': {'x': 646, 'y': 305}}, {'timestamp': 1628647527219, 'position': {'x': 629, 'y': 267}}, {'timestamp': 1628647527319, 'position': {'x': 642, 'y': 225}}, {'timestamp': 1628647527418, 'position': {'x': 712, 'y': 215}}, {'timestamp': 1628647527519, 'position': {'x': 705, 'y': 256}}, {'timestamp': 1628647527619, 'position': {'x': 564, 'y': 631}}, {'timestamp': 1628647527719, 'position': {'x': 547, 'y': 718}}, {'timestamp': 1628647527819, 'position': {'x': 549, 'y': 771}}, {'timestamp': 1628647527919, 'position': {'x': 553, 'y': 786}}, {'timestamp': 1628647528119, 'position': {'x': 569, 'y': 763}}, {'timestamp': 1628647528319, 'position': {'x': 569, 'y': 760}}, {'timestamp': 1628647528419, 'position': {'x': 575, 'y': 742}}, {'timestamp': 1628647528519, 'position': {'x': 575, 'y': 741}}, {'timestamp': 1628647528719, 'position': {'x': 664, 'y': 724}}, {'timestamp': 1628647528819, 'position': {'x': 852, 'y': 688}}, {'timestamp': 1628647529519, 'position': {'x': 851, 'y': 688}}, {'timestamp': 1628647529619, 'position': {'x': 738, 'y': 649}}, {'timestamp': 1628647529719, 'position': {'x': 312, 'y': 309}}, {'timestamp': 1628647529818, 'position': {'x': 184, 'y': 291}}, {'timestamp': 1628647529918, 'position': {'x': 268, 'y': 464}}, {'timestamp': 1628647530020, 'position': {'x': 288, 'y': 370}}, {'timestamp': 1628647530119, 'position': {'x': 174, 'y': 357}}, {'timestamp': 1628647530219, 'position': {'x': 244, 'y': 400}}, {'timestamp': 1628647530319, 'position': {'x': 244, 'y': 299}}, {'timestamp': 1628647530419, 'position': {'x': 240, 'y': 270}}, {'timestamp': 1628647530519, 'position': {'x': 315, 'y': 323}}, {'timestamp': 1628647530619, 'position': {'x': 374, 'y': 272}}, {'timestamp': 1628647530719, 'position': {'x': 315, 'y': 298}}, {'timestamp': 1628647530819, 'position': {'x': 466, 'y': 310}}, {'timestamp': 1628647530919, 'position': {'x': 389, 'y': 305}}, {'timestamp': 1628647531019, 'position': {'x': 438, 'y': 329}}, {'timestamp': 1628647531119, 'position': {'x': 457, 'y': 356}}, {'timestamp': 1628647531520, 'position': {'x': 471, 'y': 306}}, {'timestamp': 1628647531620, 'position': {'x': 487, 'y': 292}}, {'timestamp': 1628647531725, 'position': {'x': 495, 'y': 282}}, {'timestamp': 1628647532019, 'position': {'x': 487, 'y': 282}}, {'timestamp': 1628647532119, 'position': {'x': 291, 'y': 297}}, {'timestamp': 1628647532219, 'position': {'x': 200, 'y': 276}}, {'timestamp': 1628647532318, 'position': {'x': 194, 'y': 271}}, {'timestamp': 1628647532419, 'position': {'x': 192, 'y': 274}}, {'timestamp': 1628647532519, 'position': {'x': 183, 'y': 272}}, {'timestamp': 1628647532619, 'position': {'x': 131, 'y': 140}}, {'timestamp': 1628647532719, 'position': {'x': 110, 'y': 49}}, {'timestamp': 1628647532818, 'position': {'x': 103, 'y': 70}}, {'timestamp': 1628647532919, 'position': {'x': 102, 'y': 83}}, {'timestamp': 1628647533019, 'position': {'x': 105, 'y': 101}}, {'timestamp': 1628647533119, 'position': {'x': 105, 'y': 105}}, {'timestamp': 1628647533219, 'position': {'x': 107, 'y': 111}}, {'timestamp': 1628647533619, 'position': {'x': 107, 'y': 113}}, {'timestamp': 1628647533719, 'position': {'x': 95, 'y': 157}}, {'timestamp': 1628647533818, 'position': {'x': 86, 'y': 188}}, {'timestamp': 1628647533919, 'position': {'x': 85, 'y': 183}}, {'timestamp': 1628647534020, 'position': {'x': 84, 'y': 179}}, {'timestamp': 1628647534219, 'position': {'x': 87, 'y': 179}}, {'timestamp': 1628647534319, 'position': {'x': 91, 'y': 176}}, {'timestamp': 1628647534420, 'position': {'x': 106, 'y': 170}}, {'timestamp': 1628647534519, 'position': {'x': 124, 'y': 170}}, {'timestamp': 1628647534619, 'position': {'x': 144, 'y': 171}}, {'timestamp': 1628647534720, 'position': {'x': 184, 'y': 176}}, {'timestamp': 1628647534819, 'position': {'x': 232, 'y': 181}}, {'timestamp': 1628647534920, 'position': {'x': 271, 'y': 182}}, {'timestamp': 1628647535019, 'position': {'x': 276, 'y': 181}}, {'timestamp': 1628647535119, 'position': {'x': 304, 'y': 181}}, {'timestamp': 1628647535219, 'position': {'x': 305, 'y': 181}}, {'timestamp': 1628647535520, 'position': {'x': 303, 'y': 192}}, {'timestamp': 1628647535619, 'position': {'x': 303, 'y': 200}}, {'timestamp': 1628647535719, 'position': {'x': 285, 'y': 241}}, {'timestamp': 1628647535820, 'position': {'x': 231, 'y': 319}}, {'timestamp': 1628647535919, 'position': {'x': 190, 'y': 332}}, {'timestamp': 1628647536019, 'position': {'x': 176, 'y': 323}}, {'timestamp': 1628647536119, 'position': {'x': 173, 'y': 323}}, {'timestamp': 1628647536219, 'position': {'x': 167, 'y': 325}}, {'timestamp': 1628647536319, 'position': {'x': 151, 'y': 328}}, {'timestamp': 1628647536420, 'position': {'x': 137, 'y': 323}}, {'timestamp': 1628647536520, 'position': {'x': 132, 'y': 322}}, {'timestamp': 1628647536620, 'position': {'x': 131, 'y': 322}}, {'timestamp': 1628647536719, 'position': {'x': 116, 'y': 331}}, {'timestamp': 1628647536829, 'position': {'x': 115, 'y': 332}}, {'timestamp': 1628647536919, 'position': {'x': 117, 'y': 309}}, {'timestamp': 1628647537019, 'position': {'x': 139, 'y': 254}}, {'timestamp': 1628647537119, 'position': {'x': 141, 'y': 252}}, {'timestamp': 1628647537219, 'position': {'x': 145, 'y': 246}}, {'timestamp': 1628647537319, 'position': {'x': 151, 'y': 245}}, {'timestamp': 1628647537419, 'position': {'x': 179, 'y': 248}}, {'timestamp': 1628647537519, 'position': {'x': 200, 'y': 229}}, {'timestamp': 1628647537619, 'position': {'x': 221, 'y': 202}}, {'timestamp': 1628647537719, 'position': {'x': 244, 'y': 178}}, {'timestamp': 1628647537819, 'position': {'x': 258, 'y': 174}}, {'timestamp': 1628647537919, 'position': {'x': 279, 'y': 169}}, {'timestamp': 1628647538019, 'position': {'x': 290, 'y': 165}}, {'timestamp': 1628647538120, 'position': {'x': 315, 'y': 162}}, {'timestamp': 1628647538219, 'position': {'x': 333, 'y': 164}}, {'timestamp': 1628647538320, 'position': {'x': 365, 'y': 173}}, {'timestamp': 1628647538419, 'position': {'x': 421, 'y': 186}}, {'timestamp': 1628647538519, 'position': {'x': 568, 'y': 225}}, {'timestamp': 1628647538620, 'position': {'x': 590, 'y': 229}}, {'timestamp': 1628647538719, 'position': {'x': 588, 'y': 229}}, {'timestamp': 1628647538819, 'position': {'x': 584, 'y': 225}}, {'timestamp': 1628647538919, 'position': {'x': 570, 'y': 214}}, {'timestamp': 1628647539020, 'position': {'x': 569, 'y': 214}}, {'timestamp': 1628647539119, 'position': {'x': 565, 'y': 214}}, {'timestamp': 1628647539220, 'position': {'x': 561, 'y': 214}}, {'timestamp': 1628647539319, 'position': {'x': 559, 'y': 214}}, {'timestamp': 1628647540119, 'position': {'x': 690, 'y': 221}}, {'timestamp': 1628647540220, 'position': {'x': 905, 'y': 232}}, {'timestamp': 1628647540319, 'position': {'x': 842, 'y': 225}}, {'timestamp': 1628647540420, 'position': {'x': 718, 'y': 207}}, {'timestamp': 1628647540519, 'position': {'x': 688, 'y': 327}}, {'timestamp': 1628647540620, 'position': {'x': 688, 'y': 304}}, {'timestamp': 1628647540719, 'position': {'x': 677, 'y': 261}}, {'timestamp': 1628647540819, 'position': {'x': 682, 'y': 279}}, {'timestamp': 1628647541320, 'position': {'x': 666, 'y': 289}}, {'timestamp': 1628647541428, 'position': {'x': 666, 'y': 291}}, {'timestamp': 1628647542820, 'position': {'x': 657, 'y': 286}}, {'timestamp': 1628647542919, 'position': {'x': 651, 'y': 285}}, {'timestamp': 1628647543029, 'position': {'x': 650, 'y': 284}}, {'timestamp': 1628647543220, 'position': {'x': 649, 'y': 284}}, {'timestamp': 1628647543419, 'position': {'x': 647, 'y': 310}}, {'timestamp': 1628647569520, 'position': {'x': 638, 'y': 499}}, {'timestamp': 1628647569620, 'position': {'x': 633, 'y': 618}}, {'timestamp': 1628647569720, 'position': {'x': 629, 'y': 615}}, {'timestamp': 1628647569820, 'position': {'x': 585, 'y': 659}}, {'timestamp': 1628647569919, 'position': {'x': 531, 'y': 779}}, {'timestamp': 1628647570020, 'position': {'x': 538, 'y': 809}}, {'timestamp': 1628647570119, 'position': {'x': 533, 'y': 817}}, {'timestamp': 1628647570219, 'position': {'x': 547, 'y': 769}}, {'timestamp': 1628647570319, 'position': {'x': 551, 'y': 758}}, {'timestamp': 1628647570720, 'position': {'x': 555, 'y': 766}}, {'timestamp': 1628647570820, 'position': {'x': 694, 'y': 889}}, {'timestamp': 1628647570919, 'position': {'x': 674, 'y': 901}}, {'timestamp': 1628647571619, 'position': {'x': 670, 'y': 898}}, {'timestamp': 1628647571719, 'position': {'x': 419, 'y': 706}}, {'timestamp': 1628647571820, 'position': {'x': 238, 'y': 530}}, {'timestamp': 1628647571919, 'position': {'x': 219, 'y': 505}}, {'timestamp': 1628647572220, 'position': {'x': 161, 'y': 434}}, {'timestamp': 1628647572521, 'position': {'x': 171, 'y': 442}}, {'timestamp': 1628647572819, 'position': {'x': 148, 'y': 416}}, {'timestamp': 1628647572919, 'position': {'x': 152, 'y': 407}}, {'timestamp': 1628647573021, 'position': {'x': 163, 'y': 381}}, {'timestamp': 1628647573120, 'position': {'x': 166, 'y': 376}}, {'timestamp': 1628647573620, 'position': {'x': 185, 'y': 372}}, {'timestamp': 1628647573720, 'position': {'x': 270, 'y': 376}}, {'timestamp': 1628647573819, 'position': {'x': 308, 'y': 395}}, {'timestamp': 1628647573919, 'position': {'x': 306, 'y': 397}}, {'timestamp': 1628647574019, 'position': {'x': 246, 'y': 414}}, {'timestamp': 1628647574119, 'position': {'x': 242, 'y': 415}}, {'timestamp': 1628647574320, 'position': {'x': 242, 'y': 414}}, {'timestamp': 1628647574419, 'position': {'x': 245, 'y': 407}}, {'timestamp': 1628647574520, 'position': {'x': 232, 'y': 341}}, {'timestamp': 1628647574619, 'position': {'x': 202, 'y': 288}}, {'timestamp': 1628647574720, 'position': {'x': 193, 'y': 277}}, {'timestamp': 1628647574820, 'position': {'x': 190, 'y': 257}}, {'timestamp': 1628647574919, 'position': {'x': 191, 'y': 233}}, {'timestamp': 1628647575019, 'position': {'x': 194, 'y': 227}}, {'timestamp': 1628647575119, 'position': {'x': 258, 'y': 244}}, {'timestamp': 1628647575219, 'position': {'x': 262, 'y': 265}}, {'timestamp': 1628647575319, 'position': {'x': 205, 'y': 276}}, {'timestamp': 1628647575419, 'position': {'x': 182, 'y': 276}}, {'timestamp': 1628647575520, 'position': {'x': 177, 'y': 281}}, {'timestamp': 1628647575620, 'position': {'x': 172, 'y': 293}}, {'timestamp': 1628647575819, 'position': {'x': 175, 'y': 294}}, {'timestamp': 1628647575919, 'position': {'x': 184, 'y': 293}}, {'timestamp': 1628647576420, 'position': {'x': 186, 'y': 292}}, {'timestamp': 1628647576520, 'position': {'x': 189, 'y': 290}}, {'timestamp': 1628647576619, 'position': {'x': 194, 'y': 284}}, {'timestamp': 1628647576719, 'position': {'x': 205, 'y': 279}}, {'timestamp': 1628647576820, 'position': {'x': 214, 'y': 276}}, {'timestamp': 1628647576919, 'position': {'x': 231, 'y': 274}}, {'timestamp': 1628647577020, 'position': {'x': 250, 'y': 274}}, {'timestamp': 1628647578119, 'position': {'x': 265, 'y': 270}}, {'timestamp': 1628647578219, 'position': {'x': 411, 'y': 246}}, {'timestamp': 1628647578319, 'position': {'x': 421, 'y': 246}}, {'timestamp': 1628647578420, 'position': {'x': 294, 'y': 200}}, {'timestamp': 1628647578519, 'position': {'x': 56, 'y': 119}}, {'timestamp': 1628647578620, 'position': {'x': 56, 'y': 116}}, {'timestamp': 1628647578720, 'position': {'x': 62, 'y': 105}}, {'timestamp': 1628647578820, 'position': {'x': 104, 'y': 102}}, {'timestamp': 1628647579020, 'position': {'x': 103, 'y': 111}}, {'timestamp': 1628647579120, 'position': {'x': 103, 'y': 114}}, {'timestamp': 1628647579419, 'position': {'x': 121, 'y': 143}}, {'timestamp': 1628647579524, 'position': {'x': 122, 'y': 147}}, {'timestamp': 1628647579819, 'position': {'x': 158, 'y': 235}}, {'timestamp': 1628647580920, 'position': {'x': 160, 'y': 241}}, {'timestamp': 1628647581020, 'position': {'x': 181, 'y': 245}}, {'timestamp': 1628647581119, 'position': {'x': 179, 'y': 243}}, {'timestamp': 1628647581219, 'position': {'x': 152, 'y': 222}}, {'timestamp': 1628647581319, 'position': {'x': 152, 'y': 169}}, {'timestamp': 1628647581620, 'position': {'x': 152, 'y': 168}}, {'timestamp': 1628647581719, 'position': {'x': 247, 'y': 168}}, {'timestamp': 1628647581819, 'position': {'x': 303, 'y': 168}}, {'timestamp': 1628647581919, 'position': {'x': 323, 'y': 163}}, {'timestamp': 1628647582019, 'position': {'x': 337, 'y': 160}}, {'timestamp': 1628647582119, 'position': {'x': 359, 'y': 162}}, {'timestamp': 1628647582219, 'position': {'x': 374, 'y': 162}}, {'timestamp': 1628647582319, 'position': {'x': 383, 'y': 163}}, {'timestamp': 1628647582419, 'position': {'x': 404, 'y': 165}}, {'timestamp': 1628647582519, 'position': {'x': 404, 'y': 167}}, {'timestamp': 1628647582619, 'position': {'x': 388, 'y': 184}}, {'timestamp': 1628647582719, 'position': {'x': 336, 'y': 209}}, {'timestamp': 1628647582819, 'position': {'x': 188, 'y': 225}}, {'timestamp': 1628647582920, 'position': {'x': 86, 'y': 236}}, {'timestamp': 1628647583219, 'position': {'x': 119, 'y': 239}}, {'timestamp': 1628647583320, 'position': {'x': 170, 'y': 236}}, {'timestamp': 1628647583519, 'position': {'x': 182, 'y': 231}}, {'timestamp': 1628647583619, 'position': {'x': 206, 'y': 228}}, {'timestamp': 1628647583720, 'position': {'x': 246, 'y': 229}}, {'timestamp': 1628647583819, 'position': {'x': 257, 'y': 227}}, {'timestamp': 1628647583919, 'position': {'x': 289, 'y': 224}}, {'timestamp': 1628647584019, 'position': {'x': 335, 'y': 221}}, {'timestamp': 1628647584121, 'position': {'x': 339, 'y': 219}}, {'timestamp': 1628647584220, 'position': {'x': 348, 'y': 217}}, {'timestamp': 1628647584320, 'position': {'x': 350, 'y': 217}}, {'timestamp': 1628647584419, 'position': {'x': 346, 'y': 217}}, {'timestamp': 1628647584519, 'position': {'x': 308, 'y': 219}}, {'timestamp': 1628647584619, 'position': {'x': 329, 'y': 225}}, {'timestamp': 1628647584720, 'position': {'x': 343, 'y': 208}}, {'timestamp': 1628647584819, 'position': {'x': 344, 'y': 221}}, {'timestamp': 1628647584919, 'position': {'x': 365, 'y': 214}}, {'timestamp': 1628647585020, 'position': {'x': 363, 'y': 212}}, {'timestamp': 1628647585119, 'position': {'x': 373, 'y': 219}}, {'timestamp': 1628647585220, 'position': {'x': 383, 'y': 203}}, {'timestamp': 1628647585319, 'position': {'x': 365, 'y': 217}}, {'timestamp': 1628647585420, 'position': {'x': 397, 'y': 217}}, {'timestamp': 1628647585520, 'position': {'x': 354, 'y': 217}}, {'timestamp': 1628647585619, 'position': {'x': 354, 'y': 220}}, {'timestamp': 1628647585719, 'position': {'x': 354, 'y': 219}}, {'timestamp': 1628647585819, 'position': {'x': 353, 'y': 219}}, {'timestamp': 1628647585920, 'position': {'x': 204, 'y': 224}}, {'timestamp': 1628647586020, 'position': {'x': 192, 'y': 249}}, {'timestamp': 1628647586119, 'position': {'x': 241, 'y': 233}}, {'timestamp': 1628647586219, 'position': {'x': 208, 'y': 238}}, {'timestamp': 1628647586320, 'position': {'x': 230, 'y': 240}}, {'timestamp': 1628647586419, 'position': {'x': 237, 'y': 239}}, {'timestamp': 1628647586519, 'position': {'x': 432, 'y': 237}}, {'timestamp': 1628647586620, 'position': {'x': 437, 'y': 238}}, {'timestamp': 1628647586820, 'position': {'x': 440, 'y': 233}}, {'timestamp': 1628647586919, 'position': {'x': 472, 'y': 229}}, {'timestamp': 1628647587020, 'position': {'x': 479, 'y': 226}}, {'timestamp': 1628647587119, 'position': {'x': 481, 'y': 225}}, {'timestamp': 1628647587219, 'position': {'x': 494, 'y': 227}}, {'timestamp': 1628647587319, 'position': {'x': 509, 'y': 225}}, {'timestamp': 1628647587419, 'position': {'x': 515, 'y': 223}}, {'timestamp': 1628647587520, 'position': {'x': 518, 'y': 223}}, {'timestamp': 1628647587619, 'position': {'x': 529, 'y': 215}}, {'timestamp': 1628647587719, 'position': {'x': 533, 'y': 215}}, {'timestamp': 1628647587831, 'position': {'x': 535, 'y': 214}}, {'timestamp': 1628647587919, 'position': {'x': 536, 'y': 214}}, {'timestamp': 1628647588019, 'position': {'x': 539, 'y': 214}}, {'timestamp': 1628647588120, 'position': {'x': 541, 'y': 214}}, {'timestamp': 1628647588319, 'position': {'x': 582, 'y': 199}}, {'timestamp': 1628647588420, 'position': {'x': 597, 'y': 201}}, {'timestamp': 1628647612019, 'position': {'x': 586, 'y': 460}}, {'timestamp': 1628647612119, 'position': {'x': 540, 'y': 762}}, {'timestamp': 1628647612219, 'position': {'x': 504, 'y': 797}}, {'timestamp': 1628647612319, 'position': {'x': 506, 'y': 794}}, {'timestamp': 1628647612420, 'position': {'x': 641, 'y': 746}}, {'timestamp': 1628647612519, 'position': {'x': 640, 'y': 744}}, {'timestamp': 1628647612619, 'position': {'x': 583, 'y': 752}}], 'task_id': 'python:task:8'}	7
\.


--
-- TOC entry 4350 (class 0 OID 17053)
-- Dependencies: 231
-- Data for Name: activitytree_userlearningactivity; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.activitytree_userlearningactivity (id, pre_condition, recommendation_value, progress_status, objective_status, objective_measure, last_visited, num_attempts, suspended, accumulated_time, is_current, learning_activity_id, user_id) FROM stdin;
26		0	completed	notSatisfied	0	\N	0	f	0.00	f	14	1
35		0	incomplete	notSatisfied	0	2021-05-29 14:06:55.787874+00	1	f	0.00	f	6	3
5		0	completed	notSatisfied	30	2021-04-23 06:33:37.384066+00	1	f	0.00	f	8	1
13		0	incomplete	notSatisfied	0	2021-04-29 05:41:19.471345+00	0	f	0.00	f	5	2
14		0	incomplete	notSatisfied	0	2021-04-29 05:41:19.517836+00	0	f	0.00	t	4	2
8		0	completed	notSatisfied	0	2021-08-20 20:09:10.287812+00	1	f	0.00	f	10	1
36		0	incomplete	notSatisfied	0	2021-05-29 14:06:57.195669+00	0	f	0.00	t	8	3
10		0	completed	notSatisfied	0	\N	0	f	0.00	f	11	1
27		0	incomplete	notSatisfied	0	\N	0	f	0.00	f	15	2
28		0	incomplete	notSatisfied	0	\N	0	f	0.00	f	15	1
63		0	completed	notSatisfied	0	2022-12-02 04:49:15.169293+00	0	f	0.00	f	17	1
6		0	completed	notSatisfied	0	\N	0	f	0.00	f	9	1
9		0	completed	notSatisfied	0	2023-02-15 16:33:41.436897+00	0	f	0.00	f	2	1
11		0	completed	notSatisfied	0	2023-02-16 22:02:28.238188+00	0	f	0.00	t	12	1
43		0	incomplete	notSatisfied	0	\N	0	f	0.00	f	16	3
44		0	incomplete	notSatisfied	0	\N	0	f	0.00	f	16	2
46		0	incomplete	notSatisfied	0	\N	0	f	0.00	f	3	47
48		0	incomplete	notSatisfied	0	\N	0	f	0.00	f	14	47
49		0	incomplete	notSatisfied	0	\N	0	f	0.00	f	15	47
50		0	incomplete	notSatisfied	0	\N	0	f	0.00	f	5	47
51		0	incomplete	notSatisfied	0	\N	0	f	0.00	f	4	47
52		0	incomplete	notSatisfied	0	\N	0	f	0.00	f	6	47
29		0	incomplete	notSatisfied	0	\N	0	f	0.00	f	3	3
31		0	incomplete	notSatisfied	0	\N	0	f	0.00	f	14	3
32		0	incomplete	notSatisfied	0	\N	0	f	0.00	f	15	3
33		0	incomplete	notSatisfied	0	\N	0	f	0.00	f	5	3
34		0	incomplete	notSatisfied	0	\N	0	f	0.00	f	4	3
37		0	incomplete	notSatisfied	0	\N	0	f	0.00	f	9	3
3		0	completed	notSatisfied	30	2021-05-20 02:58:32.4786+00	2	f	0.00	f	4	1
38		0	incomplete	notSatisfied	0	\N	0	f	0.00	f	7	3
39		0	incomplete	notSatisfied	0	\N	0	f	0.00	f	10	3
53		0	incomplete	notSatisfied	0	\N	0	f	0.00	f	8	47
54		0	incomplete	notSatisfied	0	\N	0	f	0.00	f	9	47
55		0	incomplete	notSatisfied	0	\N	0	f	0.00	f	7	47
12		0	incomplete	notSatisfied	0	\N	0	f	0.00	f	3	2
4		0	completed	notSatisfied	30	2021-04-22 20:43:34.211942+00	2	f	0.00	f	6	1
17		0	incomplete	notSatisfied	0	\N	0	f	0.00	f	9	2
42		0	completed	notSatisfied	0	2021-05-29 13:38:02.728294+00	0	f	0.00	f	2	3
56		0	incomplete	notSatisfied	0	\N	0	f	0.00	f	10	47
18		0	incomplete	notSatisfied	0	\N	0	f	0.00	f	7	2
19		0	incomplete	notSatisfied	0	\N	0	f	0.00	f	10	2
20		0	incomplete	notSatisfied	0	\N	0	f	0.00	f	11	2
21		0	incomplete	notSatisfied	0	\N	0	f	0.00	f	12	2
57		0	incomplete	notSatisfied	0	\N	0	f	0.00	f	11	47
58		0	incomplete	notSatisfied	0	\N	0	f	0.00	f	16	47
59		0	incomplete	notSatisfied	0	\N	0	f	0.00	f	12	47
22		0	completed	notSatisfied	0	2021-04-29 05:38:11.625708+00	0	f	0.00	f	2	2
41		0	completed	notSatisfied	0	2021-05-29 14:02:55.934808+00	0	f	0.00	f	12	3
40		0	completed	notSatisfied	0	\N	0	f	0.00	f	11	3
60		0	completed	notSatisfied	0	2022-06-17 18:04:52.870812+00	0	f	0.00	f	2	47
15		0	incomplete	notSatisfied	0	2021-04-29 05:39:11.901106+00	0	f	0.00	f	6	2
45		0	completed	notSatisfied	0	2021-08-11 02:19:27.605223+00	0	f	0.00	f	16	1
16		0	incomplete	notSatisfied	0	2021-04-29 05:39:20.395645+00	0	f	0.00	f	8	2
23		0	incomplete	notSatisfied	0	\N	0	f	0.00	f	13	2
25		0	incomplete	notSatisfied	0	\N	0	f	0.00	f	14	2
30		0	completed	notSatisfied	66.66666666666666	2021-05-29 14:04:43.094476+00	1	f	0.00	f	13	3
7		0	completed	notSatisfied	30	2023-02-15 16:33:45.8054+00	9	f	0.00	f	7	1
2		0	completed	notSatisfied	30	2021-05-21 04:43:05.154896+00	8	f	0.00	f	5	1
24		0	completed	notSatisfied	66.66666666666666	2023-02-03 19:48:27.006477+00	1	f	0.00	f	13	1
47		0	incomplete	notSatisfied	0	2022-06-28 20:41:00.772051+00	0	f	0.00	t	13	47
61		0	incomplete	notSatisfied	0	\N	0	f	0.00	f	17	3
1		0	completed	notSatisfied	0	\N	0	f	0.00	f	3	1
62		0	incomplete	notSatisfied	0	\N	0	f	0.00	f	17	2
64		0	incomplete	notSatisfied	0	\N	0	f	0.00	f	17	47
\.


--
-- TOC entry 4352 (class 0 OID 17063)
-- Dependencies: 233
-- Data for Name: activitytree_userprofile; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.activitytree_userprofile (id, timezone, reputation, experience, user_id) FROM stdin;
1	America/Tijuana	80	0	2
2	America/Tijuana	80	0	1
\.


--
-- TOC entry 4328 (class 0 OID 16851)
-- Dependencies: 209
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.auth_group (id, name) FROM stdin;
1	author
\.


--
-- TOC entry 4330 (class 0 OID 16861)
-- Dependencies: 211
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 4326 (class 0 OID 16843)
-- Dependencies: 207
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add content type	2	add_contenttype
6	Can change content type	2	change_contenttype
7	Can delete content type	2	delete_contenttype
8	Can view content type	2	view_contenttype
9	Can add session	3	add_session
10	Can change session	3	change_session
11	Can delete session	3	delete_session
12	Can view session	3	view_session
13	Can add site	4	add_site
14	Can change site	4	change_site
15	Can delete site	4	delete_site
16	Can view site	4	view_site
17	Can add permission	5	add_permission
18	Can change permission	5	change_permission
19	Can delete permission	5	delete_permission
20	Can view permission	5	view_permission
21	Can add group	6	add_group
22	Can change group	6	change_group
23	Can delete group	6	delete_group
24	Can view group	6	view_group
25	Can add user	7	add_user
26	Can change user	7	change_user
27	Can delete user	7	delete_user
28	Can view user	7	view_user
29	Can add activity tree	8	add_activitytree
30	Can change activity tree	8	change_activitytree
31	Can delete activity tree	8	delete_activitytree
32	Can view activity tree	8	view_activitytree
33	Can add course	9	add_course
34	Can change course	9	change_course
35	Can delete course	9	delete_course
36	Can view course	9	view_course
37	Can add learning activity	10	add_learningactivity
38	Can change learning activity	10	change_learningactivity
39	Can delete learning activity	10	delete_learningactivity
40	Can view learning activity	10	view_learningactivity
41	Can add learning activity rating	11	add_learningactivityrating
42	Can change learning activity rating	11	change_learningactivityrating
43	Can delete learning activity rating	11	delete_learningactivityrating
44	Can view learning activity rating	11	view_learningactivityrating
45	Can add learning style inventory	12	add_learningstyleinventory
46	Can change learning style inventory	12	change_learningstyleinventory
47	Can delete learning style inventory	12	delete_learningstyleinventory
48	Can view learning style inventory	12	view_learningstyleinventory
49	Can add ul a_ event	13	add_ula_event
50	Can change ul a_ event	13	change_ula_event
51	Can delete ul a_ event	13	delete_ula_event
52	Can view ul a_ event	13	view_ula_event
53	Can add user learning activity	14	add_userlearningactivity
54	Can change user learning activity	14	change_userlearningactivity
55	Can delete user learning activity	14	delete_userlearningactivity
56	Can view user learning activity	14	view_userlearningactivity
57	Can add user profile	15	add_userprofile
58	Can change user profile	15	change_userprofile
59	Can delete user profile	15	delete_userprofile
60	Can view user profile	15	view_userprofile
61	Can add author profile	16	add_authorprofile
62	Can change author profile	16	change_authorprofile
63	Can delete author profile	16	delete_authorprofile
64	Can view author profile	16	view_authorprofile
65	Can add comment	17	add_xtdcomment
66	Can change comment	17	change_xtdcomment
67	Can delete comment	17	delete_xtdcomment
68	Can view comment	17	view_xtdcomment
69	Can moderate comments	17	can_moderate
70	Can add black listed domain	18	add_blacklisteddomain
71	Can change black listed domain	18	change_blacklisteddomain
72	Can delete black listed domain	18	delete_blacklisteddomain
73	Can view black listed domain	18	view_blacklisteddomain
74	Can add comment	19	add_comment
75	Can change comment	19	change_comment
76	Can delete comment	19	delete_comment
77	Can view comment	19	view_comment
78	Can moderate comments	19	can_moderate
79	Can add comment flag	20	add_commentflag
80	Can change comment flag	20	change_commentflag
81	Can delete comment flag	20	delete_commentflag
82	Can view comment flag	20	view_commentflag
83	Can add learning activity local	21	add_learningactivitylocal
84	Can change learning activity local	21	change_learningactivitylocal
85	Can delete learning activity local	21	delete_learningactivitylocal
86	Can view learning activity local	21	view_learningactivitylocal
\.


--
-- TOC entry 4332 (class 0 OID 16869)
-- Dependencies: 213
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
4	pbkdf2_sha256$260000$A9T8TgK61KB3WTTEwIlIqK$J7ArTpn7B/MqFCDICzMV8zJ7s8UtP/8zjbt0Djq04lw=	\N	f	mariotec			mario@tectijuana.edu.mx	f	f	2021-05-29 13:31:40.865163+00
47	pbkdf2_sha256$260000$omNRNh0ARjg711yqFvketa$WUaxT7umRWodBZfVquBQqk79f3rPSV+asIiKHFNK+sI=	2022-06-28 20:40:57.06006+00	f	Juan			mariosky@gmail.com	f	t	2022-06-17 18:02:53.564941+00
48	pbkdf2_sha256$260000$kgxfqQikRAGk7gEJnf7XVl$s/xpd/Dv4tubLY45ZPKrcuCnTiwWC8518pbPukeyvr8=	2022-07-12 06:53:10.595119+00	f	Amherag			amherag@gmail.com	f	t	2022-07-12 06:52:32.886652+00
1	pbkdf2_sha256$260000$BJ9VhXSUqyEyqZ76G1ZEC6$oGCol8Vm6SPXNjwXOiRqCYVTUY9pFrgEWiliJwRkHYo=	2023-02-03 19:48:07.304376+00	t	mariosky	Mario	García	mariosky@gmail.com	t	t	2021-04-18 19:57:42+00
49	pbkdf2_sha256$260000$IwpR7oosIiXoCnBjzxR2v3$LB/fdF1LwJgscGbF53/bI9t0FPfNUcmOdWPEtNgf3D0=	\N	f	nem8781239flebno			fmvafgcd@emailler.ga	f	f	2023-02-07 05:39:05.229365+00
44	pbkdf2_sha256$260000$vGMnzeqb7kN97VOkKBtHDI$p55iLTG6JCqHTpFp1GP6sJCDAVyqXmTo/9xcLj1P5fU=	2021-08-17 00:24:11+00	f	AlanCastellanos			vakama_alan@hotmail.com	f	t	2021-08-16 21:43:35+00
46	pbkdf2_sha256$260000$1kDo5NlpLzejCwyBmDpvaS$zR/O9+/h4vZkSVBH4kcP+9/Ft2nGkKbI9KnLo8muSb8=	2022-04-12 22:52:50.447175+00	f	Atose			ilia@notifyparty.ru	f	t	2022-04-12 22:39:18.339515+00
2	pbkdf2_sha256$260000$wREgQZRhVBym45Mh2YWVSj$1nlkb7xN9w0isgA3dNXdUZnSaMMTGnoZCWQCUHSSXpg=	2021-05-26 03:12:45.492614+00	t	puga	Manuel	Castañón-Puga	puga@uabc.edu.mx	t	t	2021-04-28 21:27:34+00
3	pbkdf2_sha256$260000$GFZE9gyHpZPvwUFnbRWkYF$EMo1P1dDtsbK/2tKq1uEruXmyJXJwriHcGeE9kKCHYo=	2021-05-29 22:34:52.749067+00	f	mario			mario@tectijuana.edu.mx	f	t	2021-05-29 13:30:46.898954+00
\.


--
-- TOC entry 4334 (class 0 OID 16879)
-- Dependencies: 215
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
1	1	1
2	2	1
3	44	1
\.


--
-- TOC entry 4336 (class 0 OID 16887)
-- Dependencies: 217
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- TOC entry 4354 (class 0 OID 17219)
-- Dependencies: 235
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-04-18 20:23:40.676778+00	1	author	1	[{"added": {}}]	6	1
2	2021-04-18 20:23:55.099073+00	1	mariosky	2	[{"changed": {"fields": ["Groups"]}}]	7	1
3	2021-04-28 16:03:21.506798+00	1	aulacode.com	2	[{"changed": {"fields": ["Domain name", "Display name"]}}]	4	1
4	2021-04-29 05:33:25.34655+00	2	puga	2	[{"changed": {"fields": ["Staff status", "Superuser status", "Groups"]}}]	7	1
5	2021-05-18 03:09:34.475641+00	1	AuthorProfile object (1)	1	[{"added": {}}]	16	1
6	2021-08-20 19:59:58.335716+00	44	AlanCastellanos	2	[{"changed": {"fields": ["Groups"]}}]	7	1
7	2021-08-20 20:01:45.675179+00	2	AuthorProfile object (2)	1	[{"added": {}}]	16	1
8	2021-08-20 20:13:58.250566+00	2	AuthorProfile object (2)	2	[{"changed": {"fields": ["Image", "Short about", "About", "Location", "Linkedin"]}}]	16	1
9	2021-10-14 19:40:36.395758+00	45	asdf	3		7	1
10	2021-10-14 19:40:36.40056+00	8	Elmerrhife	3		7	1
11	2021-10-14 19:40:36.402877+00	41	HowardAnatt	3		7	1
12	2021-10-14 19:40:36.405098+00	7	LarryGar	3		7	1
13	2021-10-14 19:40:36.40738+00	43	RobertTup	3		7	1
14	2021-10-14 19:40:36.409818+00	42	RodisHam	3		7	1
15	2021-10-14 19:40:36.412165+00	5	Ronaldtip	3		7	1
16	2021-10-14 19:40:36.414293+00	6	tecoumijeff1983	3		7	1
\.


--
-- TOC entry 4365 (class 0 OID 17344)
-- Dependencies: 247
-- Data for Name: django_comment_flags; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.django_comment_flags (id, flag, flag_date, comment_id, user_id) FROM stdin;
1	moderator deletion	2021-05-28 04:33:46.217599+00	2	1
2	moderator deletion	2021-05-28 04:33:51.099664+00	1	1
3	moderator deletion	2022-06-08 17:54:29.927619+00	3	1
4	removal suggestion	2022-06-17 17:57:22.072899+00	5	1
5	moderator deletion	2022-06-17 17:57:42.585283+00	5	1
6	I liked it	2022-06-17 17:58:05.334652+00	4	1
\.


--
-- TOC entry 4363 (class 0 OID 17333)
-- Dependencies: 245
-- Data for Name: django_comments; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.django_comments (id, object_pk, user_name, user_email, user_url, comment, submit_date, ip_address, is_public, is_removed, content_type_id, site_id, user_id) FROM stdin;
2	2	Mario García	mariosky@gmail.com		**Video**	2021-05-28 04:33:35.059701+00	10.244.76.4	t	t	21	1	1
1	2	Mario García	mariosky@gmail.com		**Buen video **	2021-05-28 04:32:40.556746+00	10.244.76.4	t	t	21	1	1
4	1	Mario García	mariosky@gmail.com		Este es un comentario de prueba, es un poco más extenso que los anteriores.\r\nLa verdar eso de poner **negritas** y otras cosas esta cool.	2022-06-08 17:32:28.724247+00	10.244.13.164	t	f	21	1	1
3	1	Mario	mario@tectijuana.edu.mx		Esta es una prueba **muy bien**	2021-05-29 13:39:53.838453+00	10.244.76.26	t	t	21	1	3
5	1	Mario García	mariosky@gmail.com		Hola que tal <script> alert("hola"); </script> [link malo](http://google.com)	2022-06-17 17:56:33.173236+00	10.244.4.193	t	t	21	1	1
\.


--
-- TOC entry 4368 (class 0 OID 17414)
-- Dependencies: 250
-- Data for Name: django_comments_xtd_blacklisteddomain; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.django_comments_xtd_blacklisteddomain (id, domain) FROM stdin;
\.


--
-- TOC entry 4366 (class 0 OID 17400)
-- Dependencies: 248
-- Data for Name: django_comments_xtd_xtdcomment; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.django_comments_xtd_xtdcomment (comment_ptr_id, thread_id, parent_id, level, "order", followup, nested_count) FROM stdin;
2	2	2	0	1	f	0
1	1	1	0	1	f	0
4	4	4	0	1	f	0
3	3	3	0	1	f	0
5	5	5	0	1	f	0
\.


--
-- TOC entry 4324 (class 0 OID 16833)
-- Dependencies: 205
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	contenttypes	contenttype
3	sessions	session
4	sites	site
5	auth	permission
6	auth	group
7	auth	user
8	activitytree	activitytree
9	activitytree	course
10	activitytree	learningactivity
11	activitytree	learningactivityrating
12	activitytree	learningstyleinventory
13	activitytree	ula_event
14	activitytree	userlearningactivity
15	activitytree	userprofile
16	activitytree	authorprofile
17	django_comments_xtd	xtdcomment
18	django_comments_xtd	blacklisteddomain
19	django_comments	comment
20	django_comments	commentflag
21	activitytree	learningactivitylocal
\.


--
-- TOC entry 4322 (class 0 OID 16822)
-- Dependencies: 203
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-04-18 19:56:11.68717+00
2	auth	0001_initial	2021-04-18 19:56:11.910345+00
3	activitytree	0001_initial	2021-04-18 19:56:12.51924+00
4	activitytree	0002_auto_20210413_1714	2021-04-18 19:56:12.84632+00
5	activitytree	0003_course_duration	2021-04-18 19:56:12.871873+00
6	activitytree	0004_course_current_price	2021-04-18 19:56:12.900648+00
7	activitytree	0005_auto_20210415_1832	2021-04-18 19:56:12.935628+00
8	activitytree	0006_auto_20210416_1840	2021-04-18 19:56:13.05463+00
9	activitytree	0007_auto_20210416_1956	2021-04-18 19:56:13.116198+00
10	activitytree	0008_alter_course_meta_data	2021-04-18 19:56:13.142464+00
11	activitytree	0009_delete_authorlearningactivity	2021-04-18 19:56:13.176408+00
12	activitytree	0010_auto_20210418_0216	2021-04-18 19:56:13.226823+00
13	activitytree	0011_rename_meta_data_course_metadata	2021-04-18 19:56:13.250363+00
14	admin	0001_initial	2021-04-18 19:56:13.307502+00
15	admin	0002_logentry_remove_auto_add	2021-04-18 19:56:13.32788+00
16	admin	0003_logentry_add_action_flag_choices	2021-04-18 19:56:13.347871+00
17	contenttypes	0002_remove_content_type_name	2021-04-18 19:56:13.386126+00
18	auth	0002_alter_permission_name_max_length	2021-04-18 19:56:13.416737+00
19	auth	0003_alter_user_email_max_length	2021-04-18 19:56:13.446688+00
20	auth	0004_alter_user_username_opts	2021-04-18 19:56:13.473361+00
21	auth	0005_alter_user_last_login_null	2021-04-18 19:56:13.50341+00
22	auth	0006_require_contenttypes_0002	2021-04-18 19:56:13.513368+00
23	auth	0007_alter_validators_add_error_messages	2021-04-18 19:56:13.536875+00
24	auth	0008_alter_user_username_max_length	2021-04-18 19:56:13.570506+00
25	auth	0009_alter_user_last_name_max_length	2021-04-18 19:56:13.602083+00
26	auth	0010_alter_group_name_max_length	2021-04-18 19:56:13.639699+00
27	auth	0011_update_proxy_permissions	2021-04-18 19:56:13.671217+00
28	auth	0012_alter_user_first_name_max_length	2021-04-18 19:56:13.692072+00
29	sessions	0001_initial	2021-04-18 19:56:13.733006+00
30	sites	0001_initial	2021-04-18 19:56:13.750592+00
31	sites	0002_alter_domain_unique	2021-04-18 19:56:13.778676+00
32	activitytree	0012_authorprofile	2021-05-18 03:06:15.484371+00
33	activitytree	0013_auto_20210514_2252	2021-05-18 03:06:15.536453+00
34	activitytree	0014_learningactivity_allow_comments	2021-05-28 04:31:07.341397+00
35	activitytree	0015_remove_learningactivity_allow_comments	2021-05-28 04:31:07.365171+00
36	activitytree	0016_la	2021-05-28 04:31:07.399081+00
37	activitytree	0017_auto_20210526_0224	2021-05-28 04:31:07.444519+00
38	django_comments	0001_initial	2021-05-28 04:31:07.601479+00
39	django_comments	0002_update_user_email_field_length	2021-05-28 04:31:07.628025+00
40	django_comments	0003_add_submit_date_index	2021-05-28 04:31:07.65798+00
41	django_comments	0004_add_object_pk_is_removed_index	2021-05-28 04:31:07.755884+00
42	django_comments_xtd	0001_initial	2021-05-28 04:31:07.818939+00
43	django_comments_xtd	0002_blacklisteddomain	2021-05-28 04:31:07.852127+00
44	django_comments_xtd	0003_auto_20170220_1333	2021-05-28 04:31:07.867234+00
45	django_comments_xtd	0004_auto_20170221_1510	2021-05-28 04:31:07.889476+00
46	django_comments_xtd	0005_auto_20170920_1247	2021-05-28 04:31:07.90652+00
47	django_comments_xtd	0006_auto_20181204_0948	2021-05-28 04:31:07.921978+00
48	django_comments_xtd	0007_xtdcomment_nested_count	2021-05-28 04:31:07.952849+00
49	django_comments_xtd	0008_auto_20200920_2037	2021-05-28 04:31:07.982295+00
50	activitytree	0018_course_related	2021-07-21 02:18:25.852417+00
51	activitytree	0019_auto_20210617_1904	2021-07-21 02:18:25.919849+00
\.


--
-- TOC entry 4355 (class 0 OID 17250)
-- Dependencies: 236
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
ixm5msbkxv6pmgb2qdlj4yekyo3mfaiz	.eJxVjE0OwiAYBe_C2hAoFIpL956BfD8gVQNJaVfGu2uTLnT7Zua9RIRtLXHraYkzi7PQ4vS7IdAj1R3wHeqtSWp1XWaUuyIP2uW1cXpeDvfvoEAv3xqNC4GSy9YjDGAsGa9G1NYNDKxU8DoQjwbQ6pATMmfDk0Wy4B1OTrw_6qw4Xw:1lYDtI:X-UIvIyPEoun_JOjSfUO4tEEhZ7mURO2f7HKkMJ10hU	2021-05-02 20:19:36.563455+00
fbr3kmn0m7laxgkv5hmpaylqpay8k53t	.eJxVjMsOwiAQRf-FtSFAebp07zeQYRikaiAp7cr479qkC93ec859sQjbWuM2aIlzZmcm2el3S4APajvId2i3zrG3dZkT3xV-0MGvPdPzcrh_BxVG_dYoRCA90eRRauXBARlTklAYinPoZEhWTMVaBK0QgLzJBhJKsFlCNuz9AeYNOIE:1lZNOm:1AqEGm-vt5TuV8G7UqA4PTbHCMWeRf0ZEMVXxHISbko	2021-05-06 00:40:52.010562+00
xfp2y9pk9788eatbegb3ecpjpyw701x5	.eJxVjMEOwiAQRP-FsyG1u0vBo3e_gbAslaqBpLQn47_bJj1oMqd5b-atfFiX7NeWZj-JuihQp9-OQ3ymsgN5hHKvOtayzBPrXdEHbfpWJb2uh_t3kEPL29oYojP1gGKcA0wCHBkZXGeTtQa5BwtCJENgJGQLWzoZB0diZET1-QK5lzcv:1ln7Xg:lVy8ls7zdlFoYSdC2lyK9hr0qrNh_Pjy19suoplVlSY	2021-06-12 22:34:52.775978+00
2z9tcjyjldr8td5psdia23xsi8d86lr6	.eJxVjEEOwiAUBe_C2hCglBaX7j0D-fAfUjU0Ke3KeHdt0oVu38y8lwi0rSVsDUuYWJyFFqffLVJ6oO6A71Rvs0xzXZcpyl2RB23yOjOel8P9OyjUyrdWrJEcRoLz1oJc1hyN8dbpISaAVB_9aJ3qcs6sfGTbASkbhaH3xoj3BwKlOJY:1lZg0H:NAeQS9iW7JtFtC0F-CZ9QVlUqs_FbJLkalBv-6IiUOA	2021-05-06 20:32:49.504171+00
0g4h32jngecwrfe8v4n5othxofvp8e6n	.eJxVjE0OwiAYBe_C2pAApYBL956B8P0gVQNJaVeNd7dNutDtm5m3iZjWpcS18xwnElehxOV3g4QvrgegZ6qPJrHVZZ5AHoo8aZf3Rvy-ne7fQUm97LUDZRyNnkzQLliyyo7eBMig2SBpQgp-sInB2QENYSILmTMj7JLT4vMF5fw5Cw:1ltZbz:sY6xoBWGmQxHmPseZRiEU989Qrf99WC3AwNdF_NnD9g	2021-06-30 17:45:59.644289+00
qjefj668i4uf4pxixuuo5q3mlyq6hdm0	.eJxVjUEOwiAQRe_C2hCoFAaX7nsGMgyDVA1NSrsy3l1JutDtfy_vv0TAfSthb7yGOYmL0OL0u0WkB9cO0h3rbZG01G2do-yKPGiT05L4eT3cv0DBVnpWq4EgOgc6ZoaMVjs2gMDgOQ85WTcaVCaPgKTPYAgweh9TJvV9seL9AenAOKM:1lZpNC:miSxjhOY43uTz_LBUKEz6m867ffeZ5B-jt4-slY0TkY	2021-05-07 06:33:06.358134+00
g7p1y4gxdbnna2vufb2bibcsnpnsq4j4	.eJxVjEsOwjAMBe-SNYpc46QxS_Y9Q-U4CSmgVupnhbg7VOoCtm9m3sv0sq2135Y890MyF0NoTr9jFH3kcSfpLuNtsjqN6zxEuyv2oIvtppSf18P9O6iy1G8dKEKCBlIBTyougnIuLrrSBEleqGREphaZQVtGygHPAZU9sFNy5v0BCXw3fg:1m7Q1Z:Jnb5JKOOg8fQH7TV9darhmT6MIJz0TWB9EdkY5XLGBQ	2021-08-07 22:21:37.551334+00
i7cxolqzzj12o86if9a0kl8zdeh6zimz	.eJxVjDsOwjAQBe_iGlneeP2jpM8ZrPUPB5AjxUmFuDuJlALaNzPvzTxta_Vbz4ufErsylOzyOwaKz9wOkh7U7jOPc1uXKfBD4SftfJxTft1O9--gUq97DQm1yzJqidKBUyhAGotAaCEWpciANmYoYgjRSghJ5KJt0AbI7D6yzxfLXDaR:1m9eXR:NYEYITDlMtOEanic6q5PLsTYlTQQ_vImu5xt4P16FKA	2021-08-14 02:15:45.511411+00
7k6tsi0zdm4u2kark96owfbcym0pbbgo	.eJxVjEEOgjAQRe_StWlmOqWgS_ecgcx0WkFNSSisjHdXEha6_e-9_zIDb-s4bDUtw6TmYtCcfjfh-EhlB3rncpttnMu6TGJ3xR602n7W9Lwe7t_ByHX81uwBGsmRIFArqZG2jaBevQ-uY9IOkRCdckqUzxF8RkGlhlwMrADm_QHZcTei:1lbmeF:Lf7bkVPA494m06Re5IOX0J8Qn8aPOnkiKFFYU3HvTww	2021-05-12 16:02:47.118495+00
mrowzatxqqfz533k5m9a5b25t7ca7t2l	.eJxVjEEOwiAQRe_C2hCYThlw6d4zkKEMUjVtUtqV8e7apAvd_vfef6nI21rj1mSJY1ZnhahOv2Pi4SHTTvKdp9ush3lalzHpXdEHbfo6Z3leDvfvoHKr35qhBEGH2SMjGUkd-YA9WQ-psxY4uN5IsJ4KYTE5iy1mCOAdWAAi9f4A53k2yg:1mFmtn:1yX4uwUJlIvuHpg3yUpCPWnB1RBMNwF8xjDWXRC4IWM	2021-08-31 00:24:11.524766+00
5bsx96l3lfclmcz292n4qaa72f1tym3a	.eJxVjMEKwyAQRP_FcxE1rpgee-83yK5ratqiEJNT6L83Qg4tzGXmPWYXAbc1h62lJcwsrkKLy-9GGF-pdMBPLI8qYy3rMpPsijxpk_fK6X073b-DjC33W8uECgyODlj5EcE441g5o5GtpQE0RyJj4QiCngYPOAGDpqN6Iz5fxwo3IA:1mHAfO:hYmG3c3GADYU15CeJy1uDqa9KQjbDKspo2LdnjGIRI4	2021-09-03 19:59:02.989998+00
doip8edxdlbekv70jmdpu0nibfmmawot	.eJxVjMsOwiAQRf-FtSGMUB4u3fcbyAwMUjU0Ke3K-O_apAvd3nPOfYmI21rj1nmJUxYXAeL0uxGmB7cd5Du22yzT3NZlIrkr8qBdjnPm5_Vw_w4q9vqtvWZnNJI3ygKeLRhIQGYYCgMnbQ0VUzh7lZxDnzIAA1hkHRQHHUi8P9QpN8Y:1mb6Xc:ajjN5QggZ7J3Qe9RZ7WilVXt4f0mO_C_L3samAiOo9Y	2021-10-28 19:37:24.135313+00
8xtmi3p3h7zgjedu1u65xm8o88zwd0oy	.eJxVjM0OwiAQhN-FsyFAKT8evfsMZNldpWogKe3J-O62SQ96m8z3zbxFgnUpae08p4nEWVgnTr9lBnxy3Qk9oN6bxFaXecpyV-RBu7w24tflcP8OCvSyrVXQwQ82RyCFY1TaRDCaTETDyMqPXgFqVhAgIjqy6G46D0DZbpm0-HwB-so4ew:1nePNS:Fed_EN3MUJRgjI-DNNh_1BXvJfXnXuKc_Zv4Qd14BZo	2022-04-26 22:52:50.451652+00
aw92vgkxvhnx7qu7ns832l9jd4n73h49	.eJxVjMsOwiAQRf-FtSG8AoNL934DGZhBqoYmpV0Z_12bdKHbe865L5FwW1vaBi9pInEWWpx-t4zlwX0HdMd-m2WZ-7pMWe6KPOiQ15n4eTncv4OGo31r9ECegglsSmStjHWgHFiubBAKsc02OKIaneGoUXmyoDIQanK1VPH-AOVEOGY:1nyzVp:8038WzsyG6JMmRLlZPx4Am-jzX9A86nDSTCMMqoZEoc	2022-06-22 17:30:33.161636+00
x7aq1pj5awito2tljzt1x2m9evgzh8kb	.eJxVjDsOwjAQBe_iGlkJtjFLSc8ZrP0FB5AtxUmFuDuJlALamXnvbRIuc05L0ymNYi6mN4dfRshPLZuQB5Z7tVzLPI1kt8TuttlbFX1d9_bvIGPL63pQgOA9OujFBYrAdCTpBBwOAupPTgEJooYVKoFQJxgdErsYzszm8wUCszkx:1o2GMf:oGc8daDXlyNlPY9_OHqV7TuWOLTBfO3ZnB6sbH5Iq2w	2022-07-01 18:06:37.402506+00
i2eszbksqutx1wv9i4yzfzob8guzyq99	.eJxVjMEOwiAQRP-FsyHCwoIevfcbyJYFqRpISnsy_rtt0oMe5jLvzbxFoHUpYe1pDhOLq9Di9NuNFJ-p7oAfVO9NxlaXeRrlrsiDdjk0Tq_b4f4dFOplWxMieuXIeBfRW_DJMlyIvOGoHWcbFWcD2VhAtjEBKA2Kz9ZvAdTi8wXQ8Tcd:1lljyP:hHDzP3-nJNrC_pi5WbpO-Ui2ckfe8PN1xXCDvKmq8GE	2021-06-09 03:12:45.497314+00
q7oqiy3lpoxnnhmorehzp9jhp2u9og3j	.eJxVjDsOgzAQRO_iOrKw8fqTMj1nsHbtdUwSgYShinL3gESRlDPvzbxFxG2tcWu8xDGLq1Di8tsRpidPB8gPnO6zTPO0LiPJQ5EnbXKYM79up_t3ULHVfR1IQTHO9glIB9QmgFXFAzhVAKlYzn1m7TuVPQXdd3pPhg0zkiNw4vMF0lw32w:1o6I4Y:60Y47rGTHWQE8MtNejsTNWnzuFrq84_3vhWWww5jTT0	2022-07-12 20:44:34.563469+00
kv0lcdks27bnrczowjd6txqp5ff883j0	.eJxVjDkOwjAUBe_iGlm2Ey-hpOcMlv-GAyiR4qRC3B0ipYD2zcx7qVy2teat8ZJHUmfVJ3X6HaHgg6ed0L1Mt1njPK3LCHpX9EGbvs7Ez8vh_h3U0uq3tiRonHjPKMEkE30gTkOffBITbADpMLkOeHDWAUsU6gHJAkdypqB6fwAVATjQ:1oB9le:U3w5ijJxWaI01-Sh8oVKKEySwsn6axDk4ERp6ixxTQY	2022-07-26 06:53:10.598168+00
3peb5nuxqovr62iawyd7lcr9af5dn5vg	.eJxVjDsOwjAQRO_iGlkb4s-Kkp4zWLZ3FweQLcVJhbg7iZQCutG8N_NWIa5LCWvnOUykLmpQp98uxfzkugN6xHpvOre6zFPSu6IP2vWtEb-uh_t3UGIv29qAy4jIyASQXdyCkTEm6wQcJe_ReWYQA4D-LORxBEgiLJZHGKz6fAHsezgR:1pGBBw:ImGxLr9aX6S63ZOemD8_SQRAMkAPOhptJDCm-fIXOVs	2023-01-27 03:57:20.635779+00
jeztjget38a0yzuadred5fjz3af15rfb	.eJxVjMsKwyAQAP_FcxF8bNQee-83yOquNW0xEJNT6L8XIYf2OjPMISLuW4175zXOJK5CicsvS5hf3IagJ7bHIvPStnVOciTytF3eF-L37Wz_BhV7HVuHKeQSjGIuUHxGKjYZSwiUABR4XbR2bI0xYeLgnA-GLEMuBG4C8fkCArE4Jw:1pO22Z:DrlPNj7HwNxMOeSRLyikT8njbN_9t-hfZ5ELF6qM0Dg	2023-02-17 19:48:07.357032+00
\.


--
-- TOC entry 4357 (class 0 OID 17262)
-- Dependencies: 238
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: django
--

COPY public.django_site (id, domain, name) FROM stdin;
1	aulacode.com	aulacode.com
\.


--
-- TOC entry 4402 (class 0 OID 0)
-- Dependencies: 218
-- Name: activitytree_activitytree_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.activitytree_activitytree_id_seq', 4, true);


--
-- TOC entry 4403 (class 0 OID 0)
-- Dependencies: 240
-- Name: activitytree_authorprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.activitytree_authorprofile_id_seq', 2, true);


--
-- TOC entry 4404 (class 0 OID 0)
-- Dependencies: 220
-- Name: activitytree_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.activitytree_course_id_seq', 2, true);


--
-- TOC entry 4405 (class 0 OID 0)
-- Dependencies: 251
-- Name: activitytree_course_related_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.activitytree_course_related_id_seq', 1, false);


--
-- TOC entry 4406 (class 0 OID 0)
-- Dependencies: 222
-- Name: activitytree_learningactivity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.activitytree_learningactivity_id_seq', 17, true);


--
-- TOC entry 4407 (class 0 OID 0)
-- Dependencies: 242
-- Name: activitytree_learningactivitylocal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.activitytree_learningactivitylocal_id_seq', 24, true);


--
-- TOC entry 4408 (class 0 OID 0)
-- Dependencies: 224
-- Name: activitytree_learningactivityrating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.activitytree_learningactivityrating_id_seq', 1, false);


--
-- TOC entry 4409 (class 0 OID 0)
-- Dependencies: 226
-- Name: activitytree_learningstyleinventory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.activitytree_learningstyleinventory_id_seq', 1, false);


--
-- TOC entry 4410 (class 0 OID 0)
-- Dependencies: 228
-- Name: activitytree_ula_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.activitytree_ula_event_id_seq', 24, true);


--
-- TOC entry 4411 (class 0 OID 0)
-- Dependencies: 230
-- Name: activitytree_userlearningactivity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.activitytree_userlearningactivity_id_seq', 64, true);


--
-- TOC entry 4412 (class 0 OID 0)
-- Dependencies: 232
-- Name: activitytree_userprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.activitytree_userprofile_id_seq', 2, true);


--
-- TOC entry 4413 (class 0 OID 0)
-- Dependencies: 208
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, true);


--
-- TOC entry 4414 (class 0 OID 0)
-- Dependencies: 210
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 4415 (class 0 OID 0)
-- Dependencies: 206
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 86, true);


--
-- TOC entry 4416 (class 0 OID 0)
-- Dependencies: 214
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 3, true);


--
-- TOC entry 4417 (class 0 OID 0)
-- Dependencies: 212
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 49, true);


--
-- TOC entry 4418 (class 0 OID 0)
-- Dependencies: 216
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 4419 (class 0 OID 0)
-- Dependencies: 234
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 16, true);


--
-- TOC entry 4420 (class 0 OID 0)
-- Dependencies: 246
-- Name: django_comment_flags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.django_comment_flags_id_seq', 6, true);


--
-- TOC entry 4421 (class 0 OID 0)
-- Dependencies: 244
-- Name: django_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.django_comments_id_seq', 5, true);


--
-- TOC entry 4422 (class 0 OID 0)
-- Dependencies: 249
-- Name: django_comments_xtd_blacklisteddomain_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.django_comments_xtd_blacklisteddomain_id_seq', 1, false);


--
-- TOC entry 4423 (class 0 OID 0)
-- Dependencies: 204
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 21, true);


--
-- TOC entry 4424 (class 0 OID 0)
-- Dependencies: 202
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 51, true);


--
-- TOC entry 4425 (class 0 OID 0)
-- Dependencies: 237
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- TOC entry 4069 (class 2606 OID 17121)
-- Name: activitytree_activitytree activitytree_activitytre_user_id_root_activity_id_d296a612_uniq; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.activitytree_activitytree
    ADD CONSTRAINT activitytree_activitytre_user_id_root_activity_id_d296a612_uniq UNIQUE (user_id, root_activity_id);


--
-- TOC entry 4072 (class 2606 OID 16952)
-- Name: activitytree_activitytree activitytree_activitytree_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.activitytree_activitytree
    ADD CONSTRAINT activitytree_activitytree_pkey PRIMARY KEY (id);


--
-- TOC entry 4122 (class 2606 OID 17299)
-- Name: activitytree_authorprofile activitytree_authorprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.activitytree_authorprofile
    ADD CONSTRAINT activitytree_authorprofile_pkey PRIMARY KEY (id);


--
-- TOC entry 4124 (class 2606 OID 17301)
-- Name: activitytree_authorprofile activitytree_authorprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.activitytree_authorprofile
    ADD CONSTRAINT activitytree_authorprofile_user_id_key UNIQUE (user_id);


--
-- TOC entry 4077 (class 2606 OID 16971)
-- Name: activitytree_course activitytree_course_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.activitytree_course
    ADD CONSTRAINT activitytree_course_pkey PRIMARY KEY (id);


--
-- TOC entry 4157 (class 2606 OID 17433)
-- Name: activitytree_course_related activitytree_course_rela_from_course_id_to_course_4f3057e6_uniq; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.activitytree_course_related
    ADD CONSTRAINT activitytree_course_rela_from_course_id_to_course_4f3057e6_uniq UNIQUE (from_course_id, to_course_id);


--
-- TOC entry 4160 (class 2606 OID 17431)
-- Name: activitytree_course_related activitytree_course_related_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.activitytree_course_related
    ADD CONSTRAINT activitytree_course_related_pkey PRIMARY KEY (id);


--
-- TOC entry 4079 (class 2606 OID 17083)
-- Name: activitytree_course activitytree_course_root_id_key; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.activitytree_course
    ADD CONSTRAINT activitytree_course_root_id_key UNIQUE (root_id);


--
-- TOC entry 4082 (class 2606 OID 17447)
-- Name: activitytree_course activitytree_course_uri_0e8e6b7c_uniq; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.activitytree_course
    ADD CONSTRAINT activitytree_course_uri_0e8e6b7c_uniq UNIQUE (uri);


--
-- TOC entry 4085 (class 2606 OID 17012)
-- Name: activitytree_learningactivity activitytree_learningactivity_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.activitytree_learningactivity
    ADD CONSTRAINT activitytree_learningactivity_pkey PRIMARY KEY (id);


--
-- TOC entry 4126 (class 2606 OID 17327)
-- Name: activitytree_learningactivitylocal activitytree_learningactivitylocal_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.activitytree_learningactivitylocal
    ADD CONSTRAINT activitytree_learningactivitylocal_pkey PRIMARY KEY (id);


--
-- TOC entry 4129 (class 2606 OID 17329)
-- Name: activitytree_learningactivitylocal activitytree_learningactivitylocal_uri_key; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.activitytree_learningactivitylocal
    ADD CONSTRAINT activitytree_learningactivitylocal_uri_key UNIQUE (uri);


--
-- TOC entry 4089 (class 2606 OID 17022)
-- Name: activitytree_learningactivityrating activitytree_learningactivityrating_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.activitytree_learningactivityrating
    ADD CONSTRAINT activitytree_learningactivityrating_pkey PRIMARY KEY (id);


--
-- TOC entry 4092 (class 2606 OID 17037)
-- Name: activitytree_learningstyleinventory activitytree_learningstyleinventory_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.activitytree_learningstyleinventory
    ADD CONSTRAINT activitytree_learningstyleinventory_pkey PRIMARY KEY (id);


--
-- TOC entry 4094 (class 2606 OID 17039)
-- Name: activitytree_learningstyleinventory activitytree_learningstyleinventory_user_id_key; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.activitytree_learningstyleinventory
    ADD CONSTRAINT activitytree_learningstyleinventory_user_id_key UNIQUE (user_id);


--
-- TOC entry 4097 (class 2606 OID 17050)
-- Name: activitytree_ula_event activitytree_ula_event_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.activitytree_ula_event
    ADD CONSTRAINT activitytree_ula_event_pkey PRIMARY KEY (id);


--
-- TOC entry 4099 (class 2606 OID 17115)
-- Name: activitytree_userlearningactivity activitytree_userlearnin_user_id_learning_activit_2f92d54c_uniq; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.activitytree_userlearningactivity
    ADD CONSTRAINT activitytree_userlearnin_user_id_learning_activit_2f92d54c_uniq UNIQUE (user_id, learning_activity_id);


--
-- TOC entry 4102 (class 2606 OID 17060)
-- Name: activitytree_userlearningactivity activitytree_userlearningactivity_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.activitytree_userlearningactivity
    ADD CONSTRAINT activitytree_userlearningactivity_pkey PRIMARY KEY (id);


--
-- TOC entry 4105 (class 2606 OID 17070)
-- Name: activitytree_userprofile activitytree_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.activitytree_userprofile
    ADD CONSTRAINT activitytree_userprofile_pkey PRIMARY KEY (id);


--
-- TOC entry 4107 (class 2606 OID 17076)
-- Name: activitytree_userprofile activitytree_userprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.activitytree_userprofile
    ADD CONSTRAINT activitytree_userprofile_user_id_key UNIQUE (user_id);


--
-- TOC entry 4042 (class 2606 OID 17248)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 4047 (class 2606 OID 16903)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 4050 (class 2606 OID 16866)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 4044 (class 2606 OID 16856)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 4037 (class 2606 OID 16894)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 4039 (class 2606 OID 16848)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 4058 (class 2606 OID 16884)
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 4061 (class 2606 OID 16918)
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 4052 (class 2606 OID 16874)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 4064 (class 2606 OID 16892)
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 4067 (class 2606 OID 16932)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 4055 (class 2606 OID 17242)
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 4110 (class 2606 OID 17228)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 4143 (class 2606 OID 17349)
-- Name: django_comment_flags django_comment_flags_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_comment_flags
    ADD CONSTRAINT django_comment_flags_pkey PRIMARY KEY (id);


--
-- TOC entry 4145 (class 2606 OID 17351)
-- Name: django_comment_flags django_comment_flags_user_id_comment_id_flag_537f77a7_uniq; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_comment_flags
    ADD CONSTRAINT django_comment_flags_user_id_comment_id_flag_537f77a7_uniq UNIQUE (user_id, comment_id, flag);


--
-- TOC entry 4135 (class 2606 OID 17341)
-- Name: django_comments django_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_comments
    ADD CONSTRAINT django_comments_pkey PRIMARY KEY (id);


--
-- TOC entry 4155 (class 2606 OID 17419)
-- Name: django_comments_xtd_blacklisteddomain django_comments_xtd_blacklisteddomain_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_comments_xtd_blacklisteddomain
    ADD CONSTRAINT django_comments_xtd_blacklisteddomain_pkey PRIMARY KEY (id);


--
-- TOC entry 4150 (class 2606 OID 17404)
-- Name: django_comments_xtd_xtdcomment django_comments_xtd_xtdcomment_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_comments_xtd_xtdcomment
    ADD CONSTRAINT django_comments_xtd_xtdcomment_pkey PRIMARY KEY (comment_ptr_id);


--
-- TOC entry 4032 (class 2606 OID 16840)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 4034 (class 2606 OID 16838)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 4030 (class 2606 OID 16830)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 4114 (class 2606 OID 17257)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 4118 (class 2606 OID 17269)
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- TOC entry 4120 (class 2606 OID 17267)
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- TOC entry 4070 (class 1259 OID 17185)
-- Name: activitytree_activitytree_current_activity_id_74d1fe19; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX activitytree_activitytree_current_activity_id_74d1fe19 ON public.activitytree_activitytree USING btree (current_activity_id);


--
-- TOC entry 4073 (class 1259 OID 17186)
-- Name: activitytree_activitytree_root_activity_id_c5d08a3e; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX activitytree_activitytree_root_activity_id_c5d08a3e ON public.activitytree_activitytree USING btree (root_activity_id);


--
-- TOC entry 4074 (class 1259 OID 17187)
-- Name: activitytree_activitytree_user_id_7fd8ad43; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX activitytree_activitytree_user_id_7fd8ad43 ON public.activitytree_activitytree USING btree (user_id);


--
-- TOC entry 4075 (class 1259 OID 17195)
-- Name: activitytree_course_author_id_cd4c6c2d; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX activitytree_course_author_id_cd4c6c2d ON public.activitytree_course USING btree (author_id);


--
-- TOC entry 4158 (class 1259 OID 17444)
-- Name: activitytree_course_related_from_course_id_54441b4f; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX activitytree_course_related_from_course_id_54441b4f ON public.activitytree_course_related USING btree (from_course_id);


--
-- TOC entry 4161 (class 1259 OID 17445)
-- Name: activitytree_course_related_to_course_id_d40ff1df; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX activitytree_course_related_to_course_id_d40ff1df ON public.activitytree_course_related USING btree (to_course_id);


--
-- TOC entry 4080 (class 1259 OID 17448)
-- Name: activitytree_course_uri_0e8e6b7c_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX activitytree_course_uri_0e8e6b7c_like ON public.activitytree_course USING btree (uri varchar_pattern_ops);


--
-- TOC entry 4087 (class 1259 OID 17158)
-- Name: activitytree_learningactiv_learning_activity_id_74f84831; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX activitytree_learningactiv_learning_activity_id_74f84831 ON public.activitytree_learningactivityrating USING btree (learning_activity_id);


--
-- TOC entry 4083 (class 1259 OID 17146)
-- Name: activitytree_learningactivity_parent_id_e5195b8f; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX activitytree_learningactivity_parent_id_e5195b8f ON public.activitytree_learningactivity USING btree (parent_id);


--
-- TOC entry 4086 (class 1259 OID 17147)
-- Name: activitytree_learningactivity_root_id_49e885cc; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX activitytree_learningactivity_root_id_49e885cc ON public.activitytree_learningactivity USING btree (root_id);


--
-- TOC entry 4127 (class 1259 OID 17330)
-- Name: activitytree_learningactivitylocal_uri_0631212f_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX activitytree_learningactivitylocal_uri_0631212f_like ON public.activitytree_learningactivitylocal USING btree (uri varchar_pattern_ops);


--
-- TOC entry 4090 (class 1259 OID 17159)
-- Name: activitytree_learningactivityrating_user_id_ce520a53; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX activitytree_learningactivityrating_user_id_ce520a53 ON public.activitytree_learningactivityrating USING btree (user_id);


--
-- TOC entry 4095 (class 1259 OID 17182)
-- Name: activitytree_ula_event_ULA_id_4fcafcf4; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX "activitytree_ula_event_ULA_id_4fcafcf4" ON public.activitytree_ula_event USING btree ("ULA_id");


--
-- TOC entry 4100 (class 1259 OID 17175)
-- Name: activitytree_userlearningactivity_learning_activity_id_5f127c64; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX activitytree_userlearningactivity_learning_activity_id_5f127c64 ON public.activitytree_userlearningactivity USING btree (learning_activity_id);


--
-- TOC entry 4103 (class 1259 OID 17176)
-- Name: activitytree_userlearningactivity_user_id_e4327eaf; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX activitytree_userlearningactivity_user_id_e4327eaf ON public.activitytree_userlearningactivity USING btree (user_id);


--
-- TOC entry 4040 (class 1259 OID 17249)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 4045 (class 1259 OID 16914)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 4048 (class 1259 OID 16915)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 4035 (class 1259 OID 16900)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 4056 (class 1259 OID 16930)
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- TOC entry 4059 (class 1259 OID 16929)
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- TOC entry 4062 (class 1259 OID 16944)
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 4065 (class 1259 OID 16943)
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 4053 (class 1259 OID 17243)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 4108 (class 1259 OID 17239)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 4111 (class 1259 OID 17240)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 4139 (class 1259 OID 17382)
-- Name: django_comment_flags_comment_id_d8054933; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX django_comment_flags_comment_id_d8054933 ON public.django_comment_flags USING btree (comment_id);


--
-- TOC entry 4140 (class 1259 OID 17380)
-- Name: django_comment_flags_flag_8b141fcb; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX django_comment_flags_flag_8b141fcb ON public.django_comment_flags USING btree (flag);


--
-- TOC entry 4141 (class 1259 OID 17381)
-- Name: django_comment_flags_flag_8b141fcb_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX django_comment_flags_flag_8b141fcb_like ON public.django_comment_flags USING btree (flag varchar_pattern_ops);


--
-- TOC entry 4146 (class 1259 OID 17383)
-- Name: django_comment_flags_user_id_f3f81f0a; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX django_comment_flags_user_id_f3f81f0a ON public.django_comment_flags USING btree (user_id);


--
-- TOC entry 4130 (class 1259 OID 17367)
-- Name: django_comments_content_type_id_c4afe962; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX django_comments_content_type_id_c4afe962 ON public.django_comments USING btree (content_type_id);


--
-- TOC entry 4131 (class 1259 OID 17385)
-- Name: django_comments_is_removed_52a03ae3; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX django_comments_is_removed_52a03ae3 ON public.django_comments USING btree (is_removed);


--
-- TOC entry 4132 (class 1259 OID 17398)
-- Name: django_comments_object_pk_7fc98e83; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX django_comments_object_pk_7fc98e83 ON public.django_comments USING btree (object_pk);


--
-- TOC entry 4133 (class 1259 OID 17399)
-- Name: django_comments_object_pk_7fc98e83_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX django_comments_object_pk_7fc98e83_like ON public.django_comments USING btree (object_pk varchar_pattern_ops);


--
-- TOC entry 4136 (class 1259 OID 17368)
-- Name: django_comments_site_id_9dcf666e; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX django_comments_site_id_9dcf666e ON public.django_comments USING btree (site_id);


--
-- TOC entry 4137 (class 1259 OID 17384)
-- Name: django_comments_submit_date_514ed2d9; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX django_comments_submit_date_514ed2d9 ON public.django_comments USING btree (submit_date);


--
-- TOC entry 4138 (class 1259 OID 17369)
-- Name: django_comments_user_id_a0a440a1; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX django_comments_user_id_a0a440a1 ON public.django_comments USING btree (user_id);


--
-- TOC entry 4152 (class 1259 OID 17420)
-- Name: django_comments_xtd_blacklisteddomain_domain_43b81328; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX django_comments_xtd_blacklisteddomain_domain_43b81328 ON public.django_comments_xtd_blacklisteddomain USING btree (domain);


--
-- TOC entry 4153 (class 1259 OID 17421)
-- Name: django_comments_xtd_blacklisteddomain_domain_43b81328_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX django_comments_xtd_blacklisteddomain_domain_43b81328_like ON public.django_comments_xtd_blacklisteddomain USING btree (domain varchar_pattern_ops);


--
-- TOC entry 4147 (class 1259 OID 17423)
-- Name: django_comments_xtd_xtdcomment_nested_count_ad55f6a9; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX django_comments_xtd_xtdcomment_nested_count_ad55f6a9 ON public.django_comments_xtd_xtdcomment USING btree (nested_count);


--
-- TOC entry 4148 (class 1259 OID 17411)
-- Name: django_comments_xtd_xtdcomment_order_36db562d; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX django_comments_xtd_xtdcomment_order_36db562d ON public.django_comments_xtd_xtdcomment USING btree ("order");


--
-- TOC entry 4151 (class 1259 OID 17410)
-- Name: django_comments_xtd_xtdcomment_thread_id_e192a27a; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX django_comments_xtd_xtdcomment_thread_id_e192a27a ON public.django_comments_xtd_xtdcomment USING btree (thread_id);


--
-- TOC entry 4112 (class 1259 OID 17259)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 4115 (class 1259 OID 17258)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 4116 (class 1259 OID 17270)
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: django
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- TOC entry 4169 (class 2606 OID 17099)
-- Name: activitytree_activitytree activitytree_activit_current_activity_id_74d1fe19_fk_activityt; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.activitytree_activitytree
    ADD CONSTRAINT activitytree_activit_current_activity_id_74d1fe19_fk_activityt FOREIGN KEY (current_activity_id) REFERENCES public.activitytree_userlearningactivity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4170 (class 2606 OID 17104)
-- Name: activitytree_activitytree activitytree_activit_root_activity_id_c5d08a3e_fk_activityt; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.activitytree_activitytree
    ADD CONSTRAINT activitytree_activit_root_activity_id_c5d08a3e_fk_activityt FOREIGN KEY (root_activity_id) REFERENCES public.activitytree_learningactivity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4171 (class 2606 OID 17109)
-- Name: activitytree_activitytree activitytree_activitytree_user_id_7fd8ad43_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.activitytree_activitytree
    ADD CONSTRAINT activitytree_activitytree_user_id_7fd8ad43_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4185 (class 2606 OID 17302)
-- Name: activitytree_authorprofile activitytree_authorprofile_user_id_d575224d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.activitytree_authorprofile
    ADD CONSTRAINT activitytree_authorprofile_user_id_d575224d_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4192 (class 2606 OID 17434)
-- Name: activitytree_course_related activitytree_course__from_course_id_54441b4f_fk_activityt; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.activitytree_course_related
    ADD CONSTRAINT activitytree_course__from_course_id_54441b4f_fk_activityt FOREIGN KEY (from_course_id) REFERENCES public.activitytree_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4193 (class 2606 OID 17439)
-- Name: activitytree_course_related activitytree_course__to_course_id_d40ff1df_fk_activityt; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.activitytree_course_related
    ADD CONSTRAINT activitytree_course__to_course_id_d40ff1df_fk_activityt FOREIGN KEY (to_course_id) REFERENCES public.activitytree_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4172 (class 2606 OID 17188)
-- Name: activitytree_course activitytree_course_author_id_cd4c6c2d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.activitytree_course
    ADD CONSTRAINT activitytree_course_author_id_cd4c6c2d_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4173 (class 2606 OID 17084)
-- Name: activitytree_course activitytree_course_root_id_c0f225e0_fk_activityt; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.activitytree_course
    ADD CONSTRAINT activitytree_course_root_id_c0f225e0_fk_activityt FOREIGN KEY (root_id) REFERENCES public.activitytree_learningactivity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4176 (class 2606 OID 17148)
-- Name: activitytree_learningactivityrating activitytree_learnin_learning_activity_id_74f84831_fk_activityt; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.activitytree_learningactivityrating
    ADD CONSTRAINT activitytree_learnin_learning_activity_id_74f84831_fk_activityt FOREIGN KEY (learning_activity_id) REFERENCES public.activitytree_learningactivity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4174 (class 2606 OID 17136)
-- Name: activitytree_learningactivity activitytree_learnin_parent_id_e5195b8f_fk_activityt; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.activitytree_learningactivity
    ADD CONSTRAINT activitytree_learnin_parent_id_e5195b8f_fk_activityt FOREIGN KEY (parent_id) REFERENCES public.activitytree_learningactivity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4175 (class 2606 OID 17141)
-- Name: activitytree_learningactivity activitytree_learnin_root_id_49e885cc_fk_activityt; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.activitytree_learningactivity
    ADD CONSTRAINT activitytree_learnin_root_id_49e885cc_fk_activityt FOREIGN KEY (root_id) REFERENCES public.activitytree_learningactivity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4178 (class 2606 OID 17160)
-- Name: activitytree_learningstyleinventory activitytree_learnin_user_id_4f5472b2_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.activitytree_learningstyleinventory
    ADD CONSTRAINT activitytree_learnin_user_id_4f5472b2_fk_auth_user FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4177 (class 2606 OID 17153)
-- Name: activitytree_learningactivityrating activitytree_learnin_user_id_ce520a53_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.activitytree_learningactivityrating
    ADD CONSTRAINT activitytree_learnin_user_id_ce520a53_fk_auth_user FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4179 (class 2606 OID 17077)
-- Name: activitytree_ula_event activitytree_ula_eve_ULA_id_4fcafcf4_fk_activityt; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.activitytree_ula_event
    ADD CONSTRAINT "activitytree_ula_eve_ULA_id_4fcafcf4_fk_activityt" FOREIGN KEY ("ULA_id") REFERENCES public.activitytree_userlearningactivity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4180 (class 2606 OID 17165)
-- Name: activitytree_userlearningactivity activitytree_userlea_learning_activity_id_5f127c64_fk_activityt; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.activitytree_userlearningactivity
    ADD CONSTRAINT activitytree_userlea_learning_activity_id_5f127c64_fk_activityt FOREIGN KEY (learning_activity_id) REFERENCES public.activitytree_learningactivity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4181 (class 2606 OID 17170)
-- Name: activitytree_userlearningactivity activitytree_userlea_user_id_e4327eaf_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.activitytree_userlearningactivity
    ADD CONSTRAINT activitytree_userlea_user_id_e4327eaf_fk_auth_user FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4182 (class 2606 OID 17177)
-- Name: activitytree_userprofile activitytree_userprofile_user_id_9162e6ee_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.activitytree_userprofile
    ADD CONSTRAINT activitytree_userprofile_user_id_9162e6ee_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4163 (class 2606 OID 16909)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4164 (class 2606 OID 16904)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4162 (class 2606 OID 16895)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4165 (class 2606 OID 16924)
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4166 (class 2606 OID 16919)
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4167 (class 2606 OID 16938)
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4168 (class 2606 OID 16933)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4183 (class 2606 OID 17229)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4184 (class 2606 OID 17234)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4189 (class 2606 OID 17370)
-- Name: django_comment_flags django_comment_flags_comment_id_d8054933_fk_django_comments_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_comment_flags
    ADD CONSTRAINT django_comment_flags_comment_id_d8054933_fk_django_comments_id FOREIGN KEY (comment_id) REFERENCES public.django_comments(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4190 (class 2606 OID 17375)
-- Name: django_comment_flags django_comment_flags_user_id_f3f81f0a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_comment_flags
    ADD CONSTRAINT django_comment_flags_user_id_f3f81f0a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4186 (class 2606 OID 17352)
-- Name: django_comments django_comments_content_type_id_c4afe962_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_comments
    ADD CONSTRAINT django_comments_content_type_id_c4afe962_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4187 (class 2606 OID 17357)
-- Name: django_comments django_comments_site_id_9dcf666e_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_comments
    ADD CONSTRAINT django_comments_site_id_9dcf666e_fk_django_site_id FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4188 (class 2606 OID 17362)
-- Name: django_comments django_comments_user_id_a0a440a1_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_comments
    ADD CONSTRAINT django_comments_user_id_a0a440a1_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4191 (class 2606 OID 17405)
-- Name: django_comments_xtd_xtdcomment django_comments_xtd__comment_ptr_id_01d47130_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: django
--

ALTER TABLE ONLY public.django_comments_xtd_xtdcomment
    ADD CONSTRAINT django_comments_xtd__comment_ptr_id_01d47130_fk_django_co FOREIGN KEY (comment_ptr_id) REFERENCES public.django_comments(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4377 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2023-02-17 11:15:03 PST

--
-- PostgreSQL database dump complete
--

