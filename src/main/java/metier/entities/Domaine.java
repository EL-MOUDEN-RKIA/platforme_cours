package metier.entities;
import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "module")
public class Domaine {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_module")
    private int  id;
    @Column(name = "nom_module")
    private String name;

    public Domaine(int id, String name){
        this.id= id;
        this.name = name;

    }

    @ManyToMany(mappedBy = "domaines")
    List<Professeur> professeurs=new ArrayList<Professeur>();

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}


