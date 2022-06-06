CREATE TABLE "users" (
  "id" bigserial PRIMARY KEY,
  "username" varchar NOT NULL,
  "hashed_password" varchar NOT NULL,
  "full_name" varchar NOT NULL,
  "nationality" varchar,
  "email" varchar UNIQUE NOT NULL,
  "created_at" timestampz NOT NULL DEFAULT (now())
);

CREATE TABLE "games" (
  "id" bigserial PRIMARY KEY,
  "user_id" bigint NOT NULL,
  "team" varchar NOT NULL,
  "field_id" bigint NOT NULL,
  "date" timestampz NOT NULL DEFAULT (now())
);

CREATE TABLE "fields" (
  "id" bigserial PRIMARY KEY,
  "field_name" varchar NOT NULL,
  "address" varchar NOT NULL
);

CREATE TABLE "groups" (
  "id" bigserial PRIMARY KEY,
  "name" varchar NOT NULL,
  "user_id" bigint
);

CREATE TABLE "ratings" (
  "id" bigserial PRIMARY KEY,
  "user_id" bigint,
  "attendance" varchar,
  "goals" bigint,
  "man_of_the_match" bigint,
  "attitude" varchar,
  "involvement" varchar
);

CREATE INDEX ON "games" ("user_id");

CREATE INDEX ON "fields" ("field_name");

CREATE INDEX ON "groups" ("user_id");

CREATE INDEX ON "ratings" ("user_id");

ALTER TABLE "games" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "games" ADD FOREIGN KEY ("field_id") REFERENCES "fields" ("id");

ALTER TABLE "ratings" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "groups" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");
