package dao;
import java.util.List;

import metier.entities.Domaine;
import metier.entities.Etudiant;
import metier.entities.Professeur;

public interface IPlatformeDao {
    public boolean signUpTeacher(Professeur professeur);//veux juste savoir si l’inscription a réussi
    public boolean signUpStudent(Etudiant etudiantnt);
    public Professeur loginTeacher(String email, String mot_de_pass);
    public Etudiant loginStudent(String email, String mot_de_pass);

    public List<Domaine> findAllDomaines();
    public  List<Professeur> findAllProfesseursbyIDdomaine(int id);
    public Professeur findProfesseurbyID(int id);
    public List<Domaine> findAllDomainesbyIDprof(int id);

}
