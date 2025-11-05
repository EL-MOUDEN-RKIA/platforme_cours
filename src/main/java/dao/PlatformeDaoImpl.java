package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import metier.entities.Demande;
import metier.entities.Domaine;
import metier.entities.Etudiant;
import metier.entities.Professeur;
import metier.entities.Utilisateur;

public class PlatformeDaoImpl implements IPlatformeDao {

    @Override
    public List<Domaine> findAllDomaines() {
            List<Domaine> list = new ArrayList<>();
            String sql= "Select * from module";
        try(Connection cn = SingletonConnection.getConnection();
            Statement stm = cn.createStatement();
            ResultSet rs = stm.executeQuery(sql)){
            while (rs.next()){
                int id = rs.getInt("id_module");
                String name = rs.getString("nom_module");
                list.add(new Domaine(id,name));
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
                        professeur = new Professeur(id,nom, prenom, email, "", telephone,  experience, tarif, description, adresse, image, about_me);
                    }
                }
            }


        }catch (Exception e) {
            throw new RuntimeException(e);
        }
            return professeur;
    }

    @Override
    public Etudiant findEtudiantbyID(int id){
        Etudiant etudiant = null;
        String sql= "Select * from etudiant where id_etudiant="+id;
        try(Connection cn = SingletonConnection.getConnection();
            Statement stm = cn.createStatement();
            ResultSet rs = stm.executeQuery(sql)) {
            if (rs.next()){
                String niveau_etude = rs.getString("niveau_etude");
                String sql2 = "select * from utilisateur where id_user="+id;
                try(Statement stm2 = cn.createStatement();
                    ResultSet rs2 = stm2.executeQuery(sql2)) {
                    if (rs2.next()) {
                        String nom = rs2.getString("nom");
                        String prenom = rs2.getString("prenom");
                        String email = rs2.getString("email");
                        String telephone = rs2.getString("telephone");
                        etudiant = new Etudiant(id,nom, prenom, email, "", telephone,  niveau_etude);
                    }
                }
            }


        }catch (Exception e) {
            throw new RuntimeException(e);
        }
        return etudiant;

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
    public List<Domaine> findAllDomainesbyIDprof(int id) {
        List<Domaine> list = new ArrayList<>();
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
                        Domaine domaine = new Domaine(i,name);
                        list.add(domaine);
                    }
                }
            }
        }catch (Exception e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    @Override
    public void editProfesseur(Professeur professeur){
        String sql = "UPDATE utilisateur \n" +
                "SET \n" +
                "    nom = ?, \n" +
                "    prenom = ?, \n" +
                "    email = ?, \n" +
                "    telephone = ?\n" +
                "WHERE id_user = ?;";
        try(Connection cn = SingletonConnection.getConnection()){
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setString(1, professeur.getNom());
            ps.setString(2, professeur.getPrenom());
            ps.setString(3, professeur.getEmail());
            ps.setString(4,professeur.getTelephone());
            ps.setInt(5, professeur.getId());

            ps.executeUpdate();
            String sql2 =  "UPDATE professeur \n" +
                    "SET \n" +
                    "    tarif_horaire = ?, \n" +
                    "    adresse = ?, \n" +
                    "    experience = ?, \n" +
                    "    description = ?, \n" +
                    "    about_me = ? \n" +
                    "WHERE id_prof = ?;";
            PreparedStatement ps2 = cn.prepareStatement(sql2);
            ps2.setDouble(1 ,professeur.getTarif());
            ps2.setString(2,professeur.getAdresse());
            ps2.setString(3, professeur.getExperience());
            ps2.setString(4, professeur.getDescription());
            ps2.setString(5, professeur.getAboutMe());
            ps2.setInt(6, professeur.getId());
            ps2.executeUpdate();

        }catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Demande> findAllRequestsbyProfesseur(int id){
        List<Demande> list = new ArrayList<>();
        String sql= "Select * from demande where id_prof="+id ;
        try(Connection cn =SingletonConnection.getConnection();
        Statement stm = cn.createStatement();
        ResultSet rs = stm.executeQuery(sql)){
            List<Integer> idsEtudiants = new ArrayList<>();
            while (rs.next()){
                int id_demande = rs.getInt("id_demande");
                String message = rs.getString("message");
                int id_etudiant = rs.getInt("id_etudiant");
                Etudiant etudiant = findEtudiantbyID(id_etudiant);
                list.add(new Demande(id_demande, message,etudiant));
            }
        }catch (Exception e){
            throw new RuntimeException(e);
        }
        return list;
    }



    @Override

    public boolean signUpTeacher(Professeur professeur, Domaine domaine) {
        Connection connection= dao.SingletonConnection.getConnection();
        try {
            PreparedStatement ps=connection.prepareStatement("INSERT INTO utilisateur (nom, prenom, email, telephone, mot_de_passe ,role) VALUES (?, ?, ?, ?, ?,?) ");
            ps.setString(1,professeur.getNom());
            ps.setString(2,professeur.getPrenom());
            ps.setString(3,professeur.getEmail());
            ps.setString(4,professeur.getTelephone());
            ps.setString(5,professeur.getMot_de_passe());
            ps.setString(6,"professeur");
            ps.executeUpdate();

            PreparedStatement psId=connection.prepareStatement("SELECT MAX(id_user) AS MAX_ID FROM utilisateur ");
            ResultSet rs=psId.executeQuery();
            int userId = 0;
            if (rs.next()) {
                userId = rs.getInt("MAX_ID");
            }


            PreparedStatement ps2 = connection.prepareStatement("INSERT INTO professeur(id_prof, experience, tarif_horaire, description, adresse, image, about_me) VALUES (?, ?, ?, ?, ?, ?, ?)");
            ps2.setInt(1, userId);
            ps2.setString(2, professeur.getExperience());
            ps2.setDouble(3, professeur.getTarif());
            ps2.setString(4, professeur.getDescription());
            ps2.setString(5,professeur.getAdresse());
            ps2.setString(6, professeur.getImage());
            ps2.setString(7, professeur.getAboutMe());
            ps2.executeUpdate();


            PreparedStatement psIdProf =connection.prepareStatement("SELECT MAX(id_prof) AS MAX_ID FROM professeur ");
            ResultSet rs1= psIdProf.executeQuery();
            int profId = 0;

            if (rs1.next()) {
                profId = rs1.getInt("MAX_ID");
            }
            PreparedStatement psmoduleId =connection.prepareStatement("SELECT id_module FROM module where nom_module=?");
            psmoduleId.setString(1,domaine.getName() );
            ResultSet rs2= psmoduleId.executeQuery();
            int  moduleId = 0;
            if (rs2.next()) {
                moduleId = rs2.getInt("id_module");
            }

            PreparedStatement ps3 = connection.prepareStatement("INSERT INTO professeur_module(id_prof, id_module) VALUES (?, ?)");
            ps3.setInt(1,profId);
            ps3.setInt(2, moduleId);
            ps3.executeUpdate();

            ps.close();
            ps2.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean signUpStudent(Etudiant etudiant) {
        Connection connection= dao.SingletonConnection.getConnection();
        try {
            PreparedStatement ps=connection.prepareStatement("INSERT INTO utilisateur(nom, prenom, telephone, mot_de_passe, email, role) VALUES (?, ?, ?, ?, ?, ?)");
            ps.setString(1, etudiant.getNom());
            ps.setString(2, etudiant.getPrenom());
            ps.setString(3, etudiant.getTelephone());
            ps.setString(4, etudiant.getMot_de_passe());
            ps.setString(5, etudiant.getEmail());
            ps.setString(6, "etudiant");

            ps.executeUpdate();
            PreparedStatement psId=connection.prepareStatement("SELECT MAX(id_user) AS MAX_ID FROM utilisateur ");
            ResultSet rs=psId.executeQuery();
            int userId = 0;
            if (rs.next()) {
                userId = rs.getInt("MAX_ID");
            }
            String sqlEtudiant = "INSERT INTO etudiant(id_etudiant, niveau_etude) VALUES (?, ?)";
            PreparedStatement psEtudiant = connection.prepareStatement(sqlEtudiant);
            psEtudiant.setInt(1, userId);
            psEtudiant.setString(2, etudiant.getNiveau_etude());
            psEtudiant.executeUpdate();
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }


    public Utilisateur loginCheck(String email, String mot_de_pass) {
        Utilisateur user = null;
        Connection connection= dao.SingletonConnection.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM utilisateur WHERE email = ? and mot_de_passe = ?");
            ps.setString(1, email);
            ps.setString(2, mot_de_pass);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                user =new Utilisateur();
                user.setId(rs.getInt("id_user"));
                user.setNom(rs.getString("nom"));
                user.setPrenom(rs.getString("prenom"));
                user.setEmail(rs.getString("email"));
                user.setMot_de_passe(rs.getString("mot_de_passe"));
                user.setTelephone(rs.getString("telephone"));
                user.setRole(rs.getString("role"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user; // renvoie "professeur", "etudiant" ou null si non trouvé
    }
}
