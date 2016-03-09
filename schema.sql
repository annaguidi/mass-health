DROP TABLE IF EXISTS town_health_records;


CREATE TABLE town_health_records(
id SERIAL PRIMARY KEY,
geography VARCHAR(255),
population INT,
age_minor INT,
age_senior INT,
per_capita_income MONEY,
below_poverty INT,
percent_below_poverty REAL,
percent_ad_pren REAL,
percent_csec REAL,
num_infant_deaths INT,
inf_mort REAL,
percent_low_bw REAL,
percent_mutli_birth REAL,
percent_pub_fin REAL,
percent_teen_births REAL
);
