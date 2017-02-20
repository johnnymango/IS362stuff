-- Johnny Rodriguez
-- Assignment 1

-- 1. How many airplanes have listed speeds? 
	SELECT COUNT(speed) FROM flights.planes
--	23
	
-- What is the minimum listed speed and the maximum listed speed?
	Min Speed:
	SELECT MIN(speed) FROM flights.planes
--	90
	
--	Max Speed:
	SELECT MAX(speed) FROM flights.planes
--	432
	
-- 2. What is the total distance flown by all of the planes in January 2013? 
	SELECT SUM(distance) FROM flights.flights
	WHERE (month = 1 AND day = 13)
--	846241


-- What is the total distance flown by all of the planes in January 2013 where the tailnum is missing?
	SELECT SUM(distance) FROM flights.flights
	WHERE (month = 1 AND day = 13)
	AND tailnum IS NOT NULL
	--844404
	
-- 3. What is the total distance flown for all planes on July 5, 2013 grouped by aircraft manufacturer? Write this statement first using an INNER JOIN, then using a LEFT OUTER JOIN. How do your results compare?
	SELECT manufacturer, (distance) FROM flights.flights
	INNER JOIN flights.planes ON planes.tailnum = flights.tailnum
	WHERE (day = 5 AND month = 7)
	GROUP BY manufacturer
	
	SELECT manufacturer, (distance) FROM flights.flights
	LEFT JOIN flights.planes ON planes.tailnum = flights.tailnum
	WHERE (day = 5 AND month = 7)
	GROUP BY manufacturer
	
--	The inner join groups the manufacture where the tail number data appears in both the flights.flights and the planes.flights have in common.  The left join matches the values  where tailnum appears in the left hand table; where there is not match, the result is null.
	
/*	
	INNER JOIN RESULTS
	Manufacturer	Distance
	AIRBUS	1617
	AIRBUS INDUSTRIE	529
	AMERICAN AIRCRAFT INC	733
	BARKER JACK L	937
	BOEING	1400
	BOMBARDIER INC	229
	CANADAIR	228
	CESSNA	764
	DOUGLAS	1089
	EMBRAER	96
	GULFSTREAM AEROSPACE	502
	MCDONNELL DOUGLAS	733
	MCDONNELL DOUGLAS AIRCRAFT CO	1096
	MCDONNELL DOUGLAS CORPORATION	1076
	
	OUTER JOIN RESULTS
	Manufacturer	Distance
	(Null)	1089
	AIRBUS	544
	AIRBUS INDUSTRIE	529
	AMERICAN AIRCRAFT INC	733
	BARKER JACK L	937
	BOEING	937
	BOMBARDIER INC	488
	CANADAIR	228
	CESSNA	764
	DOUGLAS	1089
	EMBRAER	725
	GULFSTREAM AEROSPACE	502
	MCDONNELL DOUGLAS	733
	MCDONNELL DOUGLAS AIRCRAFT CO	1005
	MCDONNELL DOUGLAS CORPORATION	1076
*/	
	
--	4. What are the total number of seats flown on New Years day for every airline?

	SELECT airlines.name as 'Airline', SUM(seats) AS 'Total_Seats' FROM flights.airlines
	LEFT JOIN flights.flights ON airlines.carrier = flights.carrier
	LEFT JOIN flights.planes ON flights.tailnum = planes.tailnum
	WHERE month = 1 and day = 1
	GROUP BY airlines.carrier
	ORDER BY airlines.name
/*	
	AirTran Airways Corporation	1000
	Alaska Airlines Inc.	298
	American Airlines Inc.	5237
	Delta Air Lines Inc.	18539
	Endeavor Air Inc.	2260
	Envoy Air	78
	ExpressJet Airlines Inc.	6535
	Frontier Airlines Inc.	182
	Hawaiian Airlines Inc.	377
	JetBlue Airways	22020
	Southwest Airlines Co.	3807
	United Air Lines Inc.	28351
	US Airways Inc.	6750
	Virgin America	2184
*/
