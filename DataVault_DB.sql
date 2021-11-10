CREATE TABLE "SAT_Competition" (
    "CompetitionID_hash_key" int   NOT NULL,
    "Discip_hash_key" int   NOT NULL,
    "Place_hash_key" int   NOT NULL,
    "Contestant_hash_key" int   NOT NULL,
    "Reward" text   NOT NULL,
    CONSTRAINT "pk_SAT_Competition" PRIMARY KEY (
        "CompetitionID_hash_key"
     )
);

CREATE TABLE "HUB_Competition" (
    "CompetitionID_hash_key" int   NOT NULL,
    "Discip_hash_key" int   NOT NULL,
    "Place_hash_key" int   NOT NULL,
    "Contestant_hash_key" int   NOT NULL,
    "ChangeDate" datestamp   NOT NULL,

    CONSTRAINT "uc_HUB_Competition_CompetitionID_hash_key" UNIQUE (
        "CompetitionID_hash_key"
    )
);

CREATE TABLE "SAT_Discipline" (
    "Discipline_hash_key" int   NOT NULL,
    "DisciplineName" string   NOT NULL,
    "DisciplineDescription" text   NOT NULL,
    CONSTRAINT "pk_SAT_Discipline" PRIMARY KEY (
        "Discipline_hash_key"
     )
);

CREATE TABLE "HUB_Discipline" (
    "Discipline_hash_key" int   NOT NULL,
    "ChangeDate" datestamp   NOT NULL,

    CONSTRAINT "uc_HUB_Discipline_Discipline_hash_key" UNIQUE (
        "Discipline_hash_key"
    )
);

CREATE TABLE "SAT_OlympicDiscipline" (
    "OlympicDiscipline_hash_key" int   NOT NULL,
    "OlympricSport" boolean   NOT NULL,
    "InOlympicDate" datestamp   NOT NULL,
    CONSTRAINT "pk_SAT_OlympicDiscipline" PRIMARY KEY (
        "OlympicDiscipline_hash_key"
     )
);

CREATE TABLE "LINK_Discipline" (
    "Discip_hash_key" int   NOT NULL,
    "Discipline_hash_key" int   NOT NULL,
    "OlympicDiscipline_hash_key" int   NOT NULL,
    CONSTRAINT "pk_LINK_Discipline" PRIMARY KEY (
        "Discip_hash_key"
     )
);

CREATE TABLE "SAT_Place" (
    "Place_hash_key" int   NOT NULL,
    "PlaceName" string   NOT NULL,
    "PlaceType" text   NOT NULL,
    "PlaceDescription" text   NOT NULL,
    CONSTRAINT "pk_SAT_Place" PRIMARY KEY (
        "Place_hash_key"
     )
);

CREATE TABLE "HUB_Place" (
    "Discipline_hash_key" int   NOT NULL,
    "ChangeDate" datestamp   NOT NULL,

    CONSTRAINT "uc_HUB_Place_Discipline_hash_key" UNIQUE (
        "Discipline_hash_key"
    )
);

CREATE TABLE "SAT_Contestant" (
    "Contestant_hash_key" int   NOT NULL,
    "OrganizationName" string   NOT NULL,
    "RepresentativeName" string   NOT NULL,
    "RepresentativeSurname" string   NOT NULL,
    "NumOfPersons" int   NOT NULL,
    CONSTRAINT "pk_SAT_Contestant" PRIMARY KEY (
        "Contestant_hash_key"
     )
);

CREATE TABLE "HUB_Contestant" (
    "Discipline_hash_key" int   NOT NULL,
    "ChangeDate" datestamp   NOT NULL,

    CONSTRAINT "uc_HUB_Contestant_Discipline_hash_key" UNIQUE (
        "Discipline_hash_key"
    )
);

ALTER TABLE "SAT_Competition" ADD CONSTRAINT "fk_SAT_Competition_Discip_hash_key_Place_hash_key_Contestant_hash_key" FOREIGN KEY("Discip_hash_key", "Place_hash_key", "Contestant_hash_key")
REFERENCES "HUB_Competition" ("Discip_hash_key", "Place_hash_key", "Contestant_hash_key");

ALTER TABLE "HUB_Competition" ADD CONSTRAINT "fk_HUB_Competition_CompetitionID_hash_key" FOREIGN KEY("CompetitionID_hash_key")
REFERENCES "SAT_Competition" ("CompetitionID_hash_key");

ALTER TABLE "HUB_Competition" ADD CONSTRAINT "fk_HUB_Competition_Discip_hash_key" FOREIGN KEY("Discip_hash_key")
REFERENCES "LINK_Discipline" ("Discip_hash_key");

ALTER TABLE "HUB_Competition" ADD CONSTRAINT "fk_HUB_Competition_Place_hash_key" FOREIGN KEY("Place_hash_key")
REFERENCES "SAT_Place" ("Place_hash_key");

ALTER TABLE "HUB_Competition" ADD CONSTRAINT "fk_HUB_Competition_Contestant_hash_key" FOREIGN KEY("Contestant_hash_key")
REFERENCES "SAT_Contestant" ("Contestant_hash_key");

ALTER TABLE "HUB_Discipline" ADD CONSTRAINT "fk_HUB_Discipline_Discipline_hash_key" FOREIGN KEY("Discipline_hash_key")
REFERENCES "SAT_Discipline" ("Discipline_hash_key");

ALTER TABLE "LINK_Discipline" ADD CONSTRAINT "fk_LINK_Discipline_Discipline_hash_key" FOREIGN KEY("Discipline_hash_key")
REFERENCES "HUB_Discipline" ("Discipline_hash_key");

ALTER TABLE "LINK_Discipline" ADD CONSTRAINT "fk_LINK_Discipline_OlympicDiscipline_hash_key" FOREIGN KEY("OlympicDiscipline_hash_key")
REFERENCES "SAT_OlympicDiscipline" ("OlympicDiscipline_hash_key");

ALTER TABLE "HUB_Place" ADD CONSTRAINT "fk_HUB_Place_Discipline_hash_key" FOREIGN KEY("Discipline_hash_key")
REFERENCES "SAT_Place" ("Place_hash_key");

ALTER TABLE "HUB_Contestant" ADD CONSTRAINT "fk_HUB_Contestant_Discipline_hash_key" FOREIGN KEY("Discipline_hash_key")
REFERENCES "SAT_Contestant" ("Contestant_hash_key");

