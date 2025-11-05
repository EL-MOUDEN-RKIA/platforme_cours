package service;

import java.util.List;

import metier.entities.Demande;
import metier.entities.Domaine;
import metier.entities.Professeur;
import dao.PlatformeDaoImpl;

public class PlatformeService {
    PlatformeDaoImpl p = new PlatformeDaoImpl();
    public List<Domaine> getAllDomaine(){
        return p.findAllDomaines();
    }
    public Professeur getProfesseurbyID(int id){ return p.findProfesseurbyID(id); }
    public List<Professeur>  getAllProfesseursbyIDdomaine(int id){
        return p.findAllProfesseursbyIDdomaine(id);
    }
    public List<Domaine> getAllDomainesbyIDprof(int id){
        return p.findAllDomainesbyIDprof(id);
    }
    public void UpdateProfesseur(Professeur prof){  p.editProfesseur(prof); }
    public List<Demande> getAllRequestsbyProfesseur(int id){ return p.findAllRequestsbyProfesseur(id); }
}

