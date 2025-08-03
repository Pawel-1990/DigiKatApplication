DO '
BEGIN
    IF NOT EXISTS(SELECT 1 FROM pg_type WHERE typname = ''production_enum'') THEN
        CREATE TYPE production_enum AS ENUM(''POLISH_PISF'', ''POLISH_OTHER'', ''FOREIGN'');
    END IF;
    IF NOT EXISTS(SELECT 1 FROM pg_type WHERE typname = ''availability_enum'') THEN
        CREATE TYPE availability_enum AS ENUM (''NETFLIX'', ''YOUTUBE'', ''DISNEY'', ''HBO'');
    END IF;
    IF NOT EXISTS(SELECT 1 FROM pg_type WHERE typname = ''rating_enum'') THEN
        CREATE TYPE rating_enum AS ENUM (''AVERAGE'', ''GOOD'', ''OUTSTANDING'');
        END IF;
    CREATE TABLE IF NOT EXISTS films (
                                        id SERIAL PRIMARY KEY,
                                        title VARCHAR(300),
                                        director VARCHAR(100),
                                        year INTEGER CHECK (year >=1888 AND year <= date_part(''year'', now())),
                                        production production_enum,
                                        availability availability_enum[],
                                        last_update DATE,
                                        user_rating rating_enum,
                                        ranking INTEGER,
                                        size INTEGER
    );
    IF (SELECT COUNT(*) FROM films) = 0 THEN
        INSERT INTO films (title, director, year, production, availability, last_update, user_rating, size) VALUES
            (''Incepcja'', ''Christopher Nolan'', 2010, ''FOREIGN'', ARRAY [''NETFLIX''::availability_enum, ''DISNEY''::availability_enum], ''2023-05-15'', ''GOOD'', 750),
            (''Pociąg do Hollywood'', ''Jerzy Kawalerowicz'', 1980, ''POLISH_PISF'', ARRAY [''NETFLIX''::availability_enum, ''HBO''::availability_enum], ''2018-03-10'', ''AVERAGE'', 300),
            (''The Godfather'', ''Francis Ford Coppola'', 1972, ''FOREIGN'', ARRAY [''HBO''::availability_enum], ''2021-09-22'', ''OUTSTANDING'', 600),
            (''Miasto 44'', ''Jan Komasa'', 2014, ''POLISH_OTHER'', ARRAY [''YOUTUBE''::availability_enum], ''2020-07-01'', ''GOOD'', 450),
            (''Schindlers List'', ''Steven Spielberg'', 1993, ''FOREIGN'', ARRAY [''NETFLIX''::availability_enum, ''DISNEY''::availability_enum], ''2019-12-05'', ''OUTSTANDING'', 800),
            (''Człowiek z marmuru'', ''Andrzej Wajda'', 1977, ''POLISH_PISF'', ARRAY [''NETFLIX''::availability_enum], ''2022-04-18'', ''AVERAGE'', 200),
            (''Titanic'', ''James Cameron'', 1997, ''FOREIGN'', ARRAY [''DISNEY''::availability_enum, ''HBO''::availability_enum], ''2024-01-30'', ''GOOD'', 900),
            (''Rejs'', ''Marek Piwowski'', 1970, ''POLISH_OTHER'', ARRAY [''YOUTUBE''::availability_enum, ''NETFLIX''::availability_enum], ''2017-06-12'', ''AVERAGE'', 150),
            (''The Dark Knight'', ''Christopher Nolan'', 2008, ''FOREIGN'', ARRAY [''NETFLIX''::availability_enum], ''2023-11-03'', ''OUTSTANDING'', 700),
            (''Ida'', ''Paweł Pawlikowski'', 2013, ''POLISH_PISF'', ARRAY [''YOUTUBE''::availability_enum, ''HBO''::availability_enum], ''2021-08-25'', ''GOOD'', 350),
            (''Forrest Gump'', ''Robert Zemeckis'', 1994, ''FOREIGN'', ARRAY [''DISNEY''::availability_enum], ''2020-02-14'', ''AVERAGE'', 650),
            (''Chłopcy z placu broni'', ''Jerzy Gruza'', 1967, ''POLISH_OTHER'', ARRAY [''NETFLIX''::availability_enum, ''HBO''::availability_enum], ''2016-09-09'', ''GOOD'', 250),
            (''The Shawshank Redemption'', ''Frank Darabont'', 1994, ''FOREIGN'', ARRAY [''NETFLIX''::availability_enum, ''HBO''::availability_enum], ''2022-06-20'', ''OUTSTANDING'', 550),
            (''Królik po berlińsku'', ''Marek Koterski'', 1984, ''POLISH_PISF'', ARRAY [''YOUTUBE''::availability_enum], ''2019-03-17'', ''AVERAGE'', 180),
            (''The Lord of the Rings: The Fellowship of the Ring'', ''Peter Jackson'', 2001, ''FOREIGN'', ARRAY [''DISNEY''::availability_enum, ''NETFLIX''::availability_enum], ''2023-07-07'', ''GOOD'', 850),
            (''Rejs'', ''Marek Piwowski'', 1970, ''POLISH_OTHER'', ARRAY [''NETFLIX''::availability_enum, ''DISNEY''::availability_enum], ''2021-10-11'', ''AVERAGE'', 160),
            (''Pulp Fiction'', ''Quentin Tarantino'', 1994, ''FOREIGN'', ARRAY [''HBO''::availability_enum], ''2020-05-03'', ''OUTSTANDING'', 700),
            (''Krótki film o miłości'', ''Janusz Zaorski'', 1988, ''POLISH_PISF'', ARRAY [''NETFLIX''::availability_enum, ''YOUTUBE''::availability_enum], ''2018-12-22'', ''GOOD'', 300),
            (''The Silence of the Lambs'', ''Jonathan Demme'', 1991, ''FOREIGN'', ARRAY [''NETFLIX''::availability_enum], ''2022-04-09'', ''AVERAGE'', 400),
            (''Przesłuchanie'', ''Ryszard Bugajski'', 1982, ''POLISH_OTHER'', ARRAY [''DISNEY''::availability_enum, ''HBO''::availability_enum], ''2017-08-15'', ''GOOD'', 220),
            (''The Grand Budapest Hotel'', ''Wes Anderson'', 2014, ''FOREIGN'', ARRAY [''DISNEY''::availability_enum, ''YOUTUBE''::availability_enum], ''2023-02-28'', ''OUTSTANDING'', 600),
            (''Człowiek z marmuru'', ''Andrzej Wajda'', 1977, ''POLISH_PISF'', ARRAY [''HBO''::availability_enum], ''2021-06-14'', ''AVERAGE'', 190),
            (''The Social Network'', ''David Fincher'', 2010, ''FOREIGN'', ARRAY [''NETFLIX''::availability_enum, ''DISNEY''::availability_enum], ''2020-11-19'', ''GOOD'', 500),
            (''Seksmisja'', ''Juliusz Machulski'', 1984, ''POLISH_OTHER'', ARRAY [''NETFLIX''::availability_enum], ''2022-09-05'', ''OUTSTANDING'', 280),
            (''Gladiator'', ''Ridley Scott'', 2000, ''FOREIGN'', ARRAY [''DISNEY''::availability_enum], ''2019-03-30'', ''GOOD'', 750),
            (''Miś'', ''Stanisław Bareja'', 1981, ''POLISH_PISF'', ARRAY [''YOUTUBE''::availability_enum, ''HBO''::availability_enum], ''2021-07-22'', ''AVERAGE'', 230),
            (''The Revenant'', ''Alejandro González Iñárritu'', 2015, ''FOREIGN'', ARRAY [''HBO''::availability_enum, ''YOUTUBE''::availability_enum], ''2023-12-10'', ''GOOD'', 900),
            (''Dzień świra'', ''Marek Koterski'', 2002, ''POLISH_OTHER'', ARRAY [''NETFLIX''::availability_enum], ''2020-04-17'', ''OUTSTANDING'', 320),
            (''The Irishman'', ''Martin Scorsese'', 2019, ''FOREIGN'', ARRAY [''DISNEY''::availability_enum, ''NETFLIX''::availability_enum], ''2022-08-03'', ''AVERAGE'', 950),
            (''Ziemia obiecana'', ''Andrzej Wajda'', 1975, ''POLISH_PISF'', ARRAY [''HBO''::availability_enum], ''2018-10-25'', ''GOOD'', 400),
            (''Mad Max: Fury Road'', ''George Miller'', 2015, ''FOREIGN'', ARRAY [''NETFLIX''::availability_enum, ''YOUTUBE''::availability_enum], ''2023-06-15'', ''OUTSTANDING'', 700),
            (''Lalka'', ''Jerzy Kawalerowicz'', 1977, ''POLISH_OTHER'', ARRAY [''DISNEY''::availability_enum], ''2021-01-09'', ''AVERAGE'', 270),
            (''Blade Runner'', ''Ridley Scott'', 1982, ''FOREIGN'', ARRAY [''NETFLIX''::availability_enum, ''YOUTUBE''::availability_enum], ''2020-07-20'', ''GOOD'', 600),
            (''Kogel-mogel'', ''Roman Załuski'', 1988, ''POLISH_PISF'', ARRAY [''DISNEY''::availability_enum], ''2022-03-12'', ''OUTSTANDING'', 180),
            (''The Big Lebowski'', ''Joel Coen'', 1998, ''FOREIGN'', ARRAY [''HBO''::availability_enum, ''NETFLIX''::availability_enum], ''2019-11-30'', ''AVERAGE'', 450),
            (''Człowiek z marmuru'', ''Andrzej Wajda'', 1977, ''POLISH_PISF'', ARRAY [''HBO''::availability_enum, ''NETFLIX''::availability_enum], ''2023-05-18'', ''GOOD'', 200),
            (''Parasite'', ''Bong Joon-ho'', 2019, ''FOREIGN'', ARRAY [''YOUTUBE''::availability_enum], ''2021-09-14'', ''OUTSTANDING'', 650),
            (''Miasto 44'', ''Jan Komasa'', 2014, ''POLISH_OTHER'', ARRAY [''DISNEY''::availability_enum, ''HBO''::availability_enum], ''2020-02-28'', ''AVERAGE'', 470),
            (''Goodfellas'', ''Martin Scorsese'', 1990, ''FOREIGN'', ARRAY [''DISNEY''::availability_enum, ''HBO''::availability_enum], ''2022-10-07'', ''GOOD'', 800),
            (''Rejs'', ''Marek Piwowski'', 1970, ''POLISH_PISF'', ARRAY [''NETFLIX''::availability_enum], ''2018-06-03'', ''OUTSTANDING'', 170),
            (''The Truman Show'', ''Peter Weir'', 1998, ''FOREIGN'', ARRAY [''YOUTUBE''::availability_enum, ''DISNEY''::availability_enum], ''2021-04-19'', ''AVERAGE'', 500),
            (''Seksmisja'', ''Juliusz Machulski'', 1984, ''POLISH_OTHER'', ARRAY [''YOUTUBE''::availability_enum, ''DISNEY''::availability_enum], ''2023-08-22'', ''GOOD'', 290),
            (''Avatar'', ''James Cameron'', 2009, ''FOREIGN'', ARRAY [''HBO''::availability_enum], ''2020-12-15'', ''OUTSTANDING'', 950),
            (''Wesele'', ''Andrzej Wajda'', 1972, ''POLISH_PISF'', ARRAY [''NETFLIX''::availability_enum, ''YOUTUBE''::availability_enum], ''2019-07-10'', ''AVERAGE'', 210),
            (''The Prestige'', ''Christopher Nolan'', 2006, ''FOREIGN'', ARRAY [''NETFLIX''::availability_enum, ''DISNEY''::availability_enum], ''2022-03-25'', ''GOOD'', 600),
            (''Dzień świra'', ''Marek Koterski'', 2002, ''POLISH_OTHER'', ARRAY [''HBO''::availability_enum], ''2021-11-08'', ''OUTSTANDING'', 330),
            (''The Kings Speech'', ''Tom Hooper'', 2010, ''FOREIGN'', ARRAY [''YOUTUBE''::availability_enum, ''NETFLIX''::availability_enum], ''2023-01-14'', ''AVERAGE'', 400),
            (''Cicha noc'', ''Piotr Domalewski'', 2017, ''POLISH_PISF'', ARRAY [''YOUTUBE''::availability_enum], ''2020-06-30'', ''GOOD'', 280),
            (''The Departed'', ''Martin Scorsese'', 2006, ''FOREIGN'', ARRAY [''NETFLIX''::availability_enum, ''HBO''::availability_enum], ''2022-09-17'', ''OUTSTANDING'', 700),
            (''Sami swoi'', ''Sylwester Chęciński'', 1967, ''POLISH_OTHER'', ARRAY [''DISNEY''::availability_enum, ''YOUTUBE''::availability_enum], ''2018-04-05'', ''AVERAGE'', 150),
            (''Interstellar'', ''Christopher Nolan'', 2014, ''FOREIGN'', ARRAY [''NETFLIX''::availability_enum], ''2023-03-20'', ''GOOD'', 800),
            (''Pan Tadeusz'', ''Andrzej Wajda'', 1999, ''POLISH_PISF'', ARRAY [''HBO''::availability_enum, ''DISNEY''::availability_enum], ''2020-10-15'', ''AVERAGE'', 400),
            (''Fight Club'', ''David Fincher'', 1999, ''FOREIGN'', ARRAY [''YOUTUBE''::availability_enum], ''2021-06-10'', ''OUTSTANDING'', 600),
            (''Zimna wojna'', ''Paweł Pawlikowski'', 2018, ''POLISH_OTHER'', ARRAY [''NETFLIX''::availability_enum], ''2022-08-05'', ''GOOD'', 350),
            (''The Matrix'', ''Wachowski Sisters'', 1999, ''FOREIGN'', ARRAY [''DISNEY''::availability_enum, ''HBO''::availability_enum], ''2019-11-22'', ''AVERAGE'', 700),
            (''Katyń'', ''Andrzej Wajda'', 2007, ''POLISH_PISF'', ARRAY [''YOUTUBE''::availability_enum], ''2023-04-18'', ''GOOD'', 450),
            (''Saving Private Ryan'', ''Steven Spielberg'', 1998, ''FOREIGN'', ARRAY [''NETFLIX''::availability_enum], ''2020-07-30'', ''OUTSTANDING'', 850),
            (''Hydrozagadka'', ''Andrzej Kondratiuk'', 1970, ''POLISH_OTHER'', ARRAY [''HBO''::availability_enum], ''2018-09-12'', ''AVERAGE'', 200),
            (''Inglourious Basterds'', ''Quentin Tarantino'', 2009, ''FOREIGN'', ARRAY [''DISNEY''::availability_enum], ''2022-01-15'', ''GOOD'', 650),
            (''Korczak'', ''Andrzej Wajda'', 1990, ''POLISH_PISF'', ARRAY [''YOUTUBE''::availability_enum, ''NETFLIX''::availability_enum], ''2021-03-25'', ''OUTSTANDING'', 300),
            (''The Lion King'', ''Roger Allers'', 1994, ''FOREIGN'', ARRAY [''NETFLIX''::availability_enum], ''2023-06-20'', ''GOOD'', 500),
            (''Vabank'', ''Juliusz Machulski'', 1981, ''POLISH_OTHER'', ARRAY [''HBO''::availability_enum], ''2019-12-10'', ''AVERAGE'', 250),
            (''Jurassic Park'', ''Steven Spielberg'', 1993, ''FOREIGN'', ARRAY [''DISNEY''::availability_enum, ''YOUTUBE''::availability_enum], ''2020-08-18'', ''OUTSTANDING'', 700),
            (''Dekalog'', ''Krzysztof Kieślowski'', 1989, ''POLISH_PISF'', ARRAY [''NETFLIX''::availability_enum], ''2022-02-14'', ''GOOD'', 600),
            (''The Avengers'', ''Joss Whedon'', 2012, ''FOREIGN'', ARRAY [''YOUTUBE''::availability_enum], ''2021-10-05'', ''AVERAGE'', 800),
            (''Alternatywy 4'', ''Stanisław Bareja'', 1983, ''POLISH_OTHER'', ARRAY [''HBO''::availability_enum], ''2023-07-22'', ''GOOD'', 400),
            (''Django Unchained'', ''Quentin Tarantino'', 2012, ''FOREIGN'', ARRAY [''DISNEY''::availability_enum], ''2020-04-30'', ''OUTSTANDING'', 750),
            (''Popiół i diament'', ''Andrzej Wajda'', 1958, ''POLISH_PISF'', ARRAY [''NETFLIX''::availability_enum, ''YOUTUBE''::availability_enum], ''2019-06-15'', ''AVERAGE'', 350),
            (''The Dark Knight Rises'', ''Christopher Nolan'', 2012, ''FOREIGN'', ARRAY [''HBO''::availability_enum], ''2022-09-10'', ''GOOD'', 900),
            (''Kiler'', ''Juliusz Machulski'', 1997, ''POLISH_OTHER'', ARRAY [''DISNEY''::availability_enum], ''2021-01-20'', ''OUTSTANDING'', 300),
            (''The Pianist'', ''Roman Polański'', 2002, ''POLISH_PISF'', ARRAY [''NETFLIX''::availability_enum], ''2023-03-05'', ''GOOD'', 650),
            (''Star Wars: Episode IV'', ''George Lucas'', 1977, ''FOREIGN'', ARRAY [''YOUTUBE''::availability_enum, ''HBO''::availability_enum], ''2020-11-12'', ''AVERAGE'', 700),
            (''Barwy ochronne'', ''Krzysztof Zanussi'', 1977, ''POLISH_OTHER'', ARRAY [''NETFLIX''::availability_enum], ''2022-05-18'', ''GOOD'', 450),
            (''Inception'', ''Christopher Nolan'', 2010, ''FOREIGN'', ARRAY [''DISNEY''::availability_enum], ''2021-08-25'', ''OUTSTANDING'', 800),
            (''Psy'', ''Władysław Pasikowski'', 1992, ''POLISH_PISF'', ARRAY [''HBO''::availability_enum], ''2023-10-30'', ''AVERAGE'', 350),
            (''The Terminator'', ''James Cameron'', 1984, ''FOREIGN'', ARRAY [''YOUTUBE''::availability_enum], ''2020-03-15'', ''GOOD'', 600),
            (''Krzyżacy'', ''Aleksander Ford'', 1960, ''POLISH_OTHER'', ARRAY [''NETFLIX''::availability_enum], ''2022-07-10'', ''OUTSTANDING'', 500),
            (''The Wolf of Wall Street'', ''Martin Scorsese'', 2013, ''FOREIGN'', ARRAY [''DISNEY''::availability_enum, ''HBO''::availability_enum], ''2019-12-20'', ''GOOD'', 900),
            (''Sami'', ''Sylwester Chęciński'', 2006, ''POLISH_PISF'', ARRAY [''YOUTUBE''::availability_enum], ''2021-04-05'', ''AVERAGE'', 400),
            (''Back to the Future'', ''Robert Zemeckis'', 1985, ''FOREIGN'', ARRAY [''NETFLIX''::availability_enum], ''2023-02-28'', ''GOOD'', 650),
            (''Jak rozpętałem drugą wojnę światową'', ''Tadeusz Chmielewski'', 1969, ''POLISH_OTHER'', ARRAY [''HBO''::availability_enum], ''2020-06-12'', ''OUTSTANDING'', 300),
            (''The Green Mile'', ''Frank Darabont'', 1999, ''FOREIGN'', ARRAY [''DISNEY''::availability_enum], ''2022-09-15'', ''AVERAGE'', 700),
            (''Quo Vadis'', ''Jerzy Kawalerowicz'', 2001, ''POLISH_PISF'', ARRAY [''NETFLIX''::availability_enum], ''2021-11-20'', ''GOOD'', 850),
            (''Alien'', ''Ridley Scott'', 1979, ''FOREIGN'', ARRAY [''YOUTUBE''::availability_enum], ''2023-05-10'', ''OUTSTANDING'', 600),
            (''Róża'', ''Wojciech Smarzowski'', 2011, ''POLISH_OTHER'', ARRAY [''HBO''::availability_enum], ''2020-08-25'', ''GOOD'', 450),
            (''The Empire Strikes Back'', ''Irvin Kershner'', 1980, ''FOREIGN'', ARRAY [''DISNEY''::availability_enum], ''2022-03-18'', ''AVERAGE'', 700),
            (''Dom zły'', ''Wojciech Smarzowski'', 2009, ''POLISH_PISF'', ARRAY [''NETFLIX''::availability_enum], ''2021-10-05'', ''GOOD'', 400),
            (''Jaws'', ''Steven Spielberg'', 1975, ''FOREIGN'', ARRAY [''YOUTUBE''::availability_enum], ''2023-07-20'', ''OUTSTANDING'', 550),
            (''Nie lubię poniedziałku'', ''Tadeusz Chmielewski'', 1971, ''POLISH_OTHER'', ARRAY [''HBO''::availability_enum], ''2020-04-30'', ''AVERAGE'', 300),
            (''The Shining'', ''Stanley Kubrick'', 1980, ''FOREIGN'', ARRAY [''DISNEY''::availability_enum], ''2022-06-15'', ''GOOD'', 600),
            (''Ogniem i mieczem'', ''Jerzy Hoffman'', 1999, ''POLISH_PISF'', ARRAY [''NETFLIX''::availability_enum], ''2021-03-10'', ''OUTSTANDING'', 800),
            (''Raiders of the Lost Ark'', ''Steven Spielberg'', 1981, ''FOREIGN'', ARRAY [''YOUTUBE''::availability_enum], ''2023-01-25'', ''GOOD'', 650),
            (''Kroll'', ''Władysław Pasikowski'', 1991, ''POLISH_OTHER'', ARRAY [''HBO''::availability_enum], ''2020-09-20'', ''AVERAGE'', 400),
            (''The Exorcist'', ''William Friedkin'', 1973, ''FOREIGN'', ARRAY [''DISNEY''::availability_enum], ''2022-11-05'', ''GOOD'', 700),
            (''Wołyń'', ''Wojciech Smarzowski'', 2016, ''POLISH_PISF'', ARRAY [''NETFLIX''::availability_enum], ''2021-06-30'', ''OUTSTANDING'', 900),
            (''E.T. the Extra-Terrestrial'', ''Steven Spielberg'', 1982, ''FOREIGN'', ARRAY [''YOUTUBE''::availability_enum], ''2023-04-15'', ''AVERAGE'', 500),
            (''Co mi zrobisz, jak mnie złapiesz'', ''Stanisław Bareja'', 1978, ''POLISH_OTHER'', ARRAY [''HBO''::availability_enum], ''2020-12-10'', ''GOOD'', 350),
            (''The Godfather Part II'', ''Francis Ford Coppola'', 1974, ''FOREIGN'', ARRAY [''DISNEY''::availability_enum], ''2022-08-20'', ''OUTSTANDING'', 800),
            (''Królewna Śnieżka'', ''Walerian Borowczyk'', 1984, ''POLISH_PISF'', ARRAY [''NETFLIX''::availability_enum], ''2021-07-15'', ''GOOD'', 600),
            (''Braveheart'', ''Mel Gibson'', 1995, ''FOREIGN'', ARRAY [''YOUTUBE''::availability_enum, ''HBO''::availability_enum], ''2023-09-30'', ''AVERAGE'', 750);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM pg_cast WHERE castsource = ''varchar''::regtype AND casttarget = ''production_enum''::regtype) THEN
        CREATE CAST (varchar AS production_enum) WITH INOUT AS IMPLICIT;
        END IF;
    IF NOT EXISTS (SELECT 1 FROM pg_cast WHERE castsource = ''varchar''::regtype AND casttarget = ''rating_enum''::regtype) THEN
        CREATE CAST (varchar AS rating_enum) WITH INOUT AS IMPLICIT;
        END IF;
    IF NOT EXISTS (SELECT 1 FROM pg_cast WHERE castsource = ''varchar''::regtype AND casttarget = ''availability_enum''::regtype) THEN
        CREATE CAST (varchar AS availability_enum) WITH INOUT AS IMPLICIT;
        END IF;
END ';


