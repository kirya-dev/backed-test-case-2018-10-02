CREATE TABLE "stuff" (
	"id" serial NOT NULL,
	"created_at" TIMESTAMP NOT NULL,
	"updated_at" TIMESTAMP NOT NULL,
	"first_name" varchar(255) NOT NULL,
	"last_name" varchar(255) NOT NULL,
	"middle_name" varchar(255),
	"sex" varchar(1),
	"salary" bigint,
	CONSTRAINT stuff_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "department" (
	"id" serial NOT NULL,
	"created_at" TIMESTAMP NOT NULL,
	"updated_at" TIMESTAMP NOT NULL,
	"name" varchar NOT NULL,
	CONSTRAINT department_pk PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "stuff_department" (
	"stuff_id" bigint NOT NULL,
	"department_id" bigint NOT NULL,
	CONSTRAINT stuff_department_pk PRIMARY KEY ("stuff_id","department_id")
) WITH (
  OIDS=FALSE
);





ALTER TABLE "stuff_department" ADD CONSTRAINT "stuff_department_fk0" FOREIGN KEY ("stuff_id") REFERENCES "stuff"("id");
ALTER TABLE "stuff_department" ADD CONSTRAINT "stuff_department_fk1" FOREIGN KEY ("department_id") REFERENCES "department"("id");
