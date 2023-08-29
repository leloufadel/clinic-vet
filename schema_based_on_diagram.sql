CREATE TABLE "vets"(
    "id" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "age" INTEGER NOT NULL,
    "date_of_graduation" DATE NOT NULL
);
ALTER TABLE
    "vets" ADD PRIMARY KEY("id");
CREATE TABLE "owners"(
    "id" INTEGER NOT NULL,
    "full_name" VARCHAR(255) NOT NULL,
    "age" INTEGER NOT NULL,
    "email" VARCHAR(255) NOT NULL
);
CREATE INDEX "owners_email_index" ON
    "owners"("email");
ALTER TABLE
    "owners" ADD PRIMARY KEY("id");
CREATE TABLE "visits"(
    "vet_id" INTEGER NOT NULL,
    "animals_id" INTEGER NOT NULL,
    "visit_date" DATE NOT NULL
);
CREATE INDEX "visits_animals_id_index" ON
    "visits"("animals_id");
CREATE INDEX "visits_vet_id_index" ON
    "visits"("vet_id");
ALTER TABLE
    "visits" ADD PRIMARY KEY("vet_id");
CREATE TABLE "specializations"(
    "vet_id" INTEGER NOT NULL,
    "species_id" INTEGER NOT NULL
);
ALTER TABLE
    "specializations" ADD PRIMARY KEY("vet_id");
CREATE TABLE "species"(
    "id" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "species" ADD PRIMARY KEY("id");
CREATE TABLE "animals"(
    "id" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "date_of_birth" DATE NOT NULL,
    "escape_attempts" INTEGER NOT NULL,
    "neutured" BOOLEAN NOT NULL,
    "weight_kg" DECIMAL(8, 2) NOT NULL,
    "species_id" INTEGER NOT NULL,
    "owner_id" INTEGER NOT NULL
);
ALTER TABLE
    "animals" ADD PRIMARY KEY("id");
ALTER TABLE
    "specializations" ADD CONSTRAINT "specializations_species_id_foreign" FOREIGN KEY("species_id") REFERENCES "species"("id");
ALTER TABLE
    "visits" ADD CONSTRAINT "visits_animals_id_foreign" FOREIGN KEY("animals_id") REFERENCES "animals"("id");
ALTER TABLE
    "animals" ADD CONSTRAINT "animals_species_id_foreign" FOREIGN KEY("species_id") REFERENCES "species"("id");
ALTER TABLE
    "animals" ADD CONSTRAINT "animals_owner_id_foreign" FOREIGN KEY("owner_id") REFERENCES "owners"("id");
ALTER TABLE
    "vets" ADD CONSTRAINT "vets_id_foreign" FOREIGN KEY("id") REFERENCES "visits"("vet_id");
ALTER TABLE
    "vets" ADD CONSTRAINT "vets_id_foreign" FOREIGN KEY("id") REFERENCES "specializations"("vet_id");

    