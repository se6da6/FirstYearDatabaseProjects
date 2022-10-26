
--  Topic: Art Galleries , Section: 101, Student ID: 4326699

DROP DATABASE IF EXISTS assignment1;
CREATE DATABASE assignment1;

USE assignment1;

CREATE TABLE artist
(
	artistID				INT					PRIMARY KEY,
	artistFName				VARCHAR(30),
	artistLName				VARCHAR(30),
	artistBirth				DATE,
	artistGradArtSch		BOOLEAN
);

INSERT INTO artist VALUES
(1,	'Pablo',	'Picasso',	'1881-10-25',	TRUE),
(2,	'Salvador',	'Dali',	'1904-05-11',	TRUE),
(3,	'Hans',	'Hartung',	'1904-09-21',	TRUE),
(4,	'Van',	'Gogh',	'1853-03-30',	FALSE),
(5,	'Claude',	'Monet',	'1840-11-14',	FALSE),
(6,	'Marc' , 'Chagall',	'1887-07-07',	TRUE);

CREATE TABLE gallery
(
	galleryID           		INT				PRIMARY KEY,
	galleryName					VARCHAR(100),
  	galleryPhone         		VARCHAR(100),
 	galleryAddress				VARCHAR(100),
	galleryEntranceFee			DECIMAL(4,2),
	artistID					INT,				
    CONSTRAINT item_fk_artist	
		FOREIGN KEY (artistID)
        REFERENCES artist(artistID)
);

INSERT INTO gallery VALUES
(10,	'The Boon Gallery',	'+32 (0)475 45 49 63',	'KUSTLAAN 197 B-8300 KNOKKE BELGIUM',	50.50,	5),
(20,	'Applicat-Prazan',	'+33 (0)1 43 25 39 24',	'16 rue de Seine 75006 Paris France',	70.25,	3),
(30,	'Galleria II Mappamondo',	'+39 02 29002435',	'Via Borgonuovo 2 20121 Milan Italy',	40.10,	1),
(40,	'Tornabuoni Arte Gallery',	'+33 1 53 53 51 51',	'16 avenue Matignon, 75008 Paris',	40.50,	1),
(50,	'Gio Marconi Art Gallery',	'+39 02 2940 4373',	'Via Tadino 20 I-20124 Milano',	50.60,	6),
(60,	'Galerie Fleury',	'+33 1 42 89 42 29',	'A&R FLEURY 36 Avenue Matignon -75008 Paris',	70.45,	3),
(70,	'Frans Jacobs Fine Art Gallery',	'+31 6 10791983',	'Berlagelaan 129 1222 JR Hilversum The Netherlands',	60.50,	4),
(80,	'The Patrick Derom Gallery',	'+32 2 514 08 82',	'Rue aux Laines 1 1000 Brussels Belgium',	40.55,	2),
(90,	'Acquavella Galleries',	'+1 212-734-6300',	'18 East 79th Street New York, NY 10075', 30.45,	5),
(100,	'Beck & Eggeling International Fine Art',	'+49 211 4915890',	'Bilker Strasse 5 und Bilker Strasse 4-6 40213 Dusseldorf',	50.50,	1),
(110,	'Maison d’Art Gallery',	'+377 97 97 11 60',	'MDA Today BP 122, 98003 Monaco Cedex',	60.70,	5),
(120,	'Opera Gallery',	'+1 646-707-3299',	'791 Madison Avenue New York, NY 100‎65',	30.45,	6),
(130,	'Galerie Art',	'+420 469 622 436',	'Resslovo námstí 12, 537 01 Chrudim, Czech Republic',	30.25,	6),
(140,	'Cermak- Eisenkraft Gallery',	'+420 608 713 536',	'Národní 1010/9 Prague 11000 Czech Republic',	30.35,	2),
(150,	'Gagosian Gallery',	'+1 212-741-1111',	'555 West 24th Street, New York City',	40.50,	5);

CREATE TABLE galleryTypeNote
(
	galleryID						INT				PRIMARY KEY,
	galleryTypeNote					VARCHAR(1000),
	galleryTypeNoteDate				DATE
);

INSERT INTO galleryTypeNote VALUES
(10,	'It is a commercial gallery. Main aim is the acquisitions and sales of international artworks that were produced from 1880 until today.',	'2022-01-25'),
(20,	'It is a non-profit gallery. It is a gallery dedicated to the principal artists of the Post-War School of Paris. Applicat-Prazan works with collectors, with whom it develops long-term relationships of trust.',	'2009-07-10'),
(30,	'Established in the 1970s, is devoted to Modern and Contemporary Art, Italian and International.',	'2010-05-22'),
(40,	'It is an artist-run initiative. Tornabuoni Art was founded in 1981 in Via Tornabuoni, Florence, thanks to Roberto Casamonti’s passion for art, an interest inherited from his father who was a collector of 20th century Italian art. Tornabuoni Art also works closely with museums and cultural institutions. Thanks to its experience and knowledge gained in the art market, the gallery has also established itself as an advisor for both public and private collections.',	'2001-10-23'),
(50,	'It starts as an artist-run initiative. Throughout the decades, the gallery continued to support the careers of its artists, promoting their diverse practices to audiences and institutions at home and abroad. While the focus of the gallery has always been on contemporary positions, it gradually started to include also historical artists of the Studio Marconi.',	'2000-05-20'),
(60,	'It is a commercial one. Alexandre and Richard Fleury, specialists in modern and post-war art, have been passionately researching the most significant works of the 20th century for twenty years.This rigorous selection work is based on the bonds of trust and loyalty forged over the years with collectors, families of artists and colleagues.',	'2010-02-25'),
(70,	'It is a vanity gallery. Frans Jacobs Fine Art, founded in 1985 by Dr. Frans Jacobs, is one of the leading art galleries in The Netherlands. The gallery represents a permanent collection of the great modern masters starting from 1860 on.',	'1990-10-05'),
(80,	'Covering a vast period from c.1880 to the present, the gallery presents work representing modern movements from Symbolism to Pop Art, with occasional excursions into contemporary art. A collector at heart, Patrick Derom selects his acquisitions on the basis of two criteria: quality and his personal enthusiasm for the artist or work.',	'2000-01-22'),
(90,	'It is a commercial one. Acquavella Galleries is distinguished for its expertise in the fields of 19th, 20th and 21st century art. The gallery, founded by Nicholas Acquavella in the early 1920s, is now a three-generation, family-owned business: Bill Acquavella joined his father in 1960, Bill’s daughter Eleanor joined in 1997, and his sons Nick and Alexander joined in 2000 and 2003 respectively.',	'2010-12-01'),
(100,	'Beck & Eggeling has made a diverse contribution to cultural life for over 20 years. A consistent, high-quality program with impressionist, expressionist, classical and postwar modernist works has allowed Beck & Eggeling to establish itself as one of the leading galleries in the international art market.',	'2009-10-01'),
(110,	'Founded in 1997 in the Principality of Monaco, the Art Gallery Maison d’Art operates in the Modern and Contemporary Art field, with a strong background in Old Masters from the 13th to the 18th century.Besides Modern and Contemporary art exhibitions held at the Gallery, Maison d’Art takes enthusiastically part in major art fairs, such as TEFAF Maastricht, London Masterpiece, the Biennales d’Antiquaires in Paris and Florence, the Moscow World Fine Art Fair and many others.',	'2010-11-24'),
(120,	'It is a non-profit gallery. The Opera Gallery adventure began over 25 years ago, in 1994, when our two first exhibition spaces opened simultaneously in Paris and in Singapore with the aim of showing international emerging artists alongside masters of Contemporary and Modern Art. Thanks to an incredible community of collectors, artists, supporters and my outstanding Opera Gallery staff, we have, along the years, expanded to include twelve further spaces in prime locations around the world: in New York, Miami, Miami Bal Harbour, Aspen, London, Monaco, Geneva, Dubai, Beirut, Hong Kong and Seoul.',	'2005-10-22'),
(130,	'Galerie Art was founded by Svetlana and Lubos Jelinek in 1996. The gallery has a massive collection of artwork that covers a wide range of styles and traditions.These masterpieces cover work from the 13th century, 18th century, 19th century, and 20th century Old Masters to Modern and Contemporary art.',	'2000-11-25'),
(140,	'The gallery Cermak-Eisenkraft was founded in 2014 with the ambition of becoming a leading dealer in post-war and contemporary Czech and international art. The company’s founders, Tomáš Zapletal and David Železný, who were independently active on the Czech art market before the brand was established, set themselves the goal of creating a company of international repute whose unsurpassed standards will contribute to cultivating the art market in the Czech Republic.The founders of the gallery took its name from the recent history of their families as an expression of traditional and conservative values.',	'2017-10-01'),
(150,	'It is an artist-run initiative. Established by Larry Gagosian in Los Angeles in 1980, Gagosian is a global gallery specializing in modern and contemporary art that employs more than three hundred people at nineteen exhibition spaces across the United States, Europe, and Asia. In addition to its galleries, Gagosian is at the forefront of the digital marketplace with innovative online viewing rooms, timed to coincide with major art fairs, that include highly desirable works by today’s leading artists, transparent pricing, historical scholarship, and insightful market analysis.',	'2000-10-14');

SELECT *
FROM artist;

SELECT *
FROM gallery;

SELECT *
FROM galleryTypeNote;

SELECT galleryName, artistLName
FROM artist
	INNER JOIN gallery
		ON artist.artistID = gallery.artistID;

SELECT galleryName, galleryTypeNoteDate	
FROM gallery
	INNER JOIN galleryTypeNote	
		ON gallery.galleryID = galleryTypeNote.galleryID;
