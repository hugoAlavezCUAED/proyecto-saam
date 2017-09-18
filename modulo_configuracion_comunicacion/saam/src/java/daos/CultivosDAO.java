package daos;

import java.util.ArrayList;
import java.util.List;
import model.Cultivo;
import model.HibernateUtil;
import model.TipoCultivo;
import org.hibernate.Query;
import org.hibernate.Session;

public class CultivosDAO {
    
    Session session = null;

    public CultivosDAO() {
        this.session = HibernateUtil.getSessionFactory().getCurrentSession();
    }
    
    public List<Cultivo> obtenerCultivosPorEstacionIdDAO(Long estacionId){
        List<Cultivo> cultivos = new ArrayList<Cultivo>(0);        
        try {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q = session.createQuery("from Cultivo as c where c.estacion.id=" + estacionId);
            cultivos = (List<Cultivo>) q.list();
            System.out.println("cultivos: " + cultivos.size());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cultivos;
    }
    
    public List<TipoCultivo> obtenerCatalogoTipoCultivoDAO(){
        List<TipoCultivo>  tiposCultivo = new ArrayList<TipoCultivo>(0);        
        try {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q = session.createQuery("from TipoCultivo as c where 1=1");
            tiposCultivo = (List<TipoCultivo>) q.list();            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tiposCultivo;
    }
    
    public void guardarCultivoDAO(Cultivo cultivo){
        try{
            org.hibernate.Transaction tx = session.beginTransaction();
            session.save(cultivo);
            tx.commit();
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
    
    public TipoCultivo obtenerTipoCultivoDAO(Long idTipoCultivo){
        TipoCultivo tipoCultivo = null;        
        try {
            org.hibernate.Transaction tx = session.beginTransaction();
            tipoCultivo =  (TipoCultivo) session.get(TipoCultivo.class, idTipoCultivo);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tipoCultivo;
    }
}
