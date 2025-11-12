package dao;

import metier.entities.Demande;
import metier.entities.Meet;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

public class MeetDao {

    public void saveMeet(Meet meet) {
        Transaction tx = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {

            tx = session.beginTransaction();
            System.out.println("Saving meet: " + meet.getTitre());
            session.persist(meet);
            tx.commit();

        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        }
    }
    public void accepterDemande(int idDemande) {
        Transaction tx = null;

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            tx = session.beginTransaction();

            // Récupérer la demande
            Demande demande = session.get(Demande.class, idDemande);

            if (demande != null) {
                // Forcer le chargement des relations
                if (demande.getEtudiant() != null) demande.getEtudiant().getId();
                if (demande.getProfesseur() != null) demande.getProfesseur().getId();

                // Modifier le statut
                demande.setStatut("acceptee");

                // Mettre à jour la demande dans la base
                session.merge(demande);

                System.out.println(">>> Demande mise à jour : " + demande);
            } else {
                System.out.println(">>> Aucune demande trouvée avec l'id = " + idDemande);
            }

            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        }
    }

}
