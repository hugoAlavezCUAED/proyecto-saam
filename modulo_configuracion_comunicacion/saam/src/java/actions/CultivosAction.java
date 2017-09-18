package actions;

import com.opensymphony.xwork2.ActionSupport;
import daos.ActuadoresDAO;
import daos.CultivosDAO;
import daos.EstacionesDAO;
import daos.SensoresDAO;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import model.CatalogoActuador;
import model.CatalogoSensor;
import model.Cultivo;
import model.Estacion;
import model.Estadistica;
import model.TipoCultivo;

public class CultivosAction extends ActionSupport {
    
    Estacion estacion;

    private List<Cultivo> cultivos = new ArrayList<Cultivo>(0);

    private Long estacionId;

    private List<TipoCultivo> catalogoTipoCultivo = new ArrayList<TipoCultivo>(0);

    private List<CatalogoActuador> catalogoActuador = new ArrayList<CatalogoActuador>(0);

    private List<CatalogoSensor> catalogoSensor = new ArrayList<CatalogoSensor>(0);

    private CatalogoActuador actuador1;
    private CatalogoActuador actuador2;
    private CatalogoActuador actuador3;
    private CatalogoActuador actuador4;

    private CatalogoSensor sensor1;
    private CatalogoSensor sensor2;
    private CatalogoSensor sensor3;
    private CatalogoSensor sensor4;

    private Cultivo cultivo1;
    private Cultivo cultivo2;

    public String listarCultivos() {
        CultivosDAO cultDAO = new CultivosDAO();
        ActuadoresDAO actDAO = new ActuadoresDAO();
        SensoresDAO senDAO = new SensoresDAO();
        EstacionesDAO estDAO = new EstacionesDAO();
        estacion = estDAO.obtenerEstacionById(estacionId);
        catalogoTipoCultivo = cultDAO.obtenerCatalogoTipoCultivoDAO();
        catalogoActuador = actDAO.obtenerCatalogoActuadores();
        catalogoSensor = senDAO.obtenerCatalogoActuadores();
        cultivos = cultDAO.obtenerCultivosPorEstacionIdDAO(estacionId);
        
        
        
        //En caso de que existan datos
        if (!cultivos.isEmpty()) {
            

            //SE MUESTRAN
            //Actuadores
            if (cultivos.size() == 2) {
                cultivo2 = cultivos.get(1) == null ? null : cultivos.get(1);
                //Cultivo 2 //Actuadores
                if (!cultivos.get(1).getCatalogoActuadors().isEmpty()) {
                    for (CatalogoActuador catalogoCultivo2 : cultivos.get(1).getCatalogoActuadors()) {
                        actuador3 = catalogoCultivo2;
                        break;
                    }
                    if (cultivos.get(1).getCatalogoActuadors().size() > 1) {
                        for (CatalogoActuador catalogoCultivo2 : cultivos.get(1).getCatalogoActuadors()) {
                            actuador4 = catalogoCultivo2;
                        }
                    }
                }
                //Cultivo2 //Sensores
                if(!cultivos.get(1).getCatalogoSensors().isEmpty()){
                    for(CatalogoSensor catalogoSensoresCultivo2 : cultivos.get(1).getCatalogoSensors()){
                        sensor3 = catalogoSensoresCultivo2;
                        break;
                    }
                    if (cultivos.get(1).getCatalogoSensors().size() > 1){
                        for(CatalogoSensor catalogoSensoresCultivo2 : cultivos.get(1).getCatalogoSensors()){
                            sensor4 = catalogoSensoresCultivo2;
                        }
                    }
                }
            }
            cultivo1 = cultivos.get(0) == null ? null : cultivos.get(0);
            //Cultivo 1 //Actuadores
            if (!cultivos.get(0).getCatalogoActuadors().isEmpty()) {
                for (CatalogoActuador catalogoCultivo1 : cultivos.get(0).getCatalogoActuadors()) {
                    actuador1 = catalogoCultivo1;
                    break;
                }
                if (cultivos.get(0).getCatalogoActuadors().size() > 1) {
                    for (CatalogoActuador catalogoCultivo1 : cultivos.get(0).getCatalogoActuadors()) {
                        actuador2 = catalogoCultivo1;
                    }
                }
            }
            //Cultivo1 //Sensores
            if(!cultivos.get(0).getCatalogoSensors().isEmpty()){
                for(CatalogoSensor catalogoSensorCultivo1 : cultivos.get(0).getCatalogoSensors()){
                    sensor1 = catalogoSensorCultivo1;
                    break;
                }
                if(cultivos.get(0).getCatalogoSensors().size() > 1){
                    for(CatalogoSensor catalogoSensorCultivo1 : cultivos.get(0).getCatalogoSensors()){
                        sensor2 = catalogoSensorCultivo1;
                    }
                }
            }
        }
        else{
            if(cultivo1 != null){
                if(cultivo1.getTipoCultivo().getId() != -1){
                    Cultivo nuevo = new Cultivo();
                    nuevo.setEstacion(estacion);
                    nuevo.setTipoCultivo(cultDAO.obtenerTipoCultivoDAO(cultivo1.getTipoCultivo().getId()));
                    Set<Estadistica> estadisticas = new HashSet<Estadistica>(0);
                    nuevo.setEstadisticas(estadisticas);

                    Set<CatalogoActuador> nuevosActuadores = new HashSet<CatalogoActuador>(0);
                    if(actuador1 != null){
                        nuevosActuadores.add(actuador1);
                    }
                    if(actuador2 != null){
                        nuevosActuadores.add(actuador2);
                    }
                    if(!nuevosActuadores.isEmpty())
                        nuevo.setCatalogoActuadors(nuevosActuadores);

                    Set<CatalogoSensor> nuevosSensores = new HashSet<CatalogoSensor>(0);
                    if(sensor1 != null){
                        nuevosSensores.add(sensor1);
                    }
                    if(sensor2 != null){
                        nuevosSensores.add(sensor2);
                    }
                    if(!nuevosSensores.isEmpty())
                        nuevo.setCatalogoSensors(nuevosSensores);    

                    cultDAO.guardarCultivoDAO(nuevo);
                }
            }
            
            if(cultivo2 != null){
                if(cultivo2.getTipoCultivo().getId() != -1){
                    Cultivo nuevo2 = new Cultivo();
                    nuevo2.setEstacion(estacion);
                    nuevo2.setTipoCultivo(cultivo2.getTipoCultivo());
                    Set<Estadistica> estadisticas2 = new HashSet<Estadistica>(0);
                    nuevo2.setEstadisticas(estadisticas2);

                    Set<CatalogoActuador> nuevosActuadores2 = new HashSet<CatalogoActuador>(0);
                    if(actuador3 != null){
                        nuevosActuadores2.add(actuador3);
                    }
                    if(actuador4 != null){
                        nuevosActuadores2.add(actuador4);
                    }
                    if(!nuevosActuadores2.isEmpty())
                        nuevo2.setCatalogoActuadors(nuevosActuadores2);

                    Set<CatalogoSensor> nuevosSensores2 = new HashSet<CatalogoSensor>(0);
                    if(sensor3 != null){
                        nuevosSensores2.add(sensor3);
                    }
                    if(sensor4 != null){
                        nuevosSensores2.add(sensor4);
                    }
                    if(!nuevosSensores2.isEmpty())
                        nuevo2.setCatalogoSensors(nuevosSensores2);       

                    cultDAO.guardarCultivoDAO(nuevo2);
                }
            }
            
        }       
        return SUCCESS;
    }

    public Long getEstacionId() {
        return estacionId;
    }

    public void setEstacionId(Long estacionId) {
        this.estacionId = estacionId;
    }

    public List<Cultivo> getCultivos() {
        return cultivos;
    }

    public void setCultivos(List<Cultivo> cultivos) {
        this.cultivos = cultivos;
    }

    public List<TipoCultivo> getCatalogoTipoCultivo() {
        return catalogoTipoCultivo;
    }

    public void setCatalogoTipoCultivo(List<TipoCultivo> catalogoTipoCultivo) {
        this.catalogoTipoCultivo = catalogoTipoCultivo;
    }

    public List<CatalogoActuador> getCatalogoActuador() {
        return catalogoActuador;
    }

    public void setCatalogoActuador(List<CatalogoActuador> catalogoActuador) {
        this.catalogoActuador = catalogoActuador;
    }

    public List<CatalogoSensor> getCatalogoSensor() {
        return catalogoSensor;
    }

    public void setCatalogoSensor(List<CatalogoSensor> catalogoSensor) {
        this.catalogoSensor = catalogoSensor;
    }

    public CatalogoActuador getActuador1() {
        return actuador1;
    }

    public void setActuador1(CatalogoActuador actuador1) {
        this.actuador1 = actuador1;
    }

    public CatalogoActuador getActuador2() {
        return actuador2;
    }

    public void setActuador2(CatalogoActuador actuador2) {
        this.actuador2 = actuador2;
    }

    public CatalogoActuador getActuador3() {
        return actuador3;
    }

    public void setActuador3(CatalogoActuador actuador3) {
        this.actuador3 = actuador3;
    }

    public CatalogoActuador getActuador4() {
        return actuador4;
    }

    public void setActuador4(CatalogoActuador actuador4) {
        this.actuador4 = actuador4;
    }

    public CatalogoSensor getSensor1() {
        return sensor1;
    }

    public void setSensor1(CatalogoSensor sensor1) {
        this.sensor1 = sensor1;
    }

    public CatalogoSensor getSensor2() {
        return sensor2;
    }

    public void setSensor2(CatalogoSensor sensor2) {
        this.sensor2 = sensor2;
    }

    public CatalogoSensor getSensor3() {
        return sensor3;
    }

    public void setSensor3(CatalogoSensor sensor3) {
        this.sensor3 = sensor3;
    }

    public CatalogoSensor getSensor4() {
        return sensor4;
    }

    public void setSensor4(CatalogoSensor sensor4) {
        this.sensor4 = sensor4;
    }

    public Cultivo getCultivo1() {
        return cultivo1;
    }

    public void setCultivo1(Cultivo cultivo1) {
        this.cultivo1 = cultivo1;
    }

    public Cultivo getCultivo2() {
        return cultivo2;
    }

    public void setCultivo2(Cultivo cultivo2) {
        this.cultivo2 = cultivo2;
    }

    public Estacion getEstacion() {
        return estacion;
    }

    public void setEstacion(Estacion estacion) {
        this.estacion = estacion;
    }
}
