--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

-- Started on 2021-12-06 17:17:28

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
-- TOC entry 2 (class 3079 OID 38500)
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA "public";


--
-- TOC entry 4300 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = "heap";

--
-- TOC entry 225 (class 1259 OID 38749)
-- Name: board; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."board" (
    "Id" bigint NOT NULL,
    "Key" "uuid" NOT NULL,
    "Ordinal" integer NOT NULL,
    "Title" "text",
    "Note" "text",
    "Pinned" boolean DEFAULT false NOT NULL,
    "PinnedIp" "inet",
    "PinnedUtc" timestamp(6) with time zone,
    "PinnedUserId" bigint,
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."board" OWNER TO "postgres";

--
-- TOC entry 224 (class 1259 OID 38748)
-- Name: board_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."board" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."board_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 227 (class 1259 OID 38784)
-- Name: board_role_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."board_role_permission" (
    "Id" bigint NOT NULL,
    "BoardId" bigint NOT NULL,
    "RoleId" bigint NOT NULL,
    "PermissionId" bigint NOT NULL,
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."board_role_permission" OWNER TO "postgres";

--
-- TOC entry 226 (class 1259 OID 38783)
-- Name: board_role_permission_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."board_role_permission" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."board_role_permission_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 229 (class 1259 OID 38831)
-- Name: board_tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."board_tag" (
    "Id" integer NOT NULL,
    "BoardId" bigint,
    "TagId" bigint,
    "CreatedIp" "inet",
    "CreatedUtc" timestamp(6) with time zone,
    "CreatedUserId" bigint NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."board_tag" OWNER TO "postgres";

--
-- TOC entry 228 (class 1259 OID 38830)
-- Name: board_tag_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."board_tag" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."board_tag_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 233 (class 1259 OID 38866)
-- Name: comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."comment" (
    "Id" bigint NOT NULL,
    "Key" "uuid" NOT NULL,
    "ThreadId" bigint NOT NULL,
    "Content" "text" NOT NULL,
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."comment" OWNER TO "postgres";

--
-- TOC entry 232 (class 1259 OID 38865)
-- Name: comment_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."comment" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."comment_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 235 (class 1259 OID 38902)
-- Name: comment_attachment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."comment_attachment" (
    "Id" bigint NOT NULL,
    "CommentId" bigint NOT NULL,
    "Filename" "text",
    "Url" "text",
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."comment_attachment" OWNER TO "postgres";

--
-- TOC entry 234 (class 1259 OID 38901)
-- Name: comment_attachment_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."comment_attachment" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."comment_attachment_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 239 (class 1259 OID 38948)
-- Name: comment_reaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."comment_reaction" (
    "Id" bigint NOT NULL,
    "CommentId" bigint NOT NULL,
    "MemberId" bigint NOT NULL,
    "Emoji" character(1) NOT NULL,
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."comment_reaction" OWNER TO "postgres";

--
-- TOC entry 238 (class 1259 OID 38947)
-- Name: comment_reaction_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."comment_reaction" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."comment_reaction_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 241 (class 1259 OID 38988)
-- Name: event; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."event" (
    "Id" bigint NOT NULL,
    "MeetId" bigint NOT NULL,
    "StatusId" bigint NOT NULL,
    "Title" "text",
    "Note" "text",
    "StartUtc" timestamp(6) with time zone,
    "DurationMinutes" integer,
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."event" OWNER TO "postgres";

--
-- TOC entry 240 (class 1259 OID 38987)
-- Name: event_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."event" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."event_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 243 (class 1259 OID 39001)
-- Name: event_attachment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."event_attachment" (
    "Id" bigint NOT NULL,
    "EventId" bigint NOT NULL,
    "Title" "text",
    "Filename" "text",
    "Url" "text",
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."event_attachment" OWNER TO "postgres";

--
-- TOC entry 242 (class 1259 OID 39000)
-- Name: event_attachment_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."event_attachment" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."event_attachment_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 245 (class 1259 OID 39014)
-- Name: event_member_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."event_member_role" (
    "Id" bigint NOT NULL,
    "EventId" bigint NOT NULL,
    "MemberId" bigint NOT NULL,
    "RoleId" bigint NOT NULL,
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."event_member_role" OWNER TO "postgres";

--
-- TOC entry 244 (class 1259 OID 39013)
-- Name: event_member_role_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."event_member_role" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."event_member_role_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 247 (class 1259 OID 39027)
-- Name: event_reaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."event_reaction" (
    "Id" bigint NOT NULL,
    "EventId" bigint NOT NULL,
    "MemberId" bigint NOT NULL,
    "ReactionId" bigint NOT NULL,
    "Emoji" character(1) NOT NULL,
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."event_reaction" OWNER TO "postgres";

--
-- TOC entry 246 (class 1259 OID 39026)
-- Name: event_reaction_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."event_reaction" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."event_reaction_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 249 (class 1259 OID 39041)
-- Name: event_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."event_status" (
    "Id" bigint NOT NULL,
    "Code" "text" NOT NULL,
    "Title" "text" NOT NULL,
    "Note" "text",
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."event_status" OWNER TO "postgres";

--
-- TOC entry 248 (class 1259 OID 39040)
-- Name: event_status_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."event_status" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."event_status_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 251 (class 1259 OID 39054)
-- Name: event_tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."event_tag" (
    "Id" bigint NOT NULL,
    "Code" "text" NOT NULL,
    "Title" "text" NOT NULL,
    "Note" "text",
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."event_tag" OWNER TO "postgres";

--
-- TOC entry 250 (class 1259 OID 39053)
-- Name: event_tag_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."event_tag" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."event_tag_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 253 (class 1259 OID 39067)
-- Name: grid; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."grid" (
    "Id" bigint NOT NULL,
    "HeatId" bigint NOT NULL,
    "MemberId" bigint,
    "VehicleId" bigint,
    "Position" integer,
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."grid" OWNER TO "postgres";

--
-- TOC entry 252 (class 1259 OID 39066)
-- Name: grid_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."grid" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."grid_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 255 (class 1259 OID 39082)
-- Name: grid_reaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."grid_reaction" (
    "Id" bigint NOT NULL,
    "GridId" bigint NOT NULL,
    "MemberId" bigint NOT NULL,
    "Emoji" character(1) NOT NULL,
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."grid_reaction" OWNER TO "postgres";

--
-- TOC entry 254 (class 1259 OID 39081)
-- Name: grid_reaction_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."grid_reaction" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."grid_reaction_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 257 (class 1259 OID 39095)
-- Name: heat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."heat" (
    "Id" bigint NOT NULL,
    "EventId" bigint NOT NULL,
    "StatusId" bigint,
    "Code" "text" NOT NULL,
    "Title" "text" NOT NULL,
    "Note" "text",
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."heat" OWNER TO "postgres";

--
-- TOC entry 256 (class 1259 OID 39094)
-- Name: heat_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."heat" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."heat_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 259 (class 1259 OID 39108)
-- Name: heat_attachment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."heat_attachment" (
    "Id" bigint NOT NULL,
    "HeatId" bigint NOT NULL,
    "UploadIp" "text",
    "UploadUtc" timestamp(6) with time zone,
    "Title" "text",
    "Filename" "text",
    "Url" "text",
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."heat_attachment" OWNER TO "postgres";

--
-- TOC entry 258 (class 1259 OID 39107)
-- Name: heat_attachment_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."heat_attachment" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."heat_attachment_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 261 (class 1259 OID 39121)
-- Name: heat_penalty_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."heat_penalty_status" (
    "Id" bigint NOT NULL,
    "Code" "text" NOT NULL,
    "Title" "text" NOT NULL,
    "Note" "text",
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."heat_penalty_status" OWNER TO "postgres";

--
-- TOC entry 260 (class 1259 OID 39120)
-- Name: heat_penalty_status_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."heat_penalty_status" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."heat_penalty_status_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 263 (class 1259 OID 39131)
-- Name: heat_reaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."heat_reaction" (
    "Id" bigint NOT NULL,
    "HeatId" bigint NOT NULL,
    "MemberId" bigint NOT NULL,
    "Emoji" character(1) NOT NULL,
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."heat_reaction" OWNER TO "postgres";

--
-- TOC entry 262 (class 1259 OID 39130)
-- Name: heat_reaction_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."heat_reaction" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."heat_reaction_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 265 (class 1259 OID 39144)
-- Name: heat_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."heat_status" (
    "Id" bigint NOT NULL,
    "Code" "text" NOT NULL,
    "Title" "text" NOT NULL,
    "Note" "text",
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."heat_status" OWNER TO "postgres";

--
-- TOC entry 264 (class 1259 OID 39143)
-- Name: heat_status_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."heat_status" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."heat_status_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 267 (class 1259 OID 39158)
-- Name: heat_tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."heat_tag" (
    "Id" bigint NOT NULL,
    "HeatId" bigint NOT NULL,
    "TagId" bigint NOT NULL,
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."heat_tag" OWNER TO "postgres";

--
-- TOC entry 266 (class 1259 OID 39157)
-- Name: heat_tag_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."heat_tag" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."heat_tag_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 269 (class 1259 OID 39171)
-- Name: invoice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."invoice" (
    "Id" bigint NOT NULL,
    "CustomerId" bigint NOT NULL,
    "StatusId" bigint NOT NULL,
    "Note" "text",
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."invoice" OWNER TO "postgres";

--
-- TOC entry 268 (class 1259 OID 39170)
-- Name: invoice_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."invoice" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."invoice_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 271 (class 1259 OID 39184)
-- Name: invoice_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."invoice_detail" (
    "Id" bigint NOT NULL,
    "StockId" bigint NOT NULL,
    "Quantity" numeric(18,6) NOT NULL,
    "Note" "text",
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."invoice_detail" OWNER TO "postgres";

--
-- TOC entry 270 (class 1259 OID 39183)
-- Name: invoice_detail_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."invoice_detail" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."invoice_detail_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 273 (class 1259 OID 39197)
-- Name: invoice_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."invoice_status" (
    "Id" bigint NOT NULL,
    "Code" "text" NOT NULL,
    "Title" "text" NOT NULL,
    "Note" "text",
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."invoice_status" OWNER TO "postgres";

--
-- TOC entry 272 (class 1259 OID 39196)
-- Name: invoice_status_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."invoice_status" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."invoice_status_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 275 (class 1259 OID 39210)
-- Name: lap; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."lap" (
    "Id" bigint NOT NULL,
    "HeatId" bigint NOT NULL,
    "VehicleId" bigint,
    "DriverId" bigint,
    "StatusId" bigint,
    "StartTime" boolean DEFAULT false NOT NULL,
    "StartTimeMs" numeric(18,6),
    "StartTimeIp" "inet" NOT NULL,
    "StartTimeUtc" timestamp(6) with time zone NOT NULL,
    "StartTimeBy" "text" NOT NULL,
    "EndTime" boolean DEFAULT false NOT NULL,
    "EndTimeMs" numeric(18,6),
    "EndTimeIp" "inet" NOT NULL,
    "EndTimeUtc" timestamp(6) with time zone NOT NULL,
    "EndTimeBy" "text" NOT NULL,
    "Time" boolean DEFAULT false NOT NULL,
    "TimeMs" numeric(18,6),
    "TimeIp" "inet" NOT NULL,
    "TimeUtc" timestamp(6) with time zone NOT NULL,
    "TimeBy" "text" NOT NULL,
    "Position" boolean DEFAULT false NOT NULL,
    "PositionNumber" smallint,
    "PositionIp" "inet" NOT NULL,
    "PositionUtc" timestamp(6) with time zone NOT NULL,
    "PositionBy" "text" NOT NULL,
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."lap" OWNER TO "postgres";

--
-- TOC entry 274 (class 1259 OID 39209)
-- Name: lap_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."lap" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."lap_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 277 (class 1259 OID 39227)
-- Name: lap_reaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."lap_reaction" (
    "Id" bigint NOT NULL,
    "LapId" bigint NOT NULL,
    "MemberId" bigint NOT NULL,
    "Emoji" character(1) NOT NULL,
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."lap_reaction" OWNER TO "postgres";

--
-- TOC entry 276 (class 1259 OID 39226)
-- Name: lap_reaction_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."lap_reaction" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."lap_reaction_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 279 (class 1259 OID 39240)
-- Name: lap_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."lap_status" (
    "Id" bigint NOT NULL,
    "Code" "text" NOT NULL,
    "Title" "text" NOT NULL,
    "Note" "text",
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."lap_status" OWNER TO "postgres";

--
-- TOC entry 278 (class 1259 OID 39239)
-- Name: lap_status_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."lap_status" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."lap_status_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 281 (class 1259 OID 39253)
-- Name: lap_tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."lap_tag" (
    "Id" bigint NOT NULL,
    "Code" "text" NOT NULL,
    "Title" "text" NOT NULL,
    "Note" "text",
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."lap_tag" OWNER TO "postgres";

--
-- TOC entry 280 (class 1259 OID 39252)
-- Name: lap_tag_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."lap_tag" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."lap_tag_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 283 (class 1259 OID 39266)
-- Name: meet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."meet" (
    "Id" bigint NOT NULL,
    "MeetStatusId" bigint NOT NULL,
    "StartUtc" timestamp(6) with time zone,
    "DurationMinutes" integer,
    "Title" "text" NOT NULL,
    "Note" "text",
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."meet" OWNER TO "postgres";

--
-- TOC entry 282 (class 1259 OID 39265)
-- Name: meet_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."meet" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."meet_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 285 (class 1259 OID 39279)
-- Name: meet_attachment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."meet_attachment" (
    "Id" bigint NOT NULL,
    "MeetId" bigint NOT NULL,
    "Title" "text",
    "Filename" "text",
    "Url" "text",
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."meet_attachment" OWNER TO "postgres";

--
-- TOC entry 284 (class 1259 OID 39278)
-- Name: meet_attachment_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."meet_attachment" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."meet_attachment_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 287 (class 1259 OID 39292)
-- Name: meet_official; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."meet_official" (
    "Id" bigint NOT NULL,
    "MeetId" bigint NOT NULL,
    "OfficeId" bigint NOT NULL,
    "MemberId" bigint NOT NULL,
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."meet_official" OWNER TO "postgres";

--
-- TOC entry 286 (class 1259 OID 39291)
-- Name: meet_official_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."meet_official" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."meet_official_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 289 (class 1259 OID 39305)
-- Name: meet_reaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."meet_reaction" (
    "Id" bigint NOT NULL,
    "MeetId" bigint NOT NULL,
    "MemberId" bigint NOT NULL,
    "Emoji" character(1) NOT NULL,
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."meet_reaction" OWNER TO "postgres";

--
-- TOC entry 288 (class 1259 OID 39304)
-- Name: meet_reaction_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."meet_reaction" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."meet_reaction_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 291 (class 1259 OID 39318)
-- Name: meet_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."meet_status" (
    "Id" bigint NOT NULL,
    "Code" "text" NOT NULL,
    "Title" "text" NOT NULL,
    "Note" "text",
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedIp" "inet" NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."meet_status" OWNER TO "postgres";

--
-- TOC entry 290 (class 1259 OID 39317)
-- Name: meet_status_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."meet_status" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."meet_status_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 293 (class 1259 OID 39331)
-- Name: meet_tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."meet_tag" (
    "Id" bigint NOT NULL,
    "Code" "text" NOT NULL,
    "Title" "text" NOT NULL,
    "Note" "text",
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."meet_tag" OWNER TO "postgres";

--
-- TOC entry 292 (class 1259 OID 39330)
-- Name: meet_tag_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."meet_tag" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."meet_tag_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 237 (class 1259 OID 38937)
-- Name: member; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."member" (
    "Id" bigint NOT NULL,
    "UserKey" "text",
    "FullName" "text" NOT NULL,
    "PreferredName" "text" NOT NULL,
    "Phone" "text",
    "Mobile" "text",
    "Email" "text",
    "PrimaryAddress_Street1" "text",
    "PrimaryAddress_Street2" "text",
    "PrimaryAddress_Suburb" "text",
    "PrimaryAddress_Postcode" "text",
    "PrimaryAddress_State" "text",
    "PrimaryAddress_Latitude" numeric(18,6),
    "PrimaryAddress_Longitude" numeric(18,6),
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."member" OWNER TO "postgres";

--
-- TOC entry 236 (class 1259 OID 38936)
-- Name: member_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."member" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."member_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 295 (class 1259 OID 39344)
-- Name: member_event; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."member_event" (
    "Id" bigint NOT NULL,
    "MemberId" bigint NOT NULL,
    "EventId" bigint NOT NULL,
    "Register" boolean DEFAULT false NOT NULL,
    "RegisterIp" "inet",
    "RegisterUtc" timestamp(6) with time zone,
    "RegisterBy" "text" NOT NULL,
    "Checkin" boolean DEFAULT false NOT NULL,
    "CheckinIp" "inet",
    "CheckinUtc" timestamp(6) with time zone,
    "CheckinBy" "text" NOT NULL,
    "OnTrack" boolean DEFAULT false NOT NULL,
    "OnTrackIp" "inet",
    "OnTrackUtc" timestamp(6) with time zone,
    "OnTrackBy" "text" NOT NULL,
    "OffTrack" boolean DEFAULT false NOT NULL,
    "OffTrackIp" "inet",
    "OffTrackUtc" timestamp(6) with time zone,
    "OffTrackBy" "text" NOT NULL,
    "Checkout" boolean DEFAULT false NOT NULL,
    "CheckoutIp" "inet",
    "CheckoutUtc" timestamp(6) with time zone,
    "CheckoutBy" "text" NOT NULL,
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."member_event" OWNER TO "postgres";

--
-- TOC entry 294 (class 1259 OID 39343)
-- Name: member_event_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."member_event" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."member_event_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 297 (class 1259 OID 39359)
-- Name: member_event_attachment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."member_event_attachment" (
    "Id" bigint NOT NULL,
    "MemberEventId" bigint NOT NULL,
    "Filename" "text",
    "Title" "text",
    "Url" "text",
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."member_event_attachment" OWNER TO "postgres";

--
-- TOC entry 296 (class 1259 OID 39358)
-- Name: member_event_attachment_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."member_event_attachment" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."member_event_attachment_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 299 (class 1259 OID 39369)
-- Name: member_event_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."member_event_status" (
    "Id" bigint NOT NULL,
    "Code" "text" NOT NULL,
    "Title" "text" NOT NULL,
    "Note" "text",
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."member_event_status" OWNER TO "postgres";

--
-- TOC entry 298 (class 1259 OID 39368)
-- Name: member_event_status_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."member_event_status" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."member_event_status_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 301 (class 1259 OID 39381)
-- Name: member_meet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."member_meet" (
    "Id" bigint NOT NULL,
    "MemberId" bigint NOT NULL,
    "MeetId" bigint NOT NULL,
    "Enter" boolean NOT NULL,
    "EnterIp" "inet",
    "EnterUtc" timestamp(6) with time zone,
    "EnterBy" "text",
    "Checkin" boolean NOT NULL,
    "CheckinIp" "inet" NOT NULL,
    "CheckinUtc" timestamp(6) with time zone NOT NULL,
    "CheckinBy" "text" NOT NULL,
    "Checkout" boolean NOT NULL,
    "CheckoutIp" "inet" NOT NULL,
    "CheckoutUtc" timestamp(6) with time zone NOT NULL,
    "CheckoutBy" "text" NOT NULL,
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedBy" boolean,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."member_meet" OWNER TO "postgres";

--
-- TOC entry 300 (class 1259 OID 39380)
-- Name: member_meet_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."member_meet" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."member_meet_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 303 (class 1259 OID 39391)
-- Name: member_meet_attachment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."member_meet_attachment" (
    "Id" bigint NOT NULL,
    "MemberMeetId" bigint NOT NULL,
    "Filename" "text",
    "Url" "text",
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."member_meet_attachment" OWNER TO "postgres";

--
-- TOC entry 302 (class 1259 OID 39390)
-- Name: member_meet_attachment_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."member_meet_attachment" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."member_meet_attachment_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 305 (class 1259 OID 39401)
-- Name: member_meet_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."member_meet_status" (
    "Id" bigint NOT NULL,
    "Code" "text" NOT NULL,
    "Title" "text" NOT NULL,
    "Note" "text",
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."member_meet_status" OWNER TO "postgres";

--
-- TOC entry 304 (class 1259 OID 39400)
-- Name: member_meet_status_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."member_meet_status" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."member_meet_status_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 307 (class 1259 OID 39411)
-- Name: member_office; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."member_office" (
    "Id" bigint NOT NULL,
    "MemberId" bigint NOT NULL,
    "OfficeId" bigint NOT NULL,
    "StartUtc" timestamp(6) with time zone,
    "EndUtc" timestamp(6) with time zone,
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."member_office" OWNER TO "postgres";

--
-- TOC entry 306 (class 1259 OID 39410)
-- Name: member_office_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."member_office" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."member_office_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 309 (class 1259 OID 39421)
-- Name: member_qualification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."member_qualification" (
    "Id" bigint NOT NULL,
    "MemberId" bigint NOT NULL,
    "QualificationId" bigint NOT NULL,
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."member_qualification" OWNER TO "postgres";

--
-- TOC entry 308 (class 1259 OID 39420)
-- Name: member_qualification_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."member_qualification" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."member_qualification_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 311 (class 1259 OID 39432)
-- Name: member_transaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."member_transaction" (
    "Id" bigint NOT NULL,
    "MemberId" bigint NOT NULL,
    "WhenUtc" timestamp(6) with time zone NOT NULL,
    "Description" "text" NOT NULL,
    "Debit" numeric(19,4) NOT NULL,
    "Credit" numeric(19,4) NOT NULL,
    "Balance" numeric(19,4) NOT NULL,
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."member_transaction" OWNER TO "postgres";

--
-- TOC entry 310 (class 1259 OID 39431)
-- Name: member_transaction_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."member_transaction" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."member_transaction_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 313 (class 1259 OID 39442)
-- Name: member_vehicle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."member_vehicle" (
    "Id" bigint NOT NULL,
    "MemberId" bigint NOT NULL,
    "VehicleId" bigint NOT NULL,
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."member_vehicle" OWNER TO "postgres";

--
-- TOC entry 312 (class 1259 OID 39441)
-- Name: member_vehicle_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."member_vehicle" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."member_vehicle_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 315 (class 1259 OID 39452)
-- Name: office; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."office" (
    "Id" bigint NOT NULL,
    "Code" "text" NOT NULL,
    "Title" "text" NOT NULL,
    "Note" "text",
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedIp" "inet" NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."office" OWNER TO "postgres";

--
-- TOC entry 314 (class 1259 OID 39451)
-- Name: office_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."office" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."office_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 319 (class 1259 OID 39472)
-- Name: penalty; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."penalty" (
    "Id" bigint NOT NULL,
    "HeatId" bigint,
    "DriverId" bigint,
    "VehicleId" bigint,
    "StatusId" bigint,
    "Code" "text",
    "Title" "text",
    "Notes" "text",
    "ValueMs" smallint,
    "ValuePoints" smallint,
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."penalty" OWNER TO "postgres";

--
-- TOC entry 318 (class 1259 OID 39471)
-- Name: penalty_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."penalty" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."penalty_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 317 (class 1259 OID 39462)
-- Name: penalty_attachment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."penalty_attachment" (
    "Id" bigint NOT NULL,
    "PenaltyId" bigint NOT NULL,
    "UploadIp" "text" NOT NULL,
    "UploadUtc" timestamp(6) with time zone,
    "UploadBy" "text" NOT NULL,
    "Filename" "text",
    "Url" "text",
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."penalty_attachment" OWNER TO "postgres";

--
-- TOC entry 316 (class 1259 OID 39461)
-- Name: penalty_attachment_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."penalty_attachment" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."penalty_attachment_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 321 (class 1259 OID 39482)
-- Name: penalty_reaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."penalty_reaction" (
    "Id" bigint NOT NULL,
    "PenaltyId" bigint NOT NULL,
    "MemberId" bigint NOT NULL,
    "Emoji" character(1) NOT NULL,
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."penalty_reaction" OWNER TO "postgres";

--
-- TOC entry 320 (class 1259 OID 39481)
-- Name: penalty_reaction_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."penalty_reaction" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."penalty_reaction_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 213 (class 1259 OID 38541)
-- Name: permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."permission" (
    "Id" bigint NOT NULL,
    "Code" "text",
    "Title" "text",
    "Note" "text",
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."permission" OWNER TO "postgres";

--
-- TOC entry 212 (class 1259 OID 38540)
-- Name: permission_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."permission" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."permission_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 323 (class 1259 OID 39492)
-- Name: poll; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."poll" (
    "Id" bigint NOT NULL,
    "BoardId" bigint NOT NULL,
    "ThreadId" bigint NOT NULL,
    "Title" "text" NOT NULL,
    "Content" "text",
    "Open" boolean DEFAULT false NOT NULL,
    "OpenIp" "inet",
    "OpenUtc" timestamp(6) with time zone,
    "OpenBy" "text",
    "Closed" boolean DEFAULT false NOT NULL,
    "ClosedIp" "inet",
    "ClosedUtc" timestamp(6) with time zone,
    "ClosedBy" "text",
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."poll" OWNER TO "postgres";

--
-- TOC entry 322 (class 1259 OID 39491)
-- Name: poll_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."poll" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."poll_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 325 (class 1259 OID 39534)
-- Name: poll_option; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."poll_option" (
    "Id" bigint NOT NULL,
    "PollId" bigint NOT NULL,
    "Title" "text",
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."poll_option" OWNER TO "postgres";

--
-- TOC entry 324 (class 1259 OID 39533)
-- Name: poll_option_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."poll_option" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."poll_option_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 327 (class 1259 OID 39550)
-- Name: post; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."post" (
    "Id" bigint NOT NULL,
    "Key" "uuid" NOT NULL,
    "BoardId" bigint NOT NULL,
    "ThreadId" bigint NOT NULL,
    "Title" "text" NOT NULL,
    "Content" "text" NOT NULL,
    "Pinned" boolean DEFAULT false NOT NULL,
    "PinnedIp" "inet",
    "PinnedUtc" timestamp(6) with time zone,
    "PinnedUserId" bigint,
    "PinnedNote" "text",
    "UnpinnedIp" "inet",
    "UnpinnedUtc" timestamp(6) with time zone,
    "UnpinnedUserId" bigint,
    "UnpinnedNote" "text",
    "Locked" boolean DEFAULT false NOT NULL,
    "LockedIp" "inet",
    "LockedUtc" timestamp(6) with time zone,
    "LockedUserId" bigint,
    "LockedNote" "text",
    "UnlockedIp" "inet",
    "UnlockedUtc" timestamp(6) with time zone,
    "UnlockedUserId" bigint,
    "UnlockedNote" "text",
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."post" OWNER TO "postgres";

--
-- TOC entry 326 (class 1259 OID 39549)
-- Name: post_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."post" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."post_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 329 (class 1259 OID 39616)
-- Name: qualification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."qualification" (
    "Id" integer NOT NULL,
    "CreatedIp" "inet",
    "CreatedUtc" timestamp(6) with time zone,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "CreatedUserId" bigint NOT NULL,
    "UpdatedUserId" bigint,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."qualification" OWNER TO "postgres";

--
-- TOC entry 328 (class 1259 OID 39615)
-- Name: qualification_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."qualification" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."qualification_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 215 (class 1259 OID 38570)
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."role" (
    "Id" bigint NOT NULL,
    "Code" "text" NOT NULL,
    "Title" "text",
    "Note" "text",
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."role" OWNER TO "postgres";

--
-- TOC entry 214 (class 1259 OID 38569)
-- Name: role_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."role" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."role_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 221 (class 1259 OID 38662)
-- Name: role_permission_securable; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."role_permission_securable" (
    "Id" bigint NOT NULL,
    "RoleId" bigint NOT NULL,
    "PermissionId" bigint NOT NULL,
    "SecurableId" bigint NOT NULL,
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."role_permission_securable" OWNER TO "postgres";

--
-- TOC entry 220 (class 1259 OID 38661)
-- Name: role_permission_securable_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."role_permission_securable" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."role_permission_securable_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 331 (class 1259 OID 39624)
-- Name: season; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."season" (
    "Id" bigint NOT NULL,
    "StatusId" bigint NOT NULL,
    "Title" "text",
    "Note" "text",
    "StartUtc" timestamp(6) with time zone,
    "EndUtc" timestamp(6) with time zone,
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."season" OWNER TO "postgres";

--
-- TOC entry 330 (class 1259 OID 39623)
-- Name: season_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."season" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."season_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 333 (class 1259 OID 39634)
-- Name: season_attachment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."season_attachment" (
    "Id" bigint NOT NULL,
    "SeasonId" bigint NOT NULL,
    "Filename" "text",
    "Url" "text",
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."season_attachment" OWNER TO "postgres";

--
-- TOC entry 332 (class 1259 OID 39633)
-- Name: season_attachment_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."season_attachment" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."season_attachment_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 335 (class 1259 OID 39644)
-- Name: season_event; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."season_event" (
    "Id" bigint NOT NULL,
    "SeasonId" bigint NOT NULL,
    "EventId" bigint NOT NULL,
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."season_event" OWNER TO "postgres";

--
-- TOC entry 334 (class 1259 OID 39643)
-- Name: season_event_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."season_event" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."season_event_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 337 (class 1259 OID 39654)
-- Name: season_event_reward; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."season_event_reward" (
    "Id" bigint NOT NULL,
    "SeasonEventId" bigint NOT NULL,
    "Position" smallint,
    "Percentile" smallint,
    "Value" smallint,
    "Note" "text",
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedBy" boolean,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."season_event_reward" OWNER TO "postgres";

--
-- TOC entry 336 (class 1259 OID 39653)
-- Name: season_event_reward_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."season_event_reward" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."season_event_reward_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 339 (class 1259 OID 39664)
-- Name: season_event_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."season_event_status" (
    "Id" bigint NOT NULL,
    "Code" "text" NOT NULL,
    "Title" "text" NOT NULL,
    "Note" "text",
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."season_event_status" OWNER TO "postgres";

--
-- TOC entry 338 (class 1259 OID 39663)
-- Name: season_event_status_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."season_event_status" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."season_event_status_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 341 (class 1259 OID 39674)
-- Name: season_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."season_status" (
    "Id" bigint NOT NULL,
    "Code" "text" NOT NULL,
    "Title" "text" NOT NULL,
    "Note" "text",
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."season_status" OWNER TO "postgres";

--
-- TOC entry 340 (class 1259 OID 39673)
-- Name: season_status_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."season_status" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."season_status_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 219 (class 1259 OID 38627)
-- Name: securable; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."securable" (
    "Id" bigint NOT NULL,
    "SecurableCategoryId" bigint NOT NULL,
    "Code" "text",
    "Title" "text",
    "Note" "text",
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."securable" OWNER TO "postgres";

--
-- TOC entry 218 (class 1259 OID 38626)
-- Name: securable_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."securable" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."securable_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 217 (class 1259 OID 38598)
-- Name: securable_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."securable_category" (
    "Id" bigint NOT NULL,
    "Code" "text" NOT NULL,
    "Title" "text",
    "CreatedIp" "inet",
    "CreatedUtc" timestamp(6) with time zone,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."securable_category" OWNER TO "postgres";

--
-- TOC entry 216 (class 1259 OID 38597)
-- Name: securable_category_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."securable_category" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."securable_category_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 343 (class 1259 OID 39685)
-- Name: survey; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."survey" (
    "Id" bigint NOT NULL,
    "BoardId" bigint NOT NULL,
    "ThreadId" bigint NOT NULL,
    "StatusId" bigint NOT NULL,
    "Title" "text",
    "Content" "text",
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."survey" OWNER TO "postgres";

--
-- TOC entry 342 (class 1259 OID 39684)
-- Name: survey_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."survey" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."survey_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 345 (class 1259 OID 39725)
-- Name: survey_option; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."survey_option" (
    "Id" bigint NOT NULL,
    "QuestionId" bigint NOT NULL,
    "Position" smallint,
    "Title" "text" NOT NULL,
    "Note" "text",
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."survey_option" OWNER TO "postgres";

--
-- TOC entry 344 (class 1259 OID 39724)
-- Name: survey_option_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."survey_option" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."survey_option_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 347 (class 1259 OID 39735)
-- Name: survey_question; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."survey_question" (
    "Id" bigint NOT NULL,
    "SurveyId" bigint NOT NULL,
    "Position" smallint,
    "Title" "text",
    "Note" "text",
    "Text" boolean,
    "Int" boolean,
    "IntMin" smallint,
    "IntMax" smallint,
    "IntSteps" smallint,
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."survey_question" OWNER TO "postgres";

--
-- TOC entry 346 (class 1259 OID 39734)
-- Name: survey_question_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."survey_question" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."survey_question_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 349 (class 1259 OID 39745)
-- Name: survey_response; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."survey_response" (
    "Id" bigint NOT NULL,
    "SurveyQuestionId" bigint NOT NULL,
    "MemberId" bigint NOT NULL,
    "OptionId" bigint,
    "IntValue" smallint,
    "Note" "text",
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedIp" "inet" NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."survey_response" OWNER TO "postgres";

--
-- TOC entry 348 (class 1259 OID 39744)
-- Name: survey_response_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."survey_response" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."survey_response_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 351 (class 1259 OID 39756)
-- Name: survey_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."survey_status" (
    "Id" bigint NOT NULL,
    "Code" "text" NOT NULL,
    "Title" "text" NOT NULL,
    "Note" "text",
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."survey_status" OWNER TO "postgres";

--
-- TOC entry 350 (class 1259 OID 39755)
-- Name: survey_status_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."survey_status" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."survey_status_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 353 (class 1259 OID 39766)
-- Name: tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tag" (
    "Id" bigint NOT NULL,
    "CreatorId" bigint NOT NULL,
    "OwnerId" bigint NOT NULL,
    "StatusId" bigint NOT NULL,
    "Title" "text",
    "Note" "text",
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."tag" OWNER TO "postgres";

--
-- TOC entry 352 (class 1259 OID 39765)
-- Name: tag_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."tag" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."tag_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 355 (class 1259 OID 39776)
-- Name: tag_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tag_status" (
    "Id" bigint NOT NULL,
    "Code" "text" NOT NULL,
    "Title" "text" NOT NULL,
    "Note" "text",
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."tag_status" OWNER TO "postgres";

--
-- TOC entry 354 (class 1259 OID 39775)
-- Name: tag_status_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."tag_status" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."tag_status_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 231 (class 1259 OID 38845)
-- Name: thread; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."thread" (
    "Id" bigint NOT NULL,
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."thread" OWNER TO "postgres";

--
-- TOC entry 230 (class 1259 OID 38844)
-- Name: thread_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."thread" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."thread_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 211 (class 1259 OID 38512)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."user" (
    "Id" bigint NOT NULL,
    "Key" "uuid" NOT NULL,
    "Email" character varying(128) NOT NULL,
    "Password" character varying(128) NOT NULL,
    "MfaEnabled" boolean DEFAULT false NOT NULL,
    "MfaEnabledIp" "inet",
    "MfaEnabledUtc" timestamp(6) with time zone,
    "MfaKey" "uuid",
    "EmailVerified" boolean DEFAULT false NOT NULL,
    "EmailVerifiedIp" "inet",
    "EmailVerifiedUtc" timestamp(6) with time zone,
    "EmailVerifyKey" "uuid",
    "ForgotPassword" boolean DEFAULT false NOT NULL,
    "ForgotPasswordIp" "inet",
    "ForgotPasswordUtc" character varying(64),
    "ForgotPasswordKey" character varying(64),
    "ForgotPasswordExpiryUtc" timestamp(6) with time zone,
    "ForgotResetIp" "inet",
    "ForgotResetUtc" timestamp(6) with time zone,
    "LastLoginIp" "inet",
    "LastLoginUtc" timestamp(6) with time zone,
    "FailedLogin" boolean DEFAULT false NOT NULL,
    "FailedLoginIp" "inet",
    "FailedLoginUtc" timestamp(6) with time zone,
    "FailedLoginCount" smallint DEFAULT 0 NOT NULL,
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."user" OWNER TO "postgres";

--
-- TOC entry 210 (class 1259 OID 38511)
-- Name: user_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."user" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."user_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 223 (class 1259 OID 38708)
-- Name: user_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."user_role" (
    "Id" bigint NOT NULL,
    "UserId" bigint NOT NULL,
    "RoleId" bigint NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedIp" "inet" NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."user_role" OWNER TO "postgres";

--
-- TOC entry 222 (class 1259 OID 38707)
-- Name: user_role_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."user_role" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."user_role_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 357 (class 1259 OID 39787)
-- Name: vehicle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."vehicle" (
    "Id" bigint NOT NULL,
    "StatusId" bigint NOT NULL,
    "MakeId" bigint,
    "ModelId" bigint,
    "VariantId" bigint,
    "Year" smallint,
    "Title" "text",
    "Note" "text",
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."vehicle" OWNER TO "postgres";

--
-- TOC entry 356 (class 1259 OID 39786)
-- Name: vehicle_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."vehicle" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."vehicle_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 359 (class 1259 OID 39797)
-- Name: vehicle_attachment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."vehicle_attachment" (
    "Id" bigint NOT NULL,
    "VehicleId" bigint NOT NULL,
    "Filename" "text",
    "Url" "text",
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."vehicle_attachment" OWNER TO "postgres";

--
-- TOC entry 358 (class 1259 OID 39796)
-- Name: vehicle_attachment_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."vehicle_attachment" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."vehicle_attachment_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 361 (class 1259 OID 39807)
-- Name: vehicle_make; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."vehicle_make" (
    "Id" bigint NOT NULL,
    "Code" "text" NOT NULL,
    "Title" "text" NOT NULL,
    "Note" "text",
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."vehicle_make" OWNER TO "postgres";

--
-- TOC entry 360 (class 1259 OID 39806)
-- Name: vehicle_make_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."vehicle_make" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."vehicle_make_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 363 (class 1259 OID 39817)
-- Name: vehicle_model; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."vehicle_model" (
    "Id" bigint NOT NULL,
    "MakeId" bigint NOT NULL,
    "Code" "text" NOT NULL,
    "Title" "text" NOT NULL,
    "Note" "text",
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."vehicle_model" OWNER TO "postgres";

--
-- TOC entry 362 (class 1259 OID 39816)
-- Name: vehicle_model_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."vehicle_model" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."vehicle_model_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 365 (class 1259 OID 39827)
-- Name: vehicle_owner; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."vehicle_owner" (
    "Id" bigint NOT NULL,
    "MemberId" bigint,
    "Note" "text",
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."vehicle_owner" OWNER TO "postgres";

--
-- TOC entry 364 (class 1259 OID 39826)
-- Name: vehicle_owner_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."vehicle_owner" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."vehicle_owner_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 367 (class 1259 OID 39837)
-- Name: vehicle_reaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."vehicle_reaction" (
    "Id" bigint NOT NULL,
    "VehicleId" bigint NOT NULL,
    "MemberId" bigint NOT NULL,
    "Emoji" character(1) NOT NULL,
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."vehicle_reaction" OWNER TO "postgres";

--
-- TOC entry 366 (class 1259 OID 39836)
-- Name: vehicle_reaction_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."vehicle_reaction" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."vehicle_reaction_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 369 (class 1259 OID 39847)
-- Name: vehicle_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."vehicle_status" (
    "Id" bigint NOT NULL,
    "Code" "text" NOT NULL,
    "Title" "text" NOT NULL,
    "Note" "text",
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "Updated" boolean DEFAULT false NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."vehicle_status" OWNER TO "postgres";

--
-- TOC entry 368 (class 1259 OID 39846)
-- Name: vehicle_status_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."vehicle_status" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."vehicle_status_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 371 (class 1259 OID 39857)
-- Name: vehicle_variant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."vehicle_variant" (
    "Id" bigint NOT NULL,
    "ModelId" bigint NOT NULL,
    "Code" "text" NOT NULL,
    "Title" "text" NOT NULL,
    "Note" "text",
    "CreatedIp" "inet" NOT NULL,
    "CreatedUtc" timestamp(6) with time zone NOT NULL,
    "CreatedUserId" bigint NOT NULL,
    "UpdatedIp" "inet",
    "UpdatedUtc" timestamp(6) with time zone,
    "UpdatedUserId" bigint,
    "Deleted" boolean DEFAULT false NOT NULL,
    "DeletedIp" "inet",
    "DeletedUtc" timestamp(6) with time zone,
    "DeletedUserId" bigint
);


ALTER TABLE "public"."vehicle_variant" OWNER TO "postgres";

--
-- TOC entry 370 (class 1259 OID 39856)
-- Name: vehicle_variant_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE "public"."vehicle_variant" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "public"."vehicle_variant_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3753 (class 2606 OID 38529)
-- Name: user PK_User; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."user"
    ADD CONSTRAINT "PK_User" PRIMARY KEY ("Id");


--
-- TOC entry 3801 (class 2606 OID 38757)
-- Name: board board_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."board"
    ADD CONSTRAINT "board_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3810 (class 2606 OID 38792)
-- Name: board_role_permission board_role_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."board_role_permission"
    ADD CONSTRAINT "board_role_permission_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3813 (class 2606 OID 38837)
-- Name: board_tag board_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."board_tag"
    ADD CONSTRAINT "board_tag_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3832 (class 2606 OID 38910)
-- Name: comment_attachment comment_attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."comment_attachment"
    ADD CONSTRAINT "comment_attachment_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3825 (class 2606 OID 38874)
-- Name: comment comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."comment"
    ADD CONSTRAINT "comment_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3842 (class 2606 OID 38956)
-- Name: comment_reaction comment_reaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."comment_reaction"
    ADD CONSTRAINT "comment_reaction_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3852 (class 2606 OID 39009)
-- Name: event_attachment event_attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."event_attachment"
    ADD CONSTRAINT "event_attachment_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3857 (class 2606 OID 39022)
-- Name: event_member_role event_member_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."event_member_role"
    ADD CONSTRAINT "event_member_role_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3847 (class 2606 OID 38996)
-- Name: event event_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."event"
    ADD CONSTRAINT "event_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3863 (class 2606 OID 39035)
-- Name: event_reaction event_reaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."event_reaction"
    ADD CONSTRAINT "event_reaction_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3868 (class 2606 OID 39049)
-- Name: event_status event_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."event_status"
    ADD CONSTRAINT "event_status_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3873 (class 2606 OID 39062)
-- Name: event_tag event_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."event_tag"
    ADD CONSTRAINT "event_tag_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3880 (class 2606 OID 39075)
-- Name: grid grid_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."grid"
    ADD CONSTRAINT "grid_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3885 (class 2606 OID 39090)
-- Name: grid_reaction grid_reaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."grid_reaction"
    ADD CONSTRAINT "grid_reaction_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3895 (class 2606 OID 39116)
-- Name: heat_attachment heat_attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."heat_attachment"
    ADD CONSTRAINT "heat_attachment_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3897 (class 2606 OID 39129)
-- Name: heat_penalty_status heat_penalty_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."heat_penalty_status"
    ADD CONSTRAINT "heat_penalty_status_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3890 (class 2606 OID 39103)
-- Name: heat heat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."heat"
    ADD CONSTRAINT "heat_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3902 (class 2606 OID 39139)
-- Name: heat_reaction heat_reaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."heat_reaction"
    ADD CONSTRAINT "heat_reaction_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3908 (class 2606 OID 39152)
-- Name: heat_status heat_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."heat_status"
    ADD CONSTRAINT "heat_status_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3913 (class 2606 OID 39166)
-- Name: heat_tag heat_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."heat_tag"
    ADD CONSTRAINT "heat_tag_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3923 (class 2606 OID 39192)
-- Name: invoice_detail invoice_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."invoice_detail"
    ADD CONSTRAINT "invoice_detail_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3918 (class 2606 OID 39179)
-- Name: invoice invoice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."invoice"
    ADD CONSTRAINT "invoice_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3928 (class 2606 OID 39205)
-- Name: invoice_status invoice_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."invoice_status"
    ADD CONSTRAINT "invoice_status_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3933 (class 2606 OID 39222)
-- Name: lap lap_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."lap"
    ADD CONSTRAINT "lap_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3938 (class 2606 OID 39235)
-- Name: lap_reaction lap_reaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."lap_reaction"
    ADD CONSTRAINT "lap_reaction_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3943 (class 2606 OID 39248)
-- Name: lap_status lap_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."lap_status"
    ADD CONSTRAINT "lap_status_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3948 (class 2606 OID 39261)
-- Name: lap_tag lap_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."lap_tag"
    ADD CONSTRAINT "lap_tag_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3958 (class 2606 OID 39287)
-- Name: meet_attachment meet_attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."meet_attachment"
    ADD CONSTRAINT "meet_attachment_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3963 (class 2606 OID 39300)
-- Name: meet_official meet_official_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."meet_official"
    ADD CONSTRAINT "meet_official_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3953 (class 2606 OID 39274)
-- Name: meet meet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."meet"
    ADD CONSTRAINT "meet_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3968 (class 2606 OID 39313)
-- Name: meet_reaction meet_reaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."meet_reaction"
    ADD CONSTRAINT "meet_reaction_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3973 (class 2606 OID 39326)
-- Name: meet_status meet_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."meet_status"
    ADD CONSTRAINT "meet_status_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3978 (class 2606 OID 39339)
-- Name: meet_tag meet_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."meet_tag"
    ADD CONSTRAINT "meet_tag_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3982 (class 2606 OID 39367)
-- Name: member_event_attachment member_event_attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."member_event_attachment"
    ADD CONSTRAINT "member_event_attachment_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3980 (class 2606 OID 39357)
-- Name: member_event member_event_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."member_event"
    ADD CONSTRAINT "member_event_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3986 (class 2606 OID 39377)
-- Name: member_event_status member_event_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."member_event_status"
    ADD CONSTRAINT "member_event_status_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3990 (class 2606 OID 39399)
-- Name: member_meet_attachment member_meet_attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."member_meet_attachment"
    ADD CONSTRAINT "member_meet_attachment_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3988 (class 2606 OID 39389)
-- Name: member_meet member_meet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."member_meet"
    ADD CONSTRAINT "member_meet_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3992 (class 2606 OID 39409)
-- Name: member_meet_status member_meet_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."member_meet_status"
    ADD CONSTRAINT "member_meet_status_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3994 (class 2606 OID 39419)
-- Name: member_office member_office_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."member_office"
    ADD CONSTRAINT "member_office_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3835 (class 2606 OID 38945)
-- Name: member member_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."member"
    ADD CONSTRAINT "member_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3997 (class 2606 OID 39429)
-- Name: member_qualification member_qualification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."member_qualification"
    ADD CONSTRAINT "member_qualification_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3999 (class 2606 OID 39440)
-- Name: member_transaction member_transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."member_transaction"
    ADD CONSTRAINT "member_transaction_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4001 (class 2606 OID 39450)
-- Name: member_vehicle member_vehicle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."member_vehicle"
    ADD CONSTRAINT "member_vehicle_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4003 (class 2606 OID 39460)
-- Name: office office_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."office"
    ADD CONSTRAINT "office_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4005 (class 2606 OID 39470)
-- Name: penalty_attachment penalty_attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."penalty_attachment"
    ADD CONSTRAINT "penalty_attachment_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4007 (class 2606 OID 39480)
-- Name: penalty penalty_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."penalty"
    ADD CONSTRAINT "penalty_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4009 (class 2606 OID 39490)
-- Name: penalty_reaction penalty_reaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."penalty_reaction"
    ADD CONSTRAINT "penalty_reaction_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3759 (class 2606 OID 38549)
-- Name: permission permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."permission"
    ADD CONSTRAINT "permission_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4019 (class 2606 OID 39542)
-- Name: poll_option poll_option_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."poll_option"
    ADD CONSTRAINT "poll_option_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4016 (class 2606 OID 39502)
-- Name: poll poll_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."poll"
    ADD CONSTRAINT "poll_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4030 (class 2606 OID 39560)
-- Name: post post_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."post"
    ADD CONSTRAINT "post_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4032 (class 2606 OID 39622)
-- Name: qualification qualification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."qualification"
    ADD CONSTRAINT "qualification_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3786 (class 2606 OID 38670)
-- Name: role_permission_securable role_permission_securable_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."role_permission_securable"
    ADD CONSTRAINT "role_permission_securable_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3765 (class 2606 OID 38577)
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."role"
    ADD CONSTRAINT "role_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4036 (class 2606 OID 39642)
-- Name: season_attachment season_attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."season_attachment"
    ADD CONSTRAINT "season_attachment_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4038 (class 2606 OID 39652)
-- Name: season_event season_event_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."season_event"
    ADD CONSTRAINT "season_event_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4040 (class 2606 OID 39662)
-- Name: season_event_reward season_event_reward_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."season_event_reward"
    ADD CONSTRAINT "season_event_reward_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4042 (class 2606 OID 39672)
-- Name: season_event_status season_event_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."season_event_status"
    ADD CONSTRAINT "season_event_status_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4034 (class 2606 OID 39632)
-- Name: season season_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."season"
    ADD CONSTRAINT "season_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4045 (class 2606 OID 39682)
-- Name: season_status season_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."season_status"
    ADD CONSTRAINT "season_status_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3771 (class 2606 OID 38606)
-- Name: securable_category securable_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."securable_category"
    ADD CONSTRAINT "securable_category_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3778 (class 2606 OID 38635)
-- Name: securable securable_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."securable"
    ADD CONSTRAINT "securable_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4054 (class 2606 OID 39733)
-- Name: survey_option survey_option_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."survey_option"
    ADD CONSTRAINT "survey_option_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4052 (class 2606 OID 39693)
-- Name: survey survey_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."survey"
    ADD CONSTRAINT "survey_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4056 (class 2606 OID 39743)
-- Name: survey_question survey_question_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."survey_question"
    ADD CONSTRAINT "survey_question_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4059 (class 2606 OID 39753)
-- Name: survey_response survey_response_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."survey_response"
    ADD CONSTRAINT "survey_response_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4061 (class 2606 OID 39764)
-- Name: survey_status survey_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."survey_status"
    ADD CONSTRAINT "survey_status_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4063 (class 2606 OID 39774)
-- Name: tag tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tag"
    ADD CONSTRAINT "tag_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4066 (class 2606 OID 39784)
-- Name: tag_status tag_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tag_status"
    ADD CONSTRAINT "tag_status_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3817 (class 2606 OID 38852)
-- Name: thread thread_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."thread"
    ADD CONSTRAINT "thread_pkey" PRIMARY KEY ("Id") INCLUDE ("Deleted");


--
-- TOC entry 3794 (class 2606 OID 38716)
-- Name: user_role user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."user_role"
    ADD CONSTRAINT "user_role_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4070 (class 2606 OID 39805)
-- Name: vehicle_attachment vehicle_attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."vehicle_attachment"
    ADD CONSTRAINT "vehicle_attachment_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4072 (class 2606 OID 39815)
-- Name: vehicle_make vehicle_make_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."vehicle_make"
    ADD CONSTRAINT "vehicle_make_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4074 (class 2606 OID 39825)
-- Name: vehicle_model vehicle_model_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."vehicle_model"
    ADD CONSTRAINT "vehicle_model_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4076 (class 2606 OID 39835)
-- Name: vehicle_owner vehicle_owner_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."vehicle_owner"
    ADD CONSTRAINT "vehicle_owner_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4068 (class 2606 OID 39795)
-- Name: vehicle vehicle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."vehicle"
    ADD CONSTRAINT "vehicle_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4078 (class 2606 OID 39845)
-- Name: vehicle_reaction vehicle_reaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."vehicle_reaction"
    ADD CONSTRAINT "vehicle_reaction_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4080 (class 2606 OID 39855)
-- Name: vehicle_status vehicle_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."vehicle_status"
    ADD CONSTRAINT "vehicle_status_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 4082 (class 2606 OID 39864)
-- Name: vehicle_variant vehicle_variant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."vehicle_variant"
    ADD CONSTRAINT "vehicle_variant_pkey" PRIMARY KEY ("Id");


--
-- TOC entry 3826 (class 1259 OID 38935)
-- Name: FK_CommentAttachment_Comment_CommentId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_CommentAttachment_Comment_CommentId_idx" ON "public"."comment_attachment" USING "btree" ("CommentId");


--
-- TOC entry 3827 (class 1259 OID 38932)
-- Name: FK_CommentAttachment_User_CreatedUserId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_CommentAttachment_User_CreatedUserId_idx" ON "public"."comment_attachment" USING "btree" ("CreatedUserId");


--
-- TOC entry 3828 (class 1259 OID 38934)
-- Name: FK_CommentAttachment_User_DeletedUserId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_CommentAttachment_User_DeletedUserId_idx" ON "public"."comment_attachment" USING "btree" ("DeletedUserId");


--
-- TOC entry 3829 (class 1259 OID 38933)
-- Name: FK_CommentAttachment_User_UpdatedUserId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_CommentAttachment_User_UpdatedUserId_idx" ON "public"."comment_attachment" USING "btree" ("UpdatedUserId");


--
-- TOC entry 3836 (class 1259 OID 38985)
-- Name: FK_CommentReaction_Comment_CommentId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_CommentReaction_Comment_CommentId_idx" ON "public"."comment_reaction" USING "btree" ("CommentId");


--
-- TOC entry 3837 (class 1259 OID 38986)
-- Name: FK_CommentReaction_Member_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_CommentReaction_Member_idx" ON "public"."comment_reaction" USING "btree" ("MemberId");


--
-- TOC entry 3838 (class 1259 OID 38983)
-- Name: FK_CommentReaction_User_CreatedUserId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_CommentReaction_User_CreatedUserId_idx" ON "public"."comment_reaction" USING "btree" ("CreatedUserId");


--
-- TOC entry 3839 (class 1259 OID 38984)
-- Name: FK_CommentReaction_User_DeletedUserId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_CommentReaction_User_DeletedUserId_idx" ON "public"."comment_reaction" USING "btree" ("DeletedUserId");


--
-- TOC entry 3848 (class 1259 OID 39010)
-- Name: FK_EventAttachment_User_CreatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_EventAttachment_User_CreatedUserId" ON "public"."event_attachment" USING "btree" ("CreatedUserId");


--
-- TOC entry 3849 (class 1259 OID 39012)
-- Name: FK_EventAttachment_User_DeletedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_EventAttachment_User_DeletedUserId" ON "public"."event_attachment" USING "btree" ("DeletedUserId");


--
-- TOC entry 3850 (class 1259 OID 39011)
-- Name: FK_EventAttachment_User_UpdatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_EventAttachment_User_UpdatedUserId" ON "public"."event_attachment" USING "btree" ("UpdatedUserId");


--
-- TOC entry 3853 (class 1259 OID 39023)
-- Name: FK_EventMemberRole_User_CreatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_EventMemberRole_User_CreatedUserId" ON "public"."event_member_role" USING "btree" ("CreatedUserId");


--
-- TOC entry 3854 (class 1259 OID 39025)
-- Name: FK_EventMemberRole_User_DeletedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_EventMemberRole_User_DeletedUserId" ON "public"."event_member_role" USING "btree" ("DeletedUserId");


--
-- TOC entry 3855 (class 1259 OID 39024)
-- Name: FK_EventMemberRole_User_UpdatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_EventMemberRole_User_UpdatedUserId" ON "public"."event_member_role" USING "btree" ("UpdatedUserId");


--
-- TOC entry 3858 (class 1259 OID 39037)
-- Name: FK_EventReaction_User_CreatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_EventReaction_User_CreatedUserId" ON "public"."event_reaction" USING "btree" ("CreatedUserId");


--
-- TOC entry 3859 (class 1259 OID 39039)
-- Name: FK_EventReaction_User_DeletedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_EventReaction_User_DeletedUserId" ON "public"."event_reaction" USING "btree" ("DeletedUserId");


--
-- TOC entry 3860 (class 1259 OID 39038)
-- Name: FK_EventReaction_User_UpdatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_EventReaction_User_UpdatedUserId" ON "public"."event_reaction" USING "btree" ("UpdatedUserId");


--
-- TOC entry 3864 (class 1259 OID 39050)
-- Name: FK_EventStatus_User_CreatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_EventStatus_User_CreatedUserId" ON "public"."event_status" USING "btree" ("CreatedUserId");


--
-- TOC entry 3865 (class 1259 OID 39052)
-- Name: FK_EventStatus_User_DeletedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_EventStatus_User_DeletedUserId" ON "public"."event_status" USING "btree" ("DeletedUserId");


--
-- TOC entry 3866 (class 1259 OID 39051)
-- Name: FK_EventStatus_User_UpdatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_EventStatus_User_UpdatedUserId" ON "public"."event_status" USING "btree" ("UpdatedUserId");


--
-- TOC entry 3869 (class 1259 OID 39063)
-- Name: FK_EventTag_User_CreatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_EventTag_User_CreatedUserId" ON "public"."event_tag" USING "btree" ("CreatedUserId");


--
-- TOC entry 3870 (class 1259 OID 39065)
-- Name: FK_EventTag_User_DeletedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_EventTag_User_DeletedUserId" ON "public"."event_tag" USING "btree" ("DeletedUserId");


--
-- TOC entry 3871 (class 1259 OID 39064)
-- Name: FK_EventTag_User_UpdatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_EventTag_User_UpdatedUserId" ON "public"."event_tag" USING "btree" ("UpdatedUserId");


--
-- TOC entry 3843 (class 1259 OID 38997)
-- Name: FK_Event_User_CreatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_Event_User_CreatedUserId" ON "public"."event" USING "btree" ("CreatedUserId");


--
-- TOC entry 3844 (class 1259 OID 38999)
-- Name: FK_Event_User_DeletedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_Event_User_DeletedUserId" ON "public"."event" USING "btree" ("DeletedUserId");


--
-- TOC entry 3845 (class 1259 OID 38998)
-- Name: FK_Event_User_UpdatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_Event_User_UpdatedUserId" ON "public"."event" USING "btree" ("UpdatedUserId");


--
-- TOC entry 3881 (class 1259 OID 39091)
-- Name: FK_GridReaction_User_CreatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_GridReaction_User_CreatedUserId" ON "public"."grid_reaction" USING "btree" ("CreatedUserId");


--
-- TOC entry 3882 (class 1259 OID 39093)
-- Name: FK_GridReaction_User_DeletedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_GridReaction_User_DeletedUserId" ON "public"."grid_reaction" USING "btree" ("DeletedUserId");


--
-- TOC entry 3883 (class 1259 OID 39092)
-- Name: FK_GridReaction_User_UpdatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_GridReaction_User_UpdatedUserId" ON "public"."grid_reaction" USING "btree" ("UpdatedUserId");


--
-- TOC entry 3874 (class 1259 OID 39078)
-- Name: FK_Grid_User_CreatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_Grid_User_CreatedUserId" ON "public"."grid" USING "btree" ("CreatedUserId");


--
-- TOC entry 3875 (class 1259 OID 39080)
-- Name: FK_Grid_User_DeletedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_Grid_User_DeletedUserId" ON "public"."grid" USING "btree" ("DeletedUserId");


--
-- TOC entry 3876 (class 1259 OID 39079)
-- Name: FK_Grid_User_UpdatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_Grid_User_UpdatedUserId" ON "public"."grid" USING "btree" ("UpdatedUserId");


--
-- TOC entry 3891 (class 1259 OID 39117)
-- Name: FK_HeatAttachment_User_CreatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_HeatAttachment_User_CreatedUserId" ON "public"."heat_attachment" USING "btree" ("CreatedUserId");


--
-- TOC entry 3892 (class 1259 OID 39119)
-- Name: FK_HeatAttachment_User_DeletedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_HeatAttachment_User_DeletedUserId" ON "public"."heat_attachment" USING "btree" ("DeletedUserId");


--
-- TOC entry 3893 (class 1259 OID 39118)
-- Name: FK_HeatAttachment_User_UpdatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_HeatAttachment_User_UpdatedUserId" ON "public"."heat_attachment" USING "btree" ("UpdatedUserId");


--
-- TOC entry 3898 (class 1259 OID 39140)
-- Name: FK_HeatReaction_User_CreatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_HeatReaction_User_CreatedUserId" ON "public"."heat_reaction" USING "btree" ("CreatedUserId");


--
-- TOC entry 3899 (class 1259 OID 39142)
-- Name: FK_HeatReaction_User_DeletedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_HeatReaction_User_DeletedUserId" ON "public"."heat_reaction" USING "btree" ("DeletedUserId");


--
-- TOC entry 3900 (class 1259 OID 39141)
-- Name: FK_HeatReaction_User_UpdatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_HeatReaction_User_UpdatedUserId" ON "public"."heat_reaction" USING "btree" ("UpdatedUserId");


--
-- TOC entry 3903 (class 1259 OID 39154)
-- Name: FK_HeatStatus_User_CreatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_HeatStatus_User_CreatedUserId" ON "public"."heat_status" USING "btree" ("CreatedUserId");


--
-- TOC entry 3904 (class 1259 OID 39156)
-- Name: FK_HeatStatus_User_DeletedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_HeatStatus_User_DeletedUserId" ON "public"."heat_status" USING "btree" ("DeletedUserId");


--
-- TOC entry 3905 (class 1259 OID 39155)
-- Name: FK_HeatStatus_User_UpdatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_HeatStatus_User_UpdatedUserId" ON "public"."heat_status" USING "btree" ("UpdatedUserId");


--
-- TOC entry 3909 (class 1259 OID 39167)
-- Name: FK_HeatTag_User_CreatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_HeatTag_User_CreatedUserId" ON "public"."heat_tag" USING "btree" ("CreatedUserId");


--
-- TOC entry 3910 (class 1259 OID 39169)
-- Name: FK_HeatTag_User_DeletedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_HeatTag_User_DeletedUserId" ON "public"."heat_tag" USING "btree" ("DeletedUserId");


--
-- TOC entry 3911 (class 1259 OID 39168)
-- Name: FK_HeatTag_User_UpdatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_HeatTag_User_UpdatedUserId" ON "public"."heat_tag" USING "btree" ("UpdatedUserId");


--
-- TOC entry 3886 (class 1259 OID 39104)
-- Name: FK_Heat_User_CreatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_Heat_User_CreatedUserId" ON "public"."heat" USING "btree" ("CreatedUserId");


--
-- TOC entry 3887 (class 1259 OID 39106)
-- Name: FK_Heat_User_DeletedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_Heat_User_DeletedUserId" ON "public"."heat" USING "btree" ("DeletedUserId");


--
-- TOC entry 3888 (class 1259 OID 39105)
-- Name: FK_Heat_User_UpdatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_Heat_User_UpdatedUserId" ON "public"."heat" USING "btree" ("UpdatedUserId");


--
-- TOC entry 3919 (class 1259 OID 39193)
-- Name: FK_InvoiceDetail_User_CreatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_InvoiceDetail_User_CreatedUserId" ON "public"."invoice_detail" USING "btree" ("CreatedUserId");


--
-- TOC entry 3920 (class 1259 OID 39195)
-- Name: FK_InvoiceDetail_User_DeletedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_InvoiceDetail_User_DeletedUserId" ON "public"."invoice_detail" USING "btree" ("DeletedUserId");


--
-- TOC entry 3921 (class 1259 OID 39194)
-- Name: FK_InvoiceDetail_User_UpdatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_InvoiceDetail_User_UpdatedUserId" ON "public"."invoice_detail" USING "btree" ("UpdatedUserId");


--
-- TOC entry 3924 (class 1259 OID 39206)
-- Name: FK_InvoiceStatus_User_CreatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_InvoiceStatus_User_CreatedUserId" ON "public"."invoice_status" USING "btree" ("CreatedUserId");


--
-- TOC entry 3925 (class 1259 OID 39208)
-- Name: FK_InvoiceStatus_User_DeletedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_InvoiceStatus_User_DeletedUserId" ON "public"."invoice_status" USING "btree" ("DeletedUserId");


--
-- TOC entry 3926 (class 1259 OID 39207)
-- Name: FK_InvoiceStatus_User_UpdatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_InvoiceStatus_User_UpdatedUserId" ON "public"."invoice_status" USING "btree" ("UpdatedUserId");


--
-- TOC entry 3914 (class 1259 OID 39180)
-- Name: FK_Invoice_User_CreatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_Invoice_User_CreatedUserId" ON "public"."invoice" USING "btree" ("CreatedUserId");


--
-- TOC entry 3915 (class 1259 OID 39182)
-- Name: FK_Invoice_User_DeletedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_Invoice_User_DeletedUserId" ON "public"."invoice" USING "btree" ("DeletedUserId");


--
-- TOC entry 3916 (class 1259 OID 39181)
-- Name: FK_Invoice_User_UpdatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_Invoice_User_UpdatedUserId" ON "public"."invoice" USING "btree" ("UpdatedUserId");


--
-- TOC entry 3934 (class 1259 OID 39236)
-- Name: FK_LapReaction_User_CreatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_LapReaction_User_CreatedUserId" ON "public"."lap_reaction" USING "btree" ("CreatedUserId");


--
-- TOC entry 3935 (class 1259 OID 39238)
-- Name: FK_LapReaction_User_DeletedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_LapReaction_User_DeletedUserId" ON "public"."lap_reaction" USING "btree" ("DeletedUserId");


--
-- TOC entry 3936 (class 1259 OID 39237)
-- Name: FK_LapReaction_User_UpdatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_LapReaction_User_UpdatedUserId" ON "public"."lap_reaction" USING "btree" ("UpdatedUserId");


--
-- TOC entry 3939 (class 1259 OID 39249)
-- Name: FK_LapStatus_User_CreatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_LapStatus_User_CreatedUserId" ON "public"."lap_status" USING "btree" ("CreatedUserId");


--
-- TOC entry 3940 (class 1259 OID 39251)
-- Name: FK_LapStatus_User_DeletedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_LapStatus_User_DeletedUserId" ON "public"."lap_status" USING "btree" ("DeletedUserId");


--
-- TOC entry 3941 (class 1259 OID 39250)
-- Name: FK_LapStatus_User_UpdatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_LapStatus_User_UpdatedUserId" ON "public"."lap_status" USING "btree" ("UpdatedUserId");


--
-- TOC entry 3944 (class 1259 OID 39262)
-- Name: FK_LapTag_User_CreatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_LapTag_User_CreatedUserId" ON "public"."lap_tag" USING "btree" ("CreatedUserId");


--
-- TOC entry 3945 (class 1259 OID 39264)
-- Name: FK_LapTag_User_DeletedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_LapTag_User_DeletedUserId" ON "public"."lap_tag" USING "btree" ("DeletedUserId");


--
-- TOC entry 3946 (class 1259 OID 39263)
-- Name: FK_LapTag_User_UpdatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_LapTag_User_UpdatedUserId" ON "public"."lap_tag" USING "btree" ("UpdatedUserId");


--
-- TOC entry 3929 (class 1259 OID 39223)
-- Name: FK_Lap_User_CreatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_Lap_User_CreatedUserId" ON "public"."lap" USING "btree" ("CreatedUserId");


--
-- TOC entry 3930 (class 1259 OID 39225)
-- Name: FK_Lap_User_DeletedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_Lap_User_DeletedUserId" ON "public"."lap" USING "btree" ("DeletedUserId");


--
-- TOC entry 3931 (class 1259 OID 39224)
-- Name: FK_Lap_User_UpdatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_Lap_User_UpdatedUserId" ON "public"."lap" USING "btree" ("UpdatedUserId");


--
-- TOC entry 3954 (class 1259 OID 39288)
-- Name: FK_MeetAttachment_User_CreatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_MeetAttachment_User_CreatedUserId" ON "public"."meet_attachment" USING "btree" ("CreatedUserId");


--
-- TOC entry 3955 (class 1259 OID 39290)
-- Name: FK_MeetAttachment_User_DeletedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_MeetAttachment_User_DeletedUserId" ON "public"."meet_attachment" USING "btree" ("DeletedUserId");


--
-- TOC entry 3956 (class 1259 OID 39289)
-- Name: FK_MeetAttachment_User_UpdatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_MeetAttachment_User_UpdatedUserId" ON "public"."meet_attachment" USING "btree" ("UpdatedUserId");


--
-- TOC entry 3959 (class 1259 OID 39301)
-- Name: FK_MeetOfficial_User_CreatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_MeetOfficial_User_CreatedUserId" ON "public"."meet_official" USING "btree" ("CreatedUserId");


--
-- TOC entry 3960 (class 1259 OID 39303)
-- Name: FK_MeetOfficial_User_DeletedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_MeetOfficial_User_DeletedUserId" ON "public"."meet_official" USING "btree" ("DeletedUserId");


--
-- TOC entry 3961 (class 1259 OID 39302)
-- Name: FK_MeetOfficial_User_UpdatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_MeetOfficial_User_UpdatedUserId" ON "public"."meet_official" USING "btree" ("UpdatedUserId");


--
-- TOC entry 3964 (class 1259 OID 39314)
-- Name: FK_MeetReaction_User_CreatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_MeetReaction_User_CreatedUserId" ON "public"."meet_reaction" USING "btree" ("CreatedUserId");


--
-- TOC entry 3965 (class 1259 OID 39316)
-- Name: FK_MeetReaction_User_DeletedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_MeetReaction_User_DeletedUserId" ON "public"."meet_reaction" USING "btree" ("DeletedUserId");


--
-- TOC entry 3966 (class 1259 OID 39315)
-- Name: FK_MeetReaction_User_UpdatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_MeetReaction_User_UpdatedUserId" ON "public"."meet_reaction" USING "btree" ("UpdatedUserId");


--
-- TOC entry 3969 (class 1259 OID 39327)
-- Name: FK_MeetStatus_User_CreatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_MeetStatus_User_CreatedUserId" ON "public"."meet_status" USING "btree" ("CreatedUserId");


--
-- TOC entry 3970 (class 1259 OID 39329)
-- Name: FK_MeetStatus_User_DeletedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_MeetStatus_User_DeletedUserId" ON "public"."meet_status" USING "btree" ("DeletedUserId");


--
-- TOC entry 3971 (class 1259 OID 39328)
-- Name: FK_MeetStatus_User_UpdatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_MeetStatus_User_UpdatedUserId" ON "public"."meet_status" USING "btree" ("UpdatedUserId");


--
-- TOC entry 3974 (class 1259 OID 39340)
-- Name: FK_MeetTag_User_CreatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_MeetTag_User_CreatedUserId" ON "public"."meet_tag" USING "btree" ("CreatedUserId");


--
-- TOC entry 3975 (class 1259 OID 39342)
-- Name: FK_MeetTag_User_DeletedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_MeetTag_User_DeletedUserId" ON "public"."meet_tag" USING "btree" ("DeletedUserId");


--
-- TOC entry 3976 (class 1259 OID 39341)
-- Name: FK_MeetTag_User_UpdatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_MeetTag_User_UpdatedUserId" ON "public"."meet_tag" USING "btree" ("UpdatedUserId");


--
-- TOC entry 3949 (class 1259 OID 39275)
-- Name: FK_Meet_User_CreatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_Meet_User_CreatedUserId" ON "public"."meet" USING "btree" ("CreatedUserId");


--
-- TOC entry 3950 (class 1259 OID 39277)
-- Name: FK_Meet_User_DeletedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_Meet_User_DeletedUserId" ON "public"."meet" USING "btree" ("DeletedUserId");


--
-- TOC entry 3951 (class 1259 OID 39276)
-- Name: FK_Meet_User_UpdatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_Meet_User_UpdatedUserId" ON "public"."meet" USING "btree" ("UpdatedUserId");


--
-- TOC entry 4020 (class 1259 OID 39613)
-- Name: FK_Post_Board_BoardId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_Post_Board_BoardId_idx" ON "public"."post" USING "btree" ("BoardId");


--
-- TOC entry 4021 (class 1259 OID 39610)
-- Name: FK_Post_User_CreatedUserId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_Post_User_CreatedUserId_idx" ON "public"."post" USING "btree" ("CreatedUserId");


--
-- TOC entry 4022 (class 1259 OID 39612)
-- Name: FK_Post_User_DeletedUserId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_Post_User_DeletedUserId_idx" ON "public"."post" USING "btree" ("DeletedUserId");


--
-- TOC entry 4023 (class 1259 OID 39608)
-- Name: FK_Post_User_LockedUserId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_Post_User_LockedUserId_idx" ON "public"."post" USING "btree" ("LockedUserId");


--
-- TOC entry 4024 (class 1259 OID 39606)
-- Name: FK_Post_User_PinnedUserId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_Post_User_PinnedUserId_idx" ON "public"."post" USING "btree" ("PinnedUserId");


--
-- TOC entry 4025 (class 1259 OID 39609)
-- Name: FK_Post_User_UnlockedUserId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_Post_User_UnlockedUserId_idx" ON "public"."post" USING "btree" ("UnlockedUserId");


--
-- TOC entry 4026 (class 1259 OID 39607)
-- Name: FK_Post_User_UnpinnedUserId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_Post_User_UnpinnedUserId_idx" ON "public"."post" USING "btree" ("UnpinnedUserId");


--
-- TOC entry 4027 (class 1259 OID 39611)
-- Name: FK_Post_User_UpdatedUserId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "FK_Post_User_UpdatedUserId_idx" ON "public"."post" USING "btree" ("UpdatedUserId");


--
-- TOC entry 3802 (class 1259 OID 38829)
-- Name: IX_BoardRolePermission_BoardId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_BoardRolePermission_BoardId" ON "public"."board_role_permission" USING "btree" ("BoardId");


--
-- TOC entry 3803 (class 1259 OID 38823)
-- Name: IX_BoardRolePermission_Composite; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_BoardRolePermission_Composite" ON "public"."board_role_permission" USING "btree" ("Deleted", "BoardId", "RoleId", "PermissionId");


--
-- TOC entry 3804 (class 1259 OID 38826)
-- Name: IX_BoardRolePermission_CreatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_BoardRolePermission_CreatedUserId" ON "public"."board_role_permission" USING "btree" ("CreatedUserId");


--
-- TOC entry 3805 (class 1259 OID 38828)
-- Name: IX_BoardRolePermission_DeletedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_BoardRolePermission_DeletedUserId" ON "public"."board_role_permission" USING "btree" ("DeletedUserId");


--
-- TOC entry 3806 (class 1259 OID 38825)
-- Name: IX_BoardRolePermission_PermissionId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_BoardRolePermission_PermissionId" ON "public"."board_role_permission" USING "btree" ("PermissionId");


--
-- TOC entry 3807 (class 1259 OID 38824)
-- Name: IX_BoardRolePermission_RoleId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_BoardRolePermission_RoleId" ON "public"."board_role_permission" USING "btree" ("RoleId");


--
-- TOC entry 3808 (class 1259 OID 38827)
-- Name: IX_BoardRolePermission_UpdatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_BoardRolePermission_UpdatedUserId" ON "public"."board_role_permission" USING "btree" ("UpdatedUserId");


--
-- TOC entry 3811 (class 1259 OID 38843)
-- Name: IX_BoardTag_BoardId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_BoardTag_BoardId" ON "public"."board_tag" USING "btree" ("BoardId");


--
-- TOC entry 3795 (class 1259 OID 38778)
-- Name: IX_Board_Composite; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Board_Composite" ON "public"."board" USING "btree" ("Key", "Deleted");


--
-- TOC entry 3796 (class 1259 OID 38779)
-- Name: IX_Board_CreatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Board_CreatedUserId" ON "public"."board" USING "btree" ("CreatedUserId");


--
-- TOC entry 3797 (class 1259 OID 38781)
-- Name: IX_Board_DeletedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Board_DeletedUserId" ON "public"."board" USING "btree" ("DeletedUserId");


--
-- TOC entry 3798 (class 1259 OID 38782)
-- Name: IX_Board_Pinned; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Board_Pinned" ON "public"."board" USING "btree" ("PinnedUserId");


--
-- TOC entry 3799 (class 1259 OID 38780)
-- Name: IX_Board_UpdatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Board_UpdatedUserId" ON "public"."board" USING "btree" ("UpdatedUserId");


--
-- TOC entry 3830 (class 1259 OID 38931)
-- Name: IX_CommentAttachment_Composite; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_CommentAttachment_Composite" ON "public"."comment_attachment" USING "btree" ("Deleted", "CommentId", "Filename", "Url");


--
-- TOC entry 3840 (class 1259 OID 38982)
-- Name: IX_CommentReaction_Composite; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_CommentReaction_Composite" ON "public"."comment_reaction" USING "btree" ("Deleted", "CommentId", "MemberId", "Emoji");


--
-- TOC entry 3818 (class 1259 OID 38895)
-- Name: IX_Comment_Composite; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Comment_Composite" ON "public"."comment" USING "btree" ("Deleted");


--
-- TOC entry 3819 (class 1259 OID 38896)
-- Name: IX_Comment_Key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Comment_Key" ON "public"."comment" USING "btree" ("Key");


--
-- TOC entry 3820 (class 1259 OID 38900)
-- Name: IX_Comment_Thread_ThreadId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Comment_Thread_ThreadId" ON "public"."comment" USING "btree" ("ThreadId");


--
-- TOC entry 3821 (class 1259 OID 38897)
-- Name: IX_Comment_User_CreatedUserId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Comment_User_CreatedUserId_idx" ON "public"."comment" USING "btree" ("CreatedUserId");


--
-- TOC entry 3822 (class 1259 OID 38899)
-- Name: IX_Comment_User_DeletedUserId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Comment_User_DeletedUserId_idx" ON "public"."comment" USING "btree" ("DeletedUserId");


--
-- TOC entry 3823 (class 1259 OID 38898)
-- Name: IX_Comment_User_UpdatedUserId_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Comment_User_UpdatedUserId_idx" ON "public"."comment" USING "btree" ("UpdatedUserId");


--
-- TOC entry 3861 (class 1259 OID 39036)
-- Name: IX_EventReaction_ReactionId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_EventReaction_ReactionId" ON "public"."event_reaction" USING "btree" ("ReactionId");


--
-- TOC entry 3877 (class 1259 OID 39076)
-- Name: IX_Grid_DriverId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Grid_DriverId" ON "public"."grid" USING "btree" ("MemberId");


--
-- TOC entry 3878 (class 1259 OID 39077)
-- Name: IX_Grid_Vehicle; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Grid_Vehicle" ON "public"."grid" USING "btree" ("VehicleId");


--
-- TOC entry 3906 (class 1259 OID 39153)
-- Name: IX_HeatStatus_Composite; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_HeatStatus_Composite" ON "public"."heat_status" USING "btree" ("Deleted", "Code", "Title", "Updated");


--
-- TOC entry 3983 (class 1259 OID 39378)
-- Name: IX_MemberEventStatus_Code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_MemberEventStatus_Code" ON "public"."member_event_status" USING "btree" ("Deleted", "Code", "Title", "Updated");


--
-- TOC entry 3984 (class 1259 OID 39379)
-- Name: IX_MemberEventStatus_Composite; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_MemberEventStatus_Composite" ON "public"."member_event_status" USING "btree" ("Deleted", "Code", "Title", "Updated");


--
-- TOC entry 3833 (class 1259 OID 38946)
-- Name: IX_Member_Key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Member_Key" ON "public"."member" USING "btree" ("UserKey");


--
-- TOC entry 3754 (class 1259 OID 38565)
-- Name: IX_Permission_Composite; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Permission_Composite" ON "public"."permission" USING "btree" ("Id", "Code", "Title", "Deleted");


--
-- TOC entry 3755 (class 1259 OID 38567)
-- Name: IX_Permission_CreatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Permission_CreatedUserId" ON "public"."permission" USING "btree" ("CreatedUserId");


--
-- TOC entry 3756 (class 1259 OID 38566)
-- Name: IX_Permission_DeletedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Permission_DeletedUserId" ON "public"."permission" USING "btree" ("DeletedUserId");


--
-- TOC entry 3757 (class 1259 OID 38568)
-- Name: IX_Permission_UpdatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Permission_UpdatedUserId" ON "public"."permission" USING "btree" ("UpdatedUserId");


--
-- TOC entry 4017 (class 1259 OID 39548)
-- Name: IX_PollOption_PollId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_PollOption_PollId" ON "public"."poll_option" USING "btree" ("PollId");


--
-- TOC entry 4010 (class 1259 OID 39529)
-- Name: IX_Poll_BoardId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Poll_BoardId" ON "public"."poll" USING "btree" ("BoardId");


--
-- TOC entry 4011 (class 1259 OID 39530)
-- Name: IX_Poll_CreateUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Poll_CreateUserId" ON "public"."poll" USING "btree" ("CreatedUserId");


--
-- TOC entry 4012 (class 1259 OID 39532)
-- Name: IX_Poll_DeleteUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Poll_DeleteUserId" ON "public"."poll" USING "btree" ("DeletedUserId");


--
-- TOC entry 4013 (class 1259 OID 39528)
-- Name: IX_Poll_ThreadId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Poll_ThreadId" ON "public"."poll" USING "btree" ("ThreadId");


--
-- TOC entry 4014 (class 1259 OID 39531)
-- Name: IX_Poll_UpdateUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Poll_UpdateUserId" ON "public"."poll" USING "btree" ("UpdatedUserId");


--
-- TOC entry 3995 (class 1259 OID 39430)
-- Name: IX_QualificationId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_QualificationId" ON "public"."member_qualification" USING "btree" ("QualificationId");


--
-- TOC entry 3779 (class 1259 OID 38704)
-- Name: IX_RolePermissionSecurable_CreatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_RolePermissionSecurable_CreatedUserId" ON "public"."role_permission_securable" USING "btree" ("CreatedUserId");


--
-- TOC entry 3780 (class 1259 OID 38705)
-- Name: IX_RolePermissionSecurable_DeletedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_RolePermissionSecurable_DeletedUserId" ON "public"."role_permission_securable" USING "btree" ("DeletedUserId");


--
-- TOC entry 3781 (class 1259 OID 38702)
-- Name: IX_RolePermissionSecurable_PermissionId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_RolePermissionSecurable_PermissionId" ON "public"."role_permission_securable" USING "btree" ("PermissionId");


--
-- TOC entry 3782 (class 1259 OID 38701)
-- Name: IX_RolePermissionSecurable_RoleId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_RolePermissionSecurable_RoleId" ON "public"."role_permission_securable" USING "btree" ("RoleId");


--
-- TOC entry 3783 (class 1259 OID 38703)
-- Name: IX_RolePermissionSecurable_SecurableId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_RolePermissionSecurable_SecurableId" ON "public"."role_permission_securable" USING "btree" ("SecurableId");


--
-- TOC entry 3784 (class 1259 OID 38706)
-- Name: IX_RolePermissionSecurable_UpdatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_RolePermissionSecurable_UpdatedUserId" ON "public"."role_permission_securable" USING "btree" ("UpdatedUserId");


--
-- TOC entry 3760 (class 1259 OID 38593)
-- Name: IX_Role_Composite; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Role_Composite" ON "public"."role" USING "btree" ("Id", "Code", "Deleted");


--
-- TOC entry 3761 (class 1259 OID 38594)
-- Name: IX_Role_CreatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Role_CreatedUserId" ON "public"."role" USING "btree" ("CreatedUserId");


--
-- TOC entry 3762 (class 1259 OID 38595)
-- Name: IX_Role_DeletedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Role_DeletedUserId" ON "public"."role" USING "btree" ("DeletedUserId");


--
-- TOC entry 3763 (class 1259 OID 38596)
-- Name: IX_Role_UpdatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Role_UpdatedUserId" ON "public"."role" USING "btree" ("UpdatedUserId");


--
-- TOC entry 4043 (class 1259 OID 39683)
-- Name: IX_SeasonStatus_Composite; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_SeasonStatus_Composite" ON "public"."season_status" USING "btree" ("Deleted", "Code", "Title", "Updated");


--
-- TOC entry 3766 (class 1259 OID 38624)
-- Name: IX_SecurableCategory_CreateUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_SecurableCategory_CreateUserId" ON "public"."securable_category" USING "btree" ("CreatedUserId");


--
-- TOC entry 3767 (class 1259 OID 38623)
-- Name: IX_SecurableCategory_DeleteUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_SecurableCategory_DeleteUserId" ON "public"."securable_category" USING "btree" ("DeletedUserId");


--
-- TOC entry 3768 (class 1259 OID 38622)
-- Name: IX_SecurableCategory_UpdateUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_SecurableCategory_UpdateUserId" ON "public"."securable_category" USING "btree" ("UpdatedUserId");


--
-- TOC entry 3772 (class 1259 OID 38656)
-- Name: IX_Securable_Composite; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Securable_Composite" ON "public"."securable" USING "btree" ("Id", "Code", "Title", "Deleted");


--
-- TOC entry 3773 (class 1259 OID 38658)
-- Name: IX_Securable_CreatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Securable_CreatedUserId" ON "public"."securable" USING "btree" ("CreatedUserId");


--
-- TOC entry 3774 (class 1259 OID 38657)
-- Name: IX_Securable_DeletedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Securable_DeletedUserId" ON "public"."securable" USING "btree" ("DeletedUserId");


--
-- TOC entry 3775 (class 1259 OID 38660)
-- Name: IX_Securable_SecurableCategoryId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Securable_SecurableCategoryId" ON "public"."securable" USING "btree" ("SecurableCategoryId");


--
-- TOC entry 3776 (class 1259 OID 38659)
-- Name: IX_Securable_UpdatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Securable_UpdatedUserId" ON "public"."securable" USING "btree" ("UpdatedUserId");


--
-- TOC entry 4057 (class 1259 OID 39754)
-- Name: IX_SurveyResponse_QuestionId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_SurveyResponse_QuestionId" ON "public"."survey_response" USING "btree" ("SurveyQuestionId");


--
-- TOC entry 4046 (class 1259 OID 39723)
-- Name: IX_Survey_Board; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Survey_Board" ON "public"."survey" USING "btree" ("BoardId");


--
-- TOC entry 4047 (class 1259 OID 39719)
-- Name: IX_Survey_CreatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Survey_CreatedUserId" ON "public"."survey" USING "btree" ("CreatedUserId");


--
-- TOC entry 4048 (class 1259 OID 39721)
-- Name: IX_Survey_DeletedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Survey_DeletedUserId" ON "public"."survey" USING "btree" ("DeletedUserId");


--
-- TOC entry 4049 (class 1259 OID 39722)
-- Name: IX_Survey_ThreadId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Survey_ThreadId" ON "public"."survey" USING "btree" ("ThreadId");


--
-- TOC entry 4050 (class 1259 OID 39720)
-- Name: IX_Survey_UpdatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Survey_UpdatedUserId" ON "public"."survey" USING "btree" ("UpdatedUserId");


--
-- TOC entry 4064 (class 1259 OID 39785)
-- Name: IX_TagStatus_Composite; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_TagStatus_Composite" ON "public"."tag_status" USING "btree" ("Deleted", "Code", "Title", "Updated");


--
-- TOC entry 3814 (class 1259 OID 38863)
-- Name: IX_Thread_CreatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Thread_CreatedUserId" ON "public"."thread" USING "btree" ("CreatedUserId");


--
-- TOC entry 3815 (class 1259 OID 38864)
-- Name: IX_Thread_DeletedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Thread_DeletedUserId" ON "public"."thread" USING "btree" ("DeletedUserId");


--
-- TOC entry 3787 (class 1259 OID 38742)
-- Name: IX_UserRole_Composite; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_UserRole_Composite" ON "public"."user_role" USING "btree" ("UserId", "RoleId", "Deleted");


--
-- TOC entry 3788 (class 1259 OID 38745)
-- Name: IX_UserRole_CreatedUsedId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_UserRole_CreatedUsedId" ON "public"."user_role" USING "btree" ("CreatedUserId");


--
-- TOC entry 3789 (class 1259 OID 38747)
-- Name: IX_UserRole_DeletedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_UserRole_DeletedUserId" ON "public"."user_role" USING "btree" ("DeletedUserId");


--
-- TOC entry 3790 (class 1259 OID 38744)
-- Name: IX_UserRole_RoleId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_UserRole_RoleId" ON "public"."user_role" USING "btree" ("RoleId");


--
-- TOC entry 3791 (class 1259 OID 38746)
-- Name: IX_UserRole_UpdatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_UserRole_UpdatedUserId" ON "public"."user_role" USING "btree" ("UpdatedUserId");


--
-- TOC entry 3792 (class 1259 OID 38743)
-- Name: IX_UserRole_UserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_UserRole_UserId" ON "public"."user_role" USING "btree" ("UserId");


--
-- TOC entry 3748 (class 1259 OID 38527)
-- Name: IX_User_DeletedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_User_DeletedUserId" ON "public"."user" USING "btree" ("DeletedUserId");


--
-- TOC entry 3749 (class 1259 OID 38525)
-- Name: IX_User_Email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IX_User_Email" ON "public"."user" USING "btree" ("Email") INCLUDE ("Password", "EmailVerified", "ForgotPassword", "FailedLoginCount") WHERE ("Deleted" = false);


--
-- TOC entry 3750 (class 1259 OID 38524)
-- Name: IX_User_Key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_User_Key" ON "public"."user" USING "btree" ("Key");


--
-- TOC entry 3751 (class 1259 OID 38526)
-- Name: IX_User_UpdatedUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_User_UpdatedUserId" ON "public"."user" USING "btree" ("UpdatedUserId");


--
-- TOC entry 3769 (class 1259 OID 38625)
-- Name: UQ_Code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "UQ_Code" ON "public"."securable_category" USING "btree" ("Code");


--
-- TOC entry 4028 (class 1259 OID 39614)
-- Name: fk_post_thread1_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fk_post_thread1_idx" ON "public"."post" USING "btree" ("ThreadId");


--
-- TOC entry 4118 (class 2606 OID 38818)
-- Name: board_role_permission FK_BoardRolePermission_Board_BoardId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."board_role_permission"
    ADD CONSTRAINT "FK_BoardRolePermission_Board_BoardId" FOREIGN KEY ("BoardId") REFERENCES "public"."board"("Id");


--
-- TOC entry 4114 (class 2606 OID 38798)
-- Name: board_role_permission FK_BoardRolePermission_Permission_PermissionId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."board_role_permission"
    ADD CONSTRAINT "FK_BoardRolePermission_Permission_PermissionId" FOREIGN KEY ("PermissionId") REFERENCES "public"."permission"("Id");


--
-- TOC entry 4113 (class 2606 OID 38793)
-- Name: board_role_permission FK_BoardRolePermission_Role_RoleId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."board_role_permission"
    ADD CONSTRAINT "FK_BoardRolePermission_Role_RoleId" FOREIGN KEY ("RoleId") REFERENCES "public"."role"("Id");


--
-- TOC entry 4115 (class 2606 OID 38803)
-- Name: board_role_permission FK_BoardRolePermission_User_CreatedUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."board_role_permission"
    ADD CONSTRAINT "FK_BoardRolePermission_User_CreatedUserId" FOREIGN KEY ("CreatedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4117 (class 2606 OID 38813)
-- Name: board_role_permission FK_BoardRolePermission_User_DeletedUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."board_role_permission"
    ADD CONSTRAINT "FK_BoardRolePermission_User_DeletedUserId" FOREIGN KEY ("DeletedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4116 (class 2606 OID 38808)
-- Name: board_role_permission FK_BoardRolePermission_User_UpdatedUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."board_role_permission"
    ADD CONSTRAINT "FK_BoardRolePermission_User_UpdatedUserId" FOREIGN KEY ("UpdatedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4119 (class 2606 OID 38838)
-- Name: board_tag FK_BoardTag_Board_BoardId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."board_tag"
    ADD CONSTRAINT "FK_BoardTag_Board_BoardId" FOREIGN KEY ("BoardId") REFERENCES "public"."board"("Id");


--
-- TOC entry 4109 (class 2606 OID 38758)
-- Name: board FK_Board_User_CreatedUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."board"
    ADD CONSTRAINT "FK_Board_User_CreatedUserId" FOREIGN KEY ("CreatedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4111 (class 2606 OID 38768)
-- Name: board FK_Board_User_DeletedUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."board"
    ADD CONSTRAINT "FK_Board_User_DeletedUserId" FOREIGN KEY ("DeletedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4112 (class 2606 OID 38773)
-- Name: board FK_Board_User_PinnedUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."board"
    ADD CONSTRAINT "FK_Board_User_PinnedUserId" FOREIGN KEY ("PinnedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4110 (class 2606 OID 38763)
-- Name: board FK_Board_User_UpdatedUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."board"
    ADD CONSTRAINT "FK_Board_User_UpdatedUserId" FOREIGN KEY ("UpdatedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4129 (class 2606 OID 38926)
-- Name: comment_attachment FK_CommentAttachment_Comment_CommentId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."comment_attachment"
    ADD CONSTRAINT "FK_CommentAttachment_Comment_CommentId" FOREIGN KEY ("CommentId") REFERENCES "public"."comment"("Id");


--
-- TOC entry 4126 (class 2606 OID 38911)
-- Name: comment_attachment FK_CommentAttachment_User_CreatedUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."comment_attachment"
    ADD CONSTRAINT "FK_CommentAttachment_User_CreatedUserId" FOREIGN KEY ("CreatedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4128 (class 2606 OID 38921)
-- Name: comment_attachment FK_CommentAttachment_User_DeletedUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."comment_attachment"
    ADD CONSTRAINT "FK_CommentAttachment_User_DeletedUserId" FOREIGN KEY ("DeletedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4127 (class 2606 OID 38916)
-- Name: comment_attachment FK_CommentAttachment_User_UpdatedUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."comment_attachment"
    ADD CONSTRAINT "FK_CommentAttachment_User_UpdatedUserId" FOREIGN KEY ("UpdatedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4133 (class 2606 OID 38972)
-- Name: comment_reaction FK_CommentReaction_Comment_CommentId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."comment_reaction"
    ADD CONSTRAINT "FK_CommentReaction_Comment_CommentId" FOREIGN KEY ("CommentId") REFERENCES "public"."comment"("Id");


--
-- TOC entry 4134 (class 2606 OID 38977)
-- Name: comment_reaction FK_CommentReaction_Member; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."comment_reaction"
    ADD CONSTRAINT "FK_CommentReaction_Member" FOREIGN KEY ("MemberId") REFERENCES "public"."member"("Id");


--
-- TOC entry 4130 (class 2606 OID 38957)
-- Name: comment_reaction FK_CommentReaction_User_CreatedUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."comment_reaction"
    ADD CONSTRAINT "FK_CommentReaction_User_CreatedUserId" FOREIGN KEY ("CreatedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4132 (class 2606 OID 38967)
-- Name: comment_reaction FK_CommentReaction_User_DeletedUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."comment_reaction"
    ADD CONSTRAINT "FK_CommentReaction_User_DeletedUserId" FOREIGN KEY ("DeletedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4131 (class 2606 OID 38962)
-- Name: comment_reaction FK_CommentReaction_User_UpdatedUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."comment_reaction"
    ADD CONSTRAINT "FK_CommentReaction_User_UpdatedUserId" FOREIGN KEY ("UpdatedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4125 (class 2606 OID 38890)
-- Name: comment FK_Comment_Thread_ThreadId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."comment"
    ADD CONSTRAINT "FK_Comment_Thread_ThreadId" FOREIGN KEY ("ThreadId") REFERENCES "public"."thread"("Id");


--
-- TOC entry 4122 (class 2606 OID 38875)
-- Name: comment FK_Comment_User_CreatedUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."comment"
    ADD CONSTRAINT "FK_Comment_User_CreatedUserId" FOREIGN KEY ("CreatedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4124 (class 2606 OID 38885)
-- Name: comment FK_Comment_User_DeletedUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."comment"
    ADD CONSTRAINT "FK_Comment_User_DeletedUserId" FOREIGN KEY ("DeletedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4123 (class 2606 OID 38880)
-- Name: comment FK_Comment_User_UpdatedUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."comment"
    ADD CONSTRAINT "FK_Comment_User_UpdatedUserId" FOREIGN KEY ("UpdatedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4085 (class 2606 OID 38550)
-- Name: permission FK_Permission_User_CreatedUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."permission"
    ADD CONSTRAINT "FK_Permission_User_CreatedUserId" FOREIGN KEY ("CreatedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4086 (class 2606 OID 38555)
-- Name: permission FK_Permission_User_DeletedUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."permission"
    ADD CONSTRAINT "FK_Permission_User_DeletedUserId" FOREIGN KEY ("DeletedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4087 (class 2606 OID 38560)
-- Name: permission FK_Permission_User_UpdatedUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."permission"
    ADD CONSTRAINT "FK_Permission_User_UpdatedUserId" FOREIGN KEY ("UpdatedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4140 (class 2606 OID 39543)
-- Name: poll_option FK_PollOption_Poll_PollId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."poll_option"
    ADD CONSTRAINT "FK_PollOption_Poll_PollId" FOREIGN KEY ("PollId") REFERENCES "public"."poll"("Id");


--
-- TOC entry 4136 (class 2606 OID 39508)
-- Name: poll FK_Poll_Board_BoardId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."poll"
    ADD CONSTRAINT "FK_Poll_Board_BoardId" FOREIGN KEY ("BoardId") REFERENCES "public"."board"("Id");


--
-- TOC entry 4137 (class 2606 OID 39513)
-- Name: poll FK_Poll_CreateUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."poll"
    ADD CONSTRAINT "FK_Poll_CreateUserId" FOREIGN KEY ("CreatedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4139 (class 2606 OID 39523)
-- Name: poll FK_Poll_DeleteUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."poll"
    ADD CONSTRAINT "FK_Poll_DeleteUserId" FOREIGN KEY ("DeletedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4135 (class 2606 OID 39503)
-- Name: poll FK_Poll_Thread_ThreadId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."poll"
    ADD CONSTRAINT "FK_Poll_Thread_ThreadId" FOREIGN KEY ("ThreadId") REFERENCES "public"."thread"("Id");


--
-- TOC entry 4138 (class 2606 OID 39518)
-- Name: poll FK_Poll_UpdateUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."poll"
    ADD CONSTRAINT "FK_Poll_UpdateUserId" FOREIGN KEY ("UpdatedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4148 (class 2606 OID 39596)
-- Name: post FK_Post_Board_BoardId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."post"
    ADD CONSTRAINT "FK_Post_Board_BoardId" FOREIGN KEY ("BoardId") REFERENCES "public"."board"("Id");


--
-- TOC entry 4149 (class 2606 OID 39601)
-- Name: post FK_Post_Thread_ThreadId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."post"
    ADD CONSTRAINT "FK_Post_Thread_ThreadId" FOREIGN KEY ("ThreadId") REFERENCES "public"."thread"("Id");


--
-- TOC entry 4145 (class 2606 OID 39581)
-- Name: post FK_Post_User_CreatedUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."post"
    ADD CONSTRAINT "FK_Post_User_CreatedUserId" FOREIGN KEY ("CreatedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4147 (class 2606 OID 39591)
-- Name: post FK_Post_User_DeletedUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."post"
    ADD CONSTRAINT "FK_Post_User_DeletedUserId" FOREIGN KEY ("DeletedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4143 (class 2606 OID 39571)
-- Name: post FK_Post_User_LockedUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."post"
    ADD CONSTRAINT "FK_Post_User_LockedUserId" FOREIGN KEY ("LockedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4141 (class 2606 OID 39561)
-- Name: post FK_Post_User_PinnedUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."post"
    ADD CONSTRAINT "FK_Post_User_PinnedUserId" FOREIGN KEY ("PinnedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4144 (class 2606 OID 39576)
-- Name: post FK_Post_User_UnlockedUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."post"
    ADD CONSTRAINT "FK_Post_User_UnlockedUserId" FOREIGN KEY ("UnlockedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4142 (class 2606 OID 39566)
-- Name: post FK_Post_User_UnpinnedUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."post"
    ADD CONSTRAINT "FK_Post_User_UnpinnedUserId" FOREIGN KEY ("UnpinnedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4146 (class 2606 OID 39586)
-- Name: post FK_Post_User_UpdatedUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."post"
    ADD CONSTRAINT "FK_Post_User_UpdatedUserId" FOREIGN KEY ("UpdatedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4098 (class 2606 OID 38671)
-- Name: role_permission_securable FK_RolePermissionSecurable_Permission_PermissionId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."role_permission_securable"
    ADD CONSTRAINT "FK_RolePermissionSecurable_Permission_PermissionId" FOREIGN KEY ("PermissionId") REFERENCES "public"."permission"("Id");


--
-- TOC entry 4099 (class 2606 OID 38676)
-- Name: role_permission_securable FK_RolePermissionSecurable_Role_RoleId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."role_permission_securable"
    ADD CONSTRAINT "FK_RolePermissionSecurable_Role_RoleId" FOREIGN KEY ("RoleId") REFERENCES "public"."role"("Id");


--
-- TOC entry 4103 (class 2606 OID 38696)
-- Name: role_permission_securable FK_RolePermissionSecurable_Securable_SecurableId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."role_permission_securable"
    ADD CONSTRAINT "FK_RolePermissionSecurable_Securable_SecurableId" FOREIGN KEY ("SecurableId") REFERENCES "public"."securable"("Id");


--
-- TOC entry 4100 (class 2606 OID 38681)
-- Name: role_permission_securable FK_RolePermissionSecurable_User_CreatedUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."role_permission_securable"
    ADD CONSTRAINT "FK_RolePermissionSecurable_User_CreatedUserId" FOREIGN KEY ("CreatedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4101 (class 2606 OID 38686)
-- Name: role_permission_securable FK_RolePermissionSecurable_User_DeletedUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."role_permission_securable"
    ADD CONSTRAINT "FK_RolePermissionSecurable_User_DeletedUserId" FOREIGN KEY ("DeletedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4102 (class 2606 OID 38691)
-- Name: role_permission_securable FK_RolePermissionSecurable_User_UpdatedUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."role_permission_securable"
    ADD CONSTRAINT "FK_RolePermissionSecurable_User_UpdatedUserId" FOREIGN KEY ("UpdatedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4088 (class 2606 OID 38578)
-- Name: role FK_Role_User_CreatedUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."role"
    ADD CONSTRAINT "FK_Role_User_CreatedUserId" FOREIGN KEY ("CreatedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4089 (class 2606 OID 38583)
-- Name: role FK_Role_User_DeletedUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."role"
    ADD CONSTRAINT "FK_Role_User_DeletedUserId" FOREIGN KEY ("DeletedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4090 (class 2606 OID 38588)
-- Name: role FK_Role_User_UpdatedUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."role"
    ADD CONSTRAINT "FK_Role_User_UpdatedUserId" FOREIGN KEY ("UpdatedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4091 (class 2606 OID 38607)
-- Name: securable_category FK_SecurableCategory_CreateUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."securable_category"
    ADD CONSTRAINT "FK_SecurableCategory_CreateUserId" FOREIGN KEY ("CreatedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4093 (class 2606 OID 38617)
-- Name: securable_category FK_SecurableCategory_DeleteUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."securable_category"
    ADD CONSTRAINT "FK_SecurableCategory_DeleteUserId" FOREIGN KEY ("DeletedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4092 (class 2606 OID 38612)
-- Name: securable_category FK_SecurableCategory_UpdateUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."securable_category"
    ADD CONSTRAINT "FK_SecurableCategory_UpdateUserId" FOREIGN KEY ("UpdatedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4097 (class 2606 OID 38651)
-- Name: securable FK_Securable_SecurableCategory_SecurableCategoryId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."securable"
    ADD CONSTRAINT "FK_Securable_SecurableCategory_SecurableCategoryId" FOREIGN KEY ("SecurableCategoryId") REFERENCES "public"."securable_category"("Id");


--
-- TOC entry 4094 (class 2606 OID 38636)
-- Name: securable FK_Securable_User_CreatedUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."securable"
    ADD CONSTRAINT "FK_Securable_User_CreatedUserId" FOREIGN KEY ("CreatedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4095 (class 2606 OID 38641)
-- Name: securable FK_Securable_User_DeletedUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."securable"
    ADD CONSTRAINT "FK_Securable_User_DeletedUserId" FOREIGN KEY ("DeletedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4096 (class 2606 OID 38646)
-- Name: securable FK_Securable_User_UpdatedUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."securable"
    ADD CONSTRAINT "FK_Securable_User_UpdatedUserId" FOREIGN KEY ("UpdatedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4154 (class 2606 OID 39714)
-- Name: survey FK_Survey_Board_BoardId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."survey"
    ADD CONSTRAINT "FK_Survey_Board_BoardId" FOREIGN KEY ("BoardId") REFERENCES "public"."board"("Id");


--
-- TOC entry 4153 (class 2606 OID 39709)
-- Name: survey FK_Survey_Thread_ThreadId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."survey"
    ADD CONSTRAINT "FK_Survey_Thread_ThreadId" FOREIGN KEY ("ThreadId") REFERENCES "public"."thread"("Id");


--
-- TOC entry 4150 (class 2606 OID 39694)
-- Name: survey FK_Survey_User_CreatedUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."survey"
    ADD CONSTRAINT "FK_Survey_User_CreatedUserId" FOREIGN KEY ("CreatedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4152 (class 2606 OID 39704)
-- Name: survey FK_Survey_User_DeletedUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."survey"
    ADD CONSTRAINT "FK_Survey_User_DeletedUserId" FOREIGN KEY ("DeletedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4151 (class 2606 OID 39699)
-- Name: survey FK_Survey_User_UpdatedUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."survey"
    ADD CONSTRAINT "FK_Survey_User_UpdatedUserId" FOREIGN KEY ("UpdatedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4120 (class 2606 OID 38853)
-- Name: thread FK_Thread_User_CreatedUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."thread"
    ADD CONSTRAINT "FK_Thread_User_CreatedUserId" FOREIGN KEY ("CreatedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4121 (class 2606 OID 38858)
-- Name: thread FK_Thread_User_DeletedUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."thread"
    ADD CONSTRAINT "FK_Thread_User_DeletedUserId" FOREIGN KEY ("DeletedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4108 (class 2606 OID 38737)
-- Name: user_role FK_UserRole_Role_RoleId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."user_role"
    ADD CONSTRAINT "FK_UserRole_Role_RoleId" FOREIGN KEY ("RoleId") REFERENCES "public"."role"("Id");


--
-- TOC entry 4104 (class 2606 OID 38717)
-- Name: user_role FK_UserRole_User_CreatedUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."user_role"
    ADD CONSTRAINT "FK_UserRole_User_CreatedUserId" FOREIGN KEY ("CreatedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4105 (class 2606 OID 38722)
-- Name: user_role FK_UserRole_User_DeletedUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."user_role"
    ADD CONSTRAINT "FK_UserRole_User_DeletedUserId" FOREIGN KEY ("DeletedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4106 (class 2606 OID 38727)
-- Name: user_role FK_UserRole_User_UpdatedUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."user_role"
    ADD CONSTRAINT "FK_UserRole_User_UpdatedUserId" FOREIGN KEY ("UpdatedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4107 (class 2606 OID 38732)
-- Name: user_role FK_UserRole_User_UserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."user_role"
    ADD CONSTRAINT "FK_UserRole_User_UserId" FOREIGN KEY ("UserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4084 (class 2606 OID 38535)
-- Name: user FK_User_User_DeletedUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."user"
    ADD CONSTRAINT "FK_User_User_DeletedUserId" FOREIGN KEY ("DeletedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4083 (class 2606 OID 38530)
-- Name: user FK_User_User_UpdatedUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."user"
    ADD CONSTRAINT "FK_User_User_UpdatedUserId" FOREIGN KEY ("UpdatedUserId") REFERENCES "public"."user"("Id");


--
-- TOC entry 4299 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA "public"; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA "public" FROM PUBLIC;
GRANT ALL ON SCHEMA "public" TO "car_club_service";


-- Completed on 2021-12-06 17:17:28

--
-- PostgreSQL database dump complete
--

