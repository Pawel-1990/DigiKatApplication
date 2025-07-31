package pl.digikat.digikatapplication;

import lombok.NonNull;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import pl.digikat.digikatapplication.models.Availability;
import pl.digikat.digikatapplication.models.Production;
import pl.digikat.digikatapplication.models.UserRating;

import java.util.List;

@Slf4j
@RestController
public class DigiKatApplicationController {
    DigiKatService digiKatService;

    public DigiKatApplicationController(DigiKatService digiKatService) {
        this.digiKatService = digiKatService;
    }

    @PostMapping("/add-film")
    public void addFilm(
            @RequestParam @NonNull String title,
            @RequestParam @NonNull String director,
            @RequestParam @NonNull int year,
            @RequestParam @NonNull Production production,
            @RequestParam @NonNull List<Availability> availability,
            @RequestParam @NonNull UserRating rating,
            @RequestParam @NonNull int size) {
        log.info("addFilm endpoint called!");
        digiKatService.addFilm(title, director, year, production, availability, rating, size);
    }
}
