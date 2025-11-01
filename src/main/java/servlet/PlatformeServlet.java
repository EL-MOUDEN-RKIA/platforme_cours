package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import dao.IPlatformeDao;
import dao.PlatformeDaoImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import metier.entities.Domaine;
import metier.entities.Etudiant;
import metier.entities.Professeur;
import service.PlatformeService;

@WebServlet(urlPatterns = {"*.jee"})
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

            // 👨‍🏫 Détails d’un professeur
            case "/selectProf.jee": {
                int id_professeur = Integer.parseInt(req.getParameter("id"));
                Professeur professeur = ps.getProfesseurbyID(id_professeur);
                List<Domaine> domaines = ps.getAllDomainesbyIDprof(id_professeur);
                professeur.setDomaines(domaines);
                req.setAttribute("professeur", professeur);
                req.getRequestDispatcher("/WEB-INF/views/professeur.jsp").forward(req, resp);
                break;
            }

            // 📝 Page d’inscription (affichage)
            case "/signUp.jee": {
                req.getRequestDispatcher("/WEB-INF/views/signUp.jsp").forward(req, resp);
                break;
            }

            // 🔐 Page de connexion (affichage)
            case "/logIn.jee": {
                req.getRequestDispatcher("/WEB-INF/views/logIn.jsp").forward(req, resp);
                break;
            }

            // 🧭 Par défaut
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

                Professeur teacher = new Professeur(0, nom, prenom, email, mot_de_passe, telephone,
                        experience, tarif_horaire, description, adresse, image, about_me);

                boolean done = metier.signUpTeacher(teacher);

                if (done) {
                    req.getRequestDispatcher("/WEB-INF/views/logIn.jsp").forward(req, resp);
                } else {
                    req.getRequestDispatcher("index.jsp").forward(req, resp);
                }
                break;
            }

            // 🎓 Inscription d’un étudiant
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

            // 🧭 Par défaut
            default: {
                resp.sendRedirect("home.jee");
                break;
            }
        }
    }
}
