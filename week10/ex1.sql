-- Table: public.accounts

-- DROP TABLE public.accounts;

CREATE TABLE public.accounts
(
	id integer NOT NULL,
	name text COLLATE pg_catalog."default",
	credit real,
	"BankName" text COLLATE pg_catalog."default",
	CONSTRAINT accounts_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE public.accounts
	OWNER to postgres;

INSERT INTO public.accounts (
id, name, credit) VALUES (
'1'::integer, 'Account1'::text, '1000'::real)
 returning id;
INSERT INTO public.accounts (
id, name, credit) VALUES (
'2'::integer, 'Account2'::text, '1000'::real)
 returning id;
INSERT INTO public.accounts (
id, name, credit) VALUES (
'3'::integer, 'Account3'::text, '1000'::real)
 returning id;
INSERT INTO public.accounts (
id, name, credit) VALUES (
'4'::integer, 'Account4'::text, '0::real)
 returning id;
UPDATE public.accounts SET
"BankName" = 'SpearBank'::text WHERE
id = 1;
UPDATE public.accounts SET
"BankName" = Tinkoff::text WHERE
id = 2;
UPDATE public.accounts SET
"BankName" = 'SpearBank'::text WHERE
id = 3;
PART 1
BEGIN;
UPDATE accounts SET credit = credit - 500 WHERE id = 1;
UPDATE accounts SET credit = credit + 500 WHERE id = 3;
UPDATE accounts SET credit = credit - 700 WHERE id = 2;
UPDATE accounts SET credit = credit + 700 WHERE id = 1;
UPDATE accounts SET credit = credit - 100 WHERE id = 2;
UPDATE accounts SET credit = credit + 100 WHERE id = 3;
SELECT * from accounts;
ROLLBACK;
SELECT * from accounts;
PART 2
BEGIN;
UPDATE accounts SET credit = credit - 500 WHERE id = 1;
UPDATE accounts SET credit = credit + 500 WHERE id = 3;
UPDATE accounts SET credit = credit - 730 WHERE id = 2;
UPDATE accounts SET credit = credit + 700 WHERE id = 1;
UPDATE accounts SET credit = credit + 30 WHERE id = 4;
UPDATE accounts SET credit = credit - 130 WHERE id = 2;
UPDATE accounts SET credit = credit + 100 WHERE id = 3;
UPDATE accounts SET credit = credit + 30 WHERE id = 4;
SELECT * from accounts;
ROLLBACK;
SELECT * from accounts;
