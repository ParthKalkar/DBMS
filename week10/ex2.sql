EX2
-- Table: public.Ledger
-- DROP TABLE public."Ledger";
CREATE TABLE public."Ledger"
(
	"from" integer,
	"to" integer,
	fee real,
	amount real,
	date_time date,
	id integer NOT NULL DEFAULT nextval('"Ledger_id_seq"'::regclass),
	CONSTRAINT "Ledger_pkey" PRIMARY KEY (id)
)
TABLESPACE pg_default;
ALTER TABLE public."Ledger"
	OWNER to postgres;
BEGIN;
UPDATE accounts SET credit = credit - 500 WHERE id = 1;
UPDATE accounts SET credit = credit + 500 WHERE id = 3;
INSERT INTO ledger("from", "to", fee, amount, date_time)
  VALUES(1, 3, 0, 500, NOW());
UPDATE accounts SET credit = credit - 730 WHERE id = 2;
UPDATE accounts SET credit = credit + 700 WHERE id = 1;
UPDATE accounts SET credit = credit + 30 WHERE id = 4;
INSERT INTO ledger("from", "to", fee, amount, date_time)
  VALUES(2, 1, 30, 700, NOW());
UPDATE accounts SET credit = credit - 130 WHERE id = 2;
UPDATE accounts SET credit = credit + 100 WHERE id = 3;
UPDATE accounts SET credit = credit + 30 WHERE id = 4;
INSERT INTO ledger("from", "to", fee, amount, date_time)
  VALUES(2, 3, 30, 100, NOW());
SELECT * from ledger;
ROLLBACK;
SELECT * from ledger;