DO '
BEGIN
    IF NOT EXISTS(SELECT 1 FROM pg_type WHERE typname = ''production_type'') THEN
        CREATE TYPE production_type AS ENUM(''POLISH_PISF'', ''POLISH'', ''FOREIGN'');
    END IF;
    IF NOT EXISTS(SELECT 1 FROM pg_type WHERE typname = ''availability_type'') THEN
        CREATE TYPE availability_type AS ENUM (''Netflix'', ''Youtube'', ''Disney'', ''HBO'');
    END IF;
    IF NOT EXISTS(SELECT 1 FROM pg_type WHERE typname = ''rating_type'') THEN
        CREATE TYPE rating_type AS ENUM (''AVERAGE'', ''GOOD'', ''OUTSTANDING'');
        END IF;
    CREATE TABLE IF NOT EXISTS film (
                                        id SERIAL PRIMARY KEY,
                                        title VARCHAR(300) NOT NULL,
                                        director VARCHAR(100) NOT NULL,
                                        year INTEGER NOT NULL CHECK (year >=1888 AND year <= date_part(''year'', now())),
                                        production production_type NOT NULL,
                                        availability availability_type[] NOT NULL,
                                        last_update DATE NOT NULL,
                                        user_rating rating_type NOT NULL
    );
END ';

