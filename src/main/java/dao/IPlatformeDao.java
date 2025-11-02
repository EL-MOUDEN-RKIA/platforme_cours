package dao;
import java.util.List;

import metier.entities.Domaine;
import metier.entities.Etudiant;
import metier.entities.Professeur;
import metier.entities.Utilisateur;

public interface IPlatformeDao {
    public boolean signUpTeacher(Professeur professeur, Domaine doamine);//veux juste savoir si l’inscription a réussi
    public boolean signUpStudent(Etudiant etudiantnt);
    public Utilisateur loginCheck(String email, String mot_de_pass);

    public List<Domaine> findAllDomaines();
    public  List<Professeur> findAllProfesseursbyIDdomaine(int id);
    public Professeur findProfesseurbyID(int id);
    public List<Domaine> findAllDomainesbyIDprof(int id);

}
