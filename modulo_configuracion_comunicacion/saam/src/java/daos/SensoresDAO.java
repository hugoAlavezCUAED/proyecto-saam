package daos;

import java.util.ArrayList;
import java.util.List;
import model.CatalogoSensor;
import model.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;

public class SensoresDAO {
    
    Session session = null;

    public SensoresDAO() {
        this.session = HibernateUtil.getSessionFactory().getCurrentSession();
    }
    
    public List<CatalogoSensor> obtenerCatalogoActuadores(){
        List<CatalogoSensor> sensores = new ArrayList<CatalogoSensor>(0);        
        try {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q = session.createQuery("from CatalogoSensor as c where 1=1");
            sensores = (List<CatalogoSensor>) q.list();
            System.out.println("sensores: " + sensores.size());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sensores;
    }
}
