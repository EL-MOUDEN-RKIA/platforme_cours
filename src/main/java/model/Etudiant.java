package model;

public class Etudiant extends utilisateur {
    private String niveau;


    public Etudiant() {}

    public Etudiant(int id,String nom, String prenom, String email, String password, String telephone, String date_inscription, String niveau) {
        super(id, nom, prenom, email, password, telephone, date_inscription);
        this.niveau = niveau;
    }

    public Etudiant(String niveau) {
        super();
        this.niveau = niveau;
    }
}
