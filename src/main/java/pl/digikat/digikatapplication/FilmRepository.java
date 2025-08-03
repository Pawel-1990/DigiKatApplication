package pl.digikat.digikatapplication;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.digikat.digikatapplication.entities.Film;

public interface FilmRepository extends JpaRepository<Film,Integer> {
}
