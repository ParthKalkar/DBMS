-- Table: public.Movie

-- DROP TABLE public."Movie";

CREATE TABLE public."Movie"
(
    "Title" "char"[] NOT NULL,
    "Genre" "char"[] NOT NULL,
    "Release Year" date NOT NULL,
    "Length" numeric,
    "Plot of Outline" "char"[],
    CONSTRAINT "Movie_pkey" PRIMARY KEY ("Title", "Release Year")
)

TABLESPACE pg_default;

ALTER TABLE public."Movie"
    OWNER to postgres;