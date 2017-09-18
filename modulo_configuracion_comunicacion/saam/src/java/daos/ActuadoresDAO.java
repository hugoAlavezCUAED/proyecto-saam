package daos;

import java.util.ArrayList;
import java.util.List;
import model.CatalogoActuador;
import model.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;

public class ActuadoresDAO {   
    
    Session session = null;

    public ActuadoresDAO() {
        this.session = HibernateUtil.getSessionFactory().getCurrentSession();
    }
    
    public List<CatalogoActuador> obtenerCatalogoActuadores(){
        List<CatalogoActuador> actuadores = new ArrayList<CatalogoActuador>(0);        
        try {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q = session.createQuery("from CatalogoActuador as c where 1=1");
            actuadores = (List<CatalogoActuador>) q.list();
            System.out.println("actuadores: " + actuadores.size());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return actuadores;
    }
}
