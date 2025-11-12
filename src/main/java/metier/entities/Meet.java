package metier.entities;


public class Meet {
    private int idMeet;
    private String titre;
    private int dureeMinutes = 60;
    private String description;
    private Professeur professeur;
    private  Etudiant etudiant;


    public Meet() {}

    public Meet(int idMeet, String titre,  String description, Professeur  professeur) {
        this.idMeet = idMeet;
        this.titre = titre;
        this.description = description;
        this.professeur = professeur;
    }

    // Getters et Setters
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



    public int getDureeMinutes() {
        return dureeMinutes;
    }

    public void setDureeMinutes(int dureeMinutes) {
        this.dureeMinutes = dureeMinutes;
    }



    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Professeur getProfesseur() {
        return professeur;
    }

    public void setProfesseur(Professeur professeur) {
        this.professeur = professeur;
    }

    public Etudiant getEtudiant() {
        return etudiant;
    }

    public void setEtudiant(Etudiant etudiant) {
        this.etudiant = etudiant;
    }
}
