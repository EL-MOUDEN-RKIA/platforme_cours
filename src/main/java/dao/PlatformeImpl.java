package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Professeur;
import model.domaine;

public class PlatformeImpl implements IPlatforme {

    @Override
    public List<domaine> findAllDomaines() {
            List<domaine> list = new ArrayList<>();
            String sql= "Select * from module";
        try(Connection cn = SingletonConnection.getConnection();
            Statement stm = cn.createStatement();
            ResultSet rs = stm.executeQuery(sql)){
            while (rs.next()){
                int id = rs.getInt("id_module");
                String name = rs.getString("nom_module");
                list.add(new domaine(id,name));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return list;
    }
@Override
    public Professeur findProfesseurbyID(int id){
        Professeur professeur = null;
        String sql= "Select * from professeur where id_prof="+id;
        try(Connection cn = SingletonConnection.getConnection();
        Statement stm = cn.createStatement();
        ResultSet rs = stm.executeQuery(sql)) {
            if (rs.next()){
                String experience = rs.getString("experience");
                Double tarif = rs.getDouble("tarif_horaire");
                String description = rs.getString("description");
                String adresse = rs.getString("adresse");
                String image = rs.getString("image");
                String about_me = rs.getString("about_me");
                String sql2 = "select * from utilisateur where id_user="+id;
                try(Statement stm2 = cn.createStatement();
                ResultSet rs2 = stm2.executeQuery(sql2)) {
                    if (rs2.next()) {
                        String nom = rs2.getString("nom");
                        String prenom = rs2.getString("prenom");
                        String email = rs2.getString("email");
                        String telephone = rs2.getString("telephone");
                        professeur = new Professeur(id,nom, prenom, email, "", telephone, "2323", experience, tarif, description, adresse, image, about_me);
                    }
                }
            }


        }catch (Exception e) {
            throw new RuntimeException(e);
        }
            return professeur;
    }
    @Override
    public List<Professeur> findAllProfesseursbyIDdomaine(int id) {
        List<Professeur> list = new ArrayList<>();
        String sql= "Select * from professeur_module where id_module="+id;
        try (Connection cn = SingletonConnection.getConnection();
             Statement stm = cn.createStatement();
             ResultSet rs = stm.executeQuery(sql)){
            List<Integer> idsProfs = new ArrayList<>();
            while (rs.next()){
                int id_professeur= rs.getInt("id_prof");
                idsProfs.add(id_professeur);
            }
            for(int i :  idsProfs){
                Professeur prof = findProfesseurbyID(i);
                if (prof != null) {
                    list.add(prof);
                }
            }

        }catch (Exception e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    @Override
    public List<domaine> findAllDomainesbyIDprof(int id) {
        List<domaine> list = new ArrayList<>();
        String sql= "Select * from professeur_module where id_prof="+id;
        try(Connection cn =SingletonConnection.getConnection();
        Statement stm = cn.createStatement();
        ResultSet rs= stm.executeQuery(sql)){
            List<Integer> idsModules = new ArrayList<>();
            while (rs.next()){
                int id_module= rs.getInt("id_module");
                idsModules.add(id_module);
            }
            for(int i :  idsModules){
                String sql2 = "select * from module where id_module="+i;
                try(Statement stm2 = cn.createStatement();
                ResultSet rs2 = stm2.executeQuery(sql2)){
                    while (rs2.next()){
                        String name = rs2.getString("nom_module");
                        domaine domaine = new domaine(i,name);
                        list.add(domaine);
                    }
                }
            }
        }catch (Exception e) {
            throw new RuntimeException(e);
        }
        return list;
    }
}
