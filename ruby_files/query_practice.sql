 create table delays(
 	month				integer,
 	airline_id			integer,
 	carrier 			varchar,
 	origin_city_name	varchar,
 	dest_city_name		varchar,
 	dep_delay_new		numeric,
 	arr_delay_new		numeric
 );

alter table delays alter column dep_delay_new type numeric;

copy delays from '/home/vagrant/code/mks/on_time_performance.csv' delimiter ',' csv header;

alter table delays drop column month;

#=> problem 1
select count(distinct airline_id) from delays; 
# => 14


#### problem 2
select 
	carrier,
	count(*) as delay_total
from 
	delays
where arr_delay_new > 0
or dep_delay_new > 0
group by carrier;   

#=> Southwest - WN has most delayed flights  
#=> Virgin American - VX has the least

#=> problem 3
select
	origin_city_name,
	count(*) as delay_total
from
	delays
where dep_delay_new > 0
or arr_delay_new > 0
group by origin_city_name
order by delay_total;
#=> Grand Forks 2 delayed
#=> Chicago 17,719 delayed 

#=> problem 4
select
	dest_city_name,
	count(*) as delay_total
from
	delays
where arr_delay_new>0
or dep_delay_new > 0
group by dest_city_name
order by delay_total;
#=> Grand Forks 2 
# => Chicago 16089

# => problem 5
select 
	avg(dep_delay_new)
from 
	delays; 
# => arr_delay_new = 18.7
#=> dep_delay_new = 18.4

#=> Problem 6
select
	carrier,
	avg(dep_delay_new) as average
from 
	delays
group by carrier
order by average;

 carrier |       average
---------+---------------------
 HA      |  2.8356869911945506
 AS      |  6.0989969827937699
 US      |  9.2902461419981636
 VX      |  9.4082491582491582
 OO      | 13.0420040063433770
 AA      | 13.7281309860439661
 FL      | 15.7939744025370937
 UA      | 18.4275430192415768
 DL      | 19.3734484234555571
 MQ      | 20.1350931677018634
 F9      | 22.4799221652220060
 WN      | 23.1696515643464393
 EV      | 24.9154072462015879
 B6      | 29.5412448132780083


##########Restaurant Inspections
create table restaurant_inspections(
	restaurant_name		VARCHAR,
	zip_code			VARCHAR,
	inspection_date		VARCHAR,
	score				NUMERIC,
	address				VARCHAR,
	facility_id			NUMERIC,
	process_description VARCHAR
);

COPY restaurant_inspections FROM '/home/vagrant/code/mks/restaurant_inspection_scores.csv' DELIMITER ',' CSV HEADER;

#=>  1 How many zipcodes are represented in this dataset?
SELECT count(DISTINCT zip_code) FROM restaurant_inspections;

 count
-------
    57

#=> 2 What is the breakdown of inspection count by zip code?
SELECT
	zip_code,
	count(zip_code) AS zipcount
FROM
	restaurant_inspections
GROUP BY zip_code
ORDER BY zipcount;

zip_code | zipcount
----------+----------
 78610    |        4
 78612    |        4
 78654    |        4
 78615    |        5
 78743    |        5
 78621    |        6
 78620    |       11
 78641    |       28
 78742    |       30
 78739    |       48
 78652    |       49
 78733    |       57
 78737    |       60
 78747    |       60
 78725    |       61
 78730    |       64
 78736    |       93
 78669    |       95
 78721    |      122
 78719    |      139
 it continues..........

 #=> 3 Which zipcode had the highest average score?

 SELECT
 	zip_code,
 	avg(score) AS average
 FROM 
 	restaurant_inspections
GROUP BY zip_code
ORDER BY average DESC;

zip_code |       average
----------+---------------------
 78621    | 96.8333333333333333
 78743    | 95.8000000000000000
 78641    | 95.6785714285714286
 78652    | 95.6326530612244898
 78654    | 95.5000000000000000

#=> 4 What is the lowest possible score based on this dataset?

SELECT
	min(score)
FROM
	restaurant_inspections;
	 
	 min
-----
  45
(1 row)

#=> 5 Which establishments scored the lowest?

SELECT
	restaurant_name,
	score
FROM
	restaurant_inspections
ORDER BY score
LIMIT 10;

       restaurant_name       | score
-----------------------------+-------
 Frans Hamburgers           |    45
 Los Comales Taqueria        |    48
 Villa Mexico Restaurant     |    50
 Janitzio Mexican Restaurant |    50
 La Fuentes Restaurant       |    50
 Chinatown Restaurant        |    51
 R.C. Fowlers Bar & Grill    |    52
 Fujian Grand China Buffet   |    52
 Chuy Panaderia              |    53
 Taco Cabana #123            |    53

#=> 6 Which establishments received the most visits from the inspector?

SELECT
	restaurant_name,
	count(*) AS inspections
FROM
	restaurant_inspections
GROUP BY restaurant_name
ORDER BY inspections DESC
LIMIT 10;

    restaurant_name     | inspections
------------------------+-------------
 Subway                 |         161
 Thundercloud Subs      |          81
 Pizza Hut              |          64
 Sonic Drive In         |          64
 McDonald's             |          63
 Amy's Ice Cream        |          45
 7-Eleven               |          41
 Torchy's Tacos         |          36
 Tokyo Gardens Catering |          36
 Sonic                  |          36



