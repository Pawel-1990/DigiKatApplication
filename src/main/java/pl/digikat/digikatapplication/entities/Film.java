package pl.digikat.digikatapplication.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import pl.digikat.digikatapplication.models.Availability;
import pl.digikat.digikatapplication.models.Production;
import pl.digikat.digikatapplication.models.UserRating;

import java.sql.Date;
import java.util.List;

@Entity
@Table(name="films")
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Film {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private Long id;

    @Column(name="title", length=300)
    private String title;

    @Column(name="director", length=100)
    private String director;

    @Column(name="year")
    private Integer year;

    @Enumerated(EnumType.STRING)
    private Production production;

    @Enumerated(EnumType.STRING)
    private List<Availability> availability;

    @Column(name="last_update")
    private Date last_update;

    @Enumerated(EnumType.STRING)
    private UserRating user_rating;

    @Column(name="ranking")
    private Integer ranking;

    @Column(name="size")
    private Integer size;
}
