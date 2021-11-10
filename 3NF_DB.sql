CREATE TABLE "Competition" (
    "CompetitionID" int   NOT NULL,
    "ContestantID" int   NOT NULL,
    "DisciplineID" int   NOT NULL,
    "PlaceID" int   NOT NULL,
    "Reward" text   NOT NULL,
    CONSTRAINT "pk_Competition" PRIMARY KEY (
        "CompetitionID"
     )
);

CREATE TABLE "Discipline" (
    "DisciplineID" int   NOT NULL,
    "DisciplineName" string   NOT NULL,
    CONSTRAINT "pk_Discipline" PRIMARY KEY (
        "DisciplineID"
     )
);


CREATE TABLE "Place" (
    "PlaceID" int   NOT NULL,
    "PlaceName" string   NOT NULL,
    "PlaceType" text   NOT NULL,
    CONSTRAINT "pk_Place" PRIMARY KEY (
        "PlaceID"
     )
);

CREATE TABLE "Contestant" (
    "ContestantID" int   NOT NULL,
    "OrganizationName" string   NOT NULL,
    "RepresentativeName" string   NOT NULL,
    "RepresentativeSurname" string   NOT NULL,
    "NumOfPersons" int   NOT NULL,
    CONSTRAINT "pk_Contestant" PRIMARY KEY (
        "ContestantID"
     )
);

ALTER TABLE "Competition" ADD CONSTRAINT "fk_Competition_ContestantID" FOREIGN KEY("ContestantID")
REFERENCES "Contestant" ("ContestantID");

ALTER TABLE "Competition" ADD CONSTRAINT "fk_Competition_DisciplineID" FOREIGN KEY("DisciplineID")
REFERENCES "Discipline" ("DisciplineID");

ALTER TABLE "Competition" ADD CONSTRAINT "fk_Competition_PlaceID" FOREIGN KEY("PlaceID")
REFERENCES "Place" ("PlaceID");

