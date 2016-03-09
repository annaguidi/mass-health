-- WRITE YOUR QUERIES HERE
-- What 3 towns have the highest population of citizens that are 65 years and older?
SELECT geography FROM town_health_records
WHERE geography NOT LIKE '%Massachusetts Total%'
ORDER BY town_health_records.age_senior DESC
LIMIT 3;
-- What 3 towns have the highest population of citizens that are 19 years and younger?
SELECT geography FROM town_health_records
WHERE geography NOT LIKE '%Massachusetts Total%'
ORDER BY town_health_records.age_minor DESC
LIMIT 3;
-- What 5 towns have the lowest per capita income?
SELECT geography FROM town_health_records
WHERE geography NOT LIKE '%Massachusetts Total%'
ORDER BY town_health_records.per_capita_income DESC
LIMIT 5;
-- Omitting Boston, Becket, and Beverly, what town has the highest percentage of teen births?

SELECT geography FROM town_health_records
WHERE geography NOT IN ('Massachusetts Total', 'Boston', 'Becket', 'Beverly')
ORDER BY town_health_records.age_minor DESC
LIMIT 1;
-- Omitting Boston, what town has the highest number of infant mortalities?
SELECT geography FROM town_health_records
WHERE geography NOT IN ('Massachusetts Total', 'Boston')
ORDER BY town_health_records.inf_mort DESC
LIMIT 1;
