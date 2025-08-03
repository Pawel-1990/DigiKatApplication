package pl.digikat.digikatapplication;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import pl.digikat.digikatapplication.entities.Film;
import pl.digikat.digikatapplication.exceptions.ValidationException;
import pl.digikat.digikatapplication.models.Availability;
import pl.digikat.digikatapplication.models.Production;
import pl.digikat.digikatapplication.models.UserRating;

import java.sql.Date;
import java.time.LocalDate;
import java.time.Year;
import java.util.List;

@Service
@Slf4j
public class DigiKatService {
    FilmRepository filmRepository;

    public DigiKatService(FilmRepository filmRepository) {
        this.filmRepository = filmRepository;
    }


    public void addFilm(String title, String director, int year, Production production, List<Availability> availability, UserRating user_rating,
                        int size) {
        validateAddFilmParameters(year, size);
        Film film = Film.builder()
                .title(title)
                .director(director)
                .year(year)
                .production(production)
                .availability(availability)
                .user_rating(user_rating)
                .size(size)
                .last_update(Date.valueOf(LocalDate.now()))
                .build();
        filmRepository.save(film);

    }

    public void validateAddFilmParameters(int year, int size) {
        int currentYear = Year.now().getValue();

        if (year < 1888 || year > currentYear) {
            String errorMessage = String.format("Film year must be between 1888 and %d", currentYear);
            throw new ValidationException(errorMessage);
        }

        if (size < 0 || size > 1000) {
            String errorMessage = "Film file size must be between 1 and 1000";
            throw new ValidationException(errorMessage);
        }
    }
}
