package actions;

import com.opensymphony.xwork2.ActionSupport;
import daos.TiposCultivoDAO;
import java.util.ArrayList;
import java.util.List;
import model.TipoCultivo;

public class TiposCultivoAction extends ActionSupport{
    
    List<TipoCultivo> tiposCultivo = new ArrayList<TipoCultivo>(0);
    TipoCultivo tipoCultivo = null;
    
    public String listarTiposCultivo(){
        TiposCultivoDAO tipCulDAO = new TiposCultivoDAO();
        setTiposCultivo(tipCulDAO.obtenerCatalogoTipoCultivoDAO());
        return SUCCESS;
    }
    
    public String crearTipoCultivo(){        
        if(tipoCultivo != null){            
            TiposCultivoDAO tipoCultivoDAO = new TiposCultivoDAO();            
            tipoCultivoDAO.guardarTipoCultivoDAO(tipoCultivo);
            return SUCCESS;
        }
        else
            return "captura";
    }
    
    public String actualizarTipoCultivo(){
        TiposCultivoDAO tipCulDAO = new TiposCultivoDAO();      
        if(tipoCultivo.getNombre() != null){          
            TipoCultivo tipoCultivoUpdate = null;
            tipoCultivoUpdate = tipCulDAO.obtenerTipoCultivoByIdDAO(tipoCultivo.getId());
            tipoCultivoUpdate.setNombre(tipoCultivo.getNombre());
            tipoCultivoUpdate.setHumedadMax(tipoCultivo.getHumedadMax());
            tipoCultivoUpdate.setHumedadMin(tipoCultivo.getHumedadMin());
            tipoCultivoUpdate.setTemperaturaMax(tipoCultivo.getTemperaturaMax());
            tipoCultivoUpdate.setTemperaturaMin(tipoCultivo.getTemperaturaMin());
            tipoCultivoUpdate.setPeriodoRiego(tipoCultivo.getPeriodoRiego());
            tipCulDAO.actualizarTipoCultivoDAO(tipoCultivoUpdate);
            return SUCCESS;
        }
        else{            
            setTipoCultivo(tipCulDAO.obtenerTipoCultivoByIdDAO(tipoCultivo.getId()));
            return "captura";
        }
    }
    
    public String eliminarTipoCultivo(){
        TiposCultivoDAO tipCulDAO = new TiposCultivoDAO();
        setTipoCultivo(tipCulDAO.obtenerTipoCultivoByIdDAO(tipoCultivo.getId()));
        tipCulDAO.eliminarTipoCultivoDAO(tipoCultivo);
        return SUCCESS;
    }

    public List<TipoCultivo> getTiposCultivo() {
        return tiposCultivo;
    }

    public void setTiposCultivo(List<TipoCultivo> tiposCultivo) {
        this.tiposCultivo = tiposCultivo;
    }    

    public TipoCultivo getTipoCultivo() {
        return tipoCultivo;
    }

    public void setTipoCultivo(TipoCultivo tipoCultivo) {
        this.tipoCultivo = tipoCultivo;
    }   
}
