package metier.entities;


import jakarta.persistence.*;

@Entity
@Table(name = "meet")
public class Meet {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_meet")
    private int idMeet;

    private String titre;

    private int duree_minutes = 60;

    private String description;

    @ManyToOne
    @JoinColumn(name = "id_prof")
    private Professeur prof;

    @ManyToOne
    @JoinColumn(name = "etudiant_id")
    private Etudiant etudiant;

    public Meet() {}

    public Meet(String titre, String description, Professeur prof , Etudiant etd) {
        this.titre = titre;
        this.description = description;
        this.prof = prof;
        this.etudiant = etd;
    }

    public Meet( int idMeet, String titre, String description, Professeur prof) {
        this.titre = titre;
        this.idMeet = idMeet;
        this.description = description;
        this.prof = prof;
       
    }

    public int getIdMeet() {
        return idMeet;
    }

    public void setIdMeet(int idMeet) {
        this.idMeet = idMeet;
    }

    public String getTitre() {
        return titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    public int getDuree_minutes() {
        return duree_minutes;
    }

    public void setDuree_minutes(int duree_minutes) {
        this.duree_minutes = duree_minutes;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Professeur getProf() {
        return prof;
    }

    public void setProf(Professeur prof) {
        this.prof = prof;
    }

    public Etudiant getEtudiant() {
        return etudiant;
    }

    public void setEtudiant(Etudiant etudiant) {
        this.etudiant = etudiant;
    }
}
