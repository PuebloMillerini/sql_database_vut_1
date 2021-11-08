CREATE TABLE IF NOT EXISTS "user" (
	"user_id" serial primary key NOT NULL,
	"username" VARCHAR(45) NOT NULL,
	"password" INT NOT NULL,
	"firstname" VARCHAR(45) NOT NULL,
	"surname" VARCHAR(45) NOT NULL,
	"email" VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS "round_schedule" (
	"round_schedule_id" serial primary key NOT NULL,
	"round_number" INT NOT NULL
);

CREATE TABLE IF NOT EXISTS "round_stats"(
	"round_stats_id" serial primary key NOT NULL,
	"total_number_of_goals" INT NOT NULL,
	"max_goals_in_a_match" INT NOT NULL,
	"total_number_of_assists" INT NOT NULL,
	"round_schedule_id" INT NOT NULL,
	foreign key("round_schedule_id") references "round_schedule"
);

CREATE TABLE IF NOT EXISTS "user_round_points" (
	"user_round_points_id" serial primary key NOT NULL,
	"user_id" INT NOT NULL,
	"users_total_number_of_goals" INT NOT NULL,
	"user_max_goals_in_a_match" INT NOT NULL,
	"users_total_number_of_assist" VARCHAR(45) NOT NULL,
	"round_stats_id" INT NOT NULL,
	foreign key ("user_id") references "user",
	foreign key ("round_stats_id") references "round_stats"
);

CREATE TABLE IF NOT EXISTS "football_team" (
	"football_team_id" serial primary key NOT NULL,
	"team_name" VARCHAR(45) NOT NULL,
	"number_of_trophy" INT NULL
);

CREATE TABLE IF NOT EXISTS "address" (
	"address_id" serial primary key NOT NULL,
	"country" VARCHAR(45) NOT NULL,
	"city" VARCHAR(45) NOT NULL,
	"street" VARCHAR(45) NOT NULL,
	"house_number" VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS "team_stadium" (
	"team_stadium_id" serial primary key NOT NULL,
	"stadium_name" VARCHAR(45) NOT NULL,
	"match_date" DATE NULL,
	"football_team_id" INT NOT NULL,
	"address_id" INT NOT NULL,
	foreign key ("address_id") references "address",
	foreign key ("football_team_id") references "football_team"
);

CREATE TABLE IF NOT EXISTS "team_game" (
	"game_id" serial primary key NOT NULL,
	"start_time" DATE NOT NULL,
	"end_time" DATE NOT NULL,
	"description" VARCHAR(45) NOT NULL,
	"football_team1_id" INT NOT NULL,
	"football_team2_id" INT NOT NULL,
	"round_schedule_id" INT NOT NULL,
	foreign key ("football_team1_id") references "football_team",
	foreign key ("football_team2_id") references "football_team",
	foreign key ("round_schedule_id") references "round_schedule"
);

CREATE TABLE IF NOT EXISTS "user_has_address"(
	"user_id" INT NOT NULL,
	"address_id" INT NOT NULL,
	"address_type" VARCHAR(45) NOT NULL,
	foreign key ("user_id") references "user",
	foreign key ("address_id") references "address"
  );

CREATE TABLE IF NOT EXISTS "manager" (
	"manager_id" serial primary key NOT NULL,
	"firstname" VARCHAR(45) NOT NULL,
	"sirname" VARCHAR(45) NOT NULL,
	"email" VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS "player" (
	"player_id" serial primary key NOT NULL,
	"name" VARCHAR(45) NOT NULL,
	"surname" VARCHAR(45) NOT NULL,
	"age" VARCHAR(45) NOT NULL,
	"contract" DATE NOT NULL,
	"salary" INT NOT NULL,
	"manager_id" INT NOT NULL,
	"football_team_id" INT NOT NULL,
	foreign key ("manager_id") references "manager",
	foreign key ("football_team_id") references "football_team"
);

CREATE TABLE IF NOT EXISTS "trainer" (
	"trainer_id" serial primary key NOT NULL,
	"firstname" VARCHAR(45) NOT NULL,
	"surname" VARCHAR(45) NOT NULL,
	"email" VARCHAR(45) NOT NULL,
	"manager_id" INT NOT NULL,
	"football_team_id" INT NOT NULL,
	foreign key ("manager_id") references "manager",
	foreign key ("football_team_id") references "football_team"
);