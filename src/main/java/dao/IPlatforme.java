package dao;
import java.util.List;

import model.Professeur;
import model.domaine;

public interface IPlatforme {
    public List<domaine> findAllDomaines();
    public  List<Professeur> findAllProfesseursbyIDdomaine(int id);
    public Professeur findProfesseurbyID(int id);
    public List<domaine> findAllDomainesbyIDprof(int id);

}
