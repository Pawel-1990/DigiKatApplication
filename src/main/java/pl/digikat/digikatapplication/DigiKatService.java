package pl.digikat.digikatapplication;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import pl.digikat.digikatapplication.exceptions.ValidationException;
import pl.digikat.digikatapplication.models.Availability;
import pl.digikat.digikatapplication.models.Production;
import pl.digikat.digikatapplication.models.UserRating;

import java.time.Year;
import java.util.List;

@Service
@Slf4j
public class DigiKatService {

    public void addFilm(String title, String director, int year, Production production, List<Availability> availability, UserRating rating, int size) {
        validateAddFilmParameters(year, size);
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
