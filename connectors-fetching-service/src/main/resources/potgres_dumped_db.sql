--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7
-- Dumped by pg_dump version 14.7

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
-- Name: bets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bets (
    id uuid NOT NULL,
    bet_result character varying(255),
    bet_selection character varying(255),
    bet_type character varying(255),
    bookmaker_reference character varying(255),
    category character varying(255),
    event_date date,
    event_name character varying(255),
    event_status character varying(255),
    event_type character varying(255),
    odds numeric(19,2),
    selection_type character varying(255),
    ticket_id uuid NOT NULL
);


ALTER TABLE public.bets OWNER TO postgres;

--
-- Name: combo_selections; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.combo_selections (
    id uuid NOT NULL,
    bookmaker_reference character varying(255),
    result character varying(255),
    selection character varying(255),
    selection_type character varying(255),
    bet_id uuid NOT NULL
);


ALTER TABLE public.combo_selections OWNER TO postgres;

--
-- Name: tickets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tickets (
    id uuid NOT NULL,
    bookmaker_reference character varying(255),
    connector_identifier character varying(255),
    created_at date,
    odds numeric(19,2),
    stake numeric(19,2),
    tax numeric(19,2),
    ticket_result character varying(255),
    ticket_type character varying(255)
);


ALTER TABLE public.tickets OWNER TO postgres;

--
-- Data for Name: bets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bets (id, bet_result, bet_selection, bet_type, bookmaker_reference, category, event_date, event_name, event_status, event_type, odds, selection_type, ticket_id) FROM stdin;
bc1250df-057b-4e0b-88cb-6b772ecaad26	LOSE	0 - 1	Dokładny wynik	3499945298	FOOTBALL	2023-06-20	Mołdawia - Polska	ENDED	El. EURO 2024	5.00	PREMATCH	fce59c06-cd1c-44a7-b295-d1014d252e6b
01aa63d4-6e4e-45ac-b2c6-46ece11c51e2	LOSE	Polska / Tak	Wynik meczu/Obie drużyny zdobędą bramki	3499945445	FOOTBALL	2023-06-20	Mołdawia - Polska	ENDED	El. EURO 2024	4.00	PREMATCH	49b52957-3420-4944-9f5e-64b9d67f4108
1ebc1f80-413f-4121-94ca-eba7ab4a6c2b	LOSE	Tomasz Kędziora	Strzelec	3502134045	FOOTBALL	2023-06-20	Mołdawia - Polska	ENDED	El. EURO 2024	13.00	PREMATCH	5fe4d4b0-c99b-49e1-8dcc-35b004cf3a7b
012703b4-967a-4018-bc9b-6af29d4f2062	LOSE	Powyżej 38.5	Łączna liczba gemów	3498297658	TENNIS	2023-06-11	Novak Djokovic - Casper Ruud	ENDED	French Open M.	1.93	PREMATCH	0144d229-0fef-4dbe-89d3-73962883a0a4
7845460f-e548-4895-a021-de61cda5c8d3	LOSE	Termalica Bruk-Bet Nieciecza	Wynik meczu (z wyłączeniem dogrywki)	3497354037	FOOTBALL	2023-06-11	Termalica Bruk-Bet Nieciecza - Puszcza Niepołomice	ENDED	Polska 1. liga	1.94	PREMATCH	0144d229-0fef-4dbe-89d3-73962883a0a4
438b5bee-f95e-4e0e-8d27-83202a58e165	LOSE	BetMaker	BetMaker	153770125	FOOTBALL	2023-06-10	Manchester City - Inter Mediolan	ENDED	Liga Mistrzów	6.40	PREMATCH	d16bf385-8647-48eb-8a37-79f41d34cf55
1dbe2f5d-677f-4cfc-9974-3fb1bd01124c	LOSE	Powyżej 5,5	Gole Powyżej/Poniżej	3486341667	FOOTBALL	2023-06-10	Manchester City - Inter Mediolan	ENDED	Liga Mistrzów	14.00	PREMATCH	5d8f880c-cf3f-4184-944a-fa806792a5d3
67b341ce-e344-4009-9ec7-0c2ae277b55d	LOSE	Ilkay Gündogan	Strzelec 2 lub więcej goli	3494572285	FOOTBALL	2023-06-10	Manchester City - Inter Mediolan	ENDED	Liga Mistrzów	27.00	PREMATCH	485c34e1-6767-46c4-b569-abfcd3218d3f
8b36b332-4695-4b0d-a571-e28334d99a6a	LOSE	Kevin De Bruyne	Strzelec	3494569375	FOOTBALL	2023-06-10	Manchester City - Inter Mediolan	ENDED	Liga Mistrzów	4.20	PREMATCH	722f6722-2948-46bf-87d9-3553bd30c0a4
19cb818c-3eee-436d-ae3d-2b8d58867ce2	LOSE	Iga Świątek wygra i obaj zawodnicy wygrają seta	Zwycięzca meczu & obaj zawodnicy wygrają seta	3497461187	TENNIS	2023-06-08	Iga Świątek - Beatriz Haddad Maia	ENDED	French Open K.	4.40	LIVE	4b0b38a5-efe6-4fc6-9e08-b2faeaa206f7
1021927d-38a4-44b7-bfa9-bea2022ceb7f	LOSE	Mamed Khalidov przez poddanie	Metoda zwycięstwa	3491669498	OTHER	2023-06-03	Mamed Khalidov - Scott Askham	ENDED	KSW	7.00	PREMATCH	67a09296-acda-41ee-9b26-7a5ab034bdcb
803283ac-939b-43b8-ba87-90805c596fa2	LOSE	Tak	Super Kursy	3495326061	OTHER	2023-06-03	M. Pudzianowski wygra walkę w 1. rundzie (vs A. Szpilka)	ENDED	Super Kursy	2.30	PREMATCH	2e2d5c8c-c820-48bf-a646-0ad2acf2e1a5
5599ab8f-5e8f-49e7-9027-1530dfb7ca8e	WIN	Arkadiusz Wrzosek	Zwycięzca walki	3491668383	OTHER	2023-06-03	Arkadiusz Wrzosek - Bogdan Stoica	ENDED	KSW	1.30	PREMATCH	79d411eb-5510-4f63-ba9a-e76154e3d540
8026f5bb-c833-4adf-a829-cf0496c7713a	WIN	Mamed Khalidov	Zwycięzca walki	3491669491	OTHER	2023-06-03	Mamed Khalidov - Scott Askham	ENDED	KSW	1.60	PREMATCH	79d411eb-5510-4f63-ba9a-e76154e3d540
48b7ba7b-e822-4a42-8292-069193c5080a	LOSE	Mariusz Pudzianowski	Zwycięzca walki	3491669323	OTHER	2023-06-03	Mariusz Pudzianowski - Artur Szpilka	ENDED	KSW	1.48	PREMATCH	79d411eb-5510-4f63-ba9a-e76154e3d540
798e71d0-61a9-4e71-a2ef-1d05b96c74d6	WIN	Michał Materla	Zwycięzca walki	3491663471	OTHER	2023-06-03	Michał Materla - Radosław Paczuski	ENDED	KSW	2.80	PREMATCH	d46093ac-6610-429f-820d-bb03da4f0a0f
fe45fb01-a431-4fb1-a557-60d96ed8f1a0	LOSE	F. Lindgren	Zwycięzca zawodów	3495313755	MOTORSPORT	2023-06-03	GP Czech	ENDED	GP Czech	6.75	LIVE	15e479e7-0526-40f7-bb7c-4af2c452301b
9e1c5cc4-925c-4392-80bd-13603784af1a	LOSE	Bruno Fernandes	Strzelec 2 lub więcej goli	3492972947	FOOTBALL	2023-06-03	Manchester City - Manchester United	ENDED	Anglia FA Cup	55.00	PREMATCH	f2f26fd0-6d28-48cb-b6ee-5c2fd271a085
c4009ba0-1a35-4823-b353-1032197a37d5	LOSE	Manchester United / Manchester United	Wynik Meczu Połowa / Cały	3470488299	FOOTBALL	2023-06-03	Manchester City - Manchester United	ENDED	Anglia FA Cup	9.00	PREMATCH	1800cf34-cdfd-4183-9ea1-5bcd6c6b897c
056a347b-9cb0-4bf6-8527-0c610db9d5d4	LOSE	Casemiro	Strzelec 2 lub więcej goli	3492972944	FOOTBALL	2023-06-03	Manchester City - Manchester United	ENDED	Anglia FA Cup	125.00	PREMATCH	e746e282-9d03-485f-8535-fdfe835734dc
1f7034ed-fba3-42e9-b0fe-f2300fac1418	LOSE	Powyżej 5,5	Gole Powyżej/Poniżej	3470487982	FOOTBALL	2023-06-03	Manchester City - Manchester United	ENDED	Anglia FA Cup	13.00	PREMATCH	0ebd8dfa-6029-40f7-bf91-8bf0afcff66c
8d1a0223-b206-4754-84e8-4a607010eacc	LOSE	Raphael Varane	Strzelec	3492835613	FOOTBALL	2023-06-03	Manchester City - Manchester United	ENDED	Anglia FA Cup	35.00	PREMATCH	47b673b1-dcad-433d-9725-307588dfff2f
9ac5c5e5-088c-45d8-ad22-72df8ee45a40	WIN	Bruno Fernandes	Strzelec	3492835617	FOOTBALL	2023-06-03	Manchester City - Manchester United	ENDED	Anglia FA Cup	6.20	PREMATCH	234d82dc-e1b1-4720-b9af-e0977d230812
51e87987-abed-4ab2-b78b-dd3394ac040e	LOSE	2 - 1	Wynik w setach	3494655702	TENNIS	2023-06-03	Iga Świątek - Xin Yu Wang	ENDED	French Open K.	6.60	PREMATCH	a8479388-52c7-4f0f-ad0a-40c148d21485
9614a8a5-193b-499a-adfc-c6e5e9b1916c	WIN	Granit Xhaka	Pierwszy strzelec	3488913481	FOOTBALL	2023-05-28	Arsenal - Wolverhampton	ENDED	Premier League	14.00	PREMATCH	19a0bfd6-6029-456d-89ca-31e542f787d3
180e174b-7f0b-4bdb-8183-f7ded5d330bc	WIN	Granit Xhaka	Strzelec	3488913589	FOOTBALL	2023-05-28	Arsenal - Wolverhampton	ENDED	Premier League	4.60	PREMATCH	0a1c01c3-cffc-4738-9ec7-4fc8e850c00d
19017f06-b417-4db1-9df8-c82c08c024a5	LOSE	Monza	Wynik meczu (z wyłączeniem dogrywki)	3485202491	FOOTBALL	2023-05-28	Monza - Lecce	ENDED	Serie A	2.37	PREMATCH	21f83285-6f74-4882-a7bc-2ec633606056
2c7dd54d-5ed5-4c48-8a41-f07b03437d57	LOSE	Juventus	Wynik meczu (z wyłączeniem dogrywki)	3485201843	FOOTBALL	2023-05-28	Juventus - AC Milan	ENDED	Serie A	2.49	PREMATCH	21f83285-6f74-4882-a7bc-2ec633606056
c170a334-eff6-4e25-b706-6faf739adf3e	LOSE	Wisła Kraków -1	Handicap	3488401357	FOOTBALL	2023-05-28	Wisła Kraków - Zagłębie Sosnowiec	ENDED	Polska 1. liga	1.73	PREMATCH	21f83285-6f74-4882-a7bc-2ec633606056
69f20d7a-9cc3-44dd-aa20-674d8fed9fcf	WIN	Arsenal -1	Handicap	3488238729	FOOTBALL	2023-05-28	Arsenal - Wolverhampton	ENDED	Premier League	1.88	PREMATCH	21f83285-6f74-4882-a7bc-2ec633606056
0f78f2de-92fb-402c-a528-24c4f23f4141	LOSE	Lazio -1	Handicap	3485217869	FOOTBALL	2023-05-28	Lazio - Cremonese	ENDED	Serie A	1.69	PREMATCH	21f83285-6f74-4882-a7bc-2ec633606056
17157d22-50df-4657-8738-8600de34a365	WIN	Powyżej 2,5	Gole Powyżej/Poniżej	3488367211	FOOTBALL	2023-05-28	AZ - PSV Eindhoven	ENDED	Holandia Eredivisie	1.58	PREMATCH	21f83285-6f74-4882-a7bc-2ec633606056
767987d4-c16b-43c6-8524-86816f23e1ed	WIN	Powyżej 2,5	Gole Powyżej/Poniżej	3488367211	FOOTBALL	2023-05-28	AZ - PSV Eindhoven	ENDED	Holandia Eredivisie	1.58	PREMATCH	f7f01488-a5e5-48f9-8585-f2be792b98e5
23295d9b-40eb-4b35-a58c-7a16be10a4a1	WIN	Manchester United / Tak	Wynik meczu/Obie drużyny zdobędą bramki	3488237653	FOOTBALL	2023-05-28	Manchester United - Fulham	ENDED	Premier League	2.70	PREMATCH	f7f01488-a5e5-48f9-8585-f2be792b98e5
d2ad8eef-09ee-493d-b450-3335cb0d2b73	WIN	Tak	Oba zespoły strzelą gola	3488236992	FOOTBALL	2023-05-28	Chelsea - Newcastle	ENDED	Premier League	1.51	PREMATCH	f7f01488-a5e5-48f9-8585-f2be792b98e5
70d9f7da-ce59-4b7c-8727-c58c20eb98de	LOSE	Juventus	Wynik meczu (z wyłączeniem dogrywki)	3485201843	FOOTBALL	2023-05-28	Juventus - AC Milan	ENDED	Serie A	2.49	PREMATCH	f7f01488-a5e5-48f9-8585-f2be792b98e5
d2c13ff2-597f-4f31-b813-02d2ed83cae0	WIN	Arsenal -1	Handicap	3488238729	FOOTBALL	2023-05-28	Arsenal - Wolverhampton	ENDED	Premier League	1.88	PREMATCH	f7f01488-a5e5-48f9-8585-f2be792b98e5
076a197c-7823-4fc0-ba5e-f0dd5e189307	LOSE	Monza	Wynik meczu (z wyłączeniem dogrywki)	3485202491	FOOTBALL	2023-05-28	Monza - Lecce	ENDED	Serie A	2.37	PREMATCH	f7f01488-a5e5-48f9-8585-f2be792b98e5
2b6a6611-9ca4-4856-a9cd-beae1f291dcb	LOSE	Lazio -1	Handicap	3485217869	FOOTBALL	2023-05-28	Lazio - Cremonese	ENDED	Serie A	1.69	PREMATCH	f7f01488-a5e5-48f9-8585-f2be792b98e5
4a3f262b-dc1a-4f2d-bdbb-9e50017b1b7c	LOSE	Wisła Kraków -1	Handicap	3488401357	FOOTBALL	2023-05-28	Wisła Kraków - Zagłębie Sosnowiec	ENDED	Polska 1. liga	1.73	PREMATCH	f7f01488-a5e5-48f9-8585-f2be792b98e5
425dbf45-5959-47a1-9618-befe0dd24bf1	WIN	Termalica Bruk-Bet Nieciecza	Wynik meczu (z wyłączeniem dogrywki)	3488268922	FOOTBALL	2023-05-27	Resovia Rzeszów - Termalica Bruk-Bet Nieciecza	ENDED	Polska 1. liga	1.65	LIVE	1d33262b-db82-4ee6-89e5-89e3dd5bb6ac
9f9ed1ea-f89a-4173-bfa5-40198594966c	WIN	Rennes	Wynik meczu (z wyłączeniem dogrywki)	3484783116	FOOTBALL	2023-05-27	Rennes - Monaco	ENDED	Ligue 1	1.94	PREMATCH	1d33262b-db82-4ee6-89e5-89e3dd5bb6ac
b50e1ddf-2f0c-49b3-8adf-8f0efb79592c	LOSE	Sparta Praga	Wynik meczu (z wyłączeniem dogrywki)	3489803751	FOOTBALL	2023-05-27	Sparta Praga - Viktoria Plzen	ENDED	Czechy 1. liga	1.72	PREMATCH	1d33262b-db82-4ee6-89e5-89e3dd5bb6ac
75c895f7-2fa4-4dc0-abc5-98e8cd4091ce	WIN	Pogoń Szczecin	Wynik meczu (z wyłączeniem dogrywki)	3488396807	FOOTBALL	2023-05-27	Pogoń Szczecin - RKS Radomiak	ENDED	Ekstraklasa	1.62	PREMATCH	1d33262b-db82-4ee6-89e5-89e3dd5bb6ac
c3f9d5ad-ba79-48df-b711-10b3967a0b47	WIN	Lech Poznań	Wynik meczu (z wyłączeniem dogrywki)	3487755495	FOOTBALL	2023-05-27	Lech Poznań - Jagiellonia Białystok	ENDED	Ekstraklasa	1.31	PREMATCH	1d33262b-db82-4ee6-89e5-89e3dd5bb6ac
59419193-9f8a-4e5f-98d2-bd0c6439458a	LOSE	Wolfsburg	Wynik meczu (z wyłączeniem dogrywki)	3486270785	FOOTBALL	2023-05-27	Wolfsburg - Hertha Berlin	ENDED	Bundesliga	1.24	PREMATCH	1d33262b-db82-4ee6-89e5-89e3dd5bb6ac
5501182e-ba88-483a-9307-35eb7dec6bbe	WIN	Termalica Bruk-Bet Nieciecza	Wynik meczu (z wyłączeniem dogrywki)	3488268922	FOOTBALL	2023-05-27	Resovia Rzeszów - Termalica Bruk-Bet Nieciecza	ENDED	Polska 1. liga	1.70	LIVE	3ffc6145-bf51-4862-8d75-ceb615af6051
11981963-1ba0-4755-b9d7-8db7d4d12faa	WIN	Lech Poznań	Wynik meczu (z wyłączeniem dogrywki)	3487755495	FOOTBALL	2023-05-27	Lech Poznań - Jagiellonia Białystok	ENDED	Ekstraklasa	1.31	PREMATCH	3ffc6145-bf51-4862-8d75-ceb615af6051
163f69c3-6905-4a79-851e-21382668c657	LOSE	Wolfsburg	Wynik meczu (z wyłączeniem dogrywki)	3486270785	FOOTBALL	2023-05-27	Wolfsburg - Hertha Berlin	ENDED	Bundesliga	1.24	PREMATCH	3ffc6145-bf51-4862-8d75-ceb615af6051
e12ec1aa-4ac1-4af1-9d1f-9af69ab37466	LOSE	Sparta Praga	Wynik meczu (z wyłączeniem dogrywki)	3489803751	FOOTBALL	2023-05-27	Sparta Praga - Viktoria Plzen	ENDED	Czechy 1. liga	1.72	PREMATCH	3ffc6145-bf51-4862-8d75-ceb615af6051
81f5b201-d5df-41ba-8068-08ba10acf06f	WIN	Rennes	Wynik meczu (z wyłączeniem dogrywki)	3484783116	FOOTBALL	2023-05-27	Rennes - Monaco	ENDED	Ligue 1	1.94	PREMATCH	3ffc6145-bf51-4862-8d75-ceb615af6051
16d9d7cb-3e59-4884-8099-4feeefe2e928	WIN	Pogoń Szczecin	Wynik meczu (z wyłączeniem dogrywki)	3488396807	FOOTBALL	2023-05-27	Pogoń Szczecin - RKS Radomiak	ENDED	Ekstraklasa	1.62	PREMATCH	3ffc6145-bf51-4862-8d75-ceb615af6051
27fc4529-ffc4-45af-ad26-0221632828fb	LOSE	Sevilla	Wynik meczu (z wyłączeniem dogrywki)	3488783282	FOOTBALL	2023-05-27	Sevilla - Real Madryt	ENDED	La Liga	2.90	PREMATCH	3ffc6145-bf51-4862-8d75-ceb615af6051
9c950ebd-ade1-4243-a8bf-b7ed3debd6e1	LOSE	Freiburg	Wynik meczu (z wyłączeniem dogrywki)	3486271256	FOOTBALL	2023-05-27	Eintracht Frankfurt - Freiburg	ENDED	Bundesliga	3.10	PREMATCH	3ffc6145-bf51-4862-8d75-ceb615af6051
92f65df5-e68b-4d4a-8d90-0596f3180da5	LOSE	Atalanta	Wynik meczu (z wyłączeniem dogrywki)	3485202510	FOOTBALL	2023-05-27	Inter Mediolan - Atalanta	ENDED	Serie A	4.00	PREMATCH	3ffc6145-bf51-4862-8d75-ceb615af6051
9d1b8cc3-c202-4f73-805a-41df0e0f7819	LOSE	Senegal U20	Wynik meczu (z wyłączeniem dogrywki)	3488818742	FOOTBALL	2023-05-24	Senegal U20 - Izrael U20	ENDED	MŚ U20	1.84	PREMATCH	65c818c7-7b68-4f94-a57b-0df422dfe355
ba0cda07-650c-4b18-b10f-dc2b5dda4e5e	WIN	Nigeria U20	Wynik meczu (z wyłączeniem dogrywki)	3488818880	FOOTBALL	2023-05-24	Włochy U20 - Nigeria U20	ENDED	MŚ U20	5.20	PREMATCH	65c818c7-7b68-4f94-a57b-0df422dfe355
27616542-9214-4172-b99c-56ac4c12fd26	WIN	Rennes	Wynik meczu (z wyłączeniem dogrywki)	3479459732	FOOTBALL	2023-05-21	Ajaccio - Rennes	ENDED	Ligue 1	1.42	PREMATCH	9abbdd60-79ac-44b7-9591-d2d06ab7e5b2
49d57b53-5981-455e-a88a-4c6d6d47cbc8	WIN	Sparta Rotterdam	Wynik meczu (z wyłączeniem dogrywki)	3480231525	FOOTBALL	2023-05-21	Sparta Rotterdam - Cambuur Leeuwarden	ENDED	Holandia Eredivisie	1.38	PREMATCH	9abbdd60-79ac-44b7-9591-d2d06ab7e5b2
83cf22ba-86eb-4cdb-bb17-c1d73d0e633c	WIN	Borussia Dortmund	Wynik meczu (z wyłączeniem dogrywki)	3479210153	FOOTBALL	2023-05-21	Augsburg - Borussia Dortmund	ENDED	Bundesliga	1.43	PREMATCH	9abbdd60-79ac-44b7-9591-d2d06ab7e5b2
868c77d6-31fa-49d9-991b-a26b82a79b01	LOSE	Bayer Leverkusen	Wynik meczu (z wyłączeniem dogrywki)	3479211053	FOOTBALL	2023-05-21	Bayer Leverkusen - Borussia M'gladbach	ENDED	Bundesliga	1.32	PREMATCH	9abbdd60-79ac-44b7-9591-d2d06ab7e5b2
7e8d7ca6-7ad5-4901-9302-3baaaac6c3b3	WIN	Paris Saint-Germain	Wynik meczu (z wyłączeniem dogrywki)	3479459784	FOOTBALL	2023-05-21	Auxerre - Paris Saint-Germain	ENDED	Ligue 1	1.31	PREMATCH	9abbdd60-79ac-44b7-9591-d2d06ab7e5b2
15a5c28f-b089-4803-ae69-bac5d53c276f	WIN	Borussia Dortmund	Wynik meczu (z wyłączeniem dogrywki)	3479210153	FOOTBALL	2023-05-21	Augsburg - Borussia Dortmund	ENDED	Bundesliga	1.43	PREMATCH	4c6f32c0-fc94-44ef-a0cb-ffe15a43f782
13e711df-83b0-412d-9f2a-d7836a80599e	WIN	Sparta Rotterdam	Wynik meczu (z wyłączeniem dogrywki)	3480231525	FOOTBALL	2023-05-21	Sparta Rotterdam - Cambuur Leeuwarden	ENDED	Holandia Eredivisie	1.38	PREMATCH	4c6f32c0-fc94-44ef-a0cb-ffe15a43f782
dacba662-cf98-4452-a15d-4e52b934e61e	WIN	Paris Saint-Germain	Wynik meczu (z wyłączeniem dogrywki)	3479459784	FOOTBALL	2023-05-21	Auxerre - Paris Saint-Germain	ENDED	Ligue 1	1.31	PREMATCH	4c6f32c0-fc94-44ef-a0cb-ffe15a43f782
7f2c771e-c85c-430e-af4e-76429f8db3a1	WIN	Rennes	Wynik meczu (z wyłączeniem dogrywki)	3479459732	FOOTBALL	2023-05-21	Ajaccio - Rennes	ENDED	Ligue 1	1.42	PREMATCH	4c6f32c0-fc94-44ef-a0cb-ffe15a43f782
74f03d98-12fc-4e0b-b1f1-0427598fc8ad	WIN	Śląsk Wrocław	Wynik meczu (z wyłączeniem dogrywki)	3480022007	FOOTBALL	2023-05-21	Śląsk Wrocław - Miedź Legnica	ENDED	Ekstraklasa	1.75	LIVE	4c6f32c0-fc94-44ef-a0cb-ffe15a43f782
b08a1feb-0ec9-456b-b928-bbe78c8190fd	LOSE	Bayer Leverkusen	Wynik meczu (z wyłączeniem dogrywki)	3479211053	FOOTBALL	2023-05-21	Bayer Leverkusen - Borussia M'gladbach	ENDED	Bundesliga	1.32	PREMATCH	4c6f32c0-fc94-44ef-a0cb-ffe15a43f782
4c1b0157-6aab-4e27-848d-149af9cafe32	LOSE	BetMaker	BetMaker	145982606	FOOTBALL	2023-05-17	Manchester City - Real Madryt	ENDED	Liga Mistrzów	31.45	PREMATCH	8c3fd287-3f77-45d3-be07-e2452ef4db58
9b3ddab1-05f4-4bed-b764-c3cdd3b5489c	LOSE	BetMaker	BetMaker	145982190	FOOTBALL	2023-05-17	Manchester City - Real Madryt	ENDED	Liga Mistrzów	30.30	PREMATCH	3d72f151-e199-4abf-b278-53a32a3f1e7e
327452a7-f99a-4ff9-849a-0753bb6cfd2a	LOSE	Remis	Wynik meczu (z wyłączeniem dogrywki)	3481337470	FOOTBALL	2023-05-17	Manchester City - Real Madryt	ENDED	Liga Mistrzów	17.00	LIVE	a5a40902-3c2b-4e69-9bb7-45ccd0c8e994
dfa9d6d9-b1f5-4981-b751-7ca6b0db52f5	LOSE	Powyżej 5,5	Gole Powyżej/Poniżej	3481410517	FOOTBALL	2023-05-17	Manchester City - Real Madryt	ENDED	Liga Mistrzów	8.40	PREMATCH	1570e08b-6e1b-4f59-8d7a-6c673a70e4c2
f6109d21-30bc-4db6-9aef-da124f13430b	LOSE	Real Madryt	Wynik meczu (z wyłączeniem dogrywki)	3481337471	FOOTBALL	2023-05-17	Manchester City - Real Madryt	ENDED	Liga Mistrzów	75.00	LIVE	d0a8c52e-3cf3-471d-a62e-9c1f5ecfe39f
f2669671-a15d-4f38-906b-9fab7ccd0114	WIN	Manchester City -2	Handicap	3481411429	FOOTBALL	2023-05-17	Manchester City - Real Madryt	ENDED	Liga Mistrzów	4.40	PREMATCH	996ae4b7-fc9b-4372-8f9f-8974075e2d2b
fcfbabdb-d3d8-4ff2-836a-6cfa715d33ec	LOSE	0 - 0	Dokładny wynik	3481410844	FOOTBALL	2023-05-17	Manchester City - Real Madryt	ENDED	Liga Mistrzów	19.00	PREMATCH	ff331fcf-a214-4f00-b558-db1bdd481275
939ccbfd-bad7-4391-9a9c-d1f45d997e03	LOSE	Warta Poznań	Wynik meczu (z wyłączeniem dogrywki)	3475681830	FOOTBALL	2023-05-15	Warta Poznań - RKS Radomiak	ENDED	Ekstraklasa	2.75	PREMATCH	1dd515f7-d5bd-4e20-8994-2a9ea00dc042
57e97c29-d613-4997-9eb2-a0a1dbc625ee	WIN	Liverpool i powyżej 2.5	Wynik i gole	3474863809	FOOTBALL	2023-05-15	Leicester - Liverpool	ENDED	Premier League	2.08	PREMATCH	1dd515f7-d5bd-4e20-8994-2a9ea00dc042
40cc9115-031d-4eec-b735-47d321482592	LOSE	Malcolm Brogdon	Zawodnik zdobędzie 25 lub więcej punktów	3482982306	BASKETBALL	2023-05-14	Boston Celtics - Philadelphia 76ers	ENDED	NBA	9.75	PREMATCH	b0369e2f-c270-4468-bf73-aaef71328153
215d5afb-9bd6-4bd5-ae0b-0ff5ec4f2cd4	LOSE	Joel Embiid	Zawodnik zdobędzie 40 lub więcej punktów	3482982094	BASKETBALL	2023-05-14	Boston Celtics - Philadelphia 76ers	ENDED	NBA	7.25	PREMATCH	13e2791e-637c-4551-af70-ff098e8d8692
741f6127-ca9b-4a55-86c3-e438473b944e	LOSE	James Harden	Zawodnik zdobędzie 30 lub więcej punktów	3482982282	BASKETBALL	2023-05-14	Boston Celtics - Philadelphia 76ers	ENDED	NBA	6.25	PREMATCH	1f7182f1-9e56-4a65-a8bd-eba4807e49ba
a6a58413-e79e-46fd-9740-de3eb1f6a299	LOSE	Tyrese Maxey	Zawodnik zdobędzie 30 lub więcej punktów	3482982296	BASKETBALL	2023-05-14	Boston Celtics - Philadelphia 76ers	ENDED	NBA	6.50	PREMATCH	bde03468-8efa-4fd8-97f6-e7c6f7dd4bda
3602c94e-83d0-43c3-a397-55e76e179a43	LOSE	Powyżej 210.5	Suma punktów	3482607612	BASKETBALL	2023-05-14	Boston Celtics - Philadelphia 76ers	ENDED	NBA	3.20	PREMATCH	d050edad-df64-4a27-a98c-14b79b01dd64
75141096-33a8-45a6-a492-9785c7d717a9	LOSE	Philadelphia 76ers / Boston Celtics	Połowa / Cały	3482607691	BASKETBALL	2023-05-14	Boston Celtics - Philadelphia 76ers	ENDED	NBA	7.00	PREMATCH	e2209a51-0b3b-4e01-9136-ad9b75ab7805
82858596-cddf-4197-beab-19a8925c8015	WIN	Jayson Tatum	Zawodnik zdobędzie 40 lub więcej punktów	3482982093	BASKETBALL	2023-05-14	Boston Celtics - Philadelphia 76ers	ENDED	NBA	6.75	PREMATCH	92c0b8d7-08bf-4caa-8198-c68f7ccb1fa8
d9f48095-1ebc-4f2d-a863-4509574c9d49	WIN	Feyenoord	Wynik meczu (z wyłączeniem dogrywki)	3479779168	FOOTBALL	2023-05-14	Feyenoord - Go Ahead Eagles	ENDED	Holandia Eredivisie	1.17	PREMATCH	80474109-24ff-4f33-ad62-56b49d6227ce
488f179c-9e01-4c82-8dfa-9412d34a4d1b	WIN	RB Leipzig	Wynik meczu (z wyłączeniem dogrywki)	3474840899	FOOTBALL	2023-05-14	RB Leipzig - Werder	ENDED	Bundesliga	1.24	PREMATCH	80474109-24ff-4f33-ad62-56b49d6227ce
506c3b11-6949-432c-9971-d36745292ff8	OTHER	Ajax	Wynik meczu (z wyłączeniem dogrywki)	3479781039	FOOTBALL	2023-05-14	Groningen - Ajax	ENDED	Holandia Eredivisie	1.23	PREMATCH	80474109-24ff-4f33-ad62-56b49d6227ce
68a72794-6409-42c6-b405-1591928f8a9b	LOSE	Arsenal	Wynik meczu (z wyłączeniem dogrywki)	3474864169	FOOTBALL	2023-05-14	Arsenal - Brighton	ENDED	Premier League	1.81	PREMATCH	80474109-24ff-4f33-ad62-56b49d6227ce
925cac7b-d74f-4895-af6e-4e2412bed7ff	WIN	Rennes	Wynik meczu (z wyłączeniem dogrywki)	3474898449	FOOTBALL	2023-05-14	Rennes - Troyes	ENDED	Ligue 1	1.21	PREMATCH	80474109-24ff-4f33-ad62-56b49d6227ce
89fe40ed-e3e1-47a7-9861-71c7a276d02f	WIN	Pogoń Szczecin	Wynik meczu (z wyłączeniem dogrywki)	3475675292	FOOTBALL	2023-05-14	Pogoń Szczecin - Miedź Legnica	ENDED	Ekstraklasa	1.40	PREMATCH	80474109-24ff-4f33-ad62-56b49d6227ce
1654f387-738b-4dc4-b5a9-ab56e25e822b	WIN	Sporting Braga	Wynik meczu (z wyłączeniem dogrywki)	3477814992	FOOTBALL	2023-05-14	Sporting Braga - Santa Clara	ENDED	Portugalia Primeira Liga	1.22	PREMATCH	80474109-24ff-4f33-ad62-56b49d6227ce
11e64ab9-3120-4547-9f8b-2fb31337b6f1	WIN	AZ	Wynik meczu (z wyłączeniem dogrywki)	3479705247	FOOTBALL	2023-05-14	AZ - Emmen	ENDED	Holandia Eredivisie	1.35	PREMATCH	80474109-24ff-4f33-ad62-56b49d6227ce
b1d0383d-9af1-45d8-b11f-7d8428ea6a0a	WIN	Juventus	Wynik meczu (z wyłączeniem dogrywki)	3477393597	FOOTBALL	2023-05-14	Juventus - Cremonese	ENDED	Serie A	1.44	PREMATCH	80474109-24ff-4f33-ad62-56b49d6227ce
d8d4ff03-2b32-497d-a29b-55d53d244988	WIN	Marsylia	Wynik meczu (z wyłączeniem dogrywki)	3474612286	FOOTBALL	2023-05-14	Marsylia - Angers	ENDED	Ligue 1	1.18	PREMATCH	80474109-24ff-4f33-ad62-56b49d6227ce
87fc334c-14bf-46a9-b7ed-72fc714dd01d	WIN	Sporting Braga	Wynik meczu (z wyłączeniem dogrywki)	3477814992	FOOTBALL	2023-05-14	Sporting Braga - Santa Clara	ENDED	Portugalia Primeira Liga	1.22	PREMATCH	1a8bd5f4-04e2-43cc-92ec-24e8ba7f0f81
0692a0af-1a1b-4218-8aea-66912476979e	WIN	Pogoń Szczecin	Wynik meczu (z wyłączeniem dogrywki)	3475675292	FOOTBALL	2023-05-14	Pogoń Szczecin - Miedź Legnica	ENDED	Ekstraklasa	1.39	PREMATCH	1a8bd5f4-04e2-43cc-92ec-24e8ba7f0f81
1cd0c25d-383b-4efc-8c6c-4faf7b07a9e9	WIN	Fiorentina	Wynik meczu (z wyłączeniem dogrywki)	3477015621	FOOTBALL	2023-05-14	Fiorentina - Udinese	ENDED	Serie A	1.88	PREMATCH	1a8bd5f4-04e2-43cc-92ec-24e8ba7f0f81
51fd2e13-8837-46e2-abba-2127275bb79a	WIN	Marsylia -1	Handicap	3474614907	FOOTBALL	2023-05-14	Marsylia - Angers	ENDED	Ligue 1	1.53	PREMATCH	1a8bd5f4-04e2-43cc-92ec-24e8ba7f0f81
dd450bdd-f861-4901-b32a-78c047b99f2c	WIN	Feyenoord -1	Handicap	3479779601	FOOTBALL	2023-05-14	Feyenoord - Go Ahead Eagles	ENDED	Holandia Eredivisie	1.44	PREMATCH	1a8bd5f4-04e2-43cc-92ec-24e8ba7f0f81
4698a58e-529e-44b8-91da-19fb1816c1e0	WIN	AZ	Wynik meczu (z wyłączeniem dogrywki)	3479705247	FOOTBALL	2023-05-14	AZ - Emmen	ENDED	Holandia Eredivisie	1.36	PREMATCH	1a8bd5f4-04e2-43cc-92ec-24e8ba7f0f81
49e8092b-3f2d-4409-8506-7f6655f7cdf6	WIN	Rennes	Wynik meczu (z wyłączeniem dogrywki)	3474898449	FOOTBALL	2023-05-14	Rennes - Troyes	ENDED	Ligue 1	1.21	PREMATCH	1a8bd5f4-04e2-43cc-92ec-24e8ba7f0f81
99979720-778e-4526-b7f0-95b0d25a4a59	WIN	RB Leipzig	Wynik meczu (z wyłączeniem dogrywki)	3474840899	FOOTBALL	2023-05-14	RB Leipzig - Werder	ENDED	Bundesliga	1.23	PREMATCH	1a8bd5f4-04e2-43cc-92ec-24e8ba7f0f81
30cd2fd0-8d87-4ad3-a740-5ba56746b3a7	WIN	Brentford	Wynik meczu (z wyłączeniem dogrywki)	3474864452	FOOTBALL	2023-05-14	Brentford - West Ham	ENDED	Premier League	1.90	PREMATCH	1a8bd5f4-04e2-43cc-92ec-24e8ba7f0f81
967fc7c2-dd6b-4882-8c6a-58b1db174ff7	LOSE	Arsenal i powyżej 2.5	Wynik i gole	3474866552	FOOTBALL	2023-05-14	Arsenal - Brighton	ENDED	Premier League	2.17	PREMATCH	1a8bd5f4-04e2-43cc-92ec-24e8ba7f0f81
985cfc76-c447-4c47-a83e-fa44eb679df0	WIN	Juventus	Wynik meczu (z wyłączeniem dogrywki)	3477393597	FOOTBALL	2023-05-14	Juventus - Cremonese	ENDED	Serie A	1.44	PREMATCH	1a8bd5f4-04e2-43cc-92ec-24e8ba7f0f81
fb8d4155-cfad-4914-bbd3-d0286afffc9a	OTHER	Ajax	Wynik meczu (z wyłączeniem dogrywki)	3479781039	FOOTBALL	2023-05-14	Groningen - Ajax	ENDED	Holandia Eredivisie	1.22	PREMATCH	1a8bd5f4-04e2-43cc-92ec-24e8ba7f0f81
65e156e9-1612-4cc3-83e0-cbe35cbf78a3	WIN	Feyenoord -1	Handicap	3479779601	FOOTBALL	2023-05-14	Feyenoord - Go Ahead Eagles	ENDED	Holandia Eredivisie	1.44	PREMATCH	99775ad0-d031-4597-8f3c-1df2645b8d54
0bccf6b6-6c94-435f-848b-ac5ce550133c	WIN	Rennes	Wynik meczu (z wyłączeniem dogrywki)	3474898449	FOOTBALL	2023-05-14	Rennes - Troyes	ENDED	Ligue 1	1.21	PREMATCH	99775ad0-d031-4597-8f3c-1df2645b8d54
e93876c1-46e6-4c5c-b0f3-6fc0c23fcec3	WIN	Fiorentina	Wynik meczu (z wyłączeniem dogrywki)	3477015621	FOOTBALL	2023-05-14	Fiorentina - Udinese	ENDED	Serie A	1.88	PREMATCH	99775ad0-d031-4597-8f3c-1df2645b8d54
68298416-6089-48d4-b240-2663217f886a	WIN	Pogoń Szczecin	Wynik meczu (z wyłączeniem dogrywki)	3475675292	FOOTBALL	2023-05-14	Pogoń Szczecin - Miedź Legnica	ENDED	Ekstraklasa	1.39	PREMATCH	99775ad0-d031-4597-8f3c-1df2645b8d54
e079ac4f-e8df-4251-b0b6-3cf109a1dc71	WIN	AZ	Wynik meczu (z wyłączeniem dogrywki)	3479705247	FOOTBALL	2023-05-14	AZ - Emmen	ENDED	Holandia Eredivisie	1.36	PREMATCH	99775ad0-d031-4597-8f3c-1df2645b8d54
219182d0-7304-4fd1-a5cc-0e6fca317f73	WIN	RB Leipzig	Wynik meczu (z wyłączeniem dogrywki)	3474840899	FOOTBALL	2023-05-14	RB Leipzig - Werder	ENDED	Bundesliga	1.23	PREMATCH	99775ad0-d031-4597-8f3c-1df2645b8d54
d7ef1867-9cd5-47a7-a616-62eb40b8e424	LOSE	Stal Mielec	Wynik meczu (z wyłączeniem dogrywki)	3475675346	FOOTBALL	2023-05-14	Stal Mielec - Lechia Gdańsk	ENDED	Ekstraklasa	2.12	PREMATCH	99775ad0-d031-4597-8f3c-1df2645b8d54
ddc9968a-df5b-4aeb-96df-d16e889d0008	OTHER	Ajax	Wynik meczu (z wyłączeniem dogrywki)	3479781039	FOOTBALL	2023-05-14	Groningen - Ajax	ENDED	Holandia Eredivisie	1.22	PREMATCH	99775ad0-d031-4597-8f3c-1df2645b8d54
c41196d4-212e-4032-93cc-7d36655c6a27	WIN	Juventus	Wynik meczu (z wyłączeniem dogrywki)	3477393597	FOOTBALL	2023-05-14	Juventus - Cremonese	ENDED	Serie A	1.44	PREMATCH	99775ad0-d031-4597-8f3c-1df2645b8d54
e3ffc0c5-d3c7-4cc2-9b4d-f5ad3db7e60e	LOSE	Arsenal i powyżej 2.5	Wynik i gole	3474866552	FOOTBALL	2023-05-14	Arsenal - Brighton	ENDED	Premier League	2.17	PREMATCH	99775ad0-d031-4597-8f3c-1df2645b8d54
cfa842a0-4a58-491f-9930-1b3d0bc7c3da	WIN	Sporting Braga	Wynik meczu (z wyłączeniem dogrywki)	3477814992	FOOTBALL	2023-05-14	Sporting Braga - Santa Clara	ENDED	Portugalia Primeira Liga	1.22	PREMATCH	99775ad0-d031-4597-8f3c-1df2645b8d54
dc62f8b4-9b85-4203-9a00-9973c25040d2	WIN	Brentford	Wynik meczu (z wyłączeniem dogrywki)	3474864452	FOOTBALL	2023-05-14	Brentford - West Ham	ENDED	Premier League	1.90	PREMATCH	99775ad0-d031-4597-8f3c-1df2645b8d54
004aee8e-c3d7-41b8-95eb-99b5116a5f37	WIN	Marsylia -1	Handicap	3474614907	FOOTBALL	2023-05-14	Marsylia - Angers	ENDED	Ligue 1	1.53	PREMATCH	99775ad0-d031-4597-8f3c-1df2645b8d54
567e32f9-e0d5-4cd9-b0c4-f89a0eb9278a	WIN	RB Leipzig	Wynik meczu (z wyłączeniem dogrywki)	3474840899	FOOTBALL	2023-05-14	RB Leipzig - Werder	ENDED	Bundesliga	1.23	PREMATCH	daa1df63-0c85-4ad6-a6f2-eb66b9f76a2a
49d363ce-3964-4f45-a59b-9c6871fdc1fe	WIN	Fiorentina	Wynik meczu (z wyłączeniem dogrywki)	3477015621	FOOTBALL	2023-05-14	Fiorentina - Udinese	ENDED	Serie A	1.88	PREMATCH	daa1df63-0c85-4ad6-a6f2-eb66b9f76a2a
64d2cb6b-218d-493b-8800-18073aba712a	WIN	Feyenoord -1	Handicap	3479779601	FOOTBALL	2023-05-14	Feyenoord - Go Ahead Eagles	ENDED	Holandia Eredivisie	1.44	PREMATCH	daa1df63-0c85-4ad6-a6f2-eb66b9f76a2a
02c0d6a2-ca62-4990-a936-3d266604d180	LOSE	Arsenal i powyżej 2.5	Wynik i gole	3474866552	FOOTBALL	2023-05-14	Arsenal - Brighton	ENDED	Premier League	2.17	PREMATCH	daa1df63-0c85-4ad6-a6f2-eb66b9f76a2a
cbe27afb-7f7b-4a3f-9596-314ea6fc88c8	OTHER	Ajax	Wynik meczu (z wyłączeniem dogrywki)	3479781039	FOOTBALL	2023-05-14	Groningen - Ajax	ENDED	Holandia Eredivisie	1.22	PREMATCH	daa1df63-0c85-4ad6-a6f2-eb66b9f76a2a
2b72677d-d5a1-4bd1-a19c-16d2c8482992	LOSE	Stal Mielec	Wynik meczu (z wyłączeniem dogrywki)	3475675346	FOOTBALL	2023-05-14	Stal Mielec - Lechia Gdańsk	ENDED	Ekstraklasa	2.12	PREMATCH	daa1df63-0c85-4ad6-a6f2-eb66b9f76a2a
a34865fd-780d-4239-aa30-694bcbe41716	WIN	Juventus	Wynik meczu (z wyłączeniem dogrywki)	3477393597	FOOTBALL	2023-05-14	Juventus - Cremonese	ENDED	Serie A	1.44	PREMATCH	daa1df63-0c85-4ad6-a6f2-eb66b9f76a2a
aad86cba-60c2-4ca8-8fde-8e59887e9539	WIN	Rennes	Wynik meczu (z wyłączeniem dogrywki)	3474898449	FOOTBALL	2023-05-14	Rennes - Troyes	ENDED	Ligue 1	1.21	PREMATCH	daa1df63-0c85-4ad6-a6f2-eb66b9f76a2a
28b88e62-10b2-4b1e-a618-931b8b5b2b06	WIN	Pogoń Szczecin	Wynik meczu (z wyłączeniem dogrywki)	3475675292	FOOTBALL	2023-05-14	Pogoń Szczecin - Miedź Legnica	ENDED	Ekstraklasa	1.39	PREMATCH	daa1df63-0c85-4ad6-a6f2-eb66b9f76a2a
16d32fac-ba75-4e53-a9ab-2d7570124437	WIN	AZ	Wynik meczu (z wyłączeniem dogrywki)	3479705247	FOOTBALL	2023-05-14	AZ - Emmen	ENDED	Holandia Eredivisie	1.36	PREMATCH	daa1df63-0c85-4ad6-a6f2-eb66b9f76a2a
9de12042-67a4-4b16-a671-dc6fd8cdb354	WIN	Sporting Braga	Wynik meczu (z wyłączeniem dogrywki)	3477814992	FOOTBALL	2023-05-14	Sporting Braga - Santa Clara	ENDED	Portugalia Primeira Liga	1.22	PREMATCH	daa1df63-0c85-4ad6-a6f2-eb66b9f76a2a
a8ef77a8-e0f4-4868-b2f5-3612dd062f77	WIN	Brentford	Wynik meczu (z wyłączeniem dogrywki)	3474864452	FOOTBALL	2023-05-14	Brentford - West Ham	ENDED	Premier League	1.90	PREMATCH	daa1df63-0c85-4ad6-a6f2-eb66b9f76a2a
d24b128c-97ef-493e-b77f-f06ad2fac500	WIN	Marsylia -1	Handicap	3474614907	FOOTBALL	2023-05-14	Marsylia - Angers	ENDED	Ligue 1	1.53	PREMATCH	daa1df63-0c85-4ad6-a6f2-eb66b9f76a2a
f8a3928b-e0c6-4e96-bf6a-a1ec834343a6	WIN	Juventus	Wynik meczu (z wyłączeniem dogrywki)	3477393597	FOOTBALL	2023-05-14	Juventus - Cremonese	ENDED	Serie A	1.44	PREMATCH	6cca865c-70cd-477d-bc44-d065532a4b81
75fd5fa6-1648-49f0-97b1-557f3b50441e	WIN	RB Leipzig	Wynik meczu (z wyłączeniem dogrywki)	3474840899	FOOTBALL	2023-05-14	RB Leipzig - Werder	ENDED	Bundesliga	1.24	PREMATCH	6cca865c-70cd-477d-bc44-d065532a4b81
5817329e-5a90-4081-a351-4c3b4a9413c5	WIN	Rennes	Wynik meczu (z wyłączeniem dogrywki)	3474898449	FOOTBALL	2023-05-14	Rennes - Troyes	ENDED	Ligue 1	1.21	PREMATCH	6cca865c-70cd-477d-bc44-d065532a4b81
558fbb81-51f7-4ac8-bd82-a984f534d9f6	WIN	Fiorentina	Wynik meczu (z wyłączeniem dogrywki)	3477015621	FOOTBALL	2023-05-14	Fiorentina - Udinese	ENDED	Serie A	1.97	PREMATCH	6cca865c-70cd-477d-bc44-d065532a4b81
fb6b1e5a-7f70-4b59-bde7-6c2d635bf3a7	WIN	Marsylia	Wynik meczu (z wyłączeniem dogrywki)	3474612286	FOOTBALL	2023-05-14	Marsylia - Angers	ENDED	Ligue 1	1.18	PREMATCH	6cca865c-70cd-477d-bc44-d065532a4b81
e087142a-4e09-4841-987b-c92e94f8fada	WIN	Brentford	Wynik meczu (z wyłączeniem dogrywki)	3474864452	FOOTBALL	2023-05-14	Brentford - West Ham	ENDED	Premier League	1.98	PREMATCH	6cca865c-70cd-477d-bc44-d065532a4b81
9ba66323-2548-4035-98fd-6d627400edfb	LOSE	Arsenal	Wynik meczu (z wyłączeniem dogrywki)	3474864169	FOOTBALL	2023-05-14	Arsenal - Brighton	ENDED	Premier League	1.81	PREMATCH	6cca865c-70cd-477d-bc44-d065532a4b81
aa63aa9a-73c8-48f7-b661-01fe67cc06bb	LOSE	Stal Mielec	Wynik meczu (z wyłączeniem dogrywki)	3475675346	FOOTBALL	2023-05-14	Stal Mielec - Lechia Gdańsk	ENDED	Ekstraklasa	2.08	PREMATCH	6cca865c-70cd-477d-bc44-d065532a4b81
65dfec24-0895-4b03-b145-345a70ba39b9	OTHER	Ajax	Wynik meczu (z wyłączeniem dogrywki)	3479781039	FOOTBALL	2023-05-14	Groningen - Ajax	ENDED	Holandia Eredivisie	1.23	PREMATCH	6cca865c-70cd-477d-bc44-d065532a4b81
2f05e150-46cb-4cba-bd86-136153acb86b	WIN	Sporting Braga	Wynik meczu (z wyłączeniem dogrywki)	3477814992	FOOTBALL	2023-05-14	Sporting Braga - Santa Clara	ENDED	Portugalia Primeira Liga	1.22	PREMATCH	6cca865c-70cd-477d-bc44-d065532a4b81
dbbcc087-7ae9-48d0-93a8-f4fda74cbc02	WIN	Pogoń Szczecin	Wynik meczu (z wyłączeniem dogrywki)	3475675292	FOOTBALL	2023-05-14	Pogoń Szczecin - Miedź Legnica	ENDED	Ekstraklasa	1.40	PREMATCH	6cca865c-70cd-477d-bc44-d065532a4b81
e0e558f3-6068-45df-993e-146ac8b3a213	WIN	AZ	Wynik meczu (z wyłączeniem dogrywki)	3479705247	FOOTBALL	2023-05-14	AZ - Emmen	ENDED	Holandia Eredivisie	1.35	PREMATCH	6cca865c-70cd-477d-bc44-d065532a4b81
d19f7e10-4777-4c49-80b3-c5bc4bc589af	WIN	Feyenoord	Wynik meczu (z wyłączeniem dogrywki)	3479779168	FOOTBALL	2023-05-14	Feyenoord - Go Ahead Eagles	ENDED	Holandia Eredivisie	1.17	PREMATCH	6cca865c-70cd-477d-bc44-d065532a4b81
8a81031d-d566-4801-861f-ee94fb78b0f1	LOSE	Chelsea	Wynik meczu (z wyłączeniem dogrywki)	3474872120	FOOTBALL	2023-05-13	Chelsea - Nottingham Forest	ENDED	Premier League	1.52	PREMATCH	9dd895c7-46dd-4452-8ddb-d8f854b52674
45ff486f-fd8f-4bfa-befb-d95c6e3ea696	WIN	Manchester United	Wynik meczu (z wyłączeniem dogrywki)	3474897854	FOOTBALL	2023-05-13	Manchester United - Wolverhampton	ENDED	Premier League	1.38	PREMATCH	9dd895c7-46dd-4452-8ddb-d8f854b52674
7b0cafaa-68fb-4e1e-a1c2-fd313fc94f72	WIN	Paris Saint-Germain -1	Handicap	3474861733	FOOTBALL	2023-05-13	Paris Saint-Germain - Ajaccio	ENDED	Ligue 1	1.40	PREMATCH	9dd895c7-46dd-4452-8ddb-d8f854b52674
9f0aced7-119f-4181-a186-b071be471b59	LOSE	Sporting Lizbona -1	Handicap	3477389392	FOOTBALL	2023-05-13	Sporting Lizbona - Maritimo	ENDED	Portugalia Primeira Liga	1.52	PREMATCH	9dd895c7-46dd-4452-8ddb-d8f854b52674
4c52b98f-225a-48b9-9a2c-13d6401d9faf	LOSE	Newcastle	Wynik meczu (z wyłączeniem dogrywki)	3474864041	FOOTBALL	2023-05-13	Leeds - Newcastle	ENDED	Premier League	1.61	PREMATCH	9dd895c7-46dd-4452-8ddb-d8f854b52674
c7e42ff4-291e-4d96-934e-c2f02ee4475a	WIN	Bayern Monachium -1	Handicap	3474845748	FOOTBALL	2023-05-13	Bayern Monachium - Schalke 04	ENDED	Bundesliga	1.40	PREMATCH	9dd895c7-46dd-4452-8ddb-d8f854b52674
3488431a-72fa-4106-be48-260cc98a2cf4	LOSE	Sporting Lizbona -1	Handicap	3477389392	FOOTBALL	2023-05-13	Sporting Lizbona - Maritimo	ENDED	Portugalia Primeira Liga	1.52	PREMATCH	8006a36b-53b8-4066-801f-2dbe2bff6904
9faa98b9-9eeb-4f7e-adae-8ddc9bf6c3a6	LOSE	Cercle Brugge	Wynik meczu (z wyłączeniem dogrywki)	3476292116	FOOTBALL	2023-05-13	Cercle Brugge - Gent	ENDED	Belgia 1. liga	2.75	PREMATCH	8006a36b-53b8-4066-801f-2dbe2bff6904
283a2f7b-1dcd-4bf4-b0c4-422fd1e6b83d	LOSE	Chelsea	Wynik meczu (z wyłączeniem dogrywki)	3474872120	FOOTBALL	2023-05-13	Chelsea - Nottingham Forest	ENDED	Premier League	1.52	PREMATCH	8006a36b-53b8-4066-801f-2dbe2bff6904
2f0c3961-e005-4df8-8877-fb58e9f865bf	WIN	Bayern Monachium -1	Handicap	3474845748	FOOTBALL	2023-05-13	Bayern Monachium - Schalke 04	ENDED	Bundesliga	1.41	PREMATCH	8006a36b-53b8-4066-801f-2dbe2bff6904
872503a5-6862-4b35-825c-1441ecd3e68e	WIN	Paris Saint-Germain -1	Handicap	3474861733	FOOTBALL	2023-05-13	Paris Saint-Germain - Ajaccio	ENDED	Ligue 1	1.40	PREMATCH	8006a36b-53b8-4066-801f-2dbe2bff6904
3873bd1d-fd5d-4664-9a07-1f65e8177acc	LOSE	Newcastle	Wynik meczu (z wyłączeniem dogrywki)	3474864041	FOOTBALL	2023-05-13	Leeds - Newcastle	ENDED	Premier League	1.61	PREMATCH	8006a36b-53b8-4066-801f-2dbe2bff6904
7dc879b1-ef21-4245-85b9-1b3220ff9f5d	WIN	Inter Mediolan	Wynik meczu (z wyłączeniem dogrywki)	3477011042	FOOTBALL	2023-05-13	Inter Mediolan - Sassuolo	ENDED	Serie A	1.44	PREMATCH	8006a36b-53b8-4066-801f-2dbe2bff6904
f264aa62-8a9f-4685-a2eb-49dada05afad	LOSE	Sparta Rotterdam	Wynik meczu (z wyłączeniem dogrywki)	3479242365	FOOTBALL	2023-05-13	Volendam - Sparta Rotterdam	ENDED	Holandia Eredivisie	2.49	PREMATCH	8006a36b-53b8-4066-801f-2dbe2bff6904
0d809423-8204-437c-bbb4-1ebc8d6ac0a4	WIN	Manchester United	Wynik meczu (z wyłączeniem dogrywki)	3474897854	FOOTBALL	2023-05-13	Manchester United - Wolverhampton	ENDED	Premier League	1.38	PREMATCH	8006a36b-53b8-4066-801f-2dbe2bff6904
2eaed93b-8479-43c4-a4d3-72f7b8a380ba	LOSE	Miami Heat -4.5	Wynik połowy handicap	3482128337	BASKETBALL	2023-05-12	Miami Heat - NY Knicks	ENDED	NBA	2.05	LIVE	5ccfb2fa-94bd-41e7-8650-a929c6f61c0d
5b21040c-7db4-4ecc-9945-29e40b340f45	WIN	Twente	Wynik meczu (z wyłączeniem dogrywki)	3478482005	FOOTBALL	2023-05-12	Twente - NEC Nijmegen	ENDED	Holandia Eredivisie	1.44	PREMATCH	a51c26d4-d88c-4e1c-9f35-17196c520c44
a3122880-95e8-49ef-a863-90abcde20309	WIN	Wisła Kraków	Wynik meczu (z wyłączeniem dogrywki)	3476767621	FOOTBALL	2023-05-12	Wisła Kraków - Termalica Bruk-Bet Nieciecza	ENDED	Polska 1. liga	2.12	PREMATCH	a51c26d4-d88c-4e1c-9f35-17196c520c44
9d78b028-4970-4aa4-bc70-0db1f03e7cd5	LOSE	Lazio	Wynik meczu (z wyłączeniem dogrywki)	3477007862	FOOTBALL	2023-05-12	Lazio - Lecce	ENDED	Serie A	1.70	PREMATCH	a51c26d4-d88c-4e1c-9f35-17196c520c44
83876942-d225-4dfb-b611-90ef4c249927	LOSE	Powyżej 3.5	Gole Powyżej/Poniżej	3468182809	FOOTBALL	2023-05-11	Juventus - Sevilla	ENDED	Liga Europy	4.50	LIVE	a0492c30-88b6-4922-8bba-1aa9da08020b
0fe4b6dc-1bd3-4eee-8710-d8c98ab2ade8	LOSE	Manchester City -1	Handicap	3467524272	FOOTBALL	2023-05-09	Real Madryt - Manchester City	ENDED	Liga Mistrzów	3.85	PREMATCH	e9855fad-ce35-46f0-8204-33bbf08a396b
36dc37e0-d4e0-42ef-a135-b6e29711d9bb	LOSE	Brighton	Wynik meczu (z wyłączeniem dogrywki)	3473160656	FOOTBALL	2023-05-08	Brighton - Everton	ENDED	Premier League	1.82	LIVE	06c79840-4a9f-4f73-a0ff-fb32226ffcfb
3066fd92-a8c9-415a-adbd-31e9d4bc25c6	LOSE	Brighton -1	Handicap	3473161114	FOOTBALL	2023-05-08	Brighton - Everton	ENDED	Premier League	1.95	PREMATCH	73f4a30c-3d08-4c79-a285-b208bb526c35
9de25f18-48b9-4a1e-83eb-8609755d32f5	WIN	Joel Embiid	Gracz zdobędzie 30 punktów lub więcej i jego zespół wygra	3479571612	BASKETBALL	2023-05-07	Philadelphia 76ers - Boston Celtics	ENDED	NBA	4.05	PREMATCH	d72ad8b0-9a9f-4590-8fe1-3b2e8918237b
eadfce50-4eb0-43ca-95f0-29bb011db19e	LOSE	Fenerbahce	Wynik meczu (z wyłączeniem dogrywki)	3471412724	FOOTBALL	2023-05-07	Giresunspor - Fenerbahce	ENDED	Turcja Super Lig	1.55	PREMATCH	8ac4451f-71d7-4e6d-8589-5ab041282bc7
d2673efe-f1b1-4d0e-af1b-39d46649377c	WIN	Sporting Lizbona	Wynik meczu (z wyłączeniem dogrywki)	3473131651	FOOTBALL	2023-05-07	Pacos Ferreira - Sporting Lizbona	ENDED	Portugalia Primeira Liga	1.30	PREMATCH	8ac4451f-71d7-4e6d-8589-5ab041282bc7
d6a6af72-a5e0-491d-b11d-b08636158d01	LOSE	BetMaker	BetMaker	140623721	FOOTBALL	2023-05-07	Newcastle - Arsenal	ENDED	Premier League	7.37	PREMATCH	a3142ea6-3306-49cb-b6fa-f9c420ce8822
713cb79c-5ed1-40a7-9a5c-0b604b036574	WIN	Monaco	Wynik meczu (z wyłączeniem dogrywki)	3470631140	FOOTBALL	2023-05-07	Angers - Monaco	ENDED	Ligue 1	1.58	PREMATCH	5960ee79-18c1-4aff-8e6b-291572cdfd4f
1ec2b0ee-289f-450e-9472-a37642acd35b	LOSE	FC Midtjylland	Wynik meczu (z wyłączeniem dogrywki)	3473880171	FOOTBALL	2023-05-07	Lyngby BK - FC Midtjylland	ENDED	Dania Superliga	2.01	PREMATCH	5960ee79-18c1-4aff-8e6b-291572cdfd4f
9a84e396-83d3-4a90-88e2-a89ea9a72f8e	LOSE	Fenerbahce	Wynik meczu (z wyłączeniem dogrywki)	3471412724	FOOTBALL	2023-05-07	Giresunspor - Fenerbahce	ENDED	Turcja Super Lig	1.47	PREMATCH	5960ee79-18c1-4aff-8e6b-291572cdfd4f
ffda6496-ead8-496b-99f5-baf583107dfa	WIN	Feyenoord	Wynik meczu (z wyłączeniem dogrywki)	3469926915	FOOTBALL	2023-05-07	SBV Excelsior - Feyenoord	ENDED	Holandia Eredivisie	1.22	PREMATCH	5960ee79-18c1-4aff-8e6b-291572cdfd4f
6ba1ed97-1188-4f51-84cf-1ef1f7ca9b4a	WIN	Sporting Lizbona	Wynik meczu (z wyłączeniem dogrywki)	3473131651	FOOTBALL	2023-05-07	Pacos Ferreira - Sporting Lizbona	ENDED	Portugalia Primeira Liga	1.31	PREMATCH	5960ee79-18c1-4aff-8e6b-291572cdfd4f
c12c56bd-2af8-48e2-957a-9de93cad9682	LOSE	Fenerbahce	Wynik meczu (z wyłączeniem dogrywki)	3471412724	FOOTBALL	2023-05-07	Giresunspor - Fenerbahce	ENDED	Turcja Super Lig	1.47	PREMATCH	9c4b5135-97d1-4d34-9d6a-df35055c0abe
12a711f8-a7e5-44af-85c9-596555575987	WIN	Strasbourg	Wynik meczu (z wyłączeniem dogrywki)	3470622831	FOOTBALL	2023-05-07	Nantes - Strasbourg	ENDED	Ligue 1	2.60	PREMATCH	9c4b5135-97d1-4d34-9d6a-df35055c0abe
92ed4e5a-44a0-45d5-8b9f-8d6b06817b9c	LOSE	Toulouse	Wynik meczu (z wyłączeniem dogrywki)	3470630209	FOOTBALL	2023-05-07	Ajaccio - Toulouse	ENDED	Ligue 1	2.00	PREMATCH	9c4b5135-97d1-4d34-9d6a-df35055c0abe
9cb462e6-7535-40ad-9607-d76fcd7375e6	WIN	Feyenoord	Wynik meczu (z wyłączeniem dogrywki)	3469926915	FOOTBALL	2023-05-07	SBV Excelsior - Feyenoord	ENDED	Holandia Eredivisie	1.22	PREMATCH	9c4b5135-97d1-4d34-9d6a-df35055c0abe
10c99610-63b0-4c8c-862e-1b20eca82af0	WIN	Sporting Lizbona	Wynik meczu (z wyłączeniem dogrywki)	3473131651	FOOTBALL	2023-05-07	Pacos Ferreira - Sporting Lizbona	ENDED	Portugalia Primeira Liga	1.31	PREMATCH	9c4b5135-97d1-4d34-9d6a-df35055c0abe
ac36cab9-9ea1-455e-b2e3-9d4c87ae62d9	WIN	Monaco	Wynik meczu (z wyłączeniem dogrywki)	3470631140	FOOTBALL	2023-05-07	Angers - Monaco	ENDED	Ligue 1	1.58	PREMATCH	9c4b5135-97d1-4d34-9d6a-df35055c0abe
95a916e6-19a1-44f5-9fc1-edf30e4ce524	LOSE	FC Midtjylland	Wynik meczu (z wyłączeniem dogrywki)	3473880171	FOOTBALL	2023-05-07	Lyngby BK - FC Midtjylland	ENDED	Dania Superliga	2.01	PREMATCH	9c4b5135-97d1-4d34-9d6a-df35055c0abe
84dfce09-7cae-45df-ac10-f0292de78093	LOSE	Jalen Brunson & Jimmy Butler & RJ Barrett	3 zawodników zdobędzie 85 punktów lub więcej	3478775970	BASKETBALL	2023-05-06	Miami Heat - NY Knicks	ENDED	NBA	3.45	PREMATCH	befe981b-9038-46ae-8729-e87b16f94e4c
514a3f4d-a607-429e-bea9-6bbbcfaff3a5	WIN	Real Madryt	Wynik meczu (z wyłączeniem dogrywki)	3455965750	FOOTBALL	2023-05-06	Real Madryt - Osasuna	ENDED	Hiszpania Puchar	1.34	PREMATCH	0341c296-da6b-4b80-9d0d-2b112190a25f
91e071ba-7cae-46e3-9a71-7474c959ef94	WIN	Young Boys	Wynik meczu (z wyłączeniem dogrywki)	3472807181	FOOTBALL	2023-05-06	St Gallen - Young Boys	ENDED	Szwajcaria Superliga	2.14	PREMATCH	0341c296-da6b-4b80-9d0d-2b112190a25f
c9d6994f-27cb-4534-97c5-6fcb5636c55b	LOSE	Ruch Chorzów	Wynik meczu (z wyłączeniem dogrywki)	3472011774	FOOTBALL	2023-05-06	Ruch Chorzów - Resovia Rzeszów	ENDED	Polska 1. liga	1.67	PREMATCH	c24582ac-b9c0-47e0-a02d-24ba6a2c4024
26df2049-dbb9-4fcb-8f94-6f4860aae6f4	LOSE	Manchester City -1	Handicap	3470218979	FOOTBALL	2023-05-06	Manchester City - Leeds	ENDED	Premier League	1.45	PREMATCH	c24582ac-b9c0-47e0-a02d-24ba6a2c4024
8b17b421-7c2d-42e5-8b71-fc8f11811b3b	WIN	Lech Poznań	Wynik meczu (z wyłączeniem dogrywki)	3470167880	FOOTBALL	2023-05-06	Lech Poznań - Cracovia	ENDED	Ekstraklasa	1.56	PREMATCH	c24582ac-b9c0-47e0-a02d-24ba6a2c4024
7ec7e8c9-353a-40c8-b9b4-49d2576b21e8	WIN	Real Madryt	Wynik meczu (z wyłączeniem dogrywki)	3455965750	FOOTBALL	2023-05-06	Real Madryt - Osasuna	ENDED	Hiszpania Puchar	1.32	PREMATCH	c24582ac-b9c0-47e0-a02d-24ba6a2c4024
47534dc9-c912-4fa5-97b0-a5b7fa16ec68	LOSE	Manchester City -1	Handicap	3470218979	FOOTBALL	2023-05-06	Manchester City - Leeds	ENDED	Premier League	1.45	PREMATCH	04926b49-e2cd-451b-8783-0eaf849a3986
f0238098-2856-47f3-b7b7-d989544236b3	WIN	Real Madryt	Wynik meczu (z wyłączeniem dogrywki)	3455965750	FOOTBALL	2023-05-06	Real Madryt - Osasuna	ENDED	Hiszpania Puchar	1.32	PREMATCH	04926b49-e2cd-451b-8783-0eaf849a3986
e62858e5-c9ac-45c6-ae54-170d3c83a699	WIN	Young Boys	Wynik meczu (z wyłączeniem dogrywki)	3472807181	FOOTBALL	2023-05-06	St Gallen - Young Boys	ENDED	Szwajcaria Superliga	2.04	PREMATCH	04926b49-e2cd-451b-8783-0eaf849a3986
ccba36b5-037a-422b-aae0-01b712af6ea8	WIN	Lech Poznań	Wynik meczu (z wyłączeniem dogrywki)	3470167880	FOOTBALL	2023-05-06	Lech Poznań - Cracovia	ENDED	Ekstraklasa	1.56	PREMATCH	04926b49-e2cd-451b-8783-0eaf849a3986
5e8bc594-dcd7-4a9d-8851-1240a6735a10	LOSE	Ruch Chorzów	Wynik meczu (z wyłączeniem dogrywki)	3472011774	FOOTBALL	2023-05-06	Ruch Chorzów - Resovia Rzeszów	ENDED	Polska 1. liga	1.67	PREMATCH	04926b49-e2cd-451b-8783-0eaf849a3986
3688a7f6-5f6f-450a-8799-1ef39cc37b8b	WIN	Borussia M'gladbach	Wynik meczu (z wyłączeniem dogrywki)	3469341849	FOOTBALL	2023-05-06	Borussia M'gladbach - Bochum	ENDED	Bundesliga	2.11	PREMATCH	04926b49-e2cd-451b-8783-0eaf849a3986
195a1a70-5cfa-4a3c-abc4-edf391511748	LOSE	Manchester City -4	Handicap	3470218988	FOOTBALL	2023-05-06	Manchester City - Leeds	ENDED	Premier League	6.60	PREMATCH	05431a01-503e-4473-b00f-ea75d5a2d51a
c851b78d-cd1f-4af9-a008-a14914aab415	LOSE	Bayer Leverkusen	Wynik meczu (z wyłączeniem dogrywki)	3469362322	FOOTBALL	2023-05-05	Bayer Leverkusen - FC Koeln	ENDED	Bundesliga	1.67	PREMATCH	992d3306-d989-47f8-acb6-b898ae3a0379
ae460316-9ebb-4f55-8e55-7e0f4b815b52	LOSE	Jagiellonia Białystok	Wynik meczu (z wyłączeniem dogrywki)	3470161370	FOOTBALL	2023-05-05	Jagiellonia Białystok - Śląsk Wrocław	ENDED	Ekstraklasa	2.05	PREMATCH	992d3306-d989-47f8-acb6-b898ae3a0379
45e6a4d9-31b9-48bf-b2a9-b3f50086fea6	LOSE	Powyżej 5,5	Gole Powyżej/Poniżej	3469872483	FOOTBALL	2023-05-04	Brighton - Manchester United	ENDED	Premier League	7.20	PREMATCH	ad27c583-2f96-4b7b-aa2a-c67f07086b6a
49561e61-7c8e-40c2-949c-38db015f4ea4	WIN	Rayo Vallecano	Wynik meczu (z wyłączeniem dogrywki)	3469870714	FOOTBALL	2023-05-04	Rayo Vallecano - Real Valladolid	ENDED	La Liga	2.01	PREMATCH	55af71be-3aba-4bec-9d91-920106eb03e9
16731fe4-c0a0-46fc-81fd-60ab3a217ace	WIN	Sevilla	Wynik meczu (z wyłączeniem dogrywki)	3469871839	FOOTBALL	2023-05-04	Sevilla - Espanyol	ENDED	La Liga	1.78	PREMATCH	55af71be-3aba-4bec-9d91-920106eb03e9
8232fbe5-cb59-4f01-862a-32ffc4de3c3a	LOSE	Powyżej 3.5	Gole Powyżej/Poniżej	3469872479	FOOTBALL	2023-05-04	Brighton - Manchester United	ENDED	Premier League	2.24	PREMATCH	55af71be-3aba-4bec-9d91-920106eb03e9
0f5c0f3f-c4e6-4838-ba20-16da08d692d6	WIN	Atalanta	Wynik meczu (z wyłączeniem dogrywki)	3469872734	FOOTBALL	2023-05-03	Atalanta - Spezia	ENDED	Serie A	1.38	PREMATCH	6c1fabcd-03aa-4dcd-9e17-b000ad9dc94b
0fbf18fa-12b2-4d07-8775-2a3a8baec2c7	WIN	Liverpool	Wynik meczu (z wyłączeniem dogrywki)	3469870564	FOOTBALL	2023-05-03	Liverpool - Fulham	ENDED	Premier League	1.29	PREMATCH	6c1fabcd-03aa-4dcd-9e17-b000ad9dc94b
cd41a4a8-0f54-4252-b443-0e46fe298d57	WIN	Juventus	Wynik meczu (z wyłączeniem dogrywki)	3469870490	FOOTBALL	2023-05-03	Juventus - Lecce	ENDED	Serie A	1.57	PREMATCH	6c1fabcd-03aa-4dcd-9e17-b000ad9dc94b
72b86454-d400-4f84-9014-be07d7c5881c	WIN	Lazio	Wynik meczu (z wyłączeniem dogrywki)	3469869914	FOOTBALL	2023-05-03	Lazio - Sassuolo	ENDED	Serie A	1.61	PREMATCH	6c1fabcd-03aa-4dcd-9e17-b000ad9dc94b
ee84251b-f405-446d-b52b-787d90d16e1a	LOSE	AC Milan -1	Handicap	3469348543	FOOTBALL	2023-05-03	AC Milan - Cremonese	ENDED	Serie A	1.80	PREMATCH	6c1fabcd-03aa-4dcd-9e17-b000ad9dc94b
9dc4b7db-4daf-41c2-9641-9e6d6fcc0073	LOSE	Liverpool -4	Handicap	3469876812	FOOTBALL	2023-05-03	Liverpool - Fulham	ENDED	Premier League	11.00	PREMATCH	4c08ea9c-7291-4d61-b055-4a7259cde18f
eb68c44a-1e1b-42a9-ade3-37b0d1069b47	LOSE	Liverpool -3	Handicap	3469876809	FOOTBALL	2023-05-03	Liverpool - Fulham	ENDED	Premier League	5.40	PREMATCH	f275d223-4312-4a46-b4a6-5621492e52b3
fe98336d-d02e-42e0-a695-d5a14ee465cb	WIN	Inter Mediolan	Wynik meczu (z wyłączeniem dogrywki)	3469867826	FOOTBALL	2023-05-03	Hellas Verona - Inter Mediolan	ENDED	Serie A	1.64	PREMATCH	84a37a2a-a79a-41d6-9077-42ce8f073356
761c6ea9-d0ae-4f19-ad2a-d1dd0c380d60	WIN	Torino	Wynik meczu (z wyłączeniem dogrywki)	3469867630	FOOTBALL	2023-05-03	Sampdoria - Torino	ENDED	Serie A	1.86	PREMATCH	84a37a2a-a79a-41d6-9077-42ce8f073356
357cd509-dffd-4f9f-8169-b197c7aca9d3	WIN	Poniżej 2,5	Gole Powyżej/Poniżej	3469601960	FOOTBALL	2023-05-03	Monza - Roma	ENDED	Serie A	1.56	PREMATCH	84a37a2a-a79a-41d6-9077-42ce8f073356
005c8895-7be1-4463-afcf-3104315dd10c	LOSE	AC Milan -1	Handicap	3469348543	FOOTBALL	2023-05-03	AC Milan - Cremonese	ENDED	Serie A	1.85	PREMATCH	84a37a2a-a79a-41d6-9077-42ce8f073356
8b960842-d21e-4944-8ec4-a6f572e8fe18	WIN	Atletico Madryt	Wynik meczu (z wyłączeniem dogrywki)	3469870661	FOOTBALL	2023-05-03	Atletico Madryt - Cádiz	ENDED	La Liga	1.26	PREMATCH	84a37a2a-a79a-41d6-9077-42ce8f073356
f16b8799-0a5e-4313-a58e-657cad7b6632	LOSE	Juventus -1	Handicap	3469873990	FOOTBALL	2023-05-03	Juventus - Lecce	ENDED	Serie A	2.85	PREMATCH	84a37a2a-a79a-41d6-9077-42ce8f073356
ea35d49a-7d4c-4157-bb2b-44bc484e2202	WIN	Manchester City	Wynik meczu (z wyłączeniem dogrywki)	3469870502	FOOTBALL	2023-05-03	Manchester City - West Ham	ENDED	Premier League	1.22	PREMATCH	84a37a2a-a79a-41d6-9077-42ce8f073356
5b88eb4f-2a2e-46a6-99fe-388d37351f15	WIN	Lazio	Wynik meczu (z wyłączeniem dogrywki)	3469869914	FOOTBALL	2023-05-03	Lazio - Sassuolo	ENDED	Serie A	1.65	PREMATCH	84a37a2a-a79a-41d6-9077-42ce8f073356
0aa2453f-cebd-4a2a-9b0b-4e4ee52da8d2	WIN	Atalanta	Wynik meczu (z wyłączeniem dogrywki)	3469872734	FOOTBALL	2023-05-03	Atalanta - Spezia	ENDED	Serie A	1.41	PREMATCH	84a37a2a-a79a-41d6-9077-42ce8f073356
2d3dc5bc-5b20-4d4a-aba0-ff48e64e54e4	WIN	Liverpool	Wynik meczu (z wyłączeniem dogrywki)	3469870564	FOOTBALL	2023-05-03	Liverpool - Fulham	ENDED	Premier League	1.28	PREMATCH	84a37a2a-a79a-41d6-9077-42ce8f073356
2edb6013-e319-450e-af9c-09e7c4375acf	WIN	Arsenal i powyżej 3.5	Wynik i gole	3469886805	FOOTBALL	2023-05-02	Arsenal - Chelsea	ENDED	Premier League	3.75	PREMATCH	33325313-0103-46be-a227-ff081f3d9d91
fa683ac8-40ea-4d51-b93e-599dc0e7bece	LOSE	BetMaker	BetMaker	138078904	FOOTBALL	2023-05-02	Legia Warszawa - Raków Częstochowa	ENDED	Puchar Polski	7.41	PREMATCH	d62d2cf4-6fa0-4bed-9715-2aea77321908
af64ef86-3a9a-40a0-ad09-171107db11b2	LOSE	Fabian Piasecki	Strzelec	3476449170	FOOTBALL	2023-05-02	Legia Warszawa - Raków Częstochowa	ENDED	Puchar Polski	6.25	LIVE	0fe41883-b328-4ade-8943-4d89433ea16b
05dd43c2-3b80-4021-ba42-beb7effa2e8e	WIN	Powyżej 3.5	Gole Powyżej/Poniżej	3469881987	FOOTBALL	2023-05-01	Leicester - Everton	ENDED	Premier League	3.30	PREMATCH	d977a740-5d83-456a-bc0f-59e2684edfa1
00650132-5c35-4aad-af28-86936068d29b	WIN	Powyżej 3.5	Gole Powyżej/Poniżej	3469881987	FOOTBALL	2023-05-01	Leicester - Everton	ENDED	Premier League	3.30	PREMATCH	b6d2aa24-47e5-45fc-9663-0688f3dfd5a8
a93ea1ca-150d-4924-b8c9-b981b0038875	WIN	Fiorentina	Wynik meczu (z wyłączeniem dogrywki)	3463224341	FOOTBALL	2023-04-30	Fiorentina - Sampdoria	ENDED	Serie A	1.33	PREMATCH	74afeaa0-657d-4cc9-bfcd-a8994acaceca
b757f9d3-c0a3-4060-939a-e82ae637bc4d	WIN	Rennes	Wynik meczu (z wyłączeniem dogrywki)	3463759428	FOOTBALL	2023-04-30	Rennes - Angers	ENDED	Ligue 1	1.30	PREMATCH	74afeaa0-657d-4cc9-bfcd-a8994acaceca
9ae1245b-b1a1-4564-838e-f4229e81f7ad	WIN	Newcastle	Wynik meczu (z wyłączeniem dogrywki)	3469844955	FOOTBALL	2023-04-30	Newcastle - Southampton	ENDED	Premier League	1.26	PREMATCH	74afeaa0-657d-4cc9-bfcd-a8994acaceca
8f75b685-6cf3-4fa2-8a68-e0fbfefe43a3	WIN	Marsylia	Wynik meczu (z wyłączeniem dogrywki)	3463759184	FOOTBALL	2023-04-30	Marsylia - Auxerre	ENDED	Ligue 1	1.29	PREMATCH	74afeaa0-657d-4cc9-bfcd-a8994acaceca
7205172b-8f57-4bd8-aaf5-82c1a0a94fda	WIN	Bayern Monachium -1	Handicap	3463756126	FOOTBALL	2023-04-30	Bayern Monachium - Hertha Berlin	ENDED	Bundesliga	1.30	PREMATCH	74afeaa0-657d-4cc9-bfcd-a8994acaceca
ad8ba783-ccc4-42c6-ad46-56a1d6b1431d	LOSE	Jalen Brunson & Jimmy Butler	Gracze zdobędą 60 punktów lub więcej	3473697927	BASKETBALL	2023-04-30	NY Knicks - Miami Heat	ENDED	NBA	2.23	PREMATCH	c79a53c9-e8bd-4654-bd93-4c5b3be6f4ac
fccce4b3-3e5a-4345-8df0-21b65d468189	WIN	Rennes -1	Handicap	3463783157	FOOTBALL	2023-04-30	Rennes - Angers	ENDED	Ligue 1	1.85	PREMATCH	db1d6b64-d1eb-44d9-ad01-1ced490e5282
2b767952-b234-4d9d-8f8c-0722892d6850	WIN	Bayern Monachium -1	Handicap	3463756126	FOOTBALL	2023-04-30	Bayern Monachium - Hertha Berlin	ENDED	Bundesliga	1.30	PREMATCH	db1d6b64-d1eb-44d9-ad01-1ced490e5282
5222edb8-0e7e-40c4-a9ad-6f60f96a8c5c	LOSE	Lech Poznań	Wynik meczu (z wyłączeniem dogrywki)	3463478768	FOOTBALL	2023-04-30	Lech Poznań - Górnik Zabrze	ENDED	Ekstraklasa	1.72	PREMATCH	db1d6b64-d1eb-44d9-ad01-1ced490e5282
eee114c9-1106-4147-8d54-843ad46b593c	WIN	Newcastle -1	Handicap	3469848959	FOOTBALL	2023-04-30	Newcastle - Southampton	ENDED	Premier League	1.76	PREMATCH	db1d6b64-d1eb-44d9-ad01-1ced490e5282
70ab533a-1465-41c6-8104-d96c58bc3068	WIN	Marsylia	Wynik meczu (z wyłączeniem dogrywki)	3463759184	FOOTBALL	2023-04-30	Marsylia - Auxerre	ENDED	Ligue 1	1.29	PREMATCH	db1d6b64-d1eb-44d9-ad01-1ced490e5282
f3a746e5-1113-45f3-9615-26c94996e9e4	WIN	Fiorentina	Wynik meczu (z wyłączeniem dogrywki)	3463224341	FOOTBALL	2023-04-30	Fiorentina - Sampdoria	ENDED	Serie A	1.33	PREMATCH	db1d6b64-d1eb-44d9-ad01-1ced490e5282
2ff4abc1-e7b5-4513-ab77-aa7ff2ed9c80	WIN	Rennes -1	Handicap	3463783157	FOOTBALL	2023-04-30	Rennes - Angers	ENDED	Ligue 1	1.85	PREMATCH	b9359487-ed94-4972-a73a-41fa5b0be5a9
62d3ba04-23bc-4b08-8c04-a3da9e4b593e	WIN	Newcastle -1	Handicap	3469848959	FOOTBALL	2023-04-30	Newcastle - Southampton	ENDED	Premier League	1.76	PREMATCH	b9359487-ed94-4972-a73a-41fa5b0be5a9
75f8131f-d2fc-4ebc-bd6b-f1d9beed7a94	WIN	Bayern Monachium -1	Handicap	3463756126	FOOTBALL	2023-04-30	Bayern Monachium - Hertha Berlin	ENDED	Bundesliga	1.30	PREMATCH	b9359487-ed94-4972-a73a-41fa5b0be5a9
bdb3c74f-f320-4aa1-acc6-fe0484b35e3c	WIN	Fiorentina	Wynik meczu (z wyłączeniem dogrywki)	3463224341	FOOTBALL	2023-04-30	Fiorentina - Sampdoria	ENDED	Serie A	1.33	PREMATCH	b9359487-ed94-4972-a73a-41fa5b0be5a9
c74b266e-28d3-43ff-8001-2a3bba3e22f7	WIN	Marsylia	Wynik meczu (z wyłączeniem dogrywki)	3463759184	FOOTBALL	2023-04-30	Marsylia - Auxerre	ENDED	Ligue 1	1.29	PREMATCH	b9359487-ed94-4972-a73a-41fa5b0be5a9
b3e3301a-8b3f-46ed-9be9-fbff8d80be31	LOSE	Lech Poznań	Wynik meczu (z wyłączeniem dogrywki)	3463478768	FOOTBALL	2023-04-30	Lech Poznań - Górnik Zabrze	ENDED	Ekstraklasa	1.72	PREMATCH	b9359487-ed94-4972-a73a-41fa5b0be5a9
2d37ed8c-11f2-4faf-a53d-bdb16e3abe42	WIN	Rennes -1	Handicap	3463783157	FOOTBALL	2023-04-30	Rennes - Angers	ENDED	Ligue 1	1.86	PREMATCH	e6d1938f-bb08-4ad2-8407-f10f71199db8
593e72e5-4c79-4cf8-bf3b-8e99e3be4e63	WIN	Marsylia	Wynik meczu (z wyłączeniem dogrywki)	3463759184	FOOTBALL	2023-04-30	Marsylia - Auxerre	ENDED	Ligue 1	1.30	PREMATCH	e6d1938f-bb08-4ad2-8407-f10f71199db8
a836be93-4934-4288-a7b4-828ad2f00e4b	LOSE	Bayern Monachium -2	Handicap	3463756132	FOOTBALL	2023-04-30	Bayern Monachium - Hertha Berlin	ENDED	Bundesliga	1.80	PREMATCH	e6d1938f-bb08-4ad2-8407-f10f71199db8
173466b8-d8c7-4353-92bb-d0833e75b056	WIN	Ruch Chorzów	Wynik meczu (z wyłączeniem dogrywki)	3466115093	FOOTBALL	2023-04-30	MKS Sandecja Nowy Sącz - Ruch Chorzów	ENDED	Polska 1. liga	2.75	PREMATCH	e6d1938f-bb08-4ad2-8407-f10f71199db8
8734f5de-c316-4af2-bb7c-287dc118773e	WIN	Newcastle -1	Handicap	3469848959	FOOTBALL	2023-04-30	Newcastle - Southampton	ENDED	Premier League	1.76	PREMATCH	e6d1938f-bb08-4ad2-8407-f10f71199db8
641589d5-ef3f-4adc-8203-40684204b26d	LOSE	Porto -1	Handicap	3467501036	FOOTBALL	2023-04-30	Porto - Boavista	ENDED	Portugalia Primeira Liga	1.53	PREMATCH	e6d1938f-bb08-4ad2-8407-f10f71199db8
d47226cb-6db9-4532-b0a8-a6746e05b8ad	WIN	Fiorentina	Wynik meczu (z wyłączeniem dogrywki)	3463224341	FOOTBALL	2023-04-30	Fiorentina - Sampdoria	ENDED	Serie A	1.35	PREMATCH	e6d1938f-bb08-4ad2-8407-f10f71199db8
af73febb-9421-4ee0-a0ec-3f413f821f4c	WIN	Rennes -1	Handicap	3463783157	FOOTBALL	2023-04-30	Rennes - Angers	ENDED	Ligue 1	1.86	PREMATCH	c3efdfcf-8321-4dc5-ab28-533470e59fc5
add023a7-b85c-42c0-bf53-a7698a346ffb	WIN	Marsylia	Wynik meczu (z wyłączeniem dogrywki)	3463759184	FOOTBALL	2023-04-30	Marsylia - Auxerre	ENDED	Ligue 1	1.30	PREMATCH	c3efdfcf-8321-4dc5-ab28-533470e59fc5
48e71b8e-9264-4f59-b761-9fa6d67fc1a3	WIN	Newcastle -1	Handicap	3469848959	FOOTBALL	2023-04-30	Newcastle - Southampton	ENDED	Premier League	1.76	PREMATCH	c3efdfcf-8321-4dc5-ab28-533470e59fc5
0bbfef5d-88b1-44d5-8a31-9d405dc00c63	LOSE	Porto -1	Handicap	3467501036	FOOTBALL	2023-04-30	Porto - Boavista	ENDED	Portugalia Primeira Liga	1.53	PREMATCH	c3efdfcf-8321-4dc5-ab28-533470e59fc5
d8dd0922-d226-4b9b-a0f1-db892abc9551	WIN	Ruch Chorzów	Wynik meczu (z wyłączeniem dogrywki)	3466115093	FOOTBALL	2023-04-30	MKS Sandecja Nowy Sącz - Ruch Chorzów	ENDED	Polska 1. liga	2.75	PREMATCH	c3efdfcf-8321-4dc5-ab28-533470e59fc5
8ce29f70-c25a-4a4e-bd43-1a941363955f	LOSE	Arka Gdynia	Wynik meczu (z wyłączeniem dogrywki)	3466115045	FOOTBALL	2023-04-30	Arka Gdynia - Puszcza Niepołomice	ENDED	Polska 1. liga	1.92	PREMATCH	c3efdfcf-8321-4dc5-ab28-533470e59fc5
2ff5d0c3-a106-4706-b5ae-a5ec37eb1ff0	LOSE	Lech Poznań	Wynik meczu (z wyłączeniem dogrywki)	3463478768	FOOTBALL	2023-04-30	Lech Poznań - Górnik Zabrze	ENDED	Ekstraklasa	1.72	PREMATCH	c3efdfcf-8321-4dc5-ab28-533470e59fc5
5d63106b-0e27-4545-9537-77175f16bb3f	LOSE	Bayern Monachium -2	Handicap	3463756132	FOOTBALL	2023-04-30	Bayern Monachium - Hertha Berlin	ENDED	Bundesliga	1.80	PREMATCH	c3efdfcf-8321-4dc5-ab28-533470e59fc5
37fe8a31-c923-405c-8602-420987ff8207	WIN	Fiorentina	Wynik meczu (z wyłączeniem dogrywki)	3463224341	FOOTBALL	2023-04-30	Fiorentina - Sampdoria	ENDED	Serie A	1.35	PREMATCH	c3efdfcf-8321-4dc5-ab28-533470e59fc5
efc0d260-32c0-4343-aba6-5ddc778e3f48	WIN	RB Leipzig	Wynik meczu (z wyłączeniem dogrywki)	3463732117	FOOTBALL	2023-04-29	RB Leipzig - Hoffenheim	ENDED	Bundesliga	1.35	PREMATCH	db2aa703-1010-4c0e-a686-0f2ec1f38ef3
edd17c2f-dd55-42dd-ba29-da317c4f7025	WIN	Lille	Wynik meczu (z wyłączeniem dogrywki)	3463758246	FOOTBALL	2023-04-29	Lille - Ajaccio	ENDED	Ligue 1	1.23	PREMATCH	db2aa703-1010-4c0e-a686-0f2ec1f38ef3
afbea443-7aa4-4fbc-9169-50568a1de7dd	WIN	Wisła Kraków -1	Handicap	3466038805	FOOTBALL	2023-04-29	Wisła Kraków - Chojniczanka Chojnice	ENDED	Polska 1. liga	2.06	PREMATCH	db2aa703-1010-4c0e-a686-0f2ec1f38ef3
e737dc36-9598-4710-9c9d-31ac3a98cb18	WIN	Brighton	Wynik meczu (z wyłączeniem dogrywki)	3470509105	FOOTBALL	2023-04-29	Brighton - Wolverhampton	ENDED	Premier League	1.46	PREMATCH	db2aa703-1010-4c0e-a686-0f2ec1f38ef3
64a88532-2011-4c49-b8ac-bba90019cdb6	WIN	Brentford	Wynik meczu (z wyłączeniem dogrywki)	3469844993	FOOTBALL	2023-04-29	Brentford - Nottingham Forest	ENDED	Premier League	1.71	PREMATCH	e11179dd-d3ec-4b67-9638-c7996971c4c7
453ca2da-e68a-47ad-8099-6d18a5f3d03f	WIN	RB Leipzig	Wynik meczu (z wyłączeniem dogrywki)	3463732117	FOOTBALL	2023-04-29	RB Leipzig - Hoffenheim	ENDED	Bundesliga	1.35	PREMATCH	e11179dd-d3ec-4b67-9638-c7996971c4c7
baeb7876-8653-459b-ace1-f32032d4edda	WIN	Brighton	Wynik meczu (z wyłączeniem dogrywki)	3470509105	FOOTBALL	2023-04-29	Brighton - Wolverhampton	ENDED	Premier League	1.46	PREMATCH	e11179dd-d3ec-4b67-9638-c7996971c4c7
2f3474f9-d146-4d01-96a4-2eb17374c0c5	WIN	Wisła Kraków -1	Handicap	3466038805	FOOTBALL	2023-04-29	Wisła Kraków - Chojniczanka Chojnice	ENDED	Polska 1. liga	2.06	PREMATCH	e11179dd-d3ec-4b67-9638-c7996971c4c7
8dc5c516-a091-44fb-bf4a-c04679e06a37	LOSE	Bayer Leverkusen	Wynik meczu (z wyłączeniem dogrywki)	3463747820	FOOTBALL	2023-04-29	Union Berlin - Bayer Leverkusen	ENDED	Bundesliga	2.50	PREMATCH	344ed34e-ae3c-4d95-9c46-9fa98f2969c7
2a5642b5-e2e1-4af6-af13-da5e080046fd	WIN	Schalke 04	Wynik meczu (z wyłączeniem dogrywki)	3463732064	FOOTBALL	2023-04-29	Schalke 04 - Werder	ENDED	Bundesliga	2.35	PREMATCH	344ed34e-ae3c-4d95-9c46-9fa98f2969c7
f1bd2b03-607b-4fa4-95de-f5e08c1285d2	WIN	Brentford	Wynik meczu (z wyłączeniem dogrywki)	3469844993	FOOTBALL	2023-04-29	Brentford - Nottingham Forest	ENDED	Premier League	1.71	PREMATCH	344ed34e-ae3c-4d95-9c46-9fa98f2969c7
1f5b1762-134f-49a1-86f7-e65b4e7f7575	WIN	Lille	Wynik meczu (z wyłączeniem dogrywki)	3463758246	FOOTBALL	2023-04-29	Lille - Ajaccio	ENDED	Ligue 1	1.23	PREMATCH	344ed34e-ae3c-4d95-9c46-9fa98f2969c7
88c28442-6b66-4a8c-b50a-92b970263067	WIN	Wisła Kraków -1	Handicap	3466038805	FOOTBALL	2023-04-29	Wisła Kraków - Chojniczanka Chojnice	ENDED	Polska 1. liga	2.06	PREMATCH	344ed34e-ae3c-4d95-9c46-9fa98f2969c7
4b57e0ce-d3c1-4d32-8275-5fd436ad9b8b	WIN	Brighton	Wynik meczu (z wyłączeniem dogrywki)	3470509105	FOOTBALL	2023-04-29	Brighton - Wolverhampton	ENDED	Premier League	1.46	PREMATCH	344ed34e-ae3c-4d95-9c46-9fa98f2969c7
ccf93103-96e9-4e1b-8975-3d77084fcd86	WIN	RB Leipzig	Wynik meczu (z wyłączeniem dogrywki)	3463732117	FOOTBALL	2023-04-29	RB Leipzig - Hoffenheim	ENDED	Bundesliga	1.35	PREMATCH	344ed34e-ae3c-4d95-9c46-9fa98f2969c7
db3a5162-e8cb-41ad-8162-5d7802c2ddb6	WIN	Raków Częstochowa	Wynik meczu (z wyłączeniem dogrywki)	3463481701	FOOTBALL	2023-04-28	Raków Częstochowa - Lechia Gdańsk	ENDED	Ekstraklasa	1.25	PREMATCH	9415bd0f-ab54-4b79-960f-64016522ad5b
f17e72ac-fefa-4a1b-8c60-ad8b24bf39af	WIN	Legia Warszawa	Wynik meczu (z wyłączeniem dogrywki)	3463485460	FOOTBALL	2023-04-28	Legia Warszawa - Wisla Plock	ENDED	Ekstraklasa	1.40	PREMATCH	9415bd0f-ab54-4b79-960f-64016522ad5b
cd3b1f7e-bc93-4450-b63e-b4f7c0e3f155	LOSE	Borussia Dortmund	Wynik meczu (z wyłączeniem dogrywki)	3463731942	FOOTBALL	2023-04-28	Bochum - Borussia Dortmund	ENDED	Bundesliga	1.47	PREMATCH	9415bd0f-ab54-4b79-960f-64016522ad5b
8caaf6c9-fc93-4256-8dcb-755a88869b91	LOSE	Arsenal	Wynik meczu (z wyłączeniem dogrywki)	3459026825	FOOTBALL	2023-04-26	Manchester City - Arsenal	ENDED	Premier League	4.90	PREMATCH	7110a40f-20a9-443d-9037-a4c9656f2906
a116fd0c-ebff-464c-94ce-08acc9d707d7	LOSE	Powyżej 5,5	Gole Powyżej/Poniżej	3459090092	FOOTBALL	2023-04-26	Manchester City - Arsenal	ENDED	Premier League	11.00	PREMATCH	ff1e89fb-b72d-4194-bf5b-218f69c76f56
fee7b96e-e257-458a-8bd5-a488e434f6cc	LOSE	Granit Xhaka	Strzelec	3469545169	FOOTBALL	2023-04-26	Manchester City - Arsenal	ENDED	Premier League	11.00	PREMATCH	bf2918bd-e84a-4fd8-89ee-b2a4cab063f6
882d8650-caf5-4543-87d5-83ff5942a4fa	LOSE	Thomas Partey	Strzelec	3469545180	FOOTBALL	2023-04-26	Manchester City - Arsenal	ENDED	Premier League	13.00	PREMATCH	457836e3-ea8d-43a2-9ad9-3dd86387a177
370eb464-65c3-4897-a6c1-ae3b091afe02	LOSE	Cleveland Cavaliers -1.5	Wynik handicap	3468776335	BASKETBALL	2023-04-23	NY Knicks - Cleveland Cavaliers	ENDED	NBA	3.90	LIVE	d310de33-3da8-4fc5-9d74-c04baac3003c
a89d50c7-76d0-4fe4-b39f-2261e7ef3856	WIN	Marsylia	Wynik meczu (z wyłączeniem dogrywki)	3452906472	FOOTBALL	2023-04-16	Marsylia - Troyes	ENDED	Ligue 1	1.22	PREMATCH	336907a2-d41e-48fb-a10a-36bffa98b0b7
20eae177-7f5b-4a6c-9bcc-fd5de27c09ea	WIN	Antwerp	Wynik meczu (z wyłączeniem dogrywki)	3455485564	FOOTBALL	2023-04-16	Antwerp - Kortrijk	ENDED	Belgia 1. liga	1.18	PREMATCH	336907a2-d41e-48fb-a10a-36bffa98b0b7
6b6551e9-8d77-473e-9ad9-92297bb6aff3	LOSE	Arka Gdynia	Wynik meczu (z wyłączeniem dogrywki)	3455494225	FOOTBALL	2023-04-16	Arka Gdynia - Skra Częstochowa	ENDED	Polska 1. liga	1.50	PREMATCH	336907a2-d41e-48fb-a10a-36bffa98b0b7
7dcafb26-c5c2-4fb8-905a-dca6157d8910	LOSE	Arsenal	Wynik meczu (z wyłączeniem dogrywki)	3452906922	FOOTBALL	2023-04-16	West Ham - Arsenal	ENDED	Premier League	1.62	PREMATCH	336907a2-d41e-48fb-a10a-36bffa98b0b7
acddb7de-59b9-48f2-9817-4bdb86dd17ce	WIN	Monaco	Wynik meczu (z wyłączeniem dogrywki)	3452907665	FOOTBALL	2023-04-16	Monaco - Lorient	ENDED	Ligue 1	1.34	PREMATCH	336907a2-d41e-48fb-a10a-36bffa98b0b7
cb72f436-4390-4beb-ae7a-402ff860a9f0	LOSE	Dejounte Murray	Zawodnik zdobędzie 30 lub więcej punktów	3461130903	BASKETBALL	2023-04-15	Boston Celtics - Atlanta Hawks	ENDED	NBA	7.50	LIVE	928e2a40-4ca0-4dba-97cb-90ad10d3d355
bb1af1f1-c7a8-4671-8fa8-5c28bff1508c	LOSE	Joel Embiid	Zawodnik zdobędzie 40 lub więcej punktów	3460823110	BASKETBALL	2023-04-15	Philadelphia 76ers - Brooklyn Nets	ENDED	NBA	3.65	PREMATCH	a1d810c9-9c7e-4adb-a9e1-018b5e1301a1
d949fef2-7572-4f25-90c7-90946e2fd56e	LOSE	Powyżej 225.5	Suma punktów	3460735686	BASKETBALL	2023-04-15	Philadelphia 76ers - Brooklyn Nets	ENDED	NBA	3.30	PREMATCH	0e59d4b0-eccd-43d3-977a-5f80b706e522
09757e99-341c-44cd-875e-b4bd7f8b244b	WIN	Mikal Bridges	Zawodnik zdobędzie 30 lub więcej punktów	3460823113	BASKETBALL	2023-04-15	Philadelphia 76ers - Brooklyn Nets	ENDED	NBA	2.33	PREMATCH	ad83a17e-8a7d-4ad5-9d2b-0a631e955c03
30742a7e-4ed2-4385-906e-00357e24f1ad	LOSE	Mikal Bridges	Zawodnik zdobędzie 35 lub więcej punktów	3460823114	BASKETBALL	2023-04-15	Philadelphia 76ers - Brooklyn Nets	ENDED	NBA	4.25	PREMATCH	72366820-381c-4a59-b384-03d807730e3f
0bb5eddc-f556-4a82-a36e-b6eef150fb1d	LOSE	Tottenham	Wynik meczu (z wyłączeniem dogrywki)	3452907193	FOOTBALL	2023-04-15	Tottenham - Bournemouth	ENDED	Premier League	1.50	PREMATCH	a18ca61b-c57f-4c06-94b2-c1b97d5cef3b
3ce73e07-da90-4567-a442-cecde7decd2c	WIN	Pogoń Szczecin	Wynik meczu (z wyłączeniem dogrywki)	3454442776	FOOTBALL	2023-04-15	Lechia Gdańsk - Pogoń Szczecin	ENDED	Ekstraklasa	1.90	PREMATCH	a18ca61b-c57f-4c06-94b2-c1b97d5cef3b
5a7905f4-caa3-44bd-8a32-ffad0fbc11f4	LOSE	Manchester City -2	Handicap	3452925842	FOOTBALL	2023-04-15	Manchester City - Leicester	ENDED	Premier League	1.96	PREMATCH	a18ca61b-c57f-4c06-94b2-c1b97d5cef3b
962044d9-e628-4d83-885c-3bf331cf27f8	WIN	Oud-Heverlee Leuven	Wynik meczu (z wyłączeniem dogrywki)	3453658615	FOOTBALL	2023-04-15	Oostende - Oud-Heverlee Leuven	ENDED	Belgia 1. liga	2.70	PREMATCH	77f37c5f-1ddd-4dbd-b172-da04d9860738
11f6041a-3317-4f74-8666-efbd5528ccc9	WIN	RKC Waalwijk	Wynik meczu (z wyłączeniem dogrywki)	3456926187	FOOTBALL	2023-04-15	RKC Waalwijk - Groningen	ENDED	Holandia Eredivisie	1.90	PREMATCH	77f37c5f-1ddd-4dbd-b172-da04d9860738
19ff3d0d-4f97-4076-bfbe-2db191602ff6	WIN	Pogoń Szczecin	Wynik meczu (z wyłączeniem dogrywki)	3454442776	FOOTBALL	2023-04-15	Lechia Gdańsk - Pogoń Szczecin	ENDED	Ekstraklasa	1.90	PREMATCH	77f37c5f-1ddd-4dbd-b172-da04d9860738
f71e72f7-4d5d-4e59-92d4-756202a4b61e	LOSE	Borussia Dortmund	Wynik meczu (z wyłączeniem dogrywki)	3452907359	FOOTBALL	2023-04-15	Stuttgart - Borussia Dortmund	ENDED	Bundesliga	2.30	PREMATCH	77f37c5f-1ddd-4dbd-b172-da04d9860738
1b8458c9-0839-4f2b-bb29-cc3609c9bc16	LOSE	Tottenham	Wynik meczu (z wyłączeniem dogrywki)	3452907193	FOOTBALL	2023-04-15	Tottenham - Bournemouth	ENDED	Premier League	1.50	PREMATCH	77f37c5f-1ddd-4dbd-b172-da04d9860738
00ad8a84-4f5b-4de9-b197-73ef2c3d4716	WIN	Manchester City -1	Handicap	3452925836	FOOTBALL	2023-04-15	Manchester City - Leicester	ENDED	Premier League	1.39	PREMATCH	77f37c5f-1ddd-4dbd-b172-da04d9860738
8697e658-f328-473b-8a83-45657fb2916f	LOSE	Tottenham	Wynik meczu (z wyłączeniem dogrywki)	3452907193	FOOTBALL	2023-04-15	Tottenham - Bournemouth	ENDED	Premier League	1.50	PREMATCH	9e348681-99e1-4e29-bc71-b6e059464520
a39ff46d-be15-4216-ac72-4034d23c48dc	LOSE	Inter Mediolan	Wynik meczu (z wyłączeniem dogrywki)	3452907425	FOOTBALL	2023-04-15	Inter Mediolan - Monza	ENDED	Serie A	1.42	PREMATCH	9e348681-99e1-4e29-bc71-b6e059464520
f629cfdc-e4d3-4664-93b4-8a573d88ac7c	WIN	Poniżej 2,5	Gole Powyżej/Poniżej	3452945125	FOOTBALL	2023-04-15	Athletic Bilbao - Real Sociedad	ENDED	La Liga	1.47	PREMATCH	9e348681-99e1-4e29-bc71-b6e059464520
08ddd5d7-16e5-4f69-9d19-c6bff62c4cb7	LOSE	Poniżej 2,5	Gole Powyżej/Poniżej	3454447587	FOOTBALL	2023-04-15	Cracovia - RKS Radomiak	ENDED	Ekstraklasa	1.64	PREMATCH	9e348681-99e1-4e29-bc71-b6e059464520
b63cdfff-a3b6-428f-a1bf-ffb940cb4dbf	WIN	Manchester City -1	Handicap	3452925836	FOOTBALL	2023-04-15	Manchester City - Leicester	ENDED	Premier League	1.39	PREMATCH	9e348681-99e1-4e29-bc71-b6e059464520
2bebae10-cec5-42ad-91c5-3fe2946ee4ed	WIN	RKC Waalwijk	Wynik meczu (z wyłączeniem dogrywki)	3456926187	FOOTBALL	2023-04-15	RKC Waalwijk - Groningen	ENDED	Holandia Eredivisie	1.90	PREMATCH	9e348681-99e1-4e29-bc71-b6e059464520
0f3415ad-30de-44a8-99d1-deec94dd15aa	LOSE	Borussia Dortmund	Wynik meczu (z wyłączeniem dogrywki)	3452907359	FOOTBALL	2023-04-15	Stuttgart - Borussia Dortmund	ENDED	Bundesliga	2.30	PREMATCH	9e348681-99e1-4e29-bc71-b6e059464520
854d0d23-e679-420d-a5a2-5e27c0c7f211	WIN	Oud-Heverlee Leuven	Wynik meczu (z wyłączeniem dogrywki)	3453658615	FOOTBALL	2023-04-15	Oostende - Oud-Heverlee Leuven	ENDED	Belgia 1. liga	2.70	PREMATCH	9e348681-99e1-4e29-bc71-b6e059464520
4e90aa04-9043-4bfb-8998-95caf72ef075	WIN	Pogoń Szczecin	Wynik meczu (z wyłączeniem dogrywki)	3454442776	FOOTBALL	2023-04-15	Lechia Gdańsk - Pogoń Szczecin	ENDED	Ekstraklasa	1.90	PREMATCH	9e348681-99e1-4e29-bc71-b6e059464520
c897d861-a9e4-4052-9a88-163cba57ca92	LOSE	Villarreal	Wynik meczu (z wyłączeniem dogrywki)	3452906582	FOOTBALL	2023-04-15	Villarreal - Real Valladolid	ENDED	La Liga	1.40	PREMATCH	24e26d87-4978-4c45-97d3-79fb555f9b11
26e0ef15-3519-4e84-a5da-22d361ef7349	LOSE	Manchester City -2	Handicap	3452925842	FOOTBALL	2023-04-15	Manchester City - Leicester	ENDED	Premier League	2.00	PREMATCH	24e26d87-4978-4c45-97d3-79fb555f9b11
2ed752fa-b79e-459f-8da1-f1773842be8c	WIN	Pogoń Szczecin	Wynik meczu (z wyłączeniem dogrywki)	3454442776	FOOTBALL	2023-04-15	Lechia Gdańsk - Pogoń Szczecin	ENDED	Ekstraklasa	1.93	PREMATCH	24e26d87-4978-4c45-97d3-79fb555f9b11
912c90f8-5f99-4e24-aff7-864597d47cdf	WIN	RKC Waalwijk	Wynik meczu (z wyłączeniem dogrywki)	3456926187	FOOTBALL	2023-04-15	RKC Waalwijk - Groningen	ENDED	Holandia Eredivisie	1.93	PREMATCH	ab3013a7-4fda-4a86-8cbd-9e1e0d3c05c2
1c76b053-907c-4f0f-b0de-4b8b160f50ef	LOSE	Tottenham	Wynik meczu (z wyłączeniem dogrywki)	3452907193	FOOTBALL	2023-04-15	Tottenham - Bournemouth	ENDED	Premier League	1.51	PREMATCH	ab3013a7-4fda-4a86-8cbd-9e1e0d3c05c2
456e8620-c125-4c81-959a-44c0a5a8c07b	LOSE	Villarreal	Wynik meczu (z wyłączeniem dogrywki)	3452906582	FOOTBALL	2023-04-15	Villarreal - Real Valladolid	ENDED	La Liga	1.40	PREMATCH	ab3013a7-4fda-4a86-8cbd-9e1e0d3c05c2
8d563dad-154b-4b81-835d-db0d33ced82b	WIN	Manchester City -1	Handicap	3452925836	FOOTBALL	2023-04-15	Manchester City - Leicester	ENDED	Premier League	1.41	PREMATCH	ab3013a7-4fda-4a86-8cbd-9e1e0d3c05c2
85fcbfad-cd56-4956-9c80-721416eec30b	WIN	Pogoń Szczecin	Wynik meczu (z wyłączeniem dogrywki)	3454442776	FOOTBALL	2023-04-15	Lechia Gdańsk - Pogoń Szczecin	ENDED	Ekstraklasa	1.93	PREMATCH	ab3013a7-4fda-4a86-8cbd-9e1e0d3c05c2
7fd309a4-9382-4cce-a20d-944b29ac4302	WIN	Pogoń Szczecin	Wynik meczu (z wyłączeniem dogrywki)	3454442776	FOOTBALL	2023-04-15	Lechia Gdańsk - Pogoń Szczecin	ENDED	Ekstraklasa	1.93	PREMATCH	2f296b81-84da-4683-8244-a072094bad2f
3f57ea01-1800-4e8d-84ca-b59623289281	WIN	RKC Waalwijk	Wynik meczu (z wyłączeniem dogrywki)	3456926187	FOOTBALL	2023-04-15	RKC Waalwijk - Groningen	ENDED	Holandia Eredivisie	1.93	PREMATCH	2f296b81-84da-4683-8244-a072094bad2f
046bbaca-d2e3-4762-babf-f7e1a4ee1b76	LOSE	Inter Mediolan	Wynik meczu (z wyłączeniem dogrywki)	3452907425	FOOTBALL	2023-04-15	Inter Mediolan - Monza	ENDED	Serie A	1.42	PREMATCH	2f296b81-84da-4683-8244-a072094bad2f
92ca5ff0-53e2-4af1-9bdd-e13434a365a7	LOSE	Villarreal	Wynik meczu (z wyłączeniem dogrywki)	3452906582	FOOTBALL	2023-04-15	Villarreal - Real Valladolid	ENDED	La Liga	1.40	PREMATCH	2f296b81-84da-4683-8244-a072094bad2f
5030adbe-74c6-4db0-9f35-f76f96c5d397	LOSE	Tottenham	Wynik meczu (z wyłączeniem dogrywki)	3452907193	FOOTBALL	2023-04-15	Tottenham - Bournemouth	ENDED	Premier League	1.51	PREMATCH	2f296b81-84da-4683-8244-a072094bad2f
9c1baa21-bc72-4b53-ade1-c04f20a63aaf	WIN	Oud-Heverlee Leuven	Wynik meczu (z wyłączeniem dogrywki)	3453658615	FOOTBALL	2023-04-15	Oostende - Oud-Heverlee Leuven	ENDED	Belgia 1. liga	2.70	PREMATCH	2f296b81-84da-4683-8244-a072094bad2f
284fcd4e-1922-4ddb-a0d4-6e51d3d91163	LOSE	Borussia Dortmund	Wynik meczu (z wyłączeniem dogrywki)	3452907359	FOOTBALL	2023-04-15	Stuttgart - Borussia Dortmund	ENDED	Bundesliga	2.17	PREMATCH	2f296b81-84da-4683-8244-a072094bad2f
0a5856e2-09a7-412f-a03c-2e0408bbf530	WIN	Manchester City -1	Handicap	3452925836	FOOTBALL	2023-04-15	Manchester City - Leicester	ENDED	Premier League	1.41	PREMATCH	2f296b81-84da-4683-8244-a072094bad2f
f65e1eaa-844a-4f2a-8442-0836a965b2e6	WIN	Poniżej 2,5	Gole Powyżej/Poniżej	3452945125	FOOTBALL	2023-04-15	Athletic Bilbao - Real Sociedad	ENDED	La Liga	1.49	PREMATCH	0789d5aa-a1cc-4430-b001-77cc592131eb
01289ed6-9db0-42f8-91b4-e870b602a666	LOSE	Borussia Dortmund	Wynik meczu (z wyłączeniem dogrywki)	3452907359	FOOTBALL	2023-04-15	Stuttgart - Borussia Dortmund	ENDED	Bundesliga	2.17	PREMATCH	0789d5aa-a1cc-4430-b001-77cc592131eb
d18e7732-1618-4249-b934-05cbe17bfc24	LOSE	Poniżej 2,5	Gole Powyżej/Poniżej	3454447587	FOOTBALL	2023-04-15	Cracovia - RKS Radomiak	ENDED	Ekstraklasa	1.64	PREMATCH	0789d5aa-a1cc-4430-b001-77cc592131eb
780c8aeb-a9c9-4094-9f8b-8ff7f0bd0197	LOSE	Tottenham	Wynik meczu (z wyłączeniem dogrywki)	3452907193	FOOTBALL	2023-04-15	Tottenham - Bournemouth	ENDED	Premier League	1.51	PREMATCH	0789d5aa-a1cc-4430-b001-77cc592131eb
f832f38d-98d6-4249-813a-2e814607ebbc	WIN	Oud-Heverlee Leuven	Wynik meczu (z wyłączeniem dogrywki)	3453658615	FOOTBALL	2023-04-15	Oostende - Oud-Heverlee Leuven	ENDED	Belgia 1. liga	2.70	PREMATCH	0789d5aa-a1cc-4430-b001-77cc592131eb
04a2213d-a88f-48c3-b65d-4f4dd233e72e	WIN	Pogoń Szczecin	Wynik meczu (z wyłączeniem dogrywki)	3454442776	FOOTBALL	2023-04-15	Lechia Gdańsk - Pogoń Szczecin	ENDED	Ekstraklasa	1.93	PREMATCH	0789d5aa-a1cc-4430-b001-77cc592131eb
36bf7cc6-fac4-465a-9b40-b7bf4fbfcb13	WIN	Manchester City -1	Handicap	3452925836	FOOTBALL	2023-04-15	Manchester City - Leicester	ENDED	Premier League	1.41	PREMATCH	0789d5aa-a1cc-4430-b001-77cc592131eb
df9d56af-62ac-4029-bb57-b0811af18d11	LOSE	Inter Mediolan	Wynik meczu (z wyłączeniem dogrywki)	3452907425	FOOTBALL	2023-04-15	Inter Mediolan - Monza	ENDED	Serie A	1.42	PREMATCH	0789d5aa-a1cc-4430-b001-77cc592131eb
13068939-767b-4fa6-a46e-7e70c92d0465	LOSE	Villarreal	Wynik meczu (z wyłączeniem dogrywki)	3452906582	FOOTBALL	2023-04-15	Villarreal - Real Valladolid	ENDED	La Liga	1.40	PREMATCH	0789d5aa-a1cc-4430-b001-77cc592131eb
4db6f43c-a9af-48e6-96bf-908d997590a8	WIN	RKC Waalwijk	Wynik meczu (z wyłączeniem dogrywki)	3456926187	FOOTBALL	2023-04-15	RKC Waalwijk - Groningen	ENDED	Holandia Eredivisie	1.93	PREMATCH	0789d5aa-a1cc-4430-b001-77cc592131eb
f8784527-344b-46b9-b082-0e9ffbe80fb4	LOSE	Villarreal	Wynik meczu (z wyłączeniem dogrywki)	3452906582	FOOTBALL	2023-04-15	Villarreal - Real Valladolid	ENDED	La Liga	1.40	PREMATCH	2057d3f6-1e11-4718-ba29-1272fc7337db
060454f9-f2ba-4aa6-90ae-f78dcb5c8a56	WIN	Oud-Heverlee Leuven	Wynik meczu (z wyłączeniem dogrywki)	3453658615	FOOTBALL	2023-04-15	Oostende - Oud-Heverlee Leuven	ENDED	Belgia 1. liga	2.70	PREMATCH	2057d3f6-1e11-4718-ba29-1272fc7337db
85683a18-e69f-4028-a91e-3d010c22c38c	WIN	Pogoń Szczecin	Wynik meczu (z wyłączeniem dogrywki)	3454442776	FOOTBALL	2023-04-15	Lechia Gdańsk - Pogoń Szczecin	ENDED	Ekstraklasa	1.93	PREMATCH	2057d3f6-1e11-4718-ba29-1272fc7337db
ee1c2323-46fb-456f-97f5-3c2071007d6e	LOSE	Inter Mediolan	Wynik meczu (z wyłączeniem dogrywki)	3452907425	FOOTBALL	2023-04-15	Inter Mediolan - Monza	ENDED	Serie A	1.42	PREMATCH	2057d3f6-1e11-4718-ba29-1272fc7337db
9aafb6be-00a7-4dcc-bf5b-388359b64367	LOSE	Borussia Dortmund	Wynik meczu (z wyłączeniem dogrywki)	3452907359	FOOTBALL	2023-04-15	Stuttgart - Borussia Dortmund	ENDED	Bundesliga	2.17	PREMATCH	2057d3f6-1e11-4718-ba29-1272fc7337db
b6bf8a0d-6e2f-4b39-ada0-664c92fe044d	LOSE	Poniżej 2,5	Gole Powyżej/Poniżej	3454447587	FOOTBALL	2023-04-15	Cracovia - RKS Radomiak	ENDED	Ekstraklasa	1.64	PREMATCH	2057d3f6-1e11-4718-ba29-1272fc7337db
753c735f-a90a-4412-b7ab-f20c9ff6024d	WIN	Manchester City -1	Handicap	3452925836	FOOTBALL	2023-04-15	Manchester City - Leicester	ENDED	Premier League	1.41	PREMATCH	2057d3f6-1e11-4718-ba29-1272fc7337db
668c5712-b69c-4a45-b9ad-0a557e9c0509	WIN	Poniżej 2,5	Gole Powyżej/Poniżej	3452945125	FOOTBALL	2023-04-15	Athletic Bilbao - Real Sociedad	ENDED	La Liga	1.49	PREMATCH	2057d3f6-1e11-4718-ba29-1272fc7337db
0f6fb8d4-3eb7-40f0-b0c5-139626eb6b13	WIN	RKC Waalwijk	Wynik meczu (z wyłączeniem dogrywki)	3456926187	FOOTBALL	2023-04-15	RKC Waalwijk - Groningen	ENDED	Holandia Eredivisie	1.93	PREMATCH	2057d3f6-1e11-4718-ba29-1272fc7337db
56276294-4cdb-4572-813c-36f9c8b16640	LOSE	Tottenham	Wynik meczu (z wyłączeniem dogrywki)	3452907193	FOOTBALL	2023-04-15	Tottenham - Bournemouth	ENDED	Premier League	1.51	PREMATCH	2057d3f6-1e11-4718-ba29-1272fc7337db
2a37ae00-5f5c-46b3-80a7-d3c9e31caeea	LOSE	Villarreal	Wynik meczu (z wyłączeniem dogrywki)	3452906582	FOOTBALL	2023-04-15	Villarreal - Real Valladolid	ENDED	La Liga	1.40	PREMATCH	4d282e65-9f1e-4064-b3c2-472736afbc62
38d62f1e-8e05-4884-8f15-effa508e2ac7	LOSE	Inter Mediolan	Wynik meczu (z wyłączeniem dogrywki)	3452907425	FOOTBALL	2023-04-15	Inter Mediolan - Monza	ENDED	Serie A	1.42	PREMATCH	4d282e65-9f1e-4064-b3c2-472736afbc62
3f33e856-935d-46bd-88e4-423afdbd4cee	LOSE	Tottenham	Wynik meczu (z wyłączeniem dogrywki)	3452907193	FOOTBALL	2023-04-15	Tottenham - Bournemouth	ENDED	Premier League	1.51	PREMATCH	4d282e65-9f1e-4064-b3c2-472736afbc62
95ab411c-f71a-4fe9-b0c5-23a19da936a6	WIN	Pogoń Szczecin	Wynik meczu (z wyłączeniem dogrywki)	3454442776	FOOTBALL	2023-04-15	Lechia Gdańsk - Pogoń Szczecin	ENDED	Ekstraklasa	1.93	PREMATCH	4d282e65-9f1e-4064-b3c2-472736afbc62
912b0a79-0733-47ca-b84c-564141b8bd59	LOSE	Poniżej 2,5	Gole Powyżej/Poniżej	3454447587	FOOTBALL	2023-04-15	Cracovia - RKS Radomiak	ENDED	Ekstraklasa	1.64	PREMATCH	4d282e65-9f1e-4064-b3c2-472736afbc62
71d7f184-f0ec-4861-be55-5f36f6a68205	WIN	Manchester City -1	Handicap	3452925836	FOOTBALL	2023-04-15	Manchester City - Leicester	ENDED	Premier League	1.41	PREMATCH	4d282e65-9f1e-4064-b3c2-472736afbc62
e5141762-7ba7-471f-9e98-5cf4dfe98086	WIN	RKC Waalwijk	Wynik meczu (z wyłączeniem dogrywki)	3456926187	FOOTBALL	2023-04-15	RKC Waalwijk - Groningen	ENDED	Holandia Eredivisie	1.93	PREMATCH	4d282e65-9f1e-4064-b3c2-472736afbc62
cf3c9932-699d-4384-989a-b31dad9b8833	WIN	Poniżej 2,5	Gole Powyżej/Poniżej	3452945125	FOOTBALL	2023-04-15	Athletic Bilbao - Real Sociedad	ENDED	La Liga	1.49	PREMATCH	4d282e65-9f1e-4064-b3c2-472736afbc62
74918b6d-23d3-4f68-a467-5a6bc35e4c32	WIN	Oud-Heverlee Leuven	Wynik meczu (z wyłączeniem dogrywki)	3453658615	FOOTBALL	2023-04-15	Oostende - Oud-Heverlee Leuven	ENDED	Belgia 1. liga	2.70	PREMATCH	4d282e65-9f1e-4064-b3c2-472736afbc62
a8e0c229-2e20-4023-8a35-9c2006eeb8b9	LOSE	Borussia Dortmund	Wynik meczu (z wyłączeniem dogrywki)	3452907359	FOOTBALL	2023-04-15	Stuttgart - Borussia Dortmund	ENDED	Bundesliga	2.17	PREMATCH	4d282e65-9f1e-4064-b3c2-472736afbc62
9f25948a-1ba6-43ef-a65c-74d0729e2117	WIN	Lazio	Wynik meczu (z wyłączeniem dogrywki)	3452906692	FOOTBALL	2023-04-14	Spezia - Lazio	ENDED	Serie A	1.83	PREMATCH	ef188790-ea5d-4b95-abce-6bc684a36abf
6b7a0a17-bf62-4929-b7ec-4107b8aa8500	WIN	Tak	Oba zespoły strzelą gola	3452912640	FOOTBALL	2023-04-14	Toulouse - Lyon	ENDED	Ligue 1	1.58	PREMATCH	ef188790-ea5d-4b95-abce-6bc684a36abf
0d52590c-d781-461f-a836-67ee423c2398	WIN	Poniżej 2,5	Gole Powyżej/Poniżej	3454436270	FOOTBALL	2023-04-14	KGHM Zagłębie Lubin - Górnik Zabrze	ENDED	Ekstraklasa	1.94	PREMATCH	ef188790-ea5d-4b95-abce-6bc684a36abf
ed85aff0-f334-45f0-a4d1-bc34a6f70aa4	WIN	Wisła Kraków	Wynik meczu (z wyłączeniem dogrywki)	3455490786	FOOTBALL	2023-04-14	Wisła Kraków - Stal Rzeszów	ENDED	Polska 1. liga	1.61	PREMATCH	ef188790-ea5d-4b95-abce-6bc684a36abf
068c1c1c-8ad2-4440-a4c6-8af5af23164f	LOSE	Benfica	Wynik meczu (z wyłączeniem dogrywki)	3442014247	FOOTBALL	2023-04-11	Benfica - Inter Mediolan	ENDED	Liga Mistrzów	2.25	PREMATCH	56c3e500-035f-4fb8-b4f3-778bae938ae8
b089214b-6631-4a70-8e9e-e3c997336b53	WIN	Powyżej 2,5	Gole Powyżej/Poniżej	3442053002	FOOTBALL	2023-04-11	Manchester City - Bayern Monachium	ENDED	Liga Mistrzów	1.68	PREMATCH	56c3e500-035f-4fb8-b4f3-778bae938ae8
aea0e8d8-9b4d-4d60-a561-5f70d9da4b07	LOSE	Raków Częstochowa	Wynik meczu (z wyłączeniem dogrywki)	3443742302	FOOTBALL	2023-04-10	RKS Radomiak - Raków Częstochowa	ENDED	Ekstraklasa	1.71	PREMATCH	fef1b882-7f1d-4e0a-b3ee-99da4984318d
0f677f8e-0c6e-4820-94ae-40d9a674c33c	LOSE	Legia Warszawa	Wynik meczu (z wyłączeniem dogrywki)	3443743571	FOOTBALL	2023-04-10	Miedź Legnica - Legia Warszawa	ENDED	Ekstraklasa	1.69	PREMATCH	fef1b882-7f1d-4e0a-b3ee-99da4984318d
cd44649b-effb-4fba-b299-bc9920fe8941	LOSE	Wisła Kraków	Wynik meczu (z wyłączeniem dogrywki)	3446062022	FOOTBALL	2023-04-08	Puszcza Niepołomice - Wisła Kraków	ENDED	Polska 1. liga	17.50	LIVE	995bf14d-c74a-4da0-9b29-06978ace5a44
e28869e8-9324-4d9d-a807-6dc5c3e360b3	WIN	Aston Villa	Wynik meczu (z wyłączeniem dogrywki)	3445321348	FOOTBALL	2023-04-08	Aston Villa - Nottingham Forest	ENDED	Premier League	1.55	LIVE	44cef612-f3b2-4e26-baa9-a94515fa8bd3
499d463d-560b-4be4-8ad9-6a1ec90b5ab5	LOSE	Bendel Insurance FC	Wynik meczu (z wyłączeniem dogrywki)	3457023655	FOOTBALL	2023-04-08	Bendel Insurance FC - Kwara United	ENDED	Nigeria Premier League	1.33	PREMATCH	44cef612-f3b2-4e26-baa9-a94515fa8bd3
3fefe0fd-4718-49c8-b1e8-62fe68bc5d90	WIN	Manchester City	Wynik meczu (z wyłączeniem dogrywki)	3443907643	FOOTBALL	2023-04-08	Southampton - Manchester City	ENDED	Premier League	1.25	PREMATCH	44cef612-f3b2-4e26-baa9-a94515fa8bd3
a2f0d487-b434-469e-9d44-ead9d80cc03b	WIN	RB Leipzig	Wynik meczu (z wyłączeniem dogrywki)	3443696266	FOOTBALL	2023-04-08	Hertha Berlin - RB Leipzig	ENDED	Bundesliga	1.70	PREMATCH	44cef612-f3b2-4e26-baa9-a94515fa8bd3
1f305c32-f2e2-44c9-9ad8-eb222557adb7	WIN	Pogoń Szczecin	Wynik meczu (z wyłączeniem dogrywki)	3443745080	FOOTBALL	2023-04-08	Pogoń Szczecin - Cracovia	ENDED	Ekstraklasa	1.70	PREMATCH	44cef612-f3b2-4e26-baa9-a94515fa8bd3
c756de21-57e9-43e7-8eb1-90dc2441d9ec	LOSE	Lille	Wynik meczu (z wyłączeniem dogrywki)	3443779884	FOOTBALL	2023-04-08	Angers - Lille	ENDED	Ligue 1	1.43	PREMATCH	44cef612-f3b2-4e26-baa9-a94515fa8bd3
2fa29a3d-00e6-41c9-99eb-0a6659659b99	WIN	PSV Eindhoven -1	Handicap	3452540522	FOOTBALL	2023-04-08	PSV Eindhoven - SBV Excelsior	ENDED	Holandia Eredivisie	1.25	PREMATCH	44cef612-f3b2-4e26-baa9-a94515fa8bd3
03d66f2a-4074-4eeb-8514-b622bca9154b	LOSE	Widzew Łódź	Wynik meczu (z wyłączeniem dogrywki)	3443741358	FOOTBALL	2023-04-08	Widzew Łódź - Stal Mielec	ENDED	Ekstraklasa	1.78	PREMATCH	0262220e-c759-446d-a565-08120f59c2eb
1e738e62-139e-4bd6-b50f-1a003a8457e8	LOSE	Lille	Wynik meczu (z wyłączeniem dogrywki)	3443779884	FOOTBALL	2023-04-08	Angers - Lille	ENDED	Ligue 1	1.42	PREMATCH	0262220e-c759-446d-a565-08120f59c2eb
46d94a59-fac8-42e5-9c73-ba83de75962e	LOSE	Fiorentina	Wynik meczu (z wyłączeniem dogrywki)	3444414107	FOOTBALL	2023-04-08	Fiorentina - Spezia	ENDED	Serie A	1.44	PREMATCH	0262220e-c759-446d-a565-08120f59c2eb
59dc2601-f2f3-42f0-a8d9-7a450234e7fe	LOSE	Bendel Insurance FC	Wynik meczu (z wyłączeniem dogrywki)	3457023655	FOOTBALL	2023-04-08	Bendel Insurance FC - Kwara United	ENDED	Nigeria Premier League	1.29	PREMATCH	0262220e-c759-446d-a565-08120f59c2eb
dae5d0ff-3bcb-4f5d-9f44-bda7c9414405	WIN	RB Leipzig	Wynik meczu (z wyłączeniem dogrywki)	3443696266	FOOTBALL	2023-04-08	Hertha Berlin - RB Leipzig	ENDED	Bundesliga	1.69	PREMATCH	0262220e-c759-446d-a565-08120f59c2eb
5f47ce38-24f4-4651-ba5c-755c2f514b67	WIN	PSV Eindhoven -1	Handicap	3452540522	FOOTBALL	2023-04-08	PSV Eindhoven - SBV Excelsior	ENDED	Holandia Eredivisie	1.26	PREMATCH	0262220e-c759-446d-a565-08120f59c2eb
10168208-b534-4423-849a-bff2c3f48bb1	WIN	Manchester City	Wynik meczu (z wyłączeniem dogrywki)	3443907643	FOOTBALL	2023-04-08	Southampton - Manchester City	ENDED	Premier League	1.25	PREMATCH	0262220e-c759-446d-a565-08120f59c2eb
e3862891-d282-437d-9566-fbd76f1ab3cc	WIN	Aston Villa	Wynik meczu (z wyłączeniem dogrywki)	3445321348	FOOTBALL	2023-04-08	Aston Villa - Nottingham Forest	ENDED	Premier League	1.60	PREMATCH	0262220e-c759-446d-a565-08120f59c2eb
aee8a861-9630-4bcf-8db2-2b4252c7aef8	WIN	Pogoń Szczecin	Wynik meczu (z wyłączeniem dogrywki)	3443745080	FOOTBALL	2023-04-08	Pogoń Szczecin - Cracovia	ENDED	Ekstraklasa	1.80	PREMATCH	0262220e-c759-446d-a565-08120f59c2eb
222e4466-846f-4939-8651-386c0911f744	WIN	Manchester United	Wynik meczu (z wyłączeniem dogrywki)	3444501168	FOOTBALL	2023-04-08	Manchester United - Everton	ENDED	Premier League	1.51	PREMATCH	0262220e-c759-446d-a565-08120f59c2eb
603cf41b-61a7-4949-82c7-61f8bff55c8c	LOSE	Lille	Wynik meczu (z wyłączeniem dogrywki)	3443779884	FOOTBALL	2023-04-08	Angers - Lille	ENDED	Ligue 1	1.40	PREMATCH	80757c96-e7b1-4d3c-9deb-f6c3c0b27352
1fe5834a-729d-492a-9e55-9e31ff66deaa	WIN	PSV Eindhoven -1	Handicap	3452540522	FOOTBALL	2023-04-08	PSV Eindhoven - SBV Excelsior	ENDED	Holandia Eredivisie	1.23	PREMATCH	80757c96-e7b1-4d3c-9deb-f6c3c0b27352
20329428-4d50-4f3e-8b0f-64f381e58c87	LOSE	Widzew Łódź	Wynik meczu (z wyłączeniem dogrywki)	3443741358	FOOTBALL	2023-04-08	Widzew Łódź - Stal Mielec	ENDED	Ekstraklasa	1.78	PREMATCH	80757c96-e7b1-4d3c-9deb-f6c3c0b27352
4f25e895-b794-4027-8a6f-c82980b5e919	LOSE	Fiorentina	Wynik meczu (z wyłączeniem dogrywki)	3444414107	FOOTBALL	2023-04-08	Fiorentina - Spezia	ENDED	Serie A	1.45	PREMATCH	80757c96-e7b1-4d3c-9deb-f6c3c0b27352
e2d4ae3e-b7a8-4ac2-8735-2b653c4c1425	WIN	Aston Villa	Wynik meczu (z wyłączeniem dogrywki)	3445321348	FOOTBALL	2023-04-08	Aston Villa - Nottingham Forest	ENDED	Premier League	1.60	PREMATCH	80757c96-e7b1-4d3c-9deb-f6c3c0b27352
2a42022a-e311-48e3-93ed-c90e50622975	WIN	Manchester City	Wynik meczu (z wyłączeniem dogrywki)	3443907643	FOOTBALL	2023-04-08	Southampton - Manchester City	ENDED	Premier League	1.25	PREMATCH	80757c96-e7b1-4d3c-9deb-f6c3c0b27352
d72d37e6-48fa-40b2-a48b-fed00039964e	WIN	Pogoń Szczecin	Wynik meczu (z wyłączeniem dogrywki)	3443745080	FOOTBALL	2023-04-08	Pogoń Szczecin - Cracovia	ENDED	Ekstraklasa	1.88	PREMATCH	80757c96-e7b1-4d3c-9deb-f6c3c0b27352
0a8baf95-970a-4d5a-9b03-459cbd0928a5	WIN	Manchester United	Wynik meczu (z wyłączeniem dogrywki)	3444501168	FOOTBALL	2023-04-08	Manchester United - Everton	ENDED	Premier League	1.47	PREMATCH	80757c96-e7b1-4d3c-9deb-f6c3c0b27352
63eea059-a291-4594-8414-2c1f5f1e66ab	WIN	Napoli	Wynik meczu (z wyłączeniem dogrywki)	3444411463	FOOTBALL	2023-04-07	Lecce - Napoli	ENDED	Serie A	1.67	PREMATCH	386b0cb7-487c-43aa-8a61-c3ada3729569
f6c05c1d-0fc8-41a4-9867-977a765f2a0e	LOSE	AC Milan	Wynik meczu (z wyłączeniem dogrywki)	3444417099	FOOTBALL	2023-04-07	AC Milan - Empoli	ENDED	Serie A	1.36	PREMATCH	386b0cb7-487c-43aa-8a61-c3ada3729569
661688af-3462-40dc-9ab4-e303e80bcbd3	WIN	Powyżej 2,5	Gole Powyżej/Poniżej	3443782644	FOOTBALL	2023-04-07	RC Lens - Strasbourg	ENDED	Ligue 1	1.88	PREMATCH	386b0cb7-487c-43aa-8a61-c3ada3729569
5b30d27d-a18a-4955-b2b2-a972571f1bd0	LOSE	3 - 1	Dokładny wynik	3444491798	FOOTBALL	2023-04-05	Manchester United - Brentford	ENDED	Premier League	12.00	PREMATCH	ff8ee2cb-7023-499c-a12d-0c5cf00ffbc2
cea630da-2fa1-43d7-8c27-3e8a66aa6173	LOSE	Poniżej 2,5	Gole Powyżej/Poniżej	3444496081	FOOTBALL	2023-04-05	West Ham - Newcastle	ENDED	Premier League	1.61	PREMATCH	fa29047b-9325-4f65-9deb-5fddbb80d9d1
41116190-7dc0-4ba9-bbf6-1bc0468953c8	LOSE	Manchester United i powyżej 3.5	Wynik i gole	3444492259	FOOTBALL	2023-04-05	Manchester United - Brentford	ENDED	Premier League	3.60	PREMATCH	fa29047b-9325-4f65-9deb-5fddbb80d9d1
e5550642-21b0-4efd-9445-dbfb806d5bca	WIN	0 - 0	Dokładny wynik	3444494877	FOOTBALL	2023-04-04	Chelsea - Liverpool	ENDED	Premier League	12.00	PREMATCH	77f929ba-b53a-4546-8552-c673180e90e6
f5e24cd9-d8e0-4696-9640-b133536dd3a8	LOSE	BetMaker	BetMaker	119782427	BASKETBALL	2023-04-02	Chicago Bulls - Memphis Grizzlies	ENDED	NBA	2.86	PREMATCH	5b88f225-885a-486f-b43a-c1e514f7d0e4
92775984-d345-425f-ad55-e51e28a693af	LOSE	Tyler Herro	Zawodnik zdobędzie 35 lub więcej punktów	3451900374	BASKETBALL	2023-04-01	Miami Heat - Dallas Mavericks	ENDED	NBA	14.00	PREMATCH	20b64671-c648-49c4-a085-a98dedec2739
afb7624c-a779-4c12-8411-e1f6ee473bf3	WIN	Tim Hardaway Jr.	Zawodnik zdobędzie 25 lub więcej punktów	3452512853	BASKETBALL	2023-04-01	Miami Heat - Dallas Mavericks	ENDED	NBA	9.00	PREMATCH	a28fd0b1-0270-40d1-a28e-8925c9afc31a
57ad606a-556f-4cf2-9e65-a0bfd4bcf18b	WIN	Luka Doncic	Zawodnik zdobędzie 40 lub więcej punktów	3451900369	BASKETBALL	2023-04-01	Miami Heat - Dallas Mavericks	ENDED	NBA	5.25	PREMATCH	f273956f-ae79-4ec3-ba2b-bdadcc112761
1afdeed5-f52e-4857-bf08-b6c1c12ab243	WIN	Powyżej 234.5	Suma punktów	3451885002	BASKETBALL	2023-04-01	Miami Heat - Dallas Mavericks	ENDED	NBA	3.20	PREMATCH	e5d16940-8002-4a87-a759-ff5b8622e203
fce7e853-0b73-4b87-abc0-b6d81875b944	LOSE	BetMaker	BetMaker	119332802	FOOTBALL	2023-04-01	Bayern Monachium - Borussia Dortmund	ENDED	Bundesliga	6.45	PREMATCH	e1aab2d8-813d-4afe-aaf4-a46384031ad1
e62138e8-504c-4d34-a05b-16122f1b48d9	LOSE	Arka Gdynia	Wynik meczu (z wyłączeniem dogrywki)	3440645998	FOOTBALL	2023-04-01	Arka Gdynia - GKS Katowice	ENDED	Polska 1. liga	2.06	PREMATCH	8781ead8-6751-4802-9f1e-f2e5c6c43ff5
b47e60a0-bf8a-47e0-bc21-7920cc559d12	WIN	Wisła Kraków	Wynik meczu (z wyłączeniem dogrywki)	3440645886	FOOTBALL	2023-04-01	Wisła Kraków - Chrobry Głogów	ENDED	Polska 1. liga	1.32	PREMATCH	8781ead8-6751-4802-9f1e-f2e5c6c43ff5
22264de9-1877-49ae-955d-db81eada285c	WIN	Juventus	Wynik meczu (z wyłączeniem dogrywki)	3438262725	FOOTBALL	2023-04-01	Juventus - Hellas Verona	ENDED	Serie A	1.53	PREMATCH	8781ead8-6751-4802-9f1e-f2e5c6c43ff5
8986b907-b757-42f3-a619-6f382fb52972	WIN	Slavia Praga	Wynik meczu (z wyłączeniem dogrywki)	3444323062	FOOTBALL	2023-04-01	Slavia Praga - Sigma Olomouc	ENDED	Czechy 1. liga	1.22	PREMATCH	8781ead8-6751-4802-9f1e-f2e5c6c43ff5
9f11418b-2966-48c6-8b5b-c20896e89565	WIN	Barcelona	Wynik meczu (z wyłączeniem dogrywki)	3438262641	FOOTBALL	2023-04-01	Elche - Barcelona	ENDED	La Liga	1.37	PREMATCH	8781ead8-6751-4802-9f1e-f2e5c6c43ff5
843ccdf1-da45-411e-8890-00ce971f252a	LOSE	Chelsea	Wynik meczu (z wyłączeniem dogrywki)	3438263224	FOOTBALL	2023-04-01	Chelsea - Aston Villa	ENDED	Premier League	1.69	PREMATCH	8781ead8-6751-4802-9f1e-f2e5c6c43ff5
358c9199-0565-442d-bbd6-929d7b67ea07	LOSE	Chelsea	Wynik meczu (z wyłączeniem dogrywki)	3438263224	FOOTBALL	2023-04-01	Chelsea - Aston Villa	ENDED	Premier League	1.69	PREMATCH	34460a39-3295-483d-a1c7-8e2ad43dff50
899426ce-f128-42f9-9b72-791390b30408	WIN	Barcelona	Wynik meczu (z wyłączeniem dogrywki)	3438262641	FOOTBALL	2023-04-01	Elche - Barcelona	ENDED	La Liga	1.37	PREMATCH	34460a39-3295-483d-a1c7-8e2ad43dff50
dc4b4406-916a-4163-b29a-138a07ef6311	WIN	Juventus	Wynik meczu (z wyłączeniem dogrywki)	3438262725	FOOTBALL	2023-04-01	Juventus - Hellas Verona	ENDED	Serie A	1.53	PREMATCH	34460a39-3295-483d-a1c7-8e2ad43dff50
5994298e-e74d-4719-8e26-2b010cf44e31	WIN	Slavia Praga	Wynik meczu (z wyłączeniem dogrywki)	3444323062	FOOTBALL	2023-04-01	Slavia Praga - Sigma Olomouc	ENDED	Czechy 1. liga	1.22	PREMATCH	34460a39-3295-483d-a1c7-8e2ad43dff50
4a6aa723-d3e9-44d5-be1f-ab5dca854f7b	WIN	Wisła Kraków	Wynik meczu (z wyłączeniem dogrywki)	3440645886	FOOTBALL	2023-04-01	Wisła Kraków - Chrobry Głogów	ENDED	Polska 1. liga	1.32	PREMATCH	34460a39-3295-483d-a1c7-8e2ad43dff50
28430e58-3dc9-4ad1-bddf-f110002de63a	WIN	Arsenal	Wynik meczu (z wyłączeniem dogrywki)	3438289658	FOOTBALL	2023-04-01	Arsenal - Leeds	ENDED	Premier League	1.29	PREMATCH	2ec85d01-6f09-45ec-a0b8-f5a740a7db30
76ce16b1-46b4-4942-85b2-38669d6fc7b2	WIN	Wisła Kraków	Wynik meczu (z wyłączeniem dogrywki)	3440645886	FOOTBALL	2023-04-01	Wisła Kraków - Chrobry Głogów	ENDED	Polska 1. liga	1.34	PREMATCH	2ec85d01-6f09-45ec-a0b8-f5a740a7db30
9e1d990c-32f9-4fc4-baae-e47e9bc44833	LOSE	AZ	Wynik meczu (z wyłączeniem dogrywki)	3443751677	FOOTBALL	2023-04-01	AZ - Heerenveen	ENDED	Holandia Eredivisie	1.61	PREMATCH	2ec85d01-6f09-45ec-a0b8-f5a740a7db30
33352d6d-1739-4a58-8e72-6769cc756ae3	WIN	Slavia Praga	Wynik meczu (z wyłączeniem dogrywki)	3444323062	FOOTBALL	2023-04-01	Slavia Praga - Sigma Olomouc	ENDED	Czechy 1. liga	1.25	PREMATCH	2ec85d01-6f09-45ec-a0b8-f5a740a7db30
a15b9216-6c64-4aed-8c5a-3cf309033306	WIN	Juventus	Wynik meczu (z wyłączeniem dogrywki)	3438262725	FOOTBALL	2023-04-01	Juventus - Hellas Verona	ENDED	Serie A	1.48	PREMATCH	2ec85d01-6f09-45ec-a0b8-f5a740a7db30
47c46a01-c57e-4017-a51a-bb3f994d437f	LOSE	Gabriel Jesus	Strzelec 3 lub więcej goli	3448764913	FOOTBALL	2023-04-01	Arsenal - Leeds	ENDED	Premier League	29.00	PREMATCH	d6ae21f7-f5ee-4569-85f0-c968dcc5a86a
3ae9466d-aa93-44f4-8a19-ffb5ff430ba1	LOSE	BetMaker	BetMaker	116599577	FOOTBALL	2023-04-01	Arsenal - Leeds	ENDED	Premier League	4.69	PREMATCH	d4cfb0d2-3e3c-4d34-9e7c-50b152c0e1bd
51ad3360-8900-44c0-922b-97731af71836	LOSE	BetMaker	BetMaker	116599631	FOOTBALL	2023-04-01	Arsenal - Leeds	ENDED	Premier League	4.49	PREMATCH	354921fe-18ac-41ba-9da6-93724547fe13
6314cfcf-4ec4-4f89-86e8-5551e4b5071c	LOSE	BetMaker	BetMaker	116599565	FOOTBALL	2023-04-01	Arsenal - Leeds	ENDED	Premier League	4.66	PREMATCH	7f6ce772-7261-43ed-a73d-a85d417a53bb
a13a4f09-092f-4b3e-bb8a-5e1cb4634c3a	LOSE	G. Jesus & G. Martinelli & L. Trossard	Wszyscy strzelą	3449588093	FOOTBALL	2023-04-01	Arsenal - Leeds	ENDED	Premier League	11.75	PREMATCH	0dce37f5-75cc-425b-a284-47bb41f398d6
f6463bbc-124b-4de2-837b-26010ce7cbed	LOSE	Arsenal -3	Handicap	3438290083	FOOTBALL	2023-04-01	Arsenal - Leeds	ENDED	Premier League	6.00	PREMATCH	39f1f3b2-738f-40b1-ac09-8f654be8263e
0e3be233-4621-451b-b2c8-c38d05d1d6e4	LOSE	Chelsea	Wynik meczu (z wyłączeniem dogrywki)	3438263224	FOOTBALL	2023-04-01	Chelsea - Aston Villa	ENDED	Premier League	1.69	PREMATCH	9e2c55b2-c2df-4f87-9fac-006f8c368d5b
34c8169c-ecb5-4538-b8af-8b51a59e430f	WIN	Atalanta	Wynik meczu (z wyłączeniem dogrywki)	3438260306	FOOTBALL	2023-04-01	Cremonese - Atalanta	ENDED	Serie A	1.68	PREMATCH	9e2c55b2-c2df-4f87-9fac-006f8c368d5b
405b11b9-bf8e-4f98-a5aa-d004521020a6	WIN	Juventus	Wynik meczu (z wyłączeniem dogrywki)	3438262725	FOOTBALL	2023-04-01	Juventus - Hellas Verona	ENDED	Serie A	1.44	PREMATCH	9e2c55b2-c2df-4f87-9fac-006f8c368d5b
0b48699e-2bd8-4397-a1b5-3ceeeb95fb3c	WIN	Wisła Kraków	Wynik meczu (z wyłączeniem dogrywki)	3440645886	FOOTBALL	2023-04-01	Wisła Kraków - Chrobry Głogów	ENDED	Polska 1. liga	1.41	PREMATCH	9e2c55b2-c2df-4f87-9fac-006f8c368d5b
9566bf27-730a-4190-98a2-b67a4c9d5d5a	LOSE	AZ	Wynik meczu (z wyłączeniem dogrywki)	3443751677	FOOTBALL	2023-04-01	AZ - Heerenveen	ENDED	Holandia Eredivisie	1.51	PREMATCH	9e2c55b2-c2df-4f87-9fac-006f8c368d5b
cfd7471c-2fcb-4cb3-a2f0-178a42bdcf9c	WIN	Slavia Praga	Wynik meczu (z wyłączeniem dogrywki)	3444323062	FOOTBALL	2023-04-01	Slavia Praga - Sigma Olomouc	ENDED	Czechy 1. liga	1.26	PREMATCH	9e2c55b2-c2df-4f87-9fac-006f8c368d5b
7bb54be1-6e88-486b-8b83-276ee74590e0	LOSE	Freiburg	Wynik meczu (z wyłączeniem dogrywki)	3438262915	FOOTBALL	2023-04-01	Freiburg - Hertha Berlin	ENDED	Bundesliga	1.69	PREMATCH	9e2c55b2-c2df-4f87-9fac-006f8c368d5b
0dad0427-f279-4a27-aa9a-865d165ff23d	WIN	Arsenal -1	Handicap	3438290074	FOOTBALL	2023-04-01	Arsenal - Leeds	ENDED	Premier League	1.78	PREMATCH	9e2c55b2-c2df-4f87-9fac-006f8c368d5b
26749dbc-d715-43c4-ad2a-899dddf645bd	WIN	Barcelona	Wynik meczu (z wyłączeniem dogrywki)	3438262641	FOOTBALL	2023-04-01	Elche - Barcelona	ENDED	La Liga	1.36	PREMATCH	9e2c55b2-c2df-4f87-9fac-006f8c368d5b
375ee896-40e4-4b6d-bebb-9a3c923e463a	LOSE	Arka Gdynia	Wynik meczu (z wyłączeniem dogrywki)	3440645998	FOOTBALL	2023-04-01	Arka Gdynia - GKS Katowice	ENDED	Polska 1. liga	2.09	PREMATCH	9e2c55b2-c2df-4f87-9fac-006f8c368d5b
7f484dca-c5be-48db-8861-859a3f926f77	WIN	Atalanta	Wynik meczu (z wyłączeniem dogrywki)	3438260306	FOOTBALL	2023-04-01	Cremonese - Atalanta	ENDED	Serie A	1.68	PREMATCH	4f50495c-46b7-47ba-9ef4-4d59cfee6270
59763727-6f07-4ce0-813f-e434f1266442	WIN	Wisła Kraków	Wynik meczu (z wyłączeniem dogrywki)	3440645886	FOOTBALL	2023-04-01	Wisła Kraków - Chrobry Głogów	ENDED	Polska 1. liga	1.41	PREMATCH	4f50495c-46b7-47ba-9ef4-4d59cfee6270
f34a25bb-514f-4781-9b80-32ed870ba4c1	LOSE	Freiburg	Wynik meczu (z wyłączeniem dogrywki)	3438262915	FOOTBALL	2023-04-01	Freiburg - Hertha Berlin	ENDED	Bundesliga	1.69	PREMATCH	4f50495c-46b7-47ba-9ef4-4d59cfee6270
34247a00-fd6d-49c9-94f9-ceccf58576dd	WIN	Barcelona	Wynik meczu (z wyłączeniem dogrywki)	3438262641	FOOTBALL	2023-04-01	Elche - Barcelona	ENDED	La Liga	1.36	PREMATCH	4f50495c-46b7-47ba-9ef4-4d59cfee6270
81724a25-d5ae-4d8e-a630-f0cb6aecac66	WIN	Slavia Praga	Wynik meczu (z wyłączeniem dogrywki)	3444323062	FOOTBALL	2023-04-01	Slavia Praga - Sigma Olomouc	ENDED	Czechy 1. liga	1.26	PREMATCH	4f50495c-46b7-47ba-9ef4-4d59cfee6270
03249921-b59d-43dd-92a0-ae19ea5f3e94	WIN	Juventus	Wynik meczu (z wyłączeniem dogrywki)	3438262725	FOOTBALL	2023-04-01	Juventus - Hellas Verona	ENDED	Serie A	1.44	PREMATCH	4f50495c-46b7-47ba-9ef4-4d59cfee6270
44daa8af-5726-4597-9474-8b0f4ae60c2a	WIN	Arsenal -1	Handicap	3438290074	FOOTBALL	2023-04-01	Arsenal - Leeds	ENDED	Premier League	1.78	PREMATCH	4f50495c-46b7-47ba-9ef4-4d59cfee6270
66875385-c128-4098-b321-922fca999b7a	LOSE	AZ	Wynik meczu (z wyłączeniem dogrywki)	3443751677	FOOTBALL	2023-04-01	AZ - Heerenveen	ENDED	Holandia Eredivisie	1.51	PREMATCH	4f50495c-46b7-47ba-9ef4-4d59cfee6270
3d33699a-8def-4393-89c5-f0a5cab2c729	LOSE	Chelsea	Wynik meczu (z wyłączeniem dogrywki)	3438263224	FOOTBALL	2023-04-01	Chelsea - Aston Villa	ENDED	Premier League	1.69	PREMATCH	4f50495c-46b7-47ba-9ef4-4d59cfee6270
48c2204e-dcc1-4946-8b7f-bfdf5f79441b	LOSE	Arka Gdynia	Wynik meczu (z wyłączeniem dogrywki)	3440645998	FOOTBALL	2023-04-01	Arka Gdynia - GKS Katowice	ENDED	Polska 1. liga	2.09	PREMATCH	4f50495c-46b7-47ba-9ef4-4d59cfee6270
9d8fa113-c5fe-4fde-a04a-742244d2f6d9	LOSE	Leicester	Wynik meczu (z wyłączeniem dogrywki)	3438263126	FOOTBALL	2023-04-01	Crystal Palace - Leicester	ENDED	Premier League	2.85	PREMATCH	4f50495c-46b7-47ba-9ef4-4d59cfee6270
133c95ac-f34e-4676-ba44-c0c03b4be625	WIN	Barcelona	Wynik meczu (z wyłączeniem dogrywki)	3438262641	FOOTBALL	2023-04-01	Elche - Barcelona	ENDED	La Liga	1.36	PREMATCH	e2345aa8-635b-4e3f-ba41-58f05176c6e4
be3a20a6-29d9-482b-93d3-7b340e036ab2	LOSE	Chelsea	Wynik meczu (z wyłączeniem dogrywki)	3438263224	FOOTBALL	2023-04-01	Chelsea - Aston Villa	ENDED	Premier League	1.69	PREMATCH	e2345aa8-635b-4e3f-ba41-58f05176c6e4
1596e943-c72a-4a49-b161-af2478420255	LOSE	AZ	Wynik meczu (z wyłączeniem dogrywki)	3443751677	FOOTBALL	2023-04-01	AZ - Heerenveen	ENDED	Holandia Eredivisie	1.51	PREMATCH	e2345aa8-635b-4e3f-ba41-58f05176c6e4
a5ea1fed-b241-412e-b57c-c46697e019a6	WIN	Juventus	Wynik meczu (z wyłączeniem dogrywki)	3438262725	FOOTBALL	2023-04-01	Juventus - Hellas Verona	ENDED	Serie A	1.44	PREMATCH	e2345aa8-635b-4e3f-ba41-58f05176c6e4
bdfd49b0-50ea-4306-95f8-fe9e3d4894a7	LOSE	Arka Gdynia	Wynik meczu (z wyłączeniem dogrywki)	3440645998	FOOTBALL	2023-04-01	Arka Gdynia - GKS Katowice	ENDED	Polska 1. liga	2.09	PREMATCH	e2345aa8-635b-4e3f-ba41-58f05176c6e4
34d610ce-2872-4ddf-a2d5-39c52abbac44	LOSE	Freiburg	Wynik meczu (z wyłączeniem dogrywki)	3438262915	FOOTBALL	2023-04-01	Freiburg - Hertha Berlin	ENDED	Bundesliga	1.69	PREMATCH	e2345aa8-635b-4e3f-ba41-58f05176c6e4
b5e0a0a3-f91b-4b35-b2a3-ce7bd2ca31fa	WIN	Arsenal -1	Handicap	3438290074	FOOTBALL	2023-04-01	Arsenal - Leeds	ENDED	Premier League	1.78	PREMATCH	e2345aa8-635b-4e3f-ba41-58f05176c6e4
8d39cfdd-b795-4bb9-91e3-08b5d3146c40	WIN	Slavia Praga	Wynik meczu (z wyłączeniem dogrywki)	3444323062	FOOTBALL	2023-04-01	Slavia Praga - Sigma Olomouc	ENDED	Czechy 1. liga	1.26	PREMATCH	e2345aa8-635b-4e3f-ba41-58f05176c6e4
99b669ae-5bf9-430c-9bf7-042c25b1638c	WIN	Atalanta	Wynik meczu (z wyłączeniem dogrywki)	3438260306	FOOTBALL	2023-04-01	Cremonese - Atalanta	ENDED	Serie A	1.68	PREMATCH	e2345aa8-635b-4e3f-ba41-58f05176c6e4
b2b68d5e-ea70-454a-8152-37578b7e6cd9	WIN	Wisła Kraków	Wynik meczu (z wyłączeniem dogrywki)	3440645886	FOOTBALL	2023-04-01	Wisła Kraków - Chrobry Głogów	ENDED	Polska 1. liga	1.41	PREMATCH	e2345aa8-635b-4e3f-ba41-58f05176c6e4
665b4520-5aaf-4394-9273-8eff4665686d	LOSE	Leicester	Wynik meczu (z wyłączeniem dogrywki)	3438263126	FOOTBALL	2023-04-01	Crystal Palace - Leicester	ENDED	Premier League	2.85	PREMATCH	e2345aa8-635b-4e3f-ba41-58f05176c6e4
4b694ccd-46f0-463c-ac87-3df8f28ee158	LOSE	Freiburg	Wynik meczu (z wyłączeniem dogrywki)	3438262915	FOOTBALL	2023-04-01	Freiburg - Hertha Berlin	ENDED	Bundesliga	1.69	PREMATCH	a76015b8-b70c-4129-988b-b1d2179df42e
8e0effae-397e-4493-91c5-746494cab1ae	WIN	Slavia Praga	Wynik meczu (z wyłączeniem dogrywki)	3444323062	FOOTBALL	2023-04-01	Slavia Praga - Sigma Olomouc	ENDED	Czechy 1. liga	1.26	PREMATCH	a76015b8-b70c-4129-988b-b1d2179df42e
5b1497ff-6b02-49c6-82d8-104870a3497f	LOSE	Arka Gdynia	Wynik meczu (z wyłączeniem dogrywki)	3440645998	FOOTBALL	2023-04-01	Arka Gdynia - GKS Katowice	ENDED	Polska 1. liga	2.09	PREMATCH	a76015b8-b70c-4129-988b-b1d2179df42e
e9cd83a9-cd0d-40ca-99d6-7ec6f363baf1	WIN	Wisła Kraków	Wynik meczu (z wyłączeniem dogrywki)	3440645886	FOOTBALL	2023-04-01	Wisła Kraków - Chrobry Głogów	ENDED	Polska 1. liga	1.41	PREMATCH	a76015b8-b70c-4129-988b-b1d2179df42e
8226f213-98c9-4f60-813a-9ee07a552e71	WIN	Barcelona	Wynik meczu (z wyłączeniem dogrywki)	3438262641	FOOTBALL	2023-04-01	Elche - Barcelona	ENDED	La Liga	1.36	PREMATCH	a76015b8-b70c-4129-988b-b1d2179df42e
467a6355-3f50-4047-8cb5-2a8326a7fc8a	LOSE	Leicester	Wynik meczu (z wyłączeniem dogrywki)	3438263126	FOOTBALL	2023-04-01	Crystal Palace - Leicester	ENDED	Premier League	2.85	PREMATCH	a76015b8-b70c-4129-988b-b1d2179df42e
cc7af091-ba16-434d-a561-41caa648c6c4	WIN	Juventus	Wynik meczu (z wyłączeniem dogrywki)	3438262725	FOOTBALL	2023-04-01	Juventus - Hellas Verona	ENDED	Serie A	1.44	PREMATCH	a76015b8-b70c-4129-988b-b1d2179df42e
1d729451-6040-4a11-b4d2-ff75764dc2bd	WIN	Arsenal -1	Handicap	3438290074	FOOTBALL	2023-04-01	Arsenal - Leeds	ENDED	Premier League	1.78	PREMATCH	a76015b8-b70c-4129-988b-b1d2179df42e
a5d376e7-aeb8-4e0d-9774-f046cd26160b	LOSE	Chelsea	Wynik meczu (z wyłączeniem dogrywki)	3438263224	FOOTBALL	2023-04-01	Chelsea - Aston Villa	ENDED	Premier League	1.69	PREMATCH	a76015b8-b70c-4129-988b-b1d2179df42e
8906faec-abfa-4aac-943d-9782bc7cfa4d	WIN	Atalanta	Wynik meczu (z wyłączeniem dogrywki)	3438260306	FOOTBALL	2023-04-01	Cremonese - Atalanta	ENDED	Serie A	1.68	PREMATCH	a76015b8-b70c-4129-988b-b1d2179df42e
0f1fc8c8-15a8-4780-9e74-e808dbe6d746	LOSE	AZ	Wynik meczu (z wyłączeniem dogrywki)	3443751677	FOOTBALL	2023-04-01	AZ - Heerenveen	ENDED	Holandia Eredivisie	1.51	PREMATCH	a76015b8-b70c-4129-988b-b1d2179df42e
7672a218-90c4-434c-a249-fd70e5c9aac4	WIN	Slavia Praga	Wynik meczu (z wyłączeniem dogrywki)	3444323062	FOOTBALL	2023-04-01	Slavia Praga - Sigma Olomouc	ENDED	Czechy 1. liga	1.26	PREMATCH	9798c28a-4e73-4a23-ab96-0a200040f2d3
68c1dcd7-5c1a-48ac-8eac-cc19eb8239e4	LOSE	Chelsea	Wynik meczu (z wyłączeniem dogrywki)	3438263224	FOOTBALL	2023-04-01	Chelsea - Aston Villa	ENDED	Premier League	1.69	PREMATCH	9798c28a-4e73-4a23-ab96-0a200040f2d3
9d183842-2db3-441c-9ead-edae25940b90	LOSE	Freiburg	Wynik meczu (z wyłączeniem dogrywki)	3438262915	FOOTBALL	2023-04-01	Freiburg - Hertha Berlin	ENDED	Bundesliga	1.69	PREMATCH	9798c28a-4e73-4a23-ab96-0a200040f2d3
5f83e4eb-e113-42f0-b50b-c5ed9230b257	WIN	Arsenal -1	Handicap	3438290074	FOOTBALL	2023-04-01	Arsenal - Leeds	ENDED	Premier League	1.78	PREMATCH	9798c28a-4e73-4a23-ab96-0a200040f2d3
35181891-0830-4862-9002-1e0235f6e8aa	WIN	Barcelona	Wynik meczu (z wyłączeniem dogrywki)	3438262641	FOOTBALL	2023-04-01	Elche - Barcelona	ENDED	La Liga	1.36	PREMATCH	9798c28a-4e73-4a23-ab96-0a200040f2d3
115e5563-4567-487a-abdc-52471b6bc2e0	WIN	Wisła Kraków	Wynik meczu (z wyłączeniem dogrywki)	3440645886	FOOTBALL	2023-04-01	Wisła Kraków - Chrobry Głogów	ENDED	Polska 1. liga	1.41	PREMATCH	9798c28a-4e73-4a23-ab96-0a200040f2d3
f8810da1-6208-45cb-9c68-c9ebe3755459	WIN	Juventus	Wynik meczu (z wyłączeniem dogrywki)	3438262725	FOOTBALL	2023-04-01	Juventus - Hellas Verona	ENDED	Serie A	1.44	PREMATCH	9798c28a-4e73-4a23-ab96-0a200040f2d3
748dc322-390b-4dc8-896d-b175e7a6e8a9	LOSE	AZ	Wynik meczu (z wyłączeniem dogrywki)	3443751677	FOOTBALL	2023-04-01	AZ - Heerenveen	ENDED	Holandia Eredivisie	1.51	PREMATCH	9798c28a-4e73-4a23-ab96-0a200040f2d3
1b00d844-bdd8-435d-b49c-f0c93328cfb1	LOSE	Arka Gdynia	Wynik meczu (z wyłączeniem dogrywki)	3440645998	FOOTBALL	2023-04-01	Arka Gdynia - GKS Katowice	ENDED	Polska 1. liga	2.09	PREMATCH	9798c28a-4e73-4a23-ab96-0a200040f2d3
54469708-08a6-4630-826a-4e342fa70ca8	WIN	Atalanta	Wynik meczu (z wyłączeniem dogrywki)	3438260306	FOOTBALL	2023-04-01	Cremonese - Atalanta	ENDED	Serie A	1.68	PREMATCH	9798c28a-4e73-4a23-ab96-0a200040f2d3
175d984b-9eaa-483d-9ebe-d741aed5cf73	LOSE	BetMaker	BetMaker	119249841	FOOTBALL	2023-04-01	Manchester City - Liverpool	ENDED	Premier League	11.43	PREMATCH	a37c0162-31e8-4979-9a63-4310c87ba868
1d303ec5-436e-446f-acc7-639d9bb7c87d	LOSE	Cody Gakpo	Strzelec 2 lub więcej goli	3448761907	FOOTBALL	2023-04-01	Manchester City - Liverpool	ENDED	Premier League	29.00	PREMATCH	98baa03f-ea95-44a4-912a-941c790f83b4
947f0401-53c9-4bc4-a2e6-514eda08ecd3	LOSE	Trent Alexander-Arnold	Strzelec 2 lub więcej goli	3448761902	FOOTBALL	2023-04-01	Manchester City - Liverpool	ENDED	Premier League	275.00	PREMATCH	b412529e-1b71-4f07-997c-72ca3284d3a8
16f5c187-8324-4857-b726-4e27da6dced8	LOSE	Darwin Nunez	Strzelec	3448648907	FOOTBALL	2023-04-01	Manchester City - Liverpool	ENDED	Premier League	9.00	LIVE	264891a0-471a-4200-9abb-289f2abcee41
92f2f808-087e-4f2e-accb-43b76e1cbc45	LOSE	Cody Gakpo	Strzelec	3448648901	FOOTBALL	2023-04-01	Manchester City - Liverpool	ENDED	Premier League	4.20	PREMATCH	c1d7054e-e0d6-41d3-92cf-fb3b4cbebb0c
00c91c63-d7a8-4849-8eaa-0a2371055762	WIN	Mohamed Salah	Strzelec	3448648877	FOOTBALL	2023-04-01	Manchester City - Liverpool	ENDED	Premier League	3.70	PREMATCH	b6325591-14cd-451a-bf1f-8e6bccc860ef
51bde6e4-d6aa-496c-9074-2b4c24bd042f	WIN	Arsenal -1	Handicap	3438290074	FOOTBALL	2023-04-01	Arsenal - Leeds	ENDED	Premier League	1.78	PREMATCH	7b311d2c-1d44-4904-9ab1-b8e35743d84f
56a6a370-e292-41c9-86d5-2ae0c9e1dd3b	LOSE	Arka Gdynia	Wynik meczu (z wyłączeniem dogrywki)	3440645998	FOOTBALL	2023-04-01	Arka Gdynia - GKS Katowice	ENDED	Polska 1. liga	2.09	PREMATCH	7b311d2c-1d44-4904-9ab1-b8e35743d84f
c834ba53-ba90-4817-bee1-68999360aef1	LOSE	Chelsea	Wynik meczu (z wyłączeniem dogrywki)	3438263224	FOOTBALL	2023-04-01	Chelsea - Aston Villa	ENDED	Premier League	1.69	PREMATCH	7b311d2c-1d44-4904-9ab1-b8e35743d84f
f976fe8e-3295-4ebd-a4ef-cf1ac4593b4c	LOSE	Leicester	Wynik meczu (z wyłączeniem dogrywki)	3438263126	FOOTBALL	2023-04-01	Crystal Palace - Leicester	ENDED	Premier League	2.85	PREMATCH	7b311d2c-1d44-4904-9ab1-b8e35743d84f
e5207ced-434d-467b-94b5-6f9cdb581ff3	WIN	Juventus	Wynik meczu (z wyłączeniem dogrywki)	3438262725	FOOTBALL	2023-04-01	Juventus - Hellas Verona	ENDED	Serie A	1.44	PREMATCH	7b311d2c-1d44-4904-9ab1-b8e35743d84f
0c0554fc-7da1-4473-a8b3-4b46557abb48	WIN	Atalanta	Wynik meczu (z wyłączeniem dogrywki)	3438260306	FOOTBALL	2023-04-01	Cremonese - Atalanta	ENDED	Serie A	1.68	PREMATCH	7b311d2c-1d44-4904-9ab1-b8e35743d84f
963b91f7-a60c-433c-9fbe-27fe2be6404b	WIN	Wisła Kraków	Wynik meczu (z wyłączeniem dogrywki)	3440645886	FOOTBALL	2023-04-01	Wisła Kraków - Chrobry Głogów	ENDED	Polska 1. liga	1.41	PREMATCH	7b311d2c-1d44-4904-9ab1-b8e35743d84f
1cfa28a7-6da2-4b41-9758-db52111102e9	LOSE	AZ	Wynik meczu (z wyłączeniem dogrywki)	3443751677	FOOTBALL	2023-04-01	AZ - Heerenveen	ENDED	Holandia Eredivisie	1.51	PREMATCH	7b311d2c-1d44-4904-9ab1-b8e35743d84f
df44a745-a44f-4c97-b734-5abb86b4e7fd	LOSE	Freiburg	Wynik meczu (z wyłączeniem dogrywki)	3438262915	FOOTBALL	2023-04-01	Freiburg - Hertha Berlin	ENDED	Bundesliga	1.68	PREMATCH	7b311d2c-1d44-4904-9ab1-b8e35743d84f
3c601c4a-cd46-4df5-87e6-1d9230422fb6	LOSE	Eintracht Frankfurt	Wynik meczu (z wyłączeniem dogrywki)	3438284659	FOOTBALL	2023-03-31	Eintracht Frankfurt - Bochum	ENDED	Bundesliga	1.56	PREMATCH	7b311d2c-1d44-4904-9ab1-b8e35743d84f
29f533b7-cfea-492c-be9d-c4d73229f094	WIN	Barcelona	Wynik meczu (z wyłączeniem dogrywki)	3438262641	FOOTBALL	2023-04-01	Elche - Barcelona	ENDED	La Liga	1.36	PREMATCH	7b311d2c-1d44-4904-9ab1-b8e35743d84f
a84f2e76-d2a8-41e8-8274-5555050adecf	WIN	Slavia Praga	Wynik meczu (z wyłączeniem dogrywki)	3444323062	FOOTBALL	2023-04-01	Slavia Praga - Sigma Olomouc	ENDED	Czechy 1. liga	1.26	PREMATCH	7b311d2c-1d44-4904-9ab1-b8e35743d84f
4a6cfb2b-e823-4ac2-af53-82182393da37	LOSE	Marsylia	Wynik meczu (z wyłączeniem dogrywki)	3438259748	FOOTBALL	2023-03-31	Marsylia - Montpellier	ENDED	Ligue 1	1.54	PREMATCH	7b311d2c-1d44-4904-9ab1-b8e35743d84f
3f34999a-bcd9-40f2-8ec7-0c7d64d93514	WIN	Barcelona	Wynik meczu (z wyłączeniem dogrywki)	3438262641	FOOTBALL	2023-04-01	Elche - Barcelona	ENDED	La Liga	1.36	PREMATCH	9f0979d6-07ef-4d97-b767-d8882dd73f36
d1740023-aa25-4045-bd78-a597777a7f9e	LOSE	Eintracht Frankfurt	Wynik meczu (z wyłączeniem dogrywki)	3438284659	FOOTBALL	2023-03-31	Eintracht Frankfurt - Bochum	ENDED	Bundesliga	1.56	PREMATCH	9f0979d6-07ef-4d97-b767-d8882dd73f36
bee1f31f-964c-44a0-9d8e-d6e730fff23c	WIN	Atalanta	Wynik meczu (z wyłączeniem dogrywki)	3438260306	FOOTBALL	2023-04-01	Cremonese - Atalanta	ENDED	Serie A	1.68	PREMATCH	9f0979d6-07ef-4d97-b767-d8882dd73f36
73bcb04b-43af-4942-afa7-f72e079d51d3	LOSE	Marsylia	Wynik meczu (z wyłączeniem dogrywki)	3438259748	FOOTBALL	2023-03-31	Marsylia - Montpellier	ENDED	Ligue 1	1.54	PREMATCH	9f0979d6-07ef-4d97-b767-d8882dd73f36
b3103d3e-7e48-4610-a95d-72d1916b24db	WIN	Juventus	Wynik meczu (z wyłączeniem dogrywki)	3438262725	FOOTBALL	2023-04-01	Juventus - Hellas Verona	ENDED	Serie A	1.44	PREMATCH	9f0979d6-07ef-4d97-b767-d8882dd73f36
ae293c46-975d-4061-8abb-23a40552f5ae	LOSE	Freiburg	Wynik meczu (z wyłączeniem dogrywki)	3438262915	FOOTBALL	2023-04-01	Freiburg - Hertha Berlin	ENDED	Bundesliga	1.68	PREMATCH	9f0979d6-07ef-4d97-b767-d8882dd73f36
75edea34-cbc0-48b9-a32e-af6194ddce03	LOSE	AZ	Wynik meczu (z wyłączeniem dogrywki)	3443751677	FOOTBALL	2023-04-01	AZ - Heerenveen	ENDED	Holandia Eredivisie	1.51	PREMATCH	9f0979d6-07ef-4d97-b767-d8882dd73f36
7876732d-64b1-4d02-a36a-f9b4d4a12287	LOSE	Arka Gdynia	Wynik meczu (z wyłączeniem dogrywki)	3440645998	FOOTBALL	2023-04-01	Arka Gdynia - GKS Katowice	ENDED	Polska 1. liga	2.09	PREMATCH	9f0979d6-07ef-4d97-b767-d8882dd73f36
0bba83bd-2fbd-4042-bce1-25c96d7d85b5	WIN	Wisła Kraków	Wynik meczu (z wyłączeniem dogrywki)	3440645886	FOOTBALL	2023-04-01	Wisła Kraków - Chrobry Głogów	ENDED	Polska 1. liga	1.41	PREMATCH	9f0979d6-07ef-4d97-b767-d8882dd73f36
1c61f27c-2231-4eeb-8040-6efb58c4be95	WIN	Slavia Praga	Wynik meczu (z wyłączeniem dogrywki)	3444323062	FOOTBALL	2023-04-01	Slavia Praga - Sigma Olomouc	ENDED	Czechy 1. liga	1.26	PREMATCH	9f0979d6-07ef-4d97-b767-d8882dd73f36
e1fa98c2-829f-4437-8259-2890eac6b813	WIN	Arsenal -1	Handicap	3438290074	FOOTBALL	2023-04-01	Arsenal - Leeds	ENDED	Premier League	1.78	PREMATCH	9f0979d6-07ef-4d97-b767-d8882dd73f36
30e27911-ea48-4c07-8f45-d02d415ef241	LOSE	Leicester	Wynik meczu (z wyłączeniem dogrywki)	3438263126	FOOTBALL	2023-04-01	Crystal Palace - Leicester	ENDED	Premier League	2.85	PREMATCH	9f0979d6-07ef-4d97-b767-d8882dd73f36
5b20215d-f25f-45e6-9684-da9e74477d40	LOSE	Chelsea	Wynik meczu (z wyłączeniem dogrywki)	3438263224	FOOTBALL	2023-04-01	Chelsea - Aston Villa	ENDED	Premier League	1.69	PREMATCH	9f0979d6-07ef-4d97-b767-d8882dd73f36
da44ab10-38e1-4525-bac0-ca8c25874756	LOSE	Marsylia	Wynik meczu (z wyłączeniem dogrywki)	3438259748	FOOTBALL	2023-03-31	Marsylia - Montpellier	ENDED	Ligue 1	1.54	PREMATCH	9935d70c-9311-4d92-b0e0-b7b39b7c5034
966f2493-ffae-45d2-ac78-f086e8f7283a	LOSE	Arka Gdynia	Wynik meczu (z wyłączeniem dogrywki)	3440645998	FOOTBALL	2023-04-01	Arka Gdynia - GKS Katowice	ENDED	Polska 1. liga	2.09	PREMATCH	9935d70c-9311-4d92-b0e0-b7b39b7c5034
f58ef104-8c25-4b4c-b758-ed767837b941	LOSE	AZ	Wynik meczu (z wyłączeniem dogrywki)	3443751677	FOOTBALL	2023-04-01	AZ - Heerenveen	ENDED	Holandia Eredivisie	1.51	PREMATCH	9935d70c-9311-4d92-b0e0-b7b39b7c5034
27320744-eaba-4306-a890-26fd8a3ad4fb	WIN	Slavia Praga	Wynik meczu (z wyłączeniem dogrywki)	3444323062	FOOTBALL	2023-04-01	Slavia Praga - Sigma Olomouc	ENDED	Czechy 1. liga	1.26	PREMATCH	9935d70c-9311-4d92-b0e0-b7b39b7c5034
1bc7e903-cda8-45f1-b5ab-3a2c7058ce87	WIN	Atalanta	Wynik meczu (z wyłączeniem dogrywki)	3438260306	FOOTBALL	2023-04-01	Cremonese - Atalanta	ENDED	Serie A	1.68	PREMATCH	9935d70c-9311-4d92-b0e0-b7b39b7c5034
62b5f585-8721-4379-8c3f-ac9f4b602a83	LOSE	Freiburg	Wynik meczu (z wyłączeniem dogrywki)	3438262915	FOOTBALL	2023-04-01	Freiburg - Hertha Berlin	ENDED	Bundesliga	1.68	PREMATCH	9935d70c-9311-4d92-b0e0-b7b39b7c5034
e7838301-adef-423a-b4a8-74015c1e66c1	WIN	Juventus	Wynik meczu (z wyłączeniem dogrywki)	3438262725	FOOTBALL	2023-04-01	Juventus - Hellas Verona	ENDED	Serie A	1.44	PREMATCH	9935d70c-9311-4d92-b0e0-b7b39b7c5034
f3ebac63-7f24-4d55-a812-f6f2ad7361cf	WIN	Barcelona	Wynik meczu (z wyłączeniem dogrywki)	3438262641	FOOTBALL	2023-04-01	Elche - Barcelona	ENDED	La Liga	1.36	PREMATCH	9935d70c-9311-4d92-b0e0-b7b39b7c5034
31dc56f1-af89-4bfa-9668-9280f5e1b05c	WIN	Arsenal -1	Handicap	3438290074	FOOTBALL	2023-04-01	Arsenal - Leeds	ENDED	Premier League	1.78	PREMATCH	9935d70c-9311-4d92-b0e0-b7b39b7c5034
a58dea54-27f8-4834-8928-b2ccb212ca46	WIN	Wisła Kraków	Wynik meczu (z wyłączeniem dogrywki)	3440645886	FOOTBALL	2023-04-01	Wisła Kraków - Chrobry Głogów	ENDED	Polska 1. liga	1.41	PREMATCH	9935d70c-9311-4d92-b0e0-b7b39b7c5034
c3504d5a-646e-4182-ae7f-e8de3eee0ca5	LOSE	Leicester	Wynik meczu (z wyłączeniem dogrywki)	3438263126	FOOTBALL	2023-04-01	Crystal Palace - Leicester	ENDED	Premier League	2.85	PREMATCH	9935d70c-9311-4d92-b0e0-b7b39b7c5034
7997bd73-4aa5-42a0-b94c-cff2ef484ca5	LOSE	Eintracht Frankfurt	Wynik meczu (z wyłączeniem dogrywki)	3438284659	FOOTBALL	2023-03-31	Eintracht Frankfurt - Bochum	ENDED	Bundesliga	1.56	PREMATCH	9935d70c-9311-4d92-b0e0-b7b39b7c5034
aa86a86f-f7d0-4b62-bd44-6094cd966b46	LOSE	Chelsea	Wynik meczu (z wyłączeniem dogrywki)	3438263224	FOOTBALL	2023-04-01	Chelsea - Aston Villa	ENDED	Premier League	1.69	PREMATCH	9935d70c-9311-4d92-b0e0-b7b39b7c5034
e979af2f-1684-44df-bdf0-0a46286df0e7	WIN	Juventus	Wynik meczu (z wyłączeniem dogrywki)	3438262725	FOOTBALL	2023-04-01	Juventus - Hellas Verona	ENDED	Serie A	1.44	PREMATCH	14642f0c-c321-4c5a-8311-83749191d9a0
175921c9-f8a6-4848-91cc-095f27f86413	WIN	Arsenal -1	Handicap	3438290074	FOOTBALL	2023-04-01	Arsenal - Leeds	ENDED	Premier League	1.78	PREMATCH	14642f0c-c321-4c5a-8311-83749191d9a0
5e04b132-bc53-4660-a3e4-65d4ef8b7425	WIN	Slavia Praga	Wynik meczu (z wyłączeniem dogrywki)	3444323062	FOOTBALL	2023-04-01	Slavia Praga - Sigma Olomouc	ENDED	Czechy 1. liga	1.26	PREMATCH	14642f0c-c321-4c5a-8311-83749191d9a0
f269fa14-4a6a-483d-b30f-44be44b2b539	WIN	Atalanta	Wynik meczu (z wyłączeniem dogrywki)	3438260306	FOOTBALL	2023-04-01	Cremonese - Atalanta	ENDED	Serie A	1.68	PREMATCH	14642f0c-c321-4c5a-8311-83749191d9a0
9d5e9987-4baa-4014-a78d-746822059be7	LOSE	Freiburg	Wynik meczu (z wyłączeniem dogrywki)	3438262915	FOOTBALL	2023-04-01	Freiburg - Hertha Berlin	ENDED	Bundesliga	1.68	PREMATCH	14642f0c-c321-4c5a-8311-83749191d9a0
c9cb46c9-a2a2-417e-9145-74a304440297	LOSE	Eintracht Frankfurt	Wynik meczu (z wyłączeniem dogrywki)	3438284659	FOOTBALL	2023-03-31	Eintracht Frankfurt - Bochum	ENDED	Bundesliga	1.56	PREMATCH	14642f0c-c321-4c5a-8311-83749191d9a0
c16fb8dc-e6fb-4f90-bcd0-9195d7ff0be2	WIN	Wisła Kraków	Wynik meczu (z wyłączeniem dogrywki)	3440645886	FOOTBALL	2023-04-01	Wisła Kraków - Chrobry Głogów	ENDED	Polska 1. liga	1.41	PREMATCH	14642f0c-c321-4c5a-8311-83749191d9a0
bb9e2182-dba7-49ca-b93b-020df49c5278	LOSE	AZ	Wynik meczu (z wyłączeniem dogrywki)	3443751677	FOOTBALL	2023-04-01	AZ - Heerenveen	ENDED	Holandia Eredivisie	1.51	PREMATCH	14642f0c-c321-4c5a-8311-83749191d9a0
1c306cc9-ba55-4d62-93a9-ffd86dc5e436	WIN	Barcelona	Wynik meczu (z wyłączeniem dogrywki)	3438262641	FOOTBALL	2023-04-01	Elche - Barcelona	ENDED	La Liga	1.36	PREMATCH	14642f0c-c321-4c5a-8311-83749191d9a0
12ff9a0a-c576-4050-be19-898a6cfb4590	LOSE	Arka Gdynia	Wynik meczu (z wyłączeniem dogrywki)	3440645998	FOOTBALL	2023-04-01	Arka Gdynia - GKS Katowice	ENDED	Polska 1. liga	2.09	PREMATCH	14642f0c-c321-4c5a-8311-83749191d9a0
47938583-6d1a-4bc4-91cd-93ea74bdee62	LOSE	Chelsea	Wynik meczu (z wyłączeniem dogrywki)	3438263224	FOOTBALL	2023-04-01	Chelsea - Aston Villa	ENDED	Premier League	1.69	PREMATCH	14642f0c-c321-4c5a-8311-83749191d9a0
c84346e8-e16f-4851-8e00-7100b13807b9	LOSE	Leicester	Wynik meczu (z wyłączeniem dogrywki)	3438263126	FOOTBALL	2023-04-01	Crystal Palace - Leicester	ENDED	Premier League	2.85	PREMATCH	14642f0c-c321-4c5a-8311-83749191d9a0
87c3d68d-8dd7-4299-b4a3-6e3fedfcfccd	LOSE	Marsylia	Wynik meczu (z wyłączeniem dogrywki)	3438259748	FOOTBALL	2023-03-31	Marsylia - Montpellier	ENDED	Ligue 1	1.54	PREMATCH	14642f0c-c321-4c5a-8311-83749191d9a0
5af07280-70d6-48b5-bd28-a7ac1bdfd45c	WIN	Barcelona	Wynik meczu (z wyłączeniem dogrywki)	3438262641	FOOTBALL	2023-04-01	Elche - Barcelona	ENDED	La Liga	1.36	PREMATCH	8cdd4da3-32d5-40a4-86df-e6cc82626d76
35fdeaf4-6166-4f93-8d89-801944aaa81b	WIN	Atalanta	Wynik meczu (z wyłączeniem dogrywki)	3438260306	FOOTBALL	2023-04-01	Cremonese - Atalanta	ENDED	Serie A	1.68	PREMATCH	8cdd4da3-32d5-40a4-86df-e6cc82626d76
cc2fbf61-bd0d-4a6b-ad46-7318ef238189	LOSE	Eintracht Frankfurt	Wynik meczu (z wyłączeniem dogrywki)	3438284659	FOOTBALL	2023-03-31	Eintracht Frankfurt - Bochum	ENDED	Bundesliga	1.56	PREMATCH	8cdd4da3-32d5-40a4-86df-e6cc82626d76
6c665725-6784-4a71-ab45-f5e350745286	LOSE	Marsylia	Wynik meczu (z wyłączeniem dogrywki)	3438259748	FOOTBALL	2023-03-31	Marsylia - Montpellier	ENDED	Ligue 1	1.54	PREMATCH	8cdd4da3-32d5-40a4-86df-e6cc82626d76
23c1a36d-0d3e-4404-90be-5240e0dac7d6	LOSE	Leicester	Wynik meczu (z wyłączeniem dogrywki)	3438263126	FOOTBALL	2023-04-01	Crystal Palace - Leicester	ENDED	Premier League	2.85	PREMATCH	8cdd4da3-32d5-40a4-86df-e6cc82626d76
bb2fa475-0424-4bb1-9d78-69b8d34035af	WIN	Arsenal -1	Handicap	3438290074	FOOTBALL	2023-04-01	Arsenal - Leeds	ENDED	Premier League	1.78	PREMATCH	8cdd4da3-32d5-40a4-86df-e6cc82626d76
f5dd08ec-6487-4b3a-9367-69403d4cafca	LOSE	Arka Gdynia	Wynik meczu (z wyłączeniem dogrywki)	3440645998	FOOTBALL	2023-04-01	Arka Gdynia - GKS Katowice	ENDED	Polska 1. liga	2.09	PREMATCH	8cdd4da3-32d5-40a4-86df-e6cc82626d76
afdb98de-7598-4005-b6d4-0798a8011feb	WIN	Juventus	Wynik meczu (z wyłączeniem dogrywki)	3438262725	FOOTBALL	2023-04-01	Juventus - Hellas Verona	ENDED	Serie A	1.44	PREMATCH	8cdd4da3-32d5-40a4-86df-e6cc82626d76
dc488563-3dda-4856-92ef-c8af9a14cda7	LOSE	Chelsea	Wynik meczu (z wyłączeniem dogrywki)	3438263224	FOOTBALL	2023-04-01	Chelsea - Aston Villa	ENDED	Premier League	1.69	PREMATCH	8cdd4da3-32d5-40a4-86df-e6cc82626d76
fd270929-d2b2-4fe5-a7db-0dbed8e9a11f	WIN	Wisła Kraków	Wynik meczu (z wyłączeniem dogrywki)	3440645886	FOOTBALL	2023-04-01	Wisła Kraków - Chrobry Głogów	ENDED	Polska 1. liga	1.41	PREMATCH	8cdd4da3-32d5-40a4-86df-e6cc82626d76
d281c4e5-f3be-4f74-8e67-06ea7e1d47db	LOSE	Freiburg	Wynik meczu (z wyłączeniem dogrywki)	3438262915	FOOTBALL	2023-04-01	Freiburg - Hertha Berlin	ENDED	Bundesliga	1.68	PREMATCH	8cdd4da3-32d5-40a4-86df-e6cc82626d76
cba09a35-b458-44a5-9a19-5e9ef346728b	WIN	Slavia Praga	Wynik meczu (z wyłączeniem dogrywki)	3444323062	FOOTBALL	2023-04-01	Slavia Praga - Sigma Olomouc	ENDED	Czechy 1. liga	1.26	PREMATCH	8cdd4da3-32d5-40a4-86df-e6cc82626d76
18e9b9fd-57de-4d41-bf5f-8934a86144fe	LOSE	AZ	Wynik meczu (z wyłączeniem dogrywki)	3443751677	FOOTBALL	2023-04-01	AZ - Heerenveen	ENDED	Holandia Eredivisie	1.51	PREMATCH	8cdd4da3-32d5-40a4-86df-e6cc82626d76
df97bde5-f673-4562-9b42-559d6cf559aa	WIN	Slavia Praga	Wynik meczu (z wyłączeniem dogrywki)	3444323062	FOOTBALL	2023-04-01	Slavia Praga - Sigma Olomouc	ENDED	Czechy 1. liga	1.26	PREMATCH	13414a26-1604-4f5e-91a1-eadd99e0663f
01c480c6-920f-4e08-8a7a-c1188596da3f	WIN	Barcelona	Wynik meczu (z wyłączeniem dogrywki)	3438262641	FOOTBALL	2023-04-01	Elche - Barcelona	ENDED	La Liga	1.36	PREMATCH	13414a26-1604-4f5e-91a1-eadd99e0663f
c6309c10-7f21-402a-abe2-fc5fa83a3b08	LOSE	Marsylia	Wynik meczu (z wyłączeniem dogrywki)	3438259748	FOOTBALL	2023-03-31	Marsylia - Montpellier	ENDED	Ligue 1	1.54	PREMATCH	13414a26-1604-4f5e-91a1-eadd99e0663f
bcede1fe-296d-4fe2-be0b-5a8fda177072	LOSE	Chelsea	Wynik meczu (z wyłączeniem dogrywki)	3438263224	FOOTBALL	2023-04-01	Chelsea - Aston Villa	ENDED	Premier League	1.69	PREMATCH	13414a26-1604-4f5e-91a1-eadd99e0663f
9a699065-7f0e-469e-b6ca-ab355f2014bc	WIN	Arsenal -1	Handicap	3438290074	FOOTBALL	2023-04-01	Arsenal - Leeds	ENDED	Premier League	1.78	PREMATCH	13414a26-1604-4f5e-91a1-eadd99e0663f
4f75b608-e3ae-4d6f-a68d-9f5a34713bbd	WIN	Atalanta	Wynik meczu (z wyłączeniem dogrywki)	3438260306	FOOTBALL	2023-04-01	Cremonese - Atalanta	ENDED	Serie A	1.68	PREMATCH	13414a26-1604-4f5e-91a1-eadd99e0663f
6b42ddc2-ee34-4f45-bbf8-6ce2dbbb9cfb	LOSE	Arka Gdynia	Wynik meczu (z wyłączeniem dogrywki)	3440645998	FOOTBALL	2023-04-01	Arka Gdynia - GKS Katowice	ENDED	Polska 1. liga	2.09	PREMATCH	13414a26-1604-4f5e-91a1-eadd99e0663f
43c409bb-0ce2-4c97-b23d-2f6e8bfab92c	LOSE	Eintracht Frankfurt	Wynik meczu (z wyłączeniem dogrywki)	3438284659	FOOTBALL	2023-03-31	Eintracht Frankfurt - Bochum	ENDED	Bundesliga	1.56	PREMATCH	13414a26-1604-4f5e-91a1-eadd99e0663f
80002e9d-6642-417e-b56a-aa5c5329880b	WIN	Juventus	Wynik meczu (z wyłączeniem dogrywki)	3438262725	FOOTBALL	2023-04-01	Juventus - Hellas Verona	ENDED	Serie A	1.44	PREMATCH	13414a26-1604-4f5e-91a1-eadd99e0663f
7204d47b-592b-4da4-9c67-4c1383ef5278	WIN	Wisła Kraków	Wynik meczu (z wyłączeniem dogrywki)	3440645886	FOOTBALL	2023-04-01	Wisła Kraków - Chrobry Głogów	ENDED	Polska 1. liga	1.41	PREMATCH	13414a26-1604-4f5e-91a1-eadd99e0663f
9fd5e92a-f942-4b33-b3f4-3b888adaf451	LOSE	Freiburg	Wynik meczu (z wyłączeniem dogrywki)	3438262915	FOOTBALL	2023-04-01	Freiburg - Hertha Berlin	ENDED	Bundesliga	1.68	PREMATCH	13414a26-1604-4f5e-91a1-eadd99e0663f
98a759af-6ad3-429e-bb6b-8bcff31f3297	LOSE	AZ	Wynik meczu (z wyłączeniem dogrywki)	3443751677	FOOTBALL	2023-04-01	AZ - Heerenveen	ENDED	Holandia Eredivisie	1.51	PREMATCH	13414a26-1604-4f5e-91a1-eadd99e0663f
6727c662-ca03-4ebe-8e47-fa6d6f148d1f	LOSE	AZ	Wynik meczu (z wyłączeniem dogrywki)	3443751677	FOOTBALL	2023-04-01	AZ - Heerenveen	ENDED	Holandia Eredivisie	1.51	PREMATCH	58819d3e-d990-41da-ae2d-22da5f316aed
96468b45-d082-4d10-9ecf-b01fa819fd23	WIN	Arsenal -1	Handicap	3438290074	FOOTBALL	2023-04-01	Arsenal - Leeds	ENDED	Premier League	1.78	PREMATCH	58819d3e-d990-41da-ae2d-22da5f316aed
68e758a3-2c82-4c44-8d6b-819c996cc2bf	WIN	Atalanta	Wynik meczu (z wyłączeniem dogrywki)	3438260306	FOOTBALL	2023-04-01	Cremonese - Atalanta	ENDED	Serie A	1.68	PREMATCH	58819d3e-d990-41da-ae2d-22da5f316aed
8856a758-b677-4ba3-bd42-7ee38583c1b3	LOSE	Eintracht Frankfurt	Wynik meczu (z wyłączeniem dogrywki)	3438284659	FOOTBALL	2023-03-31	Eintracht Frankfurt - Bochum	ENDED	Bundesliga	1.56	PREMATCH	58819d3e-d990-41da-ae2d-22da5f316aed
5de90644-6c6b-44b7-aedf-58d7c9037f33	WIN	Juventus	Wynik meczu (z wyłączeniem dogrywki)	3438262725	FOOTBALL	2023-04-01	Juventus - Hellas Verona	ENDED	Serie A	1.44	PREMATCH	58819d3e-d990-41da-ae2d-22da5f316aed
88868e57-d65b-47d0-87f9-4c97ea3d7835	LOSE	Chelsea	Wynik meczu (z wyłączeniem dogrywki)	3438263224	FOOTBALL	2023-04-01	Chelsea - Aston Villa	ENDED	Premier League	1.69	PREMATCH	58819d3e-d990-41da-ae2d-22da5f316aed
5fbf9b22-3be3-4072-95f7-311094eac300	LOSE	Arka Gdynia	Wynik meczu (z wyłączeniem dogrywki)	3440645998	FOOTBALL	2023-04-01	Arka Gdynia - GKS Katowice	ENDED	Polska 1. liga	2.09	PREMATCH	58819d3e-d990-41da-ae2d-22da5f316aed
56b5077e-48cd-4601-942a-0747c484d5cd	LOSE	Freiburg	Wynik meczu (z wyłączeniem dogrywki)	3438262915	FOOTBALL	2023-04-01	Freiburg - Hertha Berlin	ENDED	Bundesliga	1.68	PREMATCH	58819d3e-d990-41da-ae2d-22da5f316aed
8f747c2b-f949-4c15-9d53-5542ec5dc825	LOSE	Marsylia	Wynik meczu (z wyłączeniem dogrywki)	3438259748	FOOTBALL	2023-03-31	Marsylia - Montpellier	ENDED	Ligue 1	1.54	PREMATCH	58819d3e-d990-41da-ae2d-22da5f316aed
e957941b-3dce-47c1-b8a5-e98d7e58cf1d	WIN	Slavia Praga	Wynik meczu (z wyłączeniem dogrywki)	3444323062	FOOTBALL	2023-04-01	Slavia Praga - Sigma Olomouc	ENDED	Czechy 1. liga	1.26	PREMATCH	58819d3e-d990-41da-ae2d-22da5f316aed
a4dbd932-c8c5-4e87-a977-902652270789	WIN	Barcelona	Wynik meczu (z wyłączeniem dogrywki)	3438262641	FOOTBALL	2023-04-01	Elche - Barcelona	ENDED	La Liga	1.36	PREMATCH	58819d3e-d990-41da-ae2d-22da5f316aed
d8250099-692b-4c81-84d2-6716a85bd2e1	WIN	Wisła Kraków	Wynik meczu (z wyłączeniem dogrywki)	3440645886	FOOTBALL	2023-04-01	Wisła Kraków - Chrobry Głogów	ENDED	Polska 1. liga	1.41	PREMATCH	58819d3e-d990-41da-ae2d-22da5f316aed
eac31468-c39c-4329-a5b4-ddd3e37a206d	LOSE	Chelsea	Wynik meczu (z wyłączeniem dogrywki)	3438263224	FOOTBALL	2023-04-01	Chelsea - Aston Villa	ENDED	Premier League	1.69	PREMATCH	3b17c83d-808f-4538-8087-7c237ada9058
62284e06-4ef3-4a93-9991-1f84ba665eaf	LOSE	Arka Gdynia	Wynik meczu (z wyłączeniem dogrywki)	3440645998	FOOTBALL	2023-04-01	Arka Gdynia - GKS Katowice	ENDED	Polska 1. liga	2.09	PREMATCH	3b17c83d-808f-4538-8087-7c237ada9058
61fb4442-e1b8-4fe7-ac2a-237c54387e02	WIN	Arsenal -1	Handicap	3438290074	FOOTBALL	2023-04-01	Arsenal - Leeds	ENDED	Premier League	1.78	PREMATCH	3b17c83d-808f-4538-8087-7c237ada9058
00fa79ad-f0af-4ebf-89c7-15ab3ae725a9	LOSE	Freiburg	Wynik meczu (z wyłączeniem dogrywki)	3438262915	FOOTBALL	2023-04-01	Freiburg - Hertha Berlin	ENDED	Bundesliga	1.68	PREMATCH	3b17c83d-808f-4538-8087-7c237ada9058
5ae5adae-9990-4b0c-95f0-81be4b131b90	WIN	Atalanta	Wynik meczu (z wyłączeniem dogrywki)	3438260306	FOOTBALL	2023-04-01	Cremonese - Atalanta	ENDED	Serie A	1.68	PREMATCH	3b17c83d-808f-4538-8087-7c237ada9058
ebaae032-3585-45ae-9f16-d12fe9fc2f29	LOSE	Eintracht Frankfurt	Wynik meczu (z wyłączeniem dogrywki)	3438284659	FOOTBALL	2023-03-31	Eintracht Frankfurt - Bochum	ENDED	Bundesliga	1.56	PREMATCH	3b17c83d-808f-4538-8087-7c237ada9058
d8c17ab0-42f8-4ff8-ab6a-efba43ef686f	WIN	Wisła Kraków	Wynik meczu (z wyłączeniem dogrywki)	3440645886	FOOTBALL	2023-04-01	Wisła Kraków - Chrobry Głogów	ENDED	Polska 1. liga	1.41	PREMATCH	3b17c83d-808f-4538-8087-7c237ada9058
2dc1776d-2496-4426-8a6f-ead995a44465	WIN	Slavia Praga	Wynik meczu (z wyłączeniem dogrywki)	3444323062	FOOTBALL	2023-04-01	Slavia Praga - Sigma Olomouc	ENDED	Czechy 1. liga	1.26	PREMATCH	3b17c83d-808f-4538-8087-7c237ada9058
b50aa589-4639-44f7-8dab-6c201854f9c7	LOSE	Marsylia	Wynik meczu (z wyłączeniem dogrywki)	3438259748	FOOTBALL	2023-03-31	Marsylia - Montpellier	ENDED	Ligue 1	1.54	PREMATCH	3b17c83d-808f-4538-8087-7c237ada9058
0665c422-d1d0-4829-b6a4-908da047979f	WIN	Juventus	Wynik meczu (z wyłączeniem dogrywki)	3438262725	FOOTBALL	2023-04-01	Juventus - Hellas Verona	ENDED	Serie A	1.44	PREMATCH	3b17c83d-808f-4538-8087-7c237ada9058
4605d756-e25c-43c5-8a6c-091fb3464fc0	WIN	Barcelona	Wynik meczu (z wyłączeniem dogrywki)	3438262641	FOOTBALL	2023-04-01	Elche - Barcelona	ENDED	La Liga	1.36	PREMATCH	3b17c83d-808f-4538-8087-7c237ada9058
bc211bef-63bb-4199-bf8c-76b71a6b07d2	LOSE	AZ	Wynik meczu (z wyłączeniem dogrywki)	3443751677	FOOTBALL	2023-04-01	AZ - Heerenveen	ENDED	Holandia Eredivisie	1.51	PREMATCH	3b17c83d-808f-4538-8087-7c237ada9058
4c5a03f4-9bf4-4f1d-8903-092f40cde03f	WIN	Atalanta	Wynik meczu (z wyłączeniem dogrywki)	3438260306	FOOTBALL	2023-04-01	Cremonese - Atalanta	ENDED	Serie A	1.68	PREMATCH	38afcfe5-a74d-40ea-a240-1586b0f18014
7d1d0985-7884-4ddc-a3a8-0f1535aeb2d4	WIN	Wisła Kraków	Wynik meczu (z wyłączeniem dogrywki)	3440645886	FOOTBALL	2023-04-01	Wisła Kraków - Chrobry Głogów	ENDED	Polska 1. liga	1.40	PREMATCH	38afcfe5-a74d-40ea-a240-1586b0f18014
92f08e32-fdf0-413c-9fa0-f673bbf4a71f	LOSE	Eintracht Frankfurt	Wynik meczu (z wyłączeniem dogrywki)	3438284659	FOOTBALL	2023-03-31	Eintracht Frankfurt - Bochum	ENDED	Bundesliga	1.50	PREMATCH	38afcfe5-a74d-40ea-a240-1586b0f18014
c3c87150-8437-4bae-990f-8dd2d63967e2	WIN	Juventus	Wynik meczu (z wyłączeniem dogrywki)	3438262725	FOOTBALL	2023-04-01	Juventus - Hellas Verona	ENDED	Serie A	1.43	PREMATCH	38afcfe5-a74d-40ea-a240-1586b0f18014
3e6d1e93-76a2-404d-a075-9982669c1d7e	LOSE	Chelsea	Wynik meczu (z wyłączeniem dogrywki)	3438263224	FOOTBALL	2023-04-01	Chelsea - Aston Villa	ENDED	Premier League	1.68	PREMATCH	38afcfe5-a74d-40ea-a240-1586b0f18014
edce43f2-233d-45d4-98ba-8f293eefe254	WIN	Slavia Praga	Wynik meczu (z wyłączeniem dogrywki)	3444323062	FOOTBALL	2023-04-01	Slavia Praga - Sigma Olomouc	ENDED	Czechy 1. liga	1.25	PREMATCH	38afcfe5-a74d-40ea-a240-1586b0f18014
fffe60bb-0094-459e-b730-4ed4b562fb88	WIN	Barcelona	Wynik meczu (z wyłączeniem dogrywki)	3438262641	FOOTBALL	2023-04-01	Elche - Barcelona	ENDED	La Liga	1.36	PREMATCH	38afcfe5-a74d-40ea-a240-1586b0f18014
80316fd6-764d-40fc-a89d-98e7a59edbb4	WIN	Arsenal	Wynik meczu (z wyłączeniem dogrywki)	3438289658	FOOTBALL	2023-04-01	Arsenal - Leeds	ENDED	Premier League	1.29	PREMATCH	38afcfe5-a74d-40ea-a240-1586b0f18014
15876fe9-884c-48e7-9052-6c3d6197abb7	LOSE	Freiburg	Wynik meczu (z wyłączeniem dogrywki)	3438262915	FOOTBALL	2023-04-01	Freiburg - Hertha Berlin	ENDED	Bundesliga	1.67	PREMATCH	38afcfe5-a74d-40ea-a240-1586b0f18014
9b38f9bb-707a-4104-ac2e-974e9b9e8d2c	LOSE	AZ	Wynik meczu (z wyłączeniem dogrywki)	3443751677	FOOTBALL	2023-04-01	AZ - Heerenveen	ENDED	Holandia Eredivisie	1.50	PREMATCH	38afcfe5-a74d-40ea-a240-1586b0f18014
1703167d-8d30-4ba4-9e13-b9b01ba35ed6	LOSE	Marsylia	Wynik meczu (z wyłączeniem dogrywki)	3438259748	FOOTBALL	2023-03-31	Marsylia - Montpellier	ENDED	Ligue 1	1.52	PREMATCH	38afcfe5-a74d-40ea-a240-1586b0f18014
c4885a76-f14a-4c16-9709-1dc97e29d472	LOSE	Eintracht Frankfurt	Wynik meczu (z wyłączeniem dogrywki)	3438284659	FOOTBALL	2023-03-31	Eintracht Frankfurt - Bochum	ENDED	Bundesliga	1.50	PREMATCH	6d5378a7-9c0e-4514-993d-b8f4a15686c5
a345e1ef-bb3c-4480-bf61-108c194fb85f	LOSE	Freiburg	Wynik meczu (z wyłączeniem dogrywki)	3438262915	FOOTBALL	2023-04-01	Freiburg - Hertha Berlin	ENDED	Bundesliga	1.67	PREMATCH	6d5378a7-9c0e-4514-993d-b8f4a15686c5
4503804d-5657-431c-8912-2e187a4f9f17	WIN	Arsenal -1	Handicap	3438290074	FOOTBALL	2023-04-01	Arsenal - Leeds	ENDED	Premier League	1.78	PREMATCH	6d5378a7-9c0e-4514-993d-b8f4a15686c5
a7ec3713-30be-4048-acf1-552ab33ba5eb	WIN	Barcelona	Wynik meczu (z wyłączeniem dogrywki)	3438262641	FOOTBALL	2023-04-01	Elche - Barcelona	ENDED	La Liga	1.36	PREMATCH	6d5378a7-9c0e-4514-993d-b8f4a15686c5
3f378f46-b2b3-4b6e-9215-15e05ef4daf6	LOSE	Marsylia	Wynik meczu (z wyłączeniem dogrywki)	3438259748	FOOTBALL	2023-03-31	Marsylia - Montpellier	ENDED	Ligue 1	1.52	PREMATCH	6d5378a7-9c0e-4514-993d-b8f4a15686c5
76b8c225-21d6-4642-8c7f-71fd89ccb30f	WIN	Slavia Praga	Wynik meczu (z wyłączeniem dogrywki)	3444323062	FOOTBALL	2023-04-01	Slavia Praga - Sigma Olomouc	ENDED	Czechy 1. liga	1.25	PREMATCH	6d5378a7-9c0e-4514-993d-b8f4a15686c5
f1502d6b-abc4-4ba4-9557-37f41066e1fa	WIN	Wisła Kraków	Wynik meczu (z wyłączeniem dogrywki)	3440645886	FOOTBALL	2023-04-01	Wisła Kraków - Chrobry Głogów	ENDED	Polska 1. liga	1.40	PREMATCH	6d5378a7-9c0e-4514-993d-b8f4a15686c5
1a8f8f91-6686-4deb-a443-21c06c92b189	WIN	Juventus	Wynik meczu (z wyłączeniem dogrywki)	3438262725	FOOTBALL	2023-04-01	Juventus - Hellas Verona	ENDED	Serie A	1.43	PREMATCH	6d5378a7-9c0e-4514-993d-b8f4a15686c5
3ea75b71-201f-4b61-826a-87a6431747cc	LOSE	AZ	Wynik meczu (z wyłączeniem dogrywki)	3443751677	FOOTBALL	2023-04-01	AZ - Heerenveen	ENDED	Holandia Eredivisie	1.50	PREMATCH	6d5378a7-9c0e-4514-993d-b8f4a15686c5
be510f47-ca27-4386-8613-e8a862e1ed5b	WIN	Barcelona	Wynik meczu (z wyłączeniem dogrywki)	3438262641	FOOTBALL	2023-04-01	Elche - Barcelona	ENDED	La Liga	1.36	PREMATCH	05abc0b7-3883-47b7-8c5c-5c549cc8c80b
dfac1a8c-2de5-441a-8d5b-0bdd43128118	LOSE	Chelsea	Wynik meczu (z wyłączeniem dogrywki)	3438263224	FOOTBALL	2023-04-01	Chelsea - Aston Villa	ENDED	Premier League	1.69	PREMATCH	05abc0b7-3883-47b7-8c5c-5c549cc8c80b
cf83cb40-0ab8-4e00-b434-bb648c9631cb	LOSE	Eintracht Frankfurt	Wynik meczu (z wyłączeniem dogrywki)	3438284659	FOOTBALL	2023-03-31	Eintracht Frankfurt - Bochum	ENDED	Bundesliga	1.54	PREMATCH	05abc0b7-3883-47b7-8c5c-5c549cc8c80b
539047c6-fd72-4870-bbfb-7c24efb6afa2	WIN	Wisła Kraków	Wynik meczu (z wyłączeniem dogrywki)	3440645886	FOOTBALL	2023-04-01	Wisła Kraków - Chrobry Głogów	ENDED	Polska 1. liga	1.41	PREMATCH	05abc0b7-3883-47b7-8c5c-5c549cc8c80b
ad2f27b6-08c2-4cb4-a933-63e9edaf0cb1	LOSE	Freiburg	Wynik meczu (z wyłączeniem dogrywki)	3438262915	FOOTBALL	2023-04-01	Freiburg - Hertha Berlin	ENDED	Bundesliga	1.66	PREMATCH	05abc0b7-3883-47b7-8c5c-5c549cc8c80b
901ca367-24bb-4d88-b17b-49ca00347889	WIN	Juventus	Wynik meczu (z wyłączeniem dogrywki)	3438262725	FOOTBALL	2023-04-01	Juventus - Hellas Verona	ENDED	Serie A	1.44	PREMATCH	05abc0b7-3883-47b7-8c5c-5c549cc8c80b
8dbd3504-ba2d-47d3-92aa-f39c4debb5f8	WIN	Atalanta	Wynik meczu (z wyłączeniem dogrywki)	3438260306	FOOTBALL	2023-04-01	Cremonese - Atalanta	ENDED	Serie A	1.68	PREMATCH	05abc0b7-3883-47b7-8c5c-5c549cc8c80b
fcc14d27-748e-4314-9270-08146cd4996a	LOSE	Arka Gdynia	Wynik meczu (z wyłączeniem dogrywki)	3440645998	FOOTBALL	2023-04-01	Arka Gdynia - GKS Katowice	ENDED	Polska 1. liga	1.92	PREMATCH	05abc0b7-3883-47b7-8c5c-5c549cc8c80b
8e9b8868-efa8-4439-933c-5d1fca721ca4	LOSE	AZ	Wynik meczu (z wyłączeniem dogrywki)	3443751677	FOOTBALL	2023-04-01	AZ - Heerenveen	ENDED	Holandia Eredivisie	1.50	PREMATCH	05abc0b7-3883-47b7-8c5c-5c549cc8c80b
d2959129-808d-4e3f-9d25-38b9e03df2c7	WIN	Arsenal -1	Handicap	3438290074	FOOTBALL	2023-04-01	Arsenal - Leeds	ENDED	Premier League	1.80	PREMATCH	05abc0b7-3883-47b7-8c5c-5c549cc8c80b
e4b048c0-ac08-4055-97b0-7f5d76dfc9cb	LOSE	Marsylia	Wynik meczu (z wyłączeniem dogrywki)	3438259748	FOOTBALL	2023-03-31	Marsylia - Montpellier	ENDED	Ligue 1	1.44	PREMATCH	05abc0b7-3883-47b7-8c5c-5c549cc8c80b
da06f653-a0e3-4bf0-ab94-8b509c495697	WIN	Slavia Praga	Wynik meczu (z wyłączeniem dogrywki)	3444323062	FOOTBALL	2023-04-01	Slavia Praga - Sigma Olomouc	ENDED	Czechy 1. liga	1.25	PREMATCH	05abc0b7-3883-47b7-8c5c-5c549cc8c80b
82218692-81fc-45fc-8b5c-c75c206b8e50	WIN	Barcelona	Wynik meczu (z wyłączeniem dogrywki)	3438262641	FOOTBALL	2023-04-01	Elche - Barcelona	ENDED	La Liga	1.36	PREMATCH	6873268a-d855-432c-929f-8548310d0d44
3e714790-9a26-44bd-9ca5-9141ff15683d	WIN	Arsenal -1	Handicap	3438290074	FOOTBALL	2023-04-01	Arsenal - Leeds	ENDED	Premier League	1.80	PREMATCH	6873268a-d855-432c-929f-8548310d0d44
4e4949e5-9bc1-422e-ae85-b49db61784c4	LOSE	Freiburg	Wynik meczu (z wyłączeniem dogrywki)	3438262915	FOOTBALL	2023-04-01	Freiburg - Hertha Berlin	ENDED	Bundesliga	1.66	PREMATCH	6873268a-d855-432c-929f-8548310d0d44
a4695b33-e028-4af3-89ff-f73178c18b8e	WIN	Slavia Praga	Wynik meczu (z wyłączeniem dogrywki)	3444323062	FOOTBALL	2023-04-01	Slavia Praga - Sigma Olomouc	ENDED	Czechy 1. liga	1.25	PREMATCH	6873268a-d855-432c-929f-8548310d0d44
a06a9217-6816-4f2c-b397-b792e9aa2aa1	LOSE	AZ	Wynik meczu (z wyłączeniem dogrywki)	3443751677	FOOTBALL	2023-04-01	AZ - Heerenveen	ENDED	Holandia Eredivisie	1.50	PREMATCH	6873268a-d855-432c-929f-8548310d0d44
1092d520-ce7e-4d9f-bb62-27293b912cc4	WIN	Wisła Kraków	Wynik meczu (z wyłączeniem dogrywki)	3440645886	FOOTBALL	2023-04-01	Wisła Kraków - Chrobry Głogów	ENDED	Polska 1. liga	1.41	PREMATCH	6873268a-d855-432c-929f-8548310d0d44
65095045-f7d1-4911-801f-77f24419ffa8	LOSE	Eintracht Frankfurt	Wynik meczu (z wyłączeniem dogrywki)	3438284659	FOOTBALL	2023-03-31	Eintracht Frankfurt - Bochum	ENDED	Bundesliga	1.54	PREMATCH	6873268a-d855-432c-929f-8548310d0d44
f89b9146-3c1f-4fcc-a660-1a5b8781c664	WIN	Atalanta	Wynik meczu (z wyłączeniem dogrywki)	3438260306	FOOTBALL	2023-04-01	Cremonese - Atalanta	ENDED	Serie A	1.68	PREMATCH	6873268a-d855-432c-929f-8548310d0d44
b74a8dd4-b0a4-4cff-9825-310f3c701f3f	LOSE	Chelsea	Wynik meczu (z wyłączeniem dogrywki)	3438263224	FOOTBALL	2023-04-01	Chelsea - Aston Villa	ENDED	Premier League	1.69	PREMATCH	6873268a-d855-432c-929f-8548310d0d44
34e5d84c-3039-4818-8b76-7eacdf72bd5a	LOSE	Arka Gdynia	Wynik meczu (z wyłączeniem dogrywki)	3440645998	FOOTBALL	2023-04-01	Arka Gdynia - GKS Katowice	ENDED	Polska 1. liga	1.92	PREMATCH	6873268a-d855-432c-929f-8548310d0d44
3d7943f0-6769-455d-a2a4-924663c5fd83	LOSE	Marsylia	Wynik meczu (z wyłączeniem dogrywki)	3438259748	FOOTBALL	2023-03-31	Marsylia - Montpellier	ENDED	Ligue 1	1.44	PREMATCH	6873268a-d855-432c-929f-8548310d0d44
28034da5-81f3-4eb1-9eec-dc7dbf6c22f7	WIN	Juventus	Wynik meczu (z wyłączeniem dogrywki)	3438262725	FOOTBALL	2023-04-01	Juventus - Hellas Verona	ENDED	Serie A	1.44	PREMATCH	6873268a-d855-432c-929f-8548310d0d44
d3892e81-05c9-4826-9f80-f3a482a06005	LOSE	Marsylia	Wynik meczu (z wyłączeniem dogrywki)	3438259748	FOOTBALL	2023-03-31	Marsylia - Montpellier	ENDED	Ligue 1	1.44	PREMATCH	a5428eb9-691a-43f0-bbf1-76f8e832837d
e12335d3-4c83-4548-90fd-51193139dd12	WIN	Juventus	Wynik meczu (z wyłączeniem dogrywki)	3438262725	FOOTBALL	2023-04-01	Juventus - Hellas Verona	ENDED	Serie A	1.44	PREMATCH	a5428eb9-691a-43f0-bbf1-76f8e832837d
b9386e6f-1583-4ec0-90de-eb8cbcc78689	LOSE	Arka Gdynia	Wynik meczu (z wyłączeniem dogrywki)	3440645998	FOOTBALL	2023-04-01	Arka Gdynia - GKS Katowice	ENDED	Polska 1. liga	1.92	PREMATCH	a5428eb9-691a-43f0-bbf1-76f8e832837d
ba5fb287-e9d6-42ac-88eb-cedb851a6573	WIN	Arsenal -1	Handicap	3438290074	FOOTBALL	2023-04-01	Arsenal - Leeds	ENDED	Premier League	1.80	PREMATCH	a5428eb9-691a-43f0-bbf1-76f8e832837d
cc693ae2-523c-485c-9e51-c301ad0ebef9	WIN	Wisła Kraków	Wynik meczu (z wyłączeniem dogrywki)	3440645886	FOOTBALL	2023-04-01	Wisła Kraków - Chrobry Głogów	ENDED	Polska 1. liga	1.41	PREMATCH	a5428eb9-691a-43f0-bbf1-76f8e832837d
92350be8-8fc8-4a6e-8dd2-ad43f5ea1531	LOSE	Freiburg	Wynik meczu (z wyłączeniem dogrywki)	3438262915	FOOTBALL	2023-04-01	Freiburg - Hertha Berlin	ENDED	Bundesliga	1.66	PREMATCH	a5428eb9-691a-43f0-bbf1-76f8e832837d
25e21b0d-4a63-49ad-8ee8-7d84cad47dcd	WIN	Slavia Praga	Wynik meczu (z wyłączeniem dogrywki)	3444323062	FOOTBALL	2023-04-01	Slavia Praga - Sigma Olomouc	ENDED	Czechy 1. liga	1.25	PREMATCH	a5428eb9-691a-43f0-bbf1-76f8e832837d
18f9040f-e2fb-4461-976d-693b5783d713	WIN	Barcelona	Wynik meczu (z wyłączeniem dogrywki)	3438262641	FOOTBALL	2023-04-01	Elche - Barcelona	ENDED	La Liga	1.36	PREMATCH	a5428eb9-691a-43f0-bbf1-76f8e832837d
b65cd9b8-a133-458b-8c61-c6b83ac06b35	WIN	Atalanta	Wynik meczu (z wyłączeniem dogrywki)	3438260306	FOOTBALL	2023-04-01	Cremonese - Atalanta	ENDED	Serie A	1.68	PREMATCH	a5428eb9-691a-43f0-bbf1-76f8e832837d
30d7b6c9-cdef-41fc-8422-1ea0c84ccce9	LOSE	Eintracht Frankfurt	Wynik meczu (z wyłączeniem dogrywki)	3438284659	FOOTBALL	2023-03-31	Eintracht Frankfurt - Bochum	ENDED	Bundesliga	1.54	PREMATCH	a5428eb9-691a-43f0-bbf1-76f8e832837d
e3e15568-3f2b-4382-a4a2-2bc0aad14f09	LOSE	Dominik Szoboszlai	Strzelec	3526530482	FOOTBALL	2023-08-13	Chelsea - Liverpool	ENDED	Premier League	5.80	PREMATCH	842d5b26-1b7b-4775-8f17-190ad7d96c0b
bd0c9033-7652-4553-b1a4-93649f34b23b	LOSE	Liverpool i powyżej 3.5	Wynik i gole	3500393316	FOOTBALL	2023-08-13	Chelsea - Liverpool	ENDED	Premier League	5.00	PREMATCH	aa0e824b-fe84-488a-a260-7c51c63e8638
b79854e4-4765-4abd-84e7-3ff5027ce7e4	LOSE	Legia Warszawa	Wynik meczu (z wyłączeniem dogrywki)	3523312216	FOOTBALL	2023-08-13	Puszcza Niepołomice - Legia Warszawa	ENDED	Ekstraklasa	1.71	PREMATCH	7dccb450-46f1-4a8c-a08a-256fb96a91b1
3c16f23a-baa9-4316-ab3b-eb52a4ec343d	LOSE	Montpellier	Wynik meczu (z wyłączeniem dogrywki)	3508130198	FOOTBALL	2023-08-13	Montpellier - Le Havre	ENDED	Ligue 1	1.72	LIVE	7dccb450-46f1-4a8c-a08a-256fb96a91b1
75a07b79-930a-4220-b4d6-7673d37f29a4	WIN	Rennes	Wynik meczu (z wyłączeniem dogrywki)	3508114488	FOOTBALL	2023-08-13	Rennes - Metz	ENDED	Ligue 1	1.63	PREMATCH	7dccb450-46f1-4a8c-a08a-256fb96a91b1
4d2528b0-da82-47a5-bc82-358c0065fd09	WIN	Remis lub RKS Radomiak	Podwójna szansa	3523312273	FOOTBALL	2023-08-13	Pogoń Szczecin - RKS Radomiak	ENDED	Ekstraklasa	1.85	LIVE	7dccb450-46f1-4a8c-a08a-256fb96a91b1
da339034-122e-4d87-a311-04eb556608c1	LOSE	Feyenoord	Wynik meczu (z wyłączeniem dogrywki)	3509552420	FOOTBALL	2023-08-13	Feyenoord - Fortuna Sittard	ENDED	Holandia Eredivisie	1.21	PREMATCH	53e43c4e-3a0b-44d4-a451-3364c915652e
e44dd004-4b1e-4ff9-ba01-353659d8ae8e	WIN	Rennes	Wynik meczu (z wyłączeniem dogrywki)	3508114488	FOOTBALL	2023-08-13	Rennes - Metz	ENDED	Ligue 1	1.62	PREMATCH	53e43c4e-3a0b-44d4-a451-3364c915652e
a97ef99b-d793-4ed6-b376-ef7666b5e49e	LOSE	Legia Warszawa	Wynik meczu (z wyłączeniem dogrywki)	3523312216	FOOTBALL	2023-08-13	Puszcza Niepołomice - Legia Warszawa	ENDED	Ekstraklasa	1.71	PREMATCH	53e43c4e-3a0b-44d4-a451-3364c915652e
b469dad3-3565-4058-8db4-6f589187a899	WIN	Remis lub RKS Radomiak	Podwójna szansa	3523312273	FOOTBALL	2023-08-13	Pogoń Szczecin - RKS Radomiak	ENDED	Ekstraklasa	1.82	PREMATCH	53e43c4e-3a0b-44d4-a451-3364c915652e
2c292c92-571f-4c5b-b6e1-d910a1d807df	LOSE	Montpellier	Wynik meczu (z wyłączeniem dogrywki)	3508130198	FOOTBALL	2023-08-13	Montpellier - Le Havre	ENDED	Ligue 1	1.80	PREMATCH	53e43c4e-3a0b-44d4-a451-3364c915652e
c0da006d-f053-4821-aea1-5dc785cac00f	LOSE	Paris Saint-Germain	Wynik meczu (z wyłączeniem dogrywki)	3508114736	FOOTBALL	2023-08-12	Paris Saint-Germain - Lorient	ENDED	Ligue 1	1.40	PREMATCH	5511b84a-074d-4446-bfdd-c43d3bfde77f
bc89c523-3513-4863-959a-16c14c0334b8	WIN	Union Saint-Gilloise	Wynik meczu (z wyłączeniem dogrywki)	3525745122	FOOTBALL	2023-08-12	Union Saint-Gilloise - Oud-Heverlee Leuven	ENDED	Belgia 1. liga	1.51	PREMATCH	5511b84a-074d-4446-bfdd-c43d3bfde77f
19407a6c-67e1-401c-b600-e6cb3f8bb00c	WIN	Ajax	Wynik meczu (z wyłączeniem dogrywki)	3509551212	FOOTBALL	2023-08-12	Ajax - Heracles	ENDED	Holandia Eredivisie	1.22	PREMATCH	5511b84a-074d-4446-bfdd-c43d3bfde77f
f7ff5764-b39e-44e5-927e-e4c509de3cc7	WIN	Brighton	Wynik meczu (z wyłączeniem dogrywki)	3500389849	FOOTBALL	2023-08-12	Brighton - Luton	ENDED	Premier League	1.24	LIVE	5511b84a-074d-4446-bfdd-c43d3bfde77f
16885150-b140-4b79-b043-c1e8c157c578	LOSE	Arsenal -1	Handicap	3500388398	FOOTBALL	2023-08-12	Arsenal - Nottingham Forest	ENDED	Premier League	1.54	PREMATCH	103ff501-80e5-48ba-83b4-a238ce67116b
b4d8388c-1130-4123-aff5-a232687fc5ac	WIN	Brighton	Wynik meczu (z wyłączeniem dogrywki)	3500389849	FOOTBALL	2023-08-12	Brighton - Luton	ENDED	Premier League	1.32	PREMATCH	103ff501-80e5-48ba-83b4-a238ce67116b
7924e567-2d95-4c8c-9f08-cf3f85976fef	LOSE	Paris Saint-Germain	Wynik meczu (z wyłączeniem dogrywki)	3508114736	FOOTBALL	2023-08-12	Paris Saint-Germain - Lorient	ENDED	Ligue 1	1.41	PREMATCH	103ff501-80e5-48ba-83b4-a238ce67116b
d4224076-09e3-4bdb-8d94-1e1ee29792f0	WIN	Ajax -1	Handicap	3509551757	FOOTBALL	2023-08-12	Ajax - Heracles	ENDED	Holandia Eredivisie	1.50	PREMATCH	103ff501-80e5-48ba-83b4-a238ce67116b
7fa7bb26-74e2-4907-a8bc-7fdf4d246d28	WIN	Union Saint-Gilloise	Wynik meczu (z wyłączeniem dogrywki)	3525745122	FOOTBALL	2023-08-12	Union Saint-Gilloise - Oud-Heverlee Leuven	ENDED	Belgia 1. liga	1.49	PREMATCH	103ff501-80e5-48ba-83b4-a238ce67116b
be493059-3e9c-436a-b9ae-a50dfa5de9a2	WIN	Brighton	Wynik meczu (z wyłączeniem dogrywki)	3500389849	FOOTBALL	2023-08-12	Brighton - Luton	ENDED	Premier League	1.32	PREMATCH	12820b21-13e7-4cb3-9a9a-13ae938872d0
f90b4933-9e85-4994-b99a-60e6e4b1bf5b	LOSE	Arsenal -1	Handicap	3500388398	FOOTBALL	2023-08-12	Arsenal - Nottingham Forest	ENDED	Premier League	1.54	PREMATCH	12820b21-13e7-4cb3-9a9a-13ae938872d0
69cb6a5f-0b26-4c10-942f-c0bc98cbf98d	WIN	Union Saint-Gilloise	Wynik meczu (z wyłączeniem dogrywki)	3525745122	FOOTBALL	2023-08-12	Union Saint-Gilloise - Oud-Heverlee Leuven	ENDED	Belgia 1. liga	1.49	PREMATCH	12820b21-13e7-4cb3-9a9a-13ae938872d0
5c7c4007-457f-4ed4-888e-b4b57365f89b	LOSE	Arsenal -3	Handicap	3500388407	FOOTBALL	2023-08-12	Arsenal - Nottingham Forest	ENDED	Premier League	4.40	PREMATCH	c82b9ad9-5030-4f26-944b-0b6d318d7fa6
b586956a-f025-43e7-acc3-16693409944f	LOSE	Sporting Braga	Wynik meczu (z wyłączeniem dogrywki)	3509940650	FOOTBALL	2023-08-11	Sporting Braga - Famalicao	ENDED	Liga Portugal Betclic	1.48	PREMATCH	af4ac91a-74e6-4616-b485-db86d210f5d4
d8a403f8-9b13-46a8-8222-7437e75ce52b	WIN	Powyżej 2,5	Gole Powyżej/Poniżej	3500387593	FOOTBALL	2023-08-11	Burnley - Manchester City	ENDED	Premier League	1.68	PREMATCH	af4ac91a-74e6-4616-b485-db86d210f5d4
c5ef4add-16f3-4de9-b3cf-e1faa7925be6	WIN	Piast Gliwice lub Remis	Podwójna szansa	3523309720	FOOTBALL	2023-08-11	Piast Gliwice - Raków Częstochowa	ENDED	Ekstraklasa	1.55	PREMATCH	af4ac91a-74e6-4616-b485-db86d210f5d4
92248651-ac5d-4d6a-a4a1-db867dc447e0	WIN	Sheriff Tiraspol	Wynik meczu (z wyłączeniem dogrywki)	3524139954	FOOTBALL	2023-08-10	Sheriff Tiraspol - BATE Borysow	ENDED	Liga Europy	1.62	PREMATCH	d10b4298-6e09-47dc-b8ef-818da9eb5d4b
4f414612-a0c7-40e1-bcdb-77c417c9107a	WIN	Lech Poznań	Wynik meczu (z wyłączeniem dogrywki)	3526433875	FOOTBALL	2023-08-10	Lech Poznań - Spartak Trnava	ENDED	Liga Konferencji Europy	1.32	PREMATCH	d10b4298-6e09-47dc-b8ef-818da9eb5d4b
dbaf6755-8f2e-4e21-8734-0097d5819ab4	LOSE	Legia Warszawa	Wynik meczu (z wyłączeniem dogrywki)	3526419795	FOOTBALL	2023-08-10	Legia Warszawa - Austria Wiedeń	ENDED	Liga Konferencji Europy	1.74	PREMATCH	d10b4298-6e09-47dc-b8ef-818da9eb5d4b
1ee169be-f5b7-4a41-a84e-90c3d634c956	WIN	Raków Częstochowa i powyżej 2.5	Wynik i gole	3524349992	FOOTBALL	2023-08-08	Raków Częstochowa - Aris Limassol	ENDED	Liga Mistrzów	3.25	PREMATCH	2ad72f63-386c-4ab3-8adf-d3ab92e12291
f0a051ab-67e1-415f-b083-08fdaa6490f8	LOSE	Marcin Cebula	Strzelec	3527049055	FOOTBALL	2023-08-08	Raków Częstochowa - Aris Limassol	ENDED	Liga Mistrzów	4.10	PREMATCH	21498510-a0cc-45bb-8601-01ede99e1bed
bc11a34c-2c16-4a1a-ad9f-e1a1f7f05628	WIN	BetMaker	BetMaker	163157313	FOOTBALL	2023-08-06	Legia Warszawa - Ruch Chorzów	ENDED	Ekstraklasa	2.02	PREMATCH	fc46a66c-9587-4743-928d-01f021996792
5ee0d9cb-a02c-48fc-adc3-556602e11315	LOSE	Bukayo Saka	Strzelec	3523777338	FOOTBALL	2023-08-06	Manchester City - Arsenal	ENDED	Anglia Tarcza Wsp.	4.80	PREMATCH	0590cd77-cb99-4092-bea4-26417ce524c7
16fc2f51-c31a-4130-83e3-1a9cc26cbf1e	LOSE	Arsenal	Wynik meczu (z wyłączeniem dogrywki)	3516713843	FOOTBALL	2023-08-06	Manchester City - Arsenal	ENDED	Anglia Tarcza Wsp.	3.70	PREMATCH	12761e21-b0ce-4905-97ba-1f8851fb27b3
0b14ebc9-12b4-4995-b2f0-eeb5452bb3cc	WIN	Sparta Praga -1	Handicap	3520476223	FOOTBALL	2023-08-05	Sparta Praga - FK Pardubice	ENDED	Czechy 1. liga	1.47	PREMATCH	46441ee9-b648-46d5-948e-be8ac46e61c9
f143f3da-6961-44b0-bc5b-04b5efe59bd8	LOSE	Oud-Heverlee Leuven	Wynik meczu (z wyłączeniem dogrywki)	3522149412	FOOTBALL	2023-08-05	Oud-Heverlee Leuven - RWD Molenbeek	ENDED	Belgia 1. liga	1.82	PREMATCH	46441ee9-b648-46d5-948e-be8ac46e61c9
a0a3ceec-425c-4953-8d0f-bcc334c526a7	LOSE	Poniżej 2,5	Gole Powyżej/Poniżej	3522253576	FOOTBALL	2023-08-05	Raków Częstochowa - Warta Poznań	ENDED	Ekstraklasa	1.65	PREMATCH	46441ee9-b648-46d5-948e-be8ac46e61c9
a9826424-462e-4975-81de-724c097d1c2f	LOSE	Genk	Wynik meczu (z wyłączeniem dogrywki)	3519392270	FOOTBALL	2023-08-05	Genk - Eupen	ENDED	Belgia 1. liga	1.28	PREMATCH	46441ee9-b648-46d5-948e-be8ac46e61c9
4f3ab90d-4bb2-4843-bd1b-b4ad064c23d0	LOSE	Wisła Kraków	Wynik meczu (z wyłączeniem dogrywki)	3521649214	FOOTBALL	2023-08-05	Wisła Kraków - Stal Rzeszów	ENDED	Polska 1. liga	1.43	PREMATCH	46441ee9-b648-46d5-948e-be8ac46e61c9
2284fd36-61c5-4d3c-b8a5-66a17c43e16b	LOSE	Legia Warszawa -1	Handicap	3521912469	FOOTBALL	2023-08-03	Legia Warszawa - Ordabasy	ENDED	Liga Konferencji Europy	1.96	PREMATCH	40f22aa9-9c07-46a2-b39c-66b878cfcc42
502f21b2-e337-4a33-8bb2-8327caaca495	WIN	Lech Poznań	Wynik meczu (z wyłączeniem dogrywki)	3511980449	FOOTBALL	2023-07-30	Lech Poznań - RKS Radomiak	ENDED	Ekstraklasa	1.82	PREMATCH	a4bd95b7-0735-4dad-bd05-8049e9670780
ee625ab4-22c7-4baa-b7d4-473bbc3860dd	LOSE	Young Boys	Wynik meczu (z wyłączeniem dogrywki)	3518771336	FOOTBALL	2023-07-30	Yverdon - Young Boys	ENDED	Szwajcaria Superliga	1.34	PREMATCH	a4bd95b7-0735-4dad-bd05-8049e9670780
fabd27fb-fc47-4d78-919c-8f587ee4e074	WIN	Odra Opole	Wynik meczu (z wyłączeniem dogrywki)	3518090474	FOOTBALL	2023-07-30	Odra Opole - Resovia Rzeszów	ENDED	Polska 1. liga	2.11	PREMATCH	a4bd95b7-0735-4dad-bd05-8049e9670780
99c0d53e-9c3a-43f0-832e-f2db4069849b	WIN	Slavia Praga	Wynik meczu (z wyłączeniem dogrywki)	3514970334	FOOTBALL	2023-07-30	Ceske Budejovice - Slavia Praga	ENDED	Czechy 1. liga	1.25	PREMATCH	a4bd95b7-0735-4dad-bd05-8049e9670780
a8cd8b04-79a0-4df9-a7fc-66928fb133b6	WIN	Pogoń Szczecin	Wynik meczu (z wyłączeniem dogrywki)	3511982090	FOOTBALL	2023-07-30	Pogoń Szczecin - Widzew Łódź	ENDED	Ekstraklasa	1.62	PREMATCH	a4bd95b7-0735-4dad-bd05-8049e9670780
8b74fa87-1824-411b-b4b2-6abe6964bd4d	WIN	Lech Poznań	Wynik meczu (z wyłączeniem dogrywki)	3511980449	FOOTBALL	2023-07-30	Lech Poznań - RKS Radomiak	ENDED	Ekstraklasa	1.82	PREMATCH	2bfc81d1-3e34-4e66-8ec7-d33a1858ee42
83347948-84e3-48ca-816d-9648c9b5b8b9	WIN	Wisła Kraków	Wynik meczu (z wyłączeniem dogrywki)	3518096844	FOOTBALL	2023-07-30	Polonia Warszawa - Wisła Kraków	ENDED	Polska 1. liga	1.71	PREMATCH	2bfc81d1-3e34-4e66-8ec7-d33a1858ee42
bc68538b-81de-47cf-9cb7-0b06c5889576	WIN	Slavia Praga	Wynik meczu (z wyłączeniem dogrywki)	3514970334	FOOTBALL	2023-07-30	Ceske Budejovice - Slavia Praga	ENDED	Czechy 1. liga	1.28	PREMATCH	2bfc81d1-3e34-4e66-8ec7-d33a1858ee42
92313eaf-b979-4b3c-8e10-8b6608090539	LOSE	Young Boys	Wynik meczu (z wyłączeniem dogrywki)	3518771336	FOOTBALL	2023-07-30	Yverdon - Young Boys	ENDED	Szwajcaria Superliga	1.35	PREMATCH	2bfc81d1-3e34-4e66-8ec7-d33a1858ee42
0ae9d08d-5e0a-4a95-b600-4b887800e879	WIN	Slavia Praga	Wynik meczu (z wyłączeniem dogrywki)	3514970334	FOOTBALL	2023-07-30	Ceske Budejovice - Slavia Praga	ENDED	Czechy 1. liga	1.28	PREMATCH	0db2ac5e-ecfc-48d7-bff0-0ca010243026
387c9b68-fde9-4f3c-8160-31e1f62feead	WIN	Wisła Kraków	Wynik meczu (z wyłączeniem dogrywki)	3518096844	FOOTBALL	2023-07-30	Polonia Warszawa - Wisła Kraków	ENDED	Polska 1. liga	1.71	PREMATCH	0db2ac5e-ecfc-48d7-bff0-0ca010243026
9b9b38fb-c822-41a2-8f92-e383c4ef00b7	WIN	Lech Poznań	Wynik meczu (z wyłączeniem dogrywki)	3511980449	FOOTBALL	2023-07-30	Lech Poznań - RKS Radomiak	ENDED	Ekstraklasa	1.82	PREMATCH	0db2ac5e-ecfc-48d7-bff0-0ca010243026
790abe47-cb5e-4cd9-89a8-9d87103dd779	WIN	Odra Opole	Wynik meczu (z wyłączeniem dogrywki)	3518090474	FOOTBALL	2023-07-30	Odra Opole - Resovia Rzeszów	ENDED	Polska 1. liga	2.10	PREMATCH	0db2ac5e-ecfc-48d7-bff0-0ca010243026
3cff82f3-622a-4bac-9fba-d73cdf68f455	LOSE	Young Boys	Wynik meczu (z wyłączeniem dogrywki)	3518771336	FOOTBALL	2023-07-30	Yverdon - Young Boys	ENDED	Szwajcaria Superliga	1.35	PREMATCH	0db2ac5e-ecfc-48d7-bff0-0ca010243026
856fb20c-6f5d-4fa8-ba55-1c583154bfba	WIN	Pogoń Szczecin	Wynik meczu (z wyłączeniem dogrywki)	3511982090	FOOTBALL	2023-07-30	Pogoń Szczecin - Widzew Łódź	ENDED	Ekstraklasa	1.62	PREMATCH	0db2ac5e-ecfc-48d7-bff0-0ca010243026
3c89b17a-48b0-4658-be40-c331b8c75909	WIN	Sparta Praga	Wynik meczu (z wyłączeniem dogrywki)	3514970434	FOOTBALL	2023-07-29	Fastav Zlín - Sparta Praga	ENDED	Czechy 1. liga	1.40	PREMATCH	1492c02b-767e-4e74-8f31-fe6df899f7c8
78e1aa21-758c-4157-b88d-105c1e201093	WIN	KGHM Zagłębie Lubin	Wynik meczu (z wyłączeniem dogrywki)	3511980475	FOOTBALL	2023-07-29	Śląsk Wrocław - KGHM Zagłębie Lubin	ENDED	Ekstraklasa	2.90	PREMATCH	1492c02b-767e-4e74-8f31-fe6df899f7c8
4c84021a-4018-42e9-adc3-23aa9c28e580	LOSE	Termalica Bruk-Bet Nieciecza	Wynik meczu (z wyłączeniem dogrywki)	3518091195	FOOTBALL	2023-07-29	Termalica Bruk-Bet Nieciecza - Miedź Legnica	ENDED	Polska 1. liga	2.26	PREMATCH	1492c02b-767e-4e74-8f31-fe6df899f7c8
7d29218e-b7f2-486b-a58b-d1eed107dd69	WIN	Lech Poznań i powyżej 3.5	Wynik i gole	3517130547	FOOTBALL	2023-07-27	Lech Poznań - Zalgiris Kaunas	ENDED	Liga Konferencji Europy	2.79	PREMATCH	7fd276ce-8ea7-4843-9ab2-21e92e04985b
2090d8c5-baee-4da5-879c-254e1714015d	WIN	Maccabi Tel-Aviv	Wynik meczu (z wyłączeniem dogrywki)	3518414362	FOOTBALL	2023-07-27	Maccabi Tel-Aviv - FC Petrocub	ENDED	Liga Konferencji Europy	1.19	PREMATCH	41bd2a90-b680-4242-9d25-5d6af12cb003
8b3e67d3-a57f-4466-89ab-f3719773f94b	LOSE	FC Basel	Wynik meczu (z wyłączeniem dogrywki)	3517827213	FOOTBALL	2023-07-27	FC Basel - Tobol Kostanay	ENDED	Liga Konferencji Europy	1.35	PREMATCH	41bd2a90-b680-4242-9d25-5d6af12cb003
d54db709-57e3-46e4-9705-ce72f194acf6	LOSE	Viktoria Pilzno	Wynik meczu (z wyłączeniem dogrywki)	3507014791	FOOTBALL	2023-07-27	Viktoria Plzen - KF Drita	ENDED	Liga Konferencji Europy	1.16	PREMATCH	41bd2a90-b680-4242-9d25-5d6af12cb003
9a59b9b6-0ef2-4788-850d-f1e49e8dc893	WIN	Twente	Wynik meczu (z wyłączeniem dogrywki)	3517538145	FOOTBALL	2023-07-27	Twente - Hammarby	ENDED	Liga Konferencji Europy	1.27	PREMATCH	41bd2a90-b680-4242-9d25-5d6af12cb003
2c82996e-9a66-4c3a-a83e-c183ee0feac6	WIN	Besiktas	Wynik meczu (z wyłączeniem dogrywki)	3517408955	FOOTBALL	2023-07-27	Besiktas - Tirana	ENDED	Liga Konferencji Europy	1.17	PREMATCH	41bd2a90-b680-4242-9d25-5d6af12cb003
272f6f94-26f9-40c1-a9d9-b971b1c56262	WIN	Maccabi Tel-Aviv -1	Handicap	3518465465	FOOTBALL	2023-07-27	Maccabi Tel-Aviv - FC Petrocub	ENDED	Liga Konferencji Europy	1.51	PREMATCH	0352af6f-e989-42d9-8a00-c6477eed1e69
8d8768b1-6901-4fd2-a608-679626ca3235	LOSE	Viktoria Pilzno -1	Handicap	3518423970	FOOTBALL	2023-07-27	Viktoria Plzen - KF Drita	ENDED	Liga Konferencji Europy	1.55	PREMATCH	0352af6f-e989-42d9-8a00-c6477eed1e69
7bb45f3e-52b9-4b94-ba04-5382f4eb4a35	LOSE	FC Basel	Wynik meczu (z wyłączeniem dogrywki)	3517827213	FOOTBALL	2023-07-27	FC Basel - Tobol Kostanay	ENDED	Liga Konferencji Europy	1.41	PREMATCH	0352af6f-e989-42d9-8a00-c6477eed1e69
96e933e7-bb5a-4ae9-8cfd-d058f8e90b84	LOSE	Twente -1	Handicap	3518470182	FOOTBALL	2023-07-27	Twente - Hammarby	ENDED	Liga Konferencji Europy	1.69	PREMATCH	0352af6f-e989-42d9-8a00-c6477eed1e69
e37760ae-3ca1-4bde-81b2-cd81e3d78f27	WIN	Besiktas -1	Handicap	3518498168	FOOTBALL	2023-07-27	Besiktas - Tirana	ENDED	Liga Konferencji Europy	1.43	PREMATCH	0352af6f-e989-42d9-8a00-c6477eed1e69
16bb95c0-0902-4c95-b41b-077225f93da3	WIN	Raków Częstochowa	Wynik meczu (z wyłączeniem dogrywki)	3516823906	FOOTBALL	2023-07-26	Raków Częstochowa - Qarabağ	ENDED	Liga Mistrzów	2.08	PREMATCH	c2b459d6-0a9f-4899-b45e-6ada5c92a769
3c61a1b2-f71c-4d5b-af6e-b9161e73417c	LOSE	1 - 0	Dokładny wynik	3517087090	FOOTBALL	2023-07-26	Raków Częstochowa - Qarabağ	ENDED	Liga Mistrzów	6.20	PREMATCH	e1d2061d-2bbe-4660-90a4-ef4c8a84d4c7
29dc0da0-53e2-454e-abef-2df6995f6999	LOSE	Powyżej 2,5	Gole Powyżej/Poniżej	3508702123	FOOTBALL	2023-07-24	Korona Kielce - Slask Wroclaw	ENDED	Ekstraklasa	2.05	LIVE	1fa2590f-0c07-4737-a35d-120a19d2eb08
e74d63ca-c956-40b9-88a0-02df5a13855d	LOSE	Widzew Łódź -1	Handicap	3508703224	FOOTBALL	2023-07-23	Widzew Łódź - Puszcza Niepołomice	ENDED	Ekstraklasa	3.60	LIVE	cbef1ae9-fcc6-4955-994e-3ba4b31aab17
5e747c45-3fbd-4b30-b692-dbd262a07f03	WIN	Miedź Legnica	Wynik meczu (z wyłączeniem dogrywki)	3508409634	FOOTBALL	2023-07-23	Miedź Legnica - GKS Katowice	ENDED	Polska 1. liga	2.16	PREMATCH	2cd97e88-a5b0-4cc1-9dcf-d33d6271c264
1030ef9c-d1b5-4f0f-bc32-7c9460ba958c	WIN	KGHM Zagłębie Lubin	Wynik meczu (z wyłączeniem dogrywki)	3503387140	FOOTBALL	2023-07-23	KGHM Zagłębie Lubin - Ruch Chorzów	ENDED	Ekstraklasa	1.87	PREMATCH	2cd97e88-a5b0-4cc1-9dcf-d33d6271c264
70da4539-3b7c-48a0-9db1-6eabb9c6282c	WIN	Bodø/Glimt	Wynik meczu (z wyłączeniem dogrywki)	3512009679	FOOTBALL	2023-07-23	Sandefjord - Bodø/Glimt	ENDED	Norwegia Eliteserien	1.31	PREMATCH	2cd97e88-a5b0-4cc1-9dcf-d33d6271c264
cc86d69f-1467-4c0d-bfba-df4235d4fb5d	WIN	Sparta Praga	Wynik meczu (z wyłączeniem dogrywki)	3505539036	FOOTBALL	2023-07-23	Sparta Praga - Sigma Olomouc	ENDED	Czechy 1. liga	1.43	PREMATCH	2cd97e88-a5b0-4cc1-9dcf-d33d6271c264
7034bc07-2444-481a-9a75-62230df78ca5	WIN	Bohemians 1905	Wynik meczu (z wyłączeniem dogrywki)	3503997123	FOOTBALL	2023-07-22	FK Pardubice - Bohemians 1905	ENDED	Czechy 1. liga	2.26	PREMATCH	a7a7c30a-cf43-4668-9da3-a79efb2f74b2
09ea841d-8a12-4335-a741-e6b9aab8c4a2	LOSE	Chrobry Głogów	Wynik meczu (z wyłączeniem dogrywki)	3508409660	FOOTBALL	2023-07-22	Chrobry Głogów - Lechia Gdańsk	ENDED	Polska 1. liga	2.55	PREMATCH	a7a7c30a-cf43-4668-9da3-a79efb2f74b2
790861ed-a623-42e2-bb84-44f95fe05a26	LOSE	Chrobry Głogów	Wynik meczu (z wyłączeniem dogrywki)	3508409660	FOOTBALL	2023-07-22	Chrobry Głogów - Lechia Gdańsk	ENDED	Polska 1. liga	2.55	PREMATCH	530a7780-0bcd-4d53-9f6c-dae027efd02a
782ee427-528f-450c-8109-3cd6c9c4f031	WIN	Bohemians 1905	Wynik meczu (z wyłączeniem dogrywki)	3503997123	FOOTBALL	2023-07-22	FK Pardubice - Bohemians 1905	ENDED	Czechy 1. liga	2.26	PREMATCH	530a7780-0bcd-4d53-9f6c-dae027efd02a
a8ea7652-9c8e-4683-be51-7db50f128aef	LOSE	Wisła Kraków	Wynik meczu (z wyłączeniem dogrywki)	3508409626	FOOTBALL	2023-07-22	Górnik Łęczna - Wisła Kraków	ENDED	Polska 1. liga	1.72	PREMATCH	530a7780-0bcd-4d53-9f6c-dae027efd02a
8ce922f1-c738-475e-9f36-3b89f110ad91	WIN	Poniżej 2,5	Gole Powyżej/Poniżej	3508593565	FOOTBALL	2023-07-21	Warta Poznań - Pogoń Szczecin	ENDED	Ekstraklasa	1.75	PREMATCH	7360da1e-4419-4544-86c3-86e8cb7724a5
3e795ba9-0b8f-48a7-9722-136ac061a992	WIN	Legia Warszawa	Wynik meczu (z wyłączeniem dogrywki)	3504508719	FOOTBALL	2023-07-21	Legia Warszawa - ŁKS Łódź	ENDED	Ekstraklasa	1.37	PREMATCH	7360da1e-4419-4544-86c3-86e8cb7724a5
4d1f62c0-8bdf-465b-9b7a-f78d6fd23e34	LOSE	0 - 2	Wynik w setach	3513608918	TENNIS	2023-07-15	Marketa Vondrousova - Ons Jabeur	ENDED	Wimbledon K.	2.08	PREMATCH	d23e45c7-c572-4f5d-9bc3-a2a02cb4844b
5412a386-fac0-44ee-8e56-537a57977a28	WIN	Iga Świątek	Zwycięzca meczu	3510690332	TENNIS	2023-07-09	Iga Swiatek - Belinda Bencic	ENDED	Wimbledon K.	1.85	LIVE	14554e28-6cd8-48e0-9930-08b42d7c9e91
1fd7919f-ad0c-4333-a804-805cf0b61de0	LOSE	Hubert Hurkacz	Zwycięzca meczu	3510731038	TENNIS	2023-07-09	Hubert Hurkacz - Novak Djokovic	ENDED	Wimbledon M.	9.80	PREMATCH	14554e28-6cd8-48e0-9930-08b42d7c9e91
\.


--
-- Data for Name: combo_selections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.combo_selections (id, bookmaker_reference, result, selection, selection_type, bet_id) FROM stdin;
746e7080-689a-43d6-937e-45b57154ea92	\N	LOSE	Powyżej 3.5	Gole Powyżej/Poniżej	438b5bee-f95e-4e0e-8d27-83202a58e165
104309af-7ef4-43dd-a6b8-76c7d18be2bf	\N	WIN	Poniżej 5,5	Kartki	438b5bee-f95e-4e0e-8d27-83202a58e165
58060a41-bb4b-4423-b106-a992310392e4	\N	LOSE	Powyżej 9,5	Rzuty rożne	438b5bee-f95e-4e0e-8d27-83202a58e165
7a11f7fc-ef8d-458c-ae61-d2e281c1fbb3	\N	LOSE	Ilkay Gündogan	Strzelec	4c1b0157-6aab-4e27-848d-149af9cafe32
8ca3c83b-ae04-4acf-846a-223b33ac49fd	\N	LOSE	Karim Benzema	Strzelec	4c1b0157-6aab-4e27-848d-149af9cafe32
0307a187-b127-4b63-9138-d401aa604f2c	\N	LOSE	Kevin De Bruyne	Strzelec	4c1b0157-6aab-4e27-848d-149af9cafe32
51da1719-3e62-4996-8d79-ecb0bf82c94b	\N	LOSE	Erling Haaland	Strzelec	4c1b0157-6aab-4e27-848d-149af9cafe32
05d4c7a9-9940-47ee-9f52-e76b4124deb3	\N	WIN	Powyżej 8,5	Rzuty rożne	9b3ddab1-05f4-4bed-b764-c3cdd3b5489c
9f329b19-3a8e-4484-9ca3-5300b624cfe4	\N	LOSE	Kevin De Bruyne	Strzelec	9b3ddab1-05f4-4bed-b764-c3cdd3b5489c
22148ea2-54c9-4691-a7f0-f0fb4f0fa71e	\N	OTHER	Tak	Oba zespoły strzelą gola	9b3ddab1-05f4-4bed-b764-c3cdd3b5489c
68d29173-0314-4084-8c72-8fa18be2a505	\N	LOSE	Real Madryt	Więcej kartek	9b3ddab1-05f4-4bed-b764-c3cdd3b5489c
e7109e51-6206-4744-957e-cba3ff834d9d	\N	WIN	Manchester City -1	Handicap	9b3ddab1-05f4-4bed-b764-c3cdd3b5489c
acbebb03-1aae-4841-81e3-42d8c1791723	\N	OTHER	Powyżej 4,5	Gole Powyżej/Poniżej	9b3ddab1-05f4-4bed-b764-c3cdd3b5489c
1e9bafd7-d93e-41c7-8ab2-2e7923c1b36a	\N	LOSE	Gabriel Jesus	Strzelec	d6a6af72-a5e0-491d-b11d-b08636158d01
6acb2207-d4ce-4e4b-bddb-ab41a1e7417e	\N	LOSE	Powyżej 3.5	Gole Powyżej/Poniżej	d6a6af72-a5e0-491d-b11d-b08636158d01
a260f433-ec9e-486a-b9cd-be745e5c149e	\N	WIN	Powyżej 9,5	Rzuty rożne	d6a6af72-a5e0-491d-b11d-b08636158d01
3de0469d-3217-4894-8fa2-7e00ce461cae	\N	LOSE	Powyżej 3.5	Gole Powyżej/Poniżej	fa683ac8-40ea-4d51-b93e-599dc0e7bece
ca596fa9-cc21-4af2-86b6-e8cd8d0fba02	\N	LOSE	Tak	Oba zespoły strzelą gola	fa683ac8-40ea-4d51-b93e-599dc0e7bece
abfd0bbf-f3b2-48e9-b58f-8f6089053441	\N	OTHER	Raków Częstochowa	Wynik meczu (z wyłączeniem dogrywki)	fa683ac8-40ea-4d51-b93e-599dc0e7bece
083f69eb-ff3a-4abd-9955-dc9f0f490e04	\N	LOSE	Memphis Grizzlies -3.5	Wynik handicap	f5e24cd9-d8e0-4696-9640-b133536dd3a8
040375e4-b81f-4270-938a-12770417dffe	\N	LOSE	Powyżej 116.5	Suma punktów gości	f5e24cd9-d8e0-4696-9640-b133536dd3a8
038714be-7473-4c05-bde3-501d7de8ddfb	\N	LOSE	Powyżej 9,5	Rzuty rożne	fce7e853-0b73-4b87-abc0-b6d81875b944
ae36a09d-0f20-44d9-8767-5ff672b581ac	\N	WIN	Powyżej 4,5	Gole Powyżej/Poniżej	fce7e853-0b73-4b87-abc0-b6d81875b944
a372e157-367a-415a-8521-561576b87511	\N	LOSE	Powyżej 3.5	Kartki	fce7e853-0b73-4b87-abc0-b6d81875b944
850e15d2-0f23-4123-9f8c-661e079ed7b9	\N	OTHER	Gabriel Martinelli	Strzelec	3ae9466d-aa93-44f4-8a19-ffb5ff430ba1
55c74c8f-adaf-487c-b46e-9ae0c32d4f96	\N	LOSE	Leandro Trossard	Strzelec	3ae9466d-aa93-44f4-8a19-ffb5ff430ba1
21a4fa77-d7d6-48e4-b419-19a42bfe2a47	\N	WIN	Gabriel Jesus	Strzelec	51ad3360-8900-44c0-922b-97731af71836
0a93c7a7-2302-4741-9989-fec3c4a97729	\N	LOSE	Gabriel Martinelli	Strzelec	51ad3360-8900-44c0-922b-97731af71836
4545bc1a-2b11-4d60-aeff-592d15a5d1a8	\N	LOSE	Leandro Trossard	Strzelec	6314cfcf-4ec4-4f89-86e8-5551e4b5071c
40cd5f12-c549-4033-8d5e-37942a8e3c3c	\N	WIN	Gabriel Jesus	Strzelec	6314cfcf-4ec4-4f89-86e8-5551e4b5071c
9ce54b53-41f1-4e40-9930-cd4a4616cacc	\N	WIN	Mohamed Salah	Strzelec	175d984b-9eaa-483d-9ebe-d741aed5cf73
07c1a87f-471a-4da2-93d5-095c3bb8026c	\N	LOSE	Powyżej 1,5	Gole gości powyżej/poniżej	175d984b-9eaa-483d-9ebe-d741aed5cf73
64668052-d4c6-432f-864a-49d95a19a625	\N	WIN	7+	Rzuty rożne gosp.	175d984b-9eaa-483d-9ebe-d741aed5cf73
eef2aa64-29ce-41f2-893e-3758f15794a1	\N	WIN	Legia Warszawa	Wynik meczu (z wyłączeniem dogrywki)	bc11a34c-2c16-4a1a-ad9f-e1a1f7f05628
32f942d4-7867-4263-9581-e017c3051c1f	\N	WIN	Powyżej 2,5	Gole Powyżej/Poniżej	bc11a34c-2c16-4a1a-ad9f-e1a1f7f05628
\.


--
-- Data for Name: tickets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tickets (id, bookmaker_reference, connector_identifier, created_at, odds, stake, tax, ticket_result, ticket_type) FROM stdin;
fce59c06-cd1c-44a7-b295-d1014d252e6b	6491ee23b7b56915820f7304	pl-betclic-http	2023-06-20	5.00	8.80	1.20	LOSE	SINGLE
49b52957-3420-4944-9f5e-64b9d67f4108	6491ee4ce1a1fa3eece21773	pl-betclic-http	2023-06-20	4.00	17.60	2.40	LOSE	SINGLE
5fe4d4b0-c99b-49e1-8dcc-35b004cf3a7b	6491ee3304d73c30bac0e9d3	pl-betclic-http	2023-06-20	13.00	8.80	1.20	LOSE	SINGLE
0144d229-0fef-4dbe-89d3-73962883a0a4	6485b4c21b582d7de108af7b	pl-betclic-http	2023-06-11	3.74	35.20	4.80	LOSE	MULTIPLE
d16bf385-8647-48eb-8a37-79f41d34cf55	6484c002e1a1fa3eec5aff2f	pl-betclic-http	2023-06-10	6.40	17.60	2.40	LOSE	SINGLE
5d8f880c-cf3f-4184-944a-fa806792a5d3	6484c069e1a1fa3eec5b0a11	pl-betclic-http	2023-06-10	14.00	8.80	1.20	LOSE	SINGLE
485c34e1-6767-46c4-b569-abfcd3218d3f	6484c02dd8f23f03fc436327	pl-betclic-http	2023-06-10	27.00	4.40	0.60	LOSE	SINGLE
722f6722-2948-46bf-87d9-3553bd30c0a4	6484c043e1a1fa3eec5b0613	pl-betclic-http	2023-06-10	4.20	13.20	1.80	LOSE	SINGLE
4b0b38a5-efe6-4fc6-9e08-b2faeaa206f7	64820657c4334f503bebe23f	pl-betclic-http	2023-06-08	4.40	26.40	3.60	LOSE	SINGLE
67a09296-acda-41ee-9b26-7a5ab034bdcb	647bb4b407a1cd09e8ff0837	pl-betclic-http	2023-06-03	7.00	44.00	6.00	LOSE	SINGLE
2e2d5c8c-c820-48bf-a646-0ad2acf2e1a5	647b9e09b3dbde2cf3376ec5	pl-betclic-http	2023-06-03	2.30	46.82	6.38	LOSE	SINGLE
79d411eb-5510-4f63-ba9a-e76154e3d540	647b6b1507a1cd09e8f893cf	pl-betclic-http	2023-06-03	3.08	61.60	8.40	LOSE	MULTIPLE
d46093ac-6610-429f-820d-bb03da4f0a0f	647b6beab3dbde2cf332a007	pl-betclic-http	2023-06-03	2.80	44.00	6.00	WIN	SINGLE
15e479e7-0526-40f7-bb7c-4af2c452301b	647b6618944e0233dc7ce76e	pl-betclic-http	2023-06-03	6.75	10.42	1.42	LOSE	SINGLE
f2f26fd0-6d28-48cb-b6ee-5c2fd271a085	647b4572b3dbde2cf32fe2e2	pl-betclic-http	2023-06-03	55.00	4.40	0.60	LOSE	SINGLE
1800cf34-cdfd-4183-9ea1-5bcd6c6b897c	647b45b9944e0233dc7a9fa8	pl-betclic-http	2023-06-03	9.00	8.80	1.20	LOSE	SINGLE
e746e282-9d03-485f-8535-fdfe835734dc	647b45a8944e0233dc7a9e5f	pl-betclic-http	2023-06-03	125.00	4.40	0.60	LOSE	SINGLE
0ebd8dfa-6029-40f7-bf91-8bf0afcff66c	647b45cab3dbde2cf32fe96e	pl-betclic-http	2023-06-03	13.00	8.80	1.20	LOSE	SINGLE
47b673b1-dcad-433d-9725-307588dfff2f	647b461a944e0233dc7aa6c4	pl-betclic-http	2023-06-03	35.00	4.40	0.60	LOSE	SINGLE
234d82dc-e1b1-4720-b9af-e0977d230812	647b4645a08f492dd564b964	pl-betclic-http	2023-06-03	6.20	13.20	1.80	WIN	SINGLE
a8479388-52c7-4f0f-ad0a-40c148d21485	647b3709a08f492dd563ad18	pl-betclic-http	2023-06-03	6.60	19.22	2.62	LOSE	SINGLE
19a0bfd6-6029-456d-89ca-31e542f787d3	647368a229218f068d1111b2	pl-betclic-http	2023-05-28	14.00	4.40	0.60	WIN	SINGLE
0a1c01c3-cffc-4738-9ec7-4fc8e850c00d	6473689c2c200228752a7121	pl-betclic-http	2023-05-28	4.60	4.40	0.60	WIN	SINGLE
21f83285-6f74-4882-a7bc-2ec633606056	6473254b29218f068d0cacd2	pl-betclic-http	2023-05-28	51.25	8.80	1.20	LOSE	MULTIPLE
f7f01488-a5e5-48f9-8585-f2be792b98e5	6473253c29218f068d0cac20	pl-betclic-http	2023-05-28	208.95	8.80	1.20	LOSE	MULTIPLE
1d33262b-db82-4ee6-89e5-89e3dd5bb6ac	647202bb7708343793e2a24e	pl-betclic-http	2023-05-27	14.49	70.40	9.60	LOSE	MULTIPLE
3ffc6145-bf51-4862-8d75-ceb615af6051	647202472c200228751806cc	pl-betclic-http	2023-05-27	536.79	8.80	1.20	LOSE	MULTIPLE
65c818c7-7b68-4f94-a57b-0df422dfe355	646e41b4dfef0664665050e4	pl-betclic-http	2023-05-24	9.57	17.60	2.40	LOSE	MULTIPLE
9abbdd60-79ac-44b7-9591-d2d06ab7e5b2	6469f61f4afac42c5cd3f09a	pl-betclic-http	2023-05-21	4.85	26.40	3.60	LOSE	MULTIPLE
4c6f32c0-fc94-44ef-a0cb-ffe15a43f782	6469f6132561fb1f43d3235e	pl-betclic-http	2023-05-21	8.48	15.91	2.17	LOSE	MULTIPLE
8c3fd287-3f77-45d3-be07-e2452ef4db58	646512eb2e863d1ce30afc8a	pl-betclic-http	2023-05-17	31.45	13.20	1.80	LOSE	SINGLE
3d72f151-e199-4abf-b278-53a32a3f1e7e	64651100a5eee408026c3a9d	pl-betclic-http	2023-05-17	30.30	17.60	2.40	LOSE	SINGLE
a5a40902-3c2b-4e69-9bb7-45ccd0c8e994	646532632e863d1ce30e66ef	pl-betclic-http	2023-05-17	17.00	17.60	2.40	LOSE	SINGLE
1570e08b-6e1b-4f59-8d7a-6c673a70e4c2	6465133df205fd571e8db646	pl-betclic-http	2023-05-17	8.40	13.20	1.80	LOSE	SINGLE
d0a8c52e-3cf3-471d-a62e-9c1f5ecfe39f	64653226ee51852fcd4f8f9d	pl-betclic-http	2023-05-17	75.00	17.60	2.40	LOSE	SINGLE
996ae4b7-fc9b-4372-8f9f-8974075e2d2b	6465112c2e863d1ce30adf2d	pl-betclic-http	2023-05-17	4.40	13.20	1.80	WIN	SINGLE
ff331fcf-a214-4f00-b558-db1bdd481275	646513c0ee51852fcd4c3633	pl-betclic-http	2023-05-17	19.00	4.40	0.60	LOSE	SINGLE
1dd515f7-d5bd-4e20-8994-2a9ea00dc042	6462611c2e863d1ce3ef8463	pl-betclic-http	2023-05-15	5.72	17.07	2.33	LOSE	MULTIPLE
b0369e2f-c270-4468-bf73-aaef71328153	64613231e0da5360a9f18334	pl-betclic-http	2023-05-14	9.75	8.80	1.20	LOSE	SINGLE
13e2791e-637c-4551-af70-ff098e8d8692	646132a02e863d1ce3e48c94	pl-betclic-http	2023-05-14	7.25	8.80	1.20	LOSE	SINGLE
1f7182f1-9e56-4a65-a8bd-eba4807e49ba	646132d5e0da5360a9f18c56	pl-betclic-http	2023-05-14	6.25	8.80	1.20	LOSE	SINGLE
bde03468-8efa-4fd8-97f6-e7c6f7dd4bda	6461326041a782066f77312d	pl-betclic-http	2023-05-14	6.50	8.80	1.20	LOSE	SINGLE
d050edad-df64-4a27-a98c-14b79b01dd64	64613191605d5e33066cbdf2	pl-betclic-http	2023-05-14	3.20	22.00	3.00	LOSE	SINGLE
e2209a51-0b3b-4e01-9136-ad9b75ab7805	6461315d41a782066f771f45	pl-betclic-http	2023-05-14	7.00	13.20	1.80	LOSE	SINGLE
92c0b8d7-08bf-4caa-8198-c68f7ccb1fa8	646132982e863d1ce3e48c3b	pl-betclic-http	2023-05-14	6.75	8.80	1.20	WIN	SINGLE
80474109-24ff-4f33-ad62-56b49d6227ce	64609b20e0da5360a9e45e16	pl-betclic-http	2023-05-14	12.45	17.60	2.40	LOSE	MULTIPLE
1a8bd5f4-04e2-43cc-92ec-24e8ba7f0f81	6460aed3e0da5360a9e565da	pl-betclic-http	2023-05-14	84.41	8.80	1.20	LOSE	MULTIPLE
99775ad0-d031-4597-8f3c-1df2645b8d54	6460aebb2e863d1ce3d87062	pl-betclic-http	2023-05-14	178.95	4.40	0.60	LOSE	MULTIPLE
daa1df63-0c85-4ad6-a6f2-eb66b9f76a2a	6460aeb5e0da5360a9e56406	pl-betclic-http	2023-05-14	178.95	4.40	0.60	LOSE	MULTIPLE
6cca865c-70cd-477d-bc44-d065532a4b81	64609b04e0da5360a9e45ce9	pl-betclic-http	2023-05-14	101.00	8.80	1.20	LOSE	MULTIPLE
9dd895c7-46dd-4452-8ddb-d8f854b52674	645f6edbba1d250c6df6ff83	pl-betclic-http	2023-05-13	10.06	26.40	3.60	LOSE	MULTIPLE
8006a36b-53b8-4066-801f-2dbe2bff6904	645f6e7141a782066f57e611	pl-betclic-http	2023-05-13	99.92	17.60	2.40	LOSE	MULTIPLE
5ccfb2fa-94bd-41e7-8650-a929c6f61c0d	645ece8141a782066f51edca	pl-betclic-http	2023-05-12	2.05	44.00	6.00	LOSE	SINGLE
a51c26d4-d88c-4e1c-9f35-17196c520c44	645e4992bf91de01ae60b66f	pl-betclic-http	2023-05-12	5.19	22.00	3.00	LOSE	MULTIPLE
a0492c30-88b6-4922-8bba-1aa9da08020b	645d3bb366796253cb94c3ed	pl-betclic-http	2023-05-11	4.50	22.00	3.00	LOSE	SINGLE
e9855fad-ce35-46f0-8204-33bbf08a396b	645a78faaf47641080481d24	pl-betclic-http	2023-05-09	3.85	88.00	12.00	LOSE	SINGLE
06c79840-4a9f-4f73-a0ff-fb32226ffcfb	6459248c2b75441d2d712ef2	pl-betclic-http	2023-05-08	1.82	44.00	6.00	LOSE	SINGLE
73f4a30c-3d08-4c79-a285-b208bb526c35	64591f120f4ed732d2fc3bbe	pl-betclic-http	2023-05-08	1.95	34.41	4.69	LOSE	SINGLE
d72ad8b0-9a9f-4590-8fe1-3b2e8918237b	6457fa84c2387845316e590a	pl-betclic-http	2023-05-07	4.05	22.00	3.00	WIN	SINGLE
8ac4451f-71d7-4e6d-8589-5ab041282bc7	6457ac98c2387845316715e2	pl-betclic-http	2023-05-07	2.02	44.00	6.00	LOSE	MULTIPLE
a3142ea6-3306-49cb-b6fa-f9c420ce8822	6457bc180f4ed732d2e9d598	pl-betclic-http	2023-05-07	7.37	22.00	3.00	LOSE	SINGLE
5960ee79-18c1-4aff-8e6b-291572cdfd4f	645780ee0f4ed732d2e47f67	pl-betclic-http	2023-05-07	7.46	44.00	6.00	LOSE	MULTIPLE
9c4b5135-97d1-4d34-9d6a-df35055c0abe	6457803f0f4ed732d2e471f6	pl-betclic-http	2023-05-07	38.80	33.56	4.58	LOSE	MULTIPLE
befe981b-9038-46ae-8729-e87b16f94e4c	6456a8a32b75441d2d4f1f04	pl-betclic-http	2023-05-06	3.45	22.00	3.00	LOSE	SINGLE
0341c296-da6b-4b80-9d0d-2b112190a25f	64567c6e2b75441d2d4ab2c9	pl-betclic-http	2023-05-06	2.87	22.00	3.00	WIN	MULTIPLE
c24582ac-b9c0-47e0-a02d-24ba6a2c4024	64561b222b75441d2d42a7bc	pl-betclic-http	2023-05-06	4.99	44.00	6.00	LOSE	MULTIPLE
04926b49-e2cd-451b-8783-0eaf849a3986	64561a6fc2882d546b1144e7	pl-betclic-http	2023-05-06	21.46	8.80	1.20	LOSE	MULTIPLE
05431a01-503e-4473-b00f-ea75d5a2d51a	64565bb922747503c9d6e8bd	pl-betclic-http	2023-05-06	6.60	22.00	3.00	LOSE	SINGLE
992d3306-d989-47f8-acb6-b898ae3a0379	6454d0fb586c0473a0e7ea82	pl-betclic-http	2023-05-05	3.42	35.20	4.80	LOSE	MULTIPLE
ad27c583-2f96-4b7b-aa2a-c67f07086b6a	6453fd2c2b75441d2d2bb6e4	pl-betclic-http	2023-05-04	7.20	17.60	2.40	LOSE	SINGLE
55af71be-3aba-4bec-9d91-920106eb03e9	6453d9042b75441d2d29482a	pl-betclic-http	2023-05-04	8.01	35.20	4.80	LOSE	MULTIPLE
6c1fabcd-03aa-4dcd-9e17-b000ad9dc94b	6452822788108f7fe9e197c2	pl-betclic-http	2023-05-03	8.10	30.80	4.20	LOSE	MULTIPLE
4c08ea9c-7291-4d61-b055-4a7259cde18f	6452aaf8586c0473a0d07b22	pl-betclic-http	2023-05-03	11.00	4.40	0.60	LOSE	SINGLE
f275d223-4312-4a46-b4a6-5621492e52b3	6452a9f22bda06704e2f5ca7	pl-betclic-http	2023-05-03	5.40	30.80	4.20	LOSE	SINGLE
84a37a2a-a79a-41d6-9077-42ce8f073356	64521bf788108f7fe9db0e91	pl-betclic-http	2023-05-03	114.85	15.21	2.07	LOSE	MULTIPLE
33325313-0103-46be-a227-ff081f3d9d91	64515a0b48ee353f62d6894c	pl-betclic-http	2023-05-02	3.75	41.94	5.72	WIN	SINGLE
d62d2cf4-6fa0-4bed-9715-2aea77321908	6450e6f95ed7ea69cd675899	pl-betclic-http	2023-05-02	7.41	8.80	1.20	LOSE	SINGLE
0fe41883-b328-4ade-8943-4d89433ea16b	64512de748ee353f62d3a2e7	pl-betclic-http	2023-05-02	6.25	8.80	1.20	LOSE	SINGLE
d977a740-5d83-456a-bc0f-59e2684edfa1	6450096ff704572bd9aca39b	pl-betclic-http	2023-05-01	3.30	14.15	1.93	WIN	SINGLE
b6d2aa24-47e5-45fc-9663-0688f3dfd5a8	64500961e12e8962afa86aa4	pl-betclic-http	2023-05-01	3.30	35.20	4.80	WIN	SINGLE
74afeaa0-657d-4cc9-bfcd-a8994acaceca	644e29c48e87d424bb41588a	pl-betclic-http	2023-04-30	3.65	110.00	15.00	WIN	MULTIPLE
c79a53c9-e8bd-4654-bd93-4c5b3be6f4ac	644e93692296683f5bb23490	pl-betclic-http	2023-04-30	2.23	44.00	6.00	LOSE	SINGLE
db1d6b64-d1eb-44d9-ad01-1ced490e5282	644e2a212296683f5ba83233	pl-betclic-http	2023-04-30	12.49	22.00	3.00	LOSE	MULTIPLE
b9359487-ed94-4972-a73a-41fa5b0be5a9	644e29868a87e2626d188b3c	pl-betclic-http	2023-04-30	12.49	14.70	2.00	LOSE	MULTIPLE
e6d1938f-bb08-4ad2-8407-f10f71199db8	644e32662296683f5ba8926f	pl-betclic-http	2023-04-30	43.51	8.80	1.20	LOSE	MULTIPLE
c3efdfcf-8321-4dc5-ab28-533470e59fc5	644e323d1fcf800bef4ee59d	pl-betclic-http	2023-04-30	143.69	13.20	1.80	LOSE	MULTIPLE
db2aa703-1010-4c0e-a686-0f2ec1f38ef3	644cdbf88a87e2626d045483	pl-betclic-http	2023-04-29	4.99	44.00	6.00	WIN	MULTIPLE
e11179dd-d3ec-4b67-9638-c7996971c4c7	644cdb6e2296683f5b93e4b9	pl-betclic-http	2023-04-29	6.94	17.60	2.40	WIN	MULTIPLE
344ed34e-ae3c-4d95-9c46-9fa98f2969c7	644cdbe32296683f5b93ea03	pl-betclic-http	2023-04-29	50.17	26.40	3.60	LOSE	MULTIPLE
9415bd0f-ab54-4b79-960f-64016522ad5b	644b7fbc2296683f5b80ef0d	pl-betclic-http	2023-04-28	2.57	101.20	13.80	LOSE	MULTIPLE
7110a40f-20a9-443d-9037-a4c9656f2906	644973da889a752c5774ff73	pl-betclic-http	2023-04-26	4.90	13.20	1.80	LOSE	SINGLE
ff1e89fb-b72d-4194-bf5b-218f69c76f56	644973b340ea871b6c5f1a74	pl-betclic-http	2023-04-26	11.00	22.00	3.00	LOSE	SINGLE
bf2918bd-e84a-4fd8-89ee-b2a4cab063f6	644973cbf85d293fed3aab7f	pl-betclic-http	2023-04-26	11.00	8.80	1.20	LOSE	SINGLE
457836e3-ea8d-43a2-9ad9-3dd86387a177	6449742ff85d293fed3ab6ac	pl-betclic-http	2023-04-26	13.00	8.80	1.20	LOSE	SINGLE
d310de33-3da8-4fc5-9d74-c04baac3003c	6445791b0fa3471b8fac332c	pl-betclic-http	2023-04-23	3.90	22.00	3.00	LOSE	SINGLE
336907a2-d41e-48fb-a10a-36bffa98b0b7	643beda80080c208e0b852d6	pl-betclic-http	2023-04-16	4.69	44.00	6.00	LOSE	MULTIPLE
928e2a40-4ca0-4dba-97cb-90ad10d3d355	643afc857a4183683a4fb454	pl-betclic-http	2023-04-15	7.50	10.13	1.38	LOSE	SINGLE
a1d810c9-9c7e-4adb-a9e1-018b5e1301a1	643ac9f5c53c57412c5bb355	pl-betclic-http	2023-04-15	3.65	17.60	2.40	LOSE	SINGLE
0e59d4b0-eccd-43d3-977a-5f80b706e522	643aca1868f8d42f4aa6ae77	pl-betclic-http	2023-04-15	3.30	26.40	3.60	LOSE	SINGLE
ad83a17e-8a7d-4ad5-9d2b-0a631e955c03	643ac9d5c53c57412c5bb153	pl-betclic-http	2023-04-15	2.33	26.40	3.60	WIN	SINGLE
72366820-381c-4a59-b384-03d807730e3f	643ac9dc212acb52350a6e75	pl-betclic-http	2023-04-15	4.25	17.60	2.40	LOSE	SINGLE
a18ca61b-c57f-4c06-94b2-c1b97d5cef3b	643a9dae212acb5235084314	pl-betclic-http	2023-04-15	5.59	35.20	4.80	LOSE	MULTIPLE
77f37c5f-1ddd-4dbd-b172-da04d9860738	643a9d8358457027ca101235	pl-betclic-http	2023-04-15	46.74	17.60	2.40	LOSE	MULTIPLE
9e348681-99e1-4e29-bc71-b6e059464520	643a9d71c53c57412c598159	pl-betclic-http	2023-04-15	160.01	13.20	1.80	LOSE	MULTIPLE
24e26d87-4978-4c45-97d3-79fb555f9b11	643a6b15d884eb6de21eafdf	pl-betclic-http	2023-04-15	5.40	52.80	7.20	LOSE	MULTIPLE
ab3013a7-4fda-4a86-8cbd-9e1e0d3c05c2	643a6a18212acb523506996a	pl-betclic-http	2023-04-15	11.10	22.00	3.00	LOSE	MULTIPLE
2f296b81-84da-4683-8244-a072094bad2f	643a6946a72cb273acf22d59	pl-betclic-http	2023-04-15	92.37	17.60	2.40	LOSE	MULTIPLE
0789d5aa-a1cc-4430-b001-77cc592131eb	643a687f58457027ca0e6591	pl-betclic-http	2023-04-15	225.73	2.34	0.32	LOSE	MULTIPLE
2057d3f6-1e11-4718-ba29-1272fc7337db	643a6875a72cb273acf22842	pl-betclic-http	2023-04-15	225.73	7.04	0.96	LOSE	MULTIPLE
4d282e65-9f1e-4064-b3c2-472736afbc62	643a686aa72cb273acf22807	pl-betclic-http	2023-04-15	225.73	7.04	0.96	LOSE	MULTIPLE
ef188790-ea5d-4b95-abce-6bc684a36abf	6439923d7eac9708a6a208aa	pl-betclic-http	2023-04-14	9.03	22.00	3.00	WIN	MULTIPLE
56c3e500-035f-4fb8-b4f3-778bae938ae8	643568ce9d90a827069d98b4	pl-betclic-http	2023-04-11	3.78	48.40	6.60	LOSE	MULTIPLE
fef1b882-7f1d-4e0a-b3ee-99da4984318d	6433c26148e4240503751dfb	pl-betclic-http	2023-04-10	2.89	44.00	6.00	LOSE	MULTIPLE
995bf14d-c74a-4da0-9b29-06978ace5a44	64319ac16808352f9adf5409	pl-betclic-http	2023-04-08	17.50	17.60	2.40	LOSE	SINGLE
44cef612-f3b2-4e26-baa9-a94515fa8bd3	6431773c27bbd004b0167d00	pl-betclic-http	2023-04-08	13.31	22.00	3.00	LOSE	MULTIPLE
0262220e-c759-446d-a565-08120f59c2eb	64313d4c1953051dfab6c4c7	pl-betclic-http	2023-04-08	54.35	22.00	3.00	LOSE	MULTIPLE
80757c96-e7b1-4d3c-9deb-f6c3c0b27352	643115695f92c9086e10c30c	pl-betclic-http	2023-04-08	24.57	44.00	6.00	LOSE	MULTIPLE
386b0cb7-487c-43aa-8a61-c3ada3729569	64304b031953051dfaaf571b	pl-betclic-http	2023-04-07	4.27	44.00	6.00	LOSE	MULTIPLE
ff8ee2cb-7023-499c-a12d-0c5cf00ffbc2	642dbfb492775718fafed026	pl-betclic-http	2023-04-05	12.00	15.21	2.07	LOSE	SINGLE
fa29047b-9325-4f65-9deb-5fddbb80d9d1	642dc02cb827db13d93092a1	pl-betclic-http	2023-04-05	5.80	17.60	2.40	LOSE	MULTIPLE
77f929ba-b53a-4546-8552-c673180e90e6	642c71680666850b83bf76c7	pl-betclic-http	2023-04-04	12.00	13.94	1.90	WIN	SINGLE
5b88f225-885a-486f-b43a-c1e514f7d0e4	6429d2f613665e55bdb6c6c5	pl-betclic-http	2023-04-02	2.86	44.00	6.00	LOSE	SINGLE
20b64671-c648-49c4-a085-a98dedec2739	6428bcf113665e55bdad3bde	pl-betclic-http	2023-04-01	14.00	17.60	2.40	LOSE	SINGLE
a28fd0b1-0270-40d1-a28e-8925c9afc31a	6428bbdfd368465ba6173ecb	pl-betclic-http	2023-04-01	9.00	17.60	2.40	WIN	SINGLE
f273956f-ae79-4ec3-ba2b-bdadcc112761	6428bb78d368465ba6173756	pl-betclic-http	2023-04-01	5.25	35.20	4.80	WIN	SINGLE
e5d16940-8002-4a87-a759-ff5b8622e203	6428bc36d368465ba61745bf	pl-betclic-http	2023-04-01	3.20	35.20	4.80	WIN	SINGLE
e1aab2d8-813d-4afe-aaf4-a46384031ad1	6428577213665e55bdaa1e76	pl-betclic-http	2023-04-01	6.45	44.00	6.00	LOSE	SINGLE
8781ead8-6751-4802-9f1e-f2e5c6c43ff5	64284d63d64b5102566d0583	pl-betclic-http	2023-04-01	11.75	26.40	3.60	LOSE	MULTIPLE
34460a39-3295-483d-a1c7-8e2ad43dff50	64284d4ad368465ba613b0f4	pl-betclic-http	2023-04-01	5.70	44.00	6.00	LOSE	MULTIPLE
2ec85d01-6f09-45ec-a0b8-f5a740a7db30	6427f8379b5c0940b46df186	pl-betclic-http	2023-04-01	5.15	88.00	12.00	LOSE	MULTIPLE
d6ae21f7-f5ee-4569-85f0-c968dcc5a86a	64282cc79b5c0940b46fa5ef	pl-betclic-http	2023-04-01	29.00	8.80	1.20	LOSE	SINGLE
d4cfb0d2-3e3c-4d34-9e7c-50b152c0e1bd	64282c67f20e7836acb158a4	pl-betclic-http	2023-04-01	4.69	17.60	2.40	LOSE	SINGLE
354921fe-18ac-41ba-9da6-93724547fe13	64282c5359e3c96ba4cea48e	pl-betclic-http	2023-04-01	4.49	17.60	2.40	LOSE	SINGLE
7f6ce772-7261-43ed-a73d-a85d417a53bb	64282c5cf20e7836acb15841	pl-betclic-http	2023-04-01	4.66	17.60	2.40	LOSE	SINGLE
0dce37f5-75cc-425b-a284-47bb41f398d6	64282d09b20f4c79e793643e	pl-betclic-http	2023-04-01	11.75	8.80	1.20	LOSE	SINGLE
39f1f3b2-738f-40b1-ac09-8f654be8263e	64282c9db20f4c79e7936022	pl-betclic-http	2023-04-01	6.00	17.60	2.40	LOSE	SINGLE
9e2c55b2-c2df-4f87-9fac-006f8c368d5b	6427560e52155959dfb9af28	pl-betclic-http	2023-03-31	93.78	7.92	1.08	LOSE	MULTIPLE
4f50495c-46b7-47ba-9ef4-4d59cfee6270	642755bc78b969754340b231	pl-betclic-http	2023-03-31	267.28	6.16	0.84	LOSE	MULTIPLE
e2345aa8-635b-4e3f-ba41-58f05176c6e4	642755b899fd3866e1f1cd37	pl-betclic-http	2023-03-31	267.28	6.16	0.84	LOSE	MULTIPLE
a76015b8-b70c-4129-988b-b1d2179df42e	642755b33016de531973321c	pl-betclic-http	2023-03-31	267.28	6.16	0.84	LOSE	MULTIPLE
9798c28a-4e73-4a23-ab96-0a200040f2d3	64275592188e491fe42fb7c8	pl-betclic-http	2023-03-31	93.78	17.60	2.40	LOSE	MULTIPLE
a37c0162-31e8-4979-9a63-4310c87ba868	642813fc59e3c96ba4cdc144	pl-betclic-http	2023-04-01	11.43	13.20	1.80	LOSE	SINGLE
98baa03f-ea95-44a4-912a-941c790f83b4	6428123659e3c96ba4cdae1b	pl-betclic-http	2023-04-01	29.00	2.64	0.36	LOSE	SINGLE
b412529e-1b71-4f07-997c-72ca3284d3a8	642812429b5c0940b46eab3a	pl-betclic-http	2023-04-01	275.00	1.76	0.24	LOSE	SINGLE
264891a0-471a-4200-9abb-289f2abcee41	64282b996c33e42f67799c2c	pl-betclic-http	2023-04-01	9.00	11.05	1.51	LOSE	SINGLE
c1d7054e-e0d6-41d3-92cf-fb3b4cbebb0c	6428119a35396761f5020b2a	pl-betclic-http	2023-04-01	4.20	8.80	1.20	LOSE	SINGLE
b6325591-14cd-451a-bf1f-8e6bccc860ef	64281191d64b5102566ab8e8	pl-betclic-http	2023-04-01	3.70	8.80	1.20	WIN	SINGLE
7b311d2c-1d44-4904-9ab1-b8e35743d84f	642725dd99fd3866e1f08eb4	pl-betclic-http	2023-03-31	638.31	1.76	0.24	LOSE	MULTIPLE
9f0979d6-07ef-4d97-b767-d8882dd73f36	642725d83016de531971f170	pl-betclic-http	2023-03-31	638.31	1.76	0.24	LOSE	MULTIPLE
9935d70c-9311-4d92-b0e0-b7b39b7c5034	642725d468400448039ff5e0	pl-betclic-http	2023-03-31	638.31	1.76	0.24	LOSE	MULTIPLE
14642f0c-c321-4c5a-8311-83749191d9a0	642725d052155959dfb86c83	pl-betclic-http	2023-03-31	638.31	1.76	0.24	LOSE	MULTIPLE
8cdd4da3-32d5-40a4-86df-e6cc82626d76	642725cc99fd3866e1f08e3b	pl-betclic-http	2023-03-31	638.31	1.76	0.24	LOSE	MULTIPLE
13414a26-1604-4f5e-91a1-eadd99e0663f	642725be99fd3866e1f08dbd	pl-betclic-http	2023-03-31	223.97	4.40	0.60	LOSE	MULTIPLE
58819d3e-d990-41da-ae2d-22da5f316aed	642725b8bb4c9e4182158b76	pl-betclic-http	2023-03-31	223.97	4.40	0.60	LOSE	MULTIPLE
3b17c83d-808f-4538-8087-7c237ada9058	642725b4188e491fe42e7643	pl-betclic-http	2023-03-31	223.97	4.40	0.60	LOSE	MULTIPLE
38afcfe5-a74d-40ea-a240-1586b0f18014	6426e54452155959dfb73c9f	pl-betclic-http	2023-03-31	70.77	22.00	3.00	LOSE	MULTIPLE
6d5378a7-9c0e-4514-993d-b8f4a15686c5	6426e51b99fd3866e1ef5ee2	pl-betclic-http	2023-03-31	34.60	52.80	7.20	LOSE	MULTIPLE
05abc0b7-3883-47b7-8c5c-5c549cc8c80b	6425bdf73626032c87d00a5b	pl-betclic-http	2023-03-30	187.02	8.80	1.20	LOSE	MULTIPLE
6873268a-d855-432c-929f-8548310d0d44	6425bdf1812d1b368f889a4c	pl-betclic-http	2023-03-30	187.02	8.80	1.20	LOSE	MULTIPLE
a5428eb9-691a-43f0-bbf1-76f8e832837d	6425bd44812d1b368f88983e	pl-betclic-http	2023-03-30	73.77	17.60	2.40	LOSE	MULTIPLE
842d5b26-1b7b-4775-8f17-190ad7d96c0b	64d8ebd3aa9b507fd1844aa6	pl-betclic-http	2023-08-13	5.80	8.80	1.20	LOSE	SINGLE
aa0e824b-fe84-488a-a260-7c51c63e8638	64d8ebe8827fc84d8aa43c20	pl-betclic-http	2023-08-13	5.00	17.60	2.40	LOSE	SINGLE
7dccb450-46f1-4a8c-a08a-256fb96a91b1	64d8d418aa9b507fd1836135	pl-betclic-http	2023-08-13	8.87	17.60	2.40	LOSE	MULTIPLE
53e43c4e-3a0b-44d4-a451-3364c915652e	64d8cb14e857aa48b2a5f169	pl-betclic-http	2023-08-13	10.98	26.40	3.60	LOSE	MULTIPLE
5511b84a-074d-4446-bfdd-c43d3bfde77f	64d791418871d8039e7b29e4	pl-betclic-http	2023-08-12	3.20	44.00	6.00	LOSE	MULTIPLE
103ff501-80e5-48ba-83b4-a238ce67116b	64d7307020f39c1a31f55aea	pl-betclic-http	2023-08-12	6.41	17.60	2.40	LOSE	MULTIPLE
12820b21-13e7-4cb3-9a9a-13ae938872d0	64d7303720f39c1a31f5557d	pl-betclic-http	2023-08-12	3.03	26.40	3.60	LOSE	MULTIPLE
c82b9ad9-5030-4f26-944b-0b6d318d7fa6	64d76b5c773b336f7e0d1b5a	pl-betclic-http	2023-08-12	4.40	17.60	2.40	LOSE	SINGLE
af4ac91a-74e6-4616-b485-db86d210f5d4	64d66208ba4582651a7dbffd	pl-betclic-http	2023-08-11	3.85	26.40	3.60	LOSE	MULTIPLE
d10b4298-6e09-47dc-b8ef-818da9eb5d4b	64d5162fab751b1c84f14a2c	pl-betclic-http	2023-08-10	3.72	28.67	3.91	LOSE	MULTIPLE
2ad72f63-386c-4ab3-8adf-d3ab92e12291	64d27f1da5105c24184ef11d	pl-betclic-http	2023-08-08	3.25	25.41	3.47	WIN	SINGLE
21498510-a0cc-45bb-8601-01ede99e1bed	64d27f2dd19b421599e9c8ee	pl-betclic-http	2023-08-08	4.10	17.60	2.40	LOSE	SINGLE
fc46a66c-9587-4743-928d-01f021996792	64cfded361e4191ec5f7caa8	pl-betclic-http	2023-08-06	2.02	44.00	6.00	WIN	SINGLE
0590cd77-cb99-4092-bea4-26417ce524c7	64cfb1b961e4191ec5f4e342	pl-betclic-http	2023-08-06	4.80	17.60	2.40	LOSE	SINGLE
12761e21-b0ce-4905-97ba-1f8851fb27b3	64cfb1c8e434932e339d26b7	pl-betclic-http	2023-08-06	3.70	26.40	3.60	LOSE	SINGLE
46441ee9-b648-46d5-948e-be8ac46e61c9	64ce297411143d2c01766152	pl-betclic-http	2023-08-05	8.08	26.40	3.60	LOSE	MULTIPLE
40f22aa9-9c07-46a2-b39c-66b878cfcc42	64cbf55b5dbc0b75adb3cdc6	pl-betclic-http	2023-08-03	1.96	30.80	4.20	LOSE	SINGLE
a4bd95b7-0735-4dad-bd05-8049e9670780	64c65b2e5dbc0b75ad666bcb	pl-betclic-http	2023-07-30	10.42	30.80	4.20	LOSE	MULTIPLE
2bfc81d1-3e34-4e66-8ec7-d33a1858ee42	64c635a55dbc0b75ad63242b	pl-betclic-http	2023-07-30	5.38	26.40	3.60	LOSE	MULTIPLE
0db2ac5e-ecfc-48d7-bff0-0ca010243026	64c63540bbe08530df59c797	pl-betclic-http	2023-07-30	18.30	17.60	2.40	LOSE	MULTIPLE
1492c02b-767e-4e74-8f31-fe6df899f7c8	64c4e9ee5dbc0b75ad4e7e6c	pl-betclic-http	2023-07-29	9.18	33.04	4.51	LOSE	MULTIPLE
7fd276ce-8ea7-4843-9ab2-21e92e04985b	64c2b716bbe08530df2d5f7e	pl-betclic-http	2023-07-27	2.79	31.38	4.28	WIN	SINGLE
41bd2a90-b680-4242-9d25-5d6af12cb003	64c2691ebbe08530df27427d	pl-betclic-http	2023-07-27	2.77	62.94	8.58	LOSE	MULTIPLE
0352af6f-e989-42d9-8a00-c6477eed1e69	64c299eb5dbc0b75ad33eb2f	pl-betclic-http	2023-07-27	7.98	12.62	1.72	LOSE	MULTIPLE
c2b459d6-0a9f-4899-b45e-6ada5c92a769	64c15a745dbc0b75ad264aa8	pl-betclic-http	2023-07-26	2.08	44.00	6.00	WIN	SINGLE
e1d2061d-2bbe-4660-90a4-ef4c8a84d4c7	64c15a855dbc0b75ad264be2	pl-betclic-http	2023-07-26	6.20	17.60	2.40	LOSE	SINGLE
1fa2590f-0c07-4737-a35d-120a19d2eb08	64beaf785dbc0b75ad0a060e	pl-betclic-http	2023-07-24	2.05	44.00	6.00	LOSE	SINGLE
cbef1ae9-fcc6-4955-994e-3ba4b31aab17	64bd6c1c5dbc0b75adfd8562	pl-betclic-http	2023-07-23	3.60	17.47	2.38	LOSE	SINGLE
2cd97e88-a5b0-4cc1-9dcf-d33d6271c264	64bcfb2f5dbc0b75adf41b78	pl-betclic-http	2023-07-23	7.57	26.40	3.60	WIN	MULTIPLE
a7a7c30a-cf43-4668-9da3-a79efb2f74b2	64bb9080bbe08530dfd6c688	pl-betclic-http	2023-07-22	5.76	17.60	2.40	LOSE	MULTIPLE
530a7780-0bcd-4d53-9f6c-dae027efd02a	64bb9075bbe08530dfd6c616	pl-betclic-http	2023-07-22	9.91	20.06	2.74	LOSE	MULTIPLE
7360da1e-4419-4544-86c3-86e8cb7724a5	64baaa285dbc0b75add7a894	pl-betclic-http	2023-07-21	2.40	22.00	3.00	WIN	MULTIPLE
d23e45c7-c572-4f5d-9bc3-a2a02cb4844b	64b294ad39339148c00f274e	pl-betclic-http	2023-07-15	2.08	26.40	3.60	LOSE	SINGLE
14554e28-6cd8-48e0-9930-08b42d7c9e91	64aaeec7cb772c2492a7d066	pl-betclic-http	2023-07-09	18.13	4.40	0.60	LOSE	MULTIPLE
\.


--
-- Name: bets bets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bets
    ADD CONSTRAINT bets_pkey PRIMARY KEY (id);


--
-- Name: combo_selections combo_selections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.combo_selections
    ADD CONSTRAINT combo_selections_pkey PRIMARY KEY (id);


--
-- Name: tickets tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (id);


--
-- Name: bets fkiurp8x7k6208cmf0ccoeieqwy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bets
    ADD CONSTRAINT fkiurp8x7k6208cmf0ccoeieqwy FOREIGN KEY (ticket_id) REFERENCES public.tickets(id);


--
-- Name: combo_selections fkjv728nfx7l7rlss7amd94hhro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.combo_selections
    ADD CONSTRAINT fkjv728nfx7l7rlss7amd94hhro FOREIGN KEY (bet_id) REFERENCES public.bets(id);


--
-- PostgreSQL database dump complete
--

