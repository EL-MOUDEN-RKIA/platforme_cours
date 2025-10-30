package servlet;

import java.util.ArrayList;
import java.util.List;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Professeur;
import service.PlatformeService;
import model.domaine;

@WebServlet(urlPatterns = {"*.do"})
public class PlatformeServlet extends HttpServlet {
    PlatformeService ps = new PlatformeService();
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path=req.getServletPath();
        switch (path){
            case "/home.do":
               List<domaine> listModel=  new ArrayList<>();
               listModel=ps.getAllDomaine();
               req.setAttribute("listModel",listModel);
               req.getRequestDispatcher("index.jsp").forward(req,resp);
               break;
           case "/selectDomaine.do":
                List<Professeur> listProfesseur= new ArrayList<>();
                int id_module=Integer.parseInt(req.getParameter("id"));
                listProfesseur = ps.getAllProfesseursbyIDdomaine(id_module);
                List<domaine> listModel2 = new ArrayList<>();
                listModel2 = ps.getAllDomaine();
                req.setAttribute("listProfesseur", listProfesseur);
               req.setAttribute("listModel",listModel2);
                req.getRequestDispatcher("index.jsp").forward(req,resp);
                break;
            case "/selectProf.do":
                Professeur professeur = null;
                int id_professeur=Integer.parseInt(req.getParameter("id"));
                professeur = ps.getProfesseurbyID(id_professeur);
                List<domaine> domaines = new ArrayList<>();
                domaines = ps.getAllDomainesbyIDprof(id_professeur);
                professeur.setDomaines(domaines);
                req.setAttribute("professeur", professeur);
                req.getRequestDispatcher("/WEB-INF/views/professeur.jsp").forward(req,resp);
                break;
            default:
                resp.sendRedirect("home.do");
        }

    }
}
