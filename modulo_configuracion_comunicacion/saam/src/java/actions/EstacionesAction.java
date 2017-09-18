package actions;

import com.opensymphony.xwork2.ActionSupport;
import daos.EstacionesDAO;
import java.util.ArrayList;
import java.util.List;
import model.Estacion;
import model.Usuario;

public class EstacionesAction extends ActionSupport{
    
    List<Estacion> estaciones = new ArrayList<Estacion>(0);
    Estacion estacion = null;
    
    public String listarEstaciones(){
        EstacionesDAO estDAO = new EstacionesDAO();
        estaciones = estDAO.obtenerEstacionesPorUsuarioIdDAO(1L);
        return SUCCESS;
    }
    
    public String crearEstacion(){
        if(estacion != null){
            estacion.setUsuario(new Usuario(1L));
            EstacionesDAO estDAO = new EstacionesDAO();            
            estDAO.guardarEstacionDAO(estacion);
            return SUCCESS;
        }
        else
            return "captura";
    }
    
    public String actualizarEstacion(){ 
        EstacionesDAO estDAO = new EstacionesDAO();        
        if(estacion.getNombre() != null){          
            Estacion estacionUpdate = null;
            estacionUpdate = estDAO.obtenerEstacionById(estacion.getId());
            estacionUpdate.setIp(estacion.getIp());
            estacionUpdate.setLatitud(estacion.getLatitud());
            estacionUpdate.setLongitud(estacion.getLongitud());
            estacionUpdate.setNombre(estacion.getNombre());
            estDAO.actualizarEstacionDAO(estacionUpdate);
            return SUCCESS;
        }
        else{            
            setEstacion(estDAO.obtenerEstacionById(estacion.getId()));
            return "captura";
        }
    }   
    
    public String eliminarEstacion(){
        EstacionesDAO estDAO = new EstacionesDAO();
        setEstacion(estDAO.obtenerEstacionById(estacion.getId()));
        estDAO.eliminarEstacionDAO(estacion);
        return SUCCESS;
    }
    

    public List<Estacion> getEstaciones() {
        return estaciones;
    }

    public void setEstaciones(List<Estacion> estaciones) {
        this.estaciones = estaciones;
    }   

    public Estacion getEstacion() {
        return estacion;
    }

    public void setEstacion(Estacion estacion) {
        this.estacion = estacion;
    }    
}
