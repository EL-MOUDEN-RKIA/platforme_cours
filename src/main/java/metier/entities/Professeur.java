package metier.entities;

import java.util.ArrayList;
import java.util.List;

public class Professeur extends Utilisateur {
    private String experience;
    private Double tarif;
    private String description;
    private String adresse;
    private String image;
    private String aboutMe;

    private List<Domaine> domaines = new ArrayList<>();

    public Professeur() {
        super();
    }
    public Professeur(int id, String nom, String prenom, String email, String password, String telephone,  String experience, Double tarif, String description, String adresse, String image, String aboutMe) {
        super(id, nom, prenom, email, password, telephone);
        this.experience = experience;
        this.tarif=tarif;
        this.description = description;
        this.adresse = adresse;
        this.image = image;
        this.aboutMe = aboutMe;
    }
    public Professeur(String experience, Double tarif, String description, String adresse, String image, String aboutMe) {
        this.experience = experience;
        this.tarif=tarif;
        this.description = description;
        this.adresse = adresse;
        this.image = image;
        this.aboutMe = aboutMe;

    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public Double getTarif() {
        return tarif;
    }

    public void setTarif(Double tarif) {
        this.tarif = tarif;
    }

    public String getAboutMe() {
        return aboutMe;
    }

    public void setAboutMe(String aboutMe) {
        this.aboutMe = aboutMe;
    }

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public List<Domaine> getDomaines() {
        return domaines;
    }

    public void setDomaines(List<Domaine> Domaines) {
        this.domaines = Domaines;
    }
    public void addDomaine(Domaine domaine){
        this.domaines.add(domaine);
    }

}
