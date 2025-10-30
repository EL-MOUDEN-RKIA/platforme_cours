package service;

import java.util.List;

import model.Professeur;
import model.domaine;
import dao.PlatformeImpl;

public class PlatformeService {
    PlatformeImpl p = new PlatformeImpl();
    public List<domaine> getAllDomaine(){
        return p.findAllDomaines();
    }
    public Professeur getProfesseurbyID(int id){ return p.findProfesseurbyID(id); }
    public List<Professeur>  getAllProfesseursbyIDdomaine(int id){
        return p.findAllProfesseursbyIDdomaine(id);
    }
    public List<domaine> getAllDomainesbyIDprof(int id){
        return p.findAllDomainesbyIDprof(id);
    }
}

