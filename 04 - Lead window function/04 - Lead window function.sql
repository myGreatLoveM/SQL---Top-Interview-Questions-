DROP TABLE IF EXISTS Weather;

CREATE TABLE IF NOT EXISTS Weather (
	id int, 
	record_date date, 
	temperature int
);

INSERT INTO Weather (id, record_date, temperature) VALUES ('1', '2015-01-01', '10');
INSERT INTO Weather (id, record_date, temperature) VALUES ('2', '2015-01-02', '25');
INSERT INTO Weather (id, record_date, temperature) VALUES ('3', '2015-01-03', '20');
INSERT INTO Weather (id, record_date, temperature) VALUES ('4', '2015-01-04', '30');


-- approach 1
SELECT weather_curr_prev_temp.record_date, weather_curr_prev_temp.temperature
FROM (
	SELECT *, LAG(temperature) OVER() AS prev_day_temp
	FROM Weather ) AS weather_curr_prev_temp
WHERE weather_curr_prev_temp.temperature > weather_curr_prev_temp.prev_day_temp


-- approach 2
WITH weather_curr_prev_temp AS (
	SELECT *, LAG(temperature) OVER() AS prev_day_temp
	FROM Weather 
)
SELECT weather_curr_prev_temp.record_date, weather_curr_prev_temp.temperature
FROM weather_curr_prev_temp
WHERE weather_curr_prev_temp.temperature > weather_curr_prev_temp.prev_day_temp