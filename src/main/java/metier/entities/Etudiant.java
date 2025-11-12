package metier.entities;
import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "etudiant")
public class Etudiant extends Utilisateur {
    private String niveau_etude;
    public  Etudiant() {}
    public Etudiant(String niveau_etude) {
        this.niveau_etude = niveau_etude;
    }
    public Etudiant(int id, String nom, String prenom, String email, String mot_de_passe, String telephone, String niveau_etude) {
        super(id, nom, prenom, email, mot_de_passe, telephone);
        this.niveau_etude = niveau_etude;
    }

    @OneToMany(mappedBy = "etudiant", cascade =CascadeType.ALL,  orphanRemoval = true)
    private List<Demande> demandes =new ArrayList<>();

    @OneToMany(mappedBy = "etudiant",  cascade =CascadeType.ALL,  orphanRemoval = true)
    private List<Meet> meets =new ArrayList<>();

    public String getNiveau_etude() {
        return niveau_etude;
    }

    public void setNiveau_etude(String niveau_etude) {
        this.niveau_etude = niveau_etude;
    }
}