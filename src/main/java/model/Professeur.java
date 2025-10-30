package model;

import java.util.ArrayList;
import java.util.List;

public class Professeur extends utilisateur{
    private String expérience;
    private Double tarif;
    private String description;
    private String adresse;
    private String image;
    private String aboutMe;

    private List<domaine> domaines = new ArrayList<>();

    public Professeur() {
        super();
    }
    public Professeur(int id, String nom, String prenom, String email, String password, String telephone, String date_inscription, String expérience, Double tarif, String description, String adresse, String image, String aboutMe) {
        super(id, nom, prenom, email, password, telephone, date_inscription);
        this.expérience=expérience;
        this.tarif=tarif;
        this.description = description;
        this.adresse = adresse;
        this.image = image;
        this.aboutMe = aboutMe;
    }
    public Professeur(String expérience, Double tarif, String description, String adresse, String image, String aboutMe) {
        super();
        this.expérience=expérience;
        this.tarif=tarif;
        this.description = description;
        this.adresse = adresse;
        this.image = image;
        this.aboutMe = aboutMe;

    }

    public String getExpérience() {
        return expérience;
    }

    public void setExpérience(String expérience) {
        this.expérience = expérience;
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

    public List<domaine> getDomaines() {
        return domaines;
    }

    public void setDomaines(List<domaine> domaines) {
        this.domaines = domaines;
    }
    public void addDomaine(domaine domaine){
        this.domaines.add(domaine);
    }

}
