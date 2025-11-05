package metier.entities;

public class Demande {
    private int id;
    private String message;
    private Etudiant etudiant;
    private Professeur professeur;

    public Demande() {}

    public Demande(int id, String message, Etudiant etudiant) {
        this.id = id;
        this.message = message;
        this.etudiant = etudiant;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Etudiant getEtudiant() {
        return etudiant;
    }

    public void setEtudiant(Etudiant etudiant) {
        this.etudiant = etudiant;
    }

    public Professeur getProfesseur() {
        return professeur;
    }

    public void setProfesseur(Professeur professeur) {
        this.professeur = professeur;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
