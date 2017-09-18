package daos;

import java.util.ArrayList;
import java.util.List;
import model.Estacion;
import model.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;

public class EstacionesDAO {
    
    Session session = null;

    public EstacionesDAO() {
        this.session = HibernateUtil.getSessionFactory().getCurrentSession();
    }
    
    public List<Estacion> obtenerEstacionesPorUsuarioIdDAO(Long usuarioId){
        List<Estacion> estaciones = new ArrayList<Estacion>(0);        
        try {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q = session.createQuery("from Estacion as e where e.usuario.id=" + usuarioId);
            estaciones = (List<Estacion>) q.list();
            System.out.println("estaciones: " + estaciones.size());
        } catch (Exception e) {
            e.printStackTrace();
        }        
        return estaciones;
    }
    
    public Estacion obtenerEstacionById(Long idEstacion){
        Estacion estacion = null;        
        try {
            org.hibernate.Transaction tx = session.beginTransaction();
            estacion =  (Estacion) session.get(Estacion.class, idEstacion);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return estacion;
    }
    
    public void guardarEstacionDAO(Estacion estacion){
        try{
            org.hibernate.Transaction tx = session.beginTransaction();
            session.save(estacion);
            tx.commit();
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }    
    
    public void actualizarEstacionDAO(Estacion estacion){
        try{
            org.hibernate.Transaction tx = session.beginTransaction();
            session.update(estacion);
            tx.commit();
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
    
    public void eliminarEstacionDAO(Estacion estacion){
        try{
            org.hibernate.Transaction tx = session.beginTransaction();
            session.delete(estacion);
            tx.commit();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
