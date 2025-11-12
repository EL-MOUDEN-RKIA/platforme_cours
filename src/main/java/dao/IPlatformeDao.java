package dao;
import java.util.List;

import metier.entities.*;

public interface IPlatformeDao {
    public boolean signUpTeacher(Professeur professeur, Domaine doamine);//veux juste savoir si l’inscription a réussi
    public boolean signUpStudent(Etudiant etudiantnt);
    public Utilisateur loginCheck(String email, String mot_de_pass);
    public void saveDemande(Demande demande);

    public List<Domaine> findAllDomaines();
    public  List<Professeur> findAllProfesseursbyIDdomaine(int id);
    public Professeur findProfesseurbyID(int id);
    public Etudiant findEtudiantbyID(int id);
    public int findIDEtudiantbyIDDemande(int id);
    public List<Domaine> findAllDomainesbyIDprof(int id);
    public void editProfesseur(Professeur professeur);
    public List<Demande> findAllRequestsbyProfesseur(int id);
    public List<Meet> findAllRequestsbyEtudiant(int id);
    public void UpdateEtudiant(Etudiant etudiant);


}
