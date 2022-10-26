-- 2022-03-19
-- Description: To create a database for a podcasting company to follow its podcasts and guest information

drop database if exists A2Seda;
create database if not exists A2Seda;
use A2Seda;

CREATE TABLE podcast
(
	podcastID				INT 			PRIMARY KEY,
    podcastName				VARCHAR(50),
    podcastDate				DATE,
    podcastIsLive			BOOLEAN,
    podcastDurationMunite	int
);

INSERT INTO podcast values
(101, 'Kermode and Mayo s Film Review' , '2022-03-18' , FALSE, 109),
(102, 'Test Match Special' , '2022-03-19' , FALSE, 33),
(103, 'Global News Podcast' , '2022-03-19' , TRUE, 31),
(104, 'Michelle Visage s Rule Breakers' , '2022-03-15' , FALSE, 35),
(105, 'Eddie Hearn: No Passion, No Point' , '2022-03-17' , FALSE, 32),
(106, 'Bad Cops' , '2021-09-25' , FALSE, 32),
(107, 'Operation Ouch! The Podcast of Everything' , '2021-08-11' , TRUE, 18);

CREATE TABLE guest
(
	guestID					INT 					PRIMARY KEY,
    guestFName				VARCHAR(25),
    guestLName				VARCHAR(25),
    guestBirthPlace			VARCHAR(25)
);

INSERT INTO guest VALUES
(10, 'Simon', 'Farnaby', 'UK-Darlington'),
(20, 'Jonathan', 'Agnew', 'UK-Macclesfield'),
(30, 'Dean', 'Wilson', 'Hawaii'),
(40, 'Michelle', 'Visage', 'US-New Jersey'),
(50, 'Jimmy', 'Anderson', 'UK-Burnley'),
(60, 'Wayne', 'Jenkins', 'US-South Carolina');

CREATE TABLE podcastGuest
(
	podcastID			INT,
    guestID				INT,
    watchingPoint		INT,
    PRIMARY KEY (podcastID, guestID),
    
    FOREIGN KEY(podcastID)
		REFERENCES podcast(podcastID),
        
	FOREIGN KEY (guestID)
		REFERENCES guest(guestID)
);

INSERT INTO podcastGuest VALUES
(101,10,60),
(102,20,70),
(102,30,70),
(104,40,65),
(105,50,75),
(106,60,80);

CREATE TABLE guestAdditionalInfo
(
	guestID				INT 				PRIMARY KEY,
    guestDateOfBirth	DATE,
    guestIsFemale		BOOLEAN,
    
    FOREIGN KEY(guestID)
		REFERENCES guest (guestID)
    
);

INSERT INTO guestAdditionalInfo VALUES
(10, '1973-04-02', FALSE),
(20, '1960-04-04', FALSE),
(30, '1969-12-17', FALSE),
(40, '1968-09-20', TRUE),
(50, '1982-07-30', FALSE),
(60, '1977-09-28', FALSE);

/* -- Question #1 query:
SELECT guestDateOfBirth, guestIsFemale, guestFName, guestLName
FROM guestAdditionalInfo a 
	JOIN guest g 
    ON a.guestID = g.guestID
WHERE guestFName LIKE 'J%';

-- Question #2 query:
SELECT podcastDurationMunite,
		(podcastDurationMunite) / 2 AS advertisementTime
FROM podcast
ORDER BY podcastDurationMunite DESC;

-- Question #3 query:
SELECT podcastName 
FROM podcast p
	LEFT JOIN podcastGuest j 
    ON p.podcastID = j.podcastID
 WHERE j.podcastID is NULL;
	

-- Question #4 query:
SELECT podcastName, guestBirthPlace, guestDateOfBirth
FROM podcast p 
	JOIN podcastGuest j 
    ON p.podcastID = j.podcastID
    JOIN guest g
    ON j.guestID = g.guestID
    JOIN guestAdditionalInfo a 
    ON g.guestID =a.guestID
ORDER BY podcastName;
    
    