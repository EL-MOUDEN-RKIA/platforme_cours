package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import dao.IPlatformeDao;
import dao.PlatformeDaoImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jakarta.servlet.http.HttpSession;
import metier.entities.*;
import service.PlatformeService;

@WebServlet(urlPatterns = {"/envoyer.jee", "/selectProf.jee", "*.jee"})
public class PlatformeServlet extends HttpServlet {
    private IPlatformeDao metier;
    private PlatformeService ps = new PlatformeService();

    @Override
    public void init() throws ServletException {
        metier = new PlatformeDaoImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String path = req.getServletPath();

        switch (path) {

            // 🏠 Page d’accueil
            case "/home.jee": {
                List<Domaine> listModel = ps.getAllDomaine();
                List<Professeur> listProfdefault = ps.getAllProfesseursbyIDdomaine(1);
                req.setAttribute("listModel", listModel);
                req.setAttribute("listProfesseur", listProfdefault);
                req.getRequestDispatcher("index.jsp").forward(req, resp);
                break;
            }

            // 🎓 Sélection d’un domaine
            case "/selectDomaine.jee": {
                int id_module = Integer.parseInt(req.getParameter("id"));
                List<Professeur> listProfesseur = ps.getAllProfesseursbyIDdomaine(id_module);
                List<Domaine> listModel2 = ps.getAllDomaine();
                req.setAttribute("listProfesseur", listProfesseur);
                req.setAttribute("listModel", listModel2);
                req.getRequestDispatcher("index.jsp").forward(req, resp);
                break;
            }

            case "/selectProf.jee": {
                int id_professeur = Integer.parseInt(req.getParameter("id"));
                Professeur professeur = ps.getProfesseurbyID(id_professeur);
                List<Domaine> domaines = ps.getAllDomainesbyIDprof(id_professeur);
                professeur.setDomaines(domaines);
                req.setAttribute("professeur", professeur);
                req.getRequestDispatcher("/WEB-INF/views/professeur.jsp").forward(req, resp);
                break;
            }


            case "/contactProf.jee":{
                int id_professeur = Integer.parseInt(req.getParameter("id"));
                Professeur professeur = ps.getProfesseurbyID(id_professeur);
                List<Domaine> domaines = ps.getAllDomainesbyIDprof(id_professeur);
                professeur.setDomaines(domaines);
                req.setAttribute("professeur", professeur);
                req.getRequestDispatcher("/WEB-INF/views/demande.jsp").forward(req, resp);
            }

            case "/signUp.jee": {
                List<Domaine> listModel = ps.getAllDomaine();
                req.setAttribute("listModel", listModel);
                req.getRequestDispatcher("/WEB-INF/views/signUp.jsp").forward(req, resp);
                break;
            }

            case "/logIn.jee": {
                req.getRequestDispatcher("/WEB-INF/views/logIn.jsp").forward(req, resp);
                break;
            }
            case "/cheekMessage.jee":{
                Professeur prof = null;
                List<Demande> listDemande = new ArrayList<>();
                int id = Integer.parseInt(req.getParameter("id"));
                prof = ps.getProfesseurbyID(id);
                listDemande = ps.getAllRequestsbyProfesseur(id);
                HttpSession session = req.getSession();
                session.setAttribute("prof", prof);
                req.setAttribute("prof", prof);
                req.setAttribute("listDemande", listDemande);
                req.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(req, resp);
                break;
            }
            case "/cheekAccount.jee":{
                Professeur prof = null;
                int id = Integer.parseInt(req.getParameter("id"));
                prof = ps.getProfesseurbyID(id);
                HttpSession session = req.getSession();
                session.setAttribute("prof", prof);
                req.setAttribute("prof", prof);
                req.getRequestDispatcher("/WEB-INF/views/compte.jsp").forward(req, resp);
            }
            case "/cheekNotifications.jee":{
                Etudiant etudiant=null;
                List<Meet> listMeet = new ArrayList<>();
                int id = Integer.parseInt(req.getParameter("id"));
                etudiant = ps.getEtudiantbyId(id);
                listMeet = ps.getAllRequestsbyEtudiant(id);
                HttpSession session = req.getSession();
                session.setAttribute("etudiant", etudiant);
                req.setAttribute("etudiant", etudiant);
                req.setAttribute("listMeet", listMeet);
                req.getRequestDispatcher("/WEB-INF/views/notification.jsp").forward(req, resp);
                break;
            }
            case "/cheekAccountEtu.jee":{
                Etudiant etudiant = null;
                int id = Integer.parseInt(req.getParameter("id"));
                etudiant = ps.getEtudiantbyId(id);
                HttpSession session = req.getSession();
                session.setAttribute("etudiant",etudiant);
                req.setAttribute("etudiant", etudiant);
                req.getRequestDispatcher("/WEB-INF/views/compteEtu.jsp").forward(req, resp);
            }
            //LogIn
            case "/dashboard.jee": {
                String email = req.getParameter("email");
                String password = req.getParameter("mot_de_passe");

                Utilisateur user = metier.loginCheck(email, password);

                if (user != null) {
                    String role = user.getRole();
                    HttpSession session = req.getSession();
                    session.setAttribute("user", user);
                    List<Domaine> listModel = ps.getAllDomaine();
                    List<Professeur> listProfdefault = ps.getAllProfesseursbyIDdomaine(1);
                    req.setAttribute("listModel", listModel);
                    req.setAttribute("listProfesseur", listProfdefault);

                    if ("professeur".equals(role)) {
                        Professeur prof = ps.getProfesseurbyID(user.getId());
                        session.setAttribute("prof", prof);
                        req.getRequestDispatcher("index.jsp").forward(req, resp);
                        return;

                    } else if ("etudiant".equals(role)) {
                        Etudiant etudiant = ps.getEtudiantbyId(user.getId());
                        session.setAttribute("etudiant", etudiant);
                        req.getRequestDispatcher("index.jsp").forward(req, resp);
                        return;

                    } else {
                        req.setAttribute("errorMessage", "Rôle utilisateur inconnu !");
                        req.getRequestDispatcher("/WEB-INF/views/logIn.jsp").forward(req, resp);
                    }

                } else {
                    req.setAttribute("errorMessage", "Email ou mot de passe incorrect !");
                    req.getRequestDispatcher("/WEB-INF/views/logIn.jsp").forward(req, resp);
                }

                break;
            }


            case "/envoyer.jee":{
                String message=req.getParameter("message");

            }
            default: {
                resp.sendRedirect("home.jee");
                break;
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String path = req.getServletPath();

        switch (path) {

            // 👨‍🏫 Inscription d’un professeur
            case "/login.jee": {
                String nom = req.getParameter("nom");
                String prenom = req.getParameter("prenom");
                String email = req.getParameter("email");
                String mot_de_passe = req.getParameter("mot_de_passe");
                String telephone = req.getParameter("telephone");
                String adresse = req.getParameter("adresse");
                String experience = req.getParameter("experience");
                double tarif_horaire = Double.parseDouble(req.getParameter("tarif_horaire"));
                String image = req.getParameter("image");
                String description = req.getParameter("description");
                String about_me = req.getParameter("about_me");

                String module=req.getParameter("module");
                Domaine domaine=new Domaine(0,module);
                Professeur teacher = new Professeur(0, nom, prenom, email, mot_de_passe, telephone, experience, tarif_horaire, description, adresse, image, about_me);
                boolean done = metier.signUpTeacher(teacher, domaine);
                if (done) {
                    req.getRequestDispatcher("/WEB-INF/views/logIn.jsp").forward(req, resp);
                } else {
                    req.getRequestDispatcher("/WEB-INF/views/signUp.jsp").forward(req, resp);
                }
                break;
            }

            case "/logIn.jee": {
                String nom = req.getParameter("nom");
                String prenom = req.getParameter("prenom");
                String email = req.getParameter("email");
                String mot_de_passe = req.getParameter("mot_de_passe");
                String telephone = req.getParameter("telephone");
                String niveau_etude = req.getParameter("niveau_etude");

                Etudiant etudiant = new Etudiant(0, nom, prenom, email, mot_de_passe, telephone, niveau_etude);
                boolean done = metier.signUpStudent(etudiant);

                if (done) {
                    req.getRequestDispatcher("/WEB-INF/views/logIn.jsp").forward(req, resp);
                } else {
                    req.getRequestDispatcher("index.jsp").forward(req, resp);
                }
                break;
            }
            case "/updateProf.jee": {
                int id = Integer.parseInt(req.getParameter("id"));
                Professeur prof = new Professeur();
                prof.setId(id);
                prof.setNom(req.getParameter("nom"));
                prof.setPrenom(req.getParameter("prenom"));
                prof.setEmail(req.getParameter("email"));
                prof.setTelephone(req.getParameter("telephone"));
                prof.setAdresse(req.getParameter("adresse"));
                prof.setExperience(req.getParameter("experience"));
                prof.setAboutMe(req.getParameter("aboutMe"));
                prof.setDescription(req.getParameter("description"));
                prof.setTarif(Double.parseDouble(req.getParameter("tarif")));

                // Mise à jour en base de données
                ps.UpdateProfesseur(prof);

                // Récupérer les infos mises à jour pour les afficher sur la page du compte
                Professeur updatedProf = ps.getProfesseurbyID(id);
                req.setAttribute("prof", updatedProf);

                // Faire un forward vers la page du compte
                RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/compte.jsp");
                dispatcher.forward(req, resp);
                break;
            }
            case "/updateEtu.jee": {
                int id = Integer.parseInt(req.getParameter("id"));
                Etudiant etudiant = new Etudiant();
                etudiant.setId(id);
                etudiant.setNom(req.getParameter("nom"));
                etudiant.setPrenom(req.getParameter("prenom"));
                etudiant.setEmail(req.getParameter("email"));
                etudiant.setTelephone(req.getParameter("telephone"));
                etudiant.setNiveau_etude(req.getParameter("niveau_etude"));
                // Mise à jour en base de données
                metier.UpdateEtudiant(etudiant);

                // Récupérer les infos mises à jour pour les afficher sur la page du compte
                Etudiant updatedEtu = ps.getEtudiantbyId(id);
                req.setAttribute("etudiant", updatedEtu);

                // Faire un forward vers la page du compte
                RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/compteEtu.jsp");
                dispatcher.forward(req, resp);
                break;
            }
            case "/envoyer.jee":  {
                int idProf = Integer.parseInt(req.getParameter("idProf"));
                int idEtudiant = Integer.parseInt(req.getParameter("idEtudiant"));
                String message = req.getParameter("message");

               Professeur professeur = ps.getProfesseurbyID(idProf);
               Etudiant etu = ps.getEtudiantbyId(idEtudiant);

                Demande demande = new Demande();
                demande.setMessage(message);
                demande.setProfesseur(professeur);
                demande.setEtudiant(etu);

                metier.saveDemande(demande);
                resp.sendRedirect(req.getContextPath() + "/selectProf.jee?id=" + idProf);
                return;
            }
            default: {
                resp.sendRedirect("home.jee");
                break;
            }
        }
    }
}
