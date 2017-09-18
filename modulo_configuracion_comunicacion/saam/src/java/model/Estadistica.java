package model;
// Generated 14/09/2017 04:33:27 PM by Hibernate Tools 3.6.0


import java.util.Date;

/**
 * Estadistica generated by hbm2java
 */
public class Estadistica  implements java.io.Serializable {


     private Long id;
     private Cultivo cultivo;
     private String ip;
     private int temperaturaAmbiente;
     private int temperaturaSuelo;
     private int humedadAmbiente;
     private int humedadSuelo;
     private Date fecha;

    public Estadistica() {
    }

    public Estadistica(Cultivo cultivo, String ip, int temperaturaAmbiente, int temperaturaSuelo, int humedadAmbiente, int humedadSuelo, Date fecha) {
       this.cultivo = cultivo;
       this.ip = ip;
       this.temperaturaAmbiente = temperaturaAmbiente;
       this.temperaturaSuelo = temperaturaSuelo;
       this.humedadAmbiente = humedadAmbiente;
       this.humedadSuelo = humedadSuelo;
       this.fecha = fecha;
    }
   
    public Long getId() {
        return this.id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    public Cultivo getCultivo() {
        return this.cultivo;
    }
    
    public void setCultivo(Cultivo cultivo) {
        this.cultivo = cultivo;
    }
    public String getIp() {
        return this.ip;
    }
    
    public void setIp(String ip) {
        this.ip = ip;
    }
    public int getTemperaturaAmbiente() {
        return this.temperaturaAmbiente;
    }
    
    public void setTemperaturaAmbiente(int temperaturaAmbiente) {
        this.temperaturaAmbiente = temperaturaAmbiente;
    }
    public int getTemperaturaSuelo() {
        return this.temperaturaSuelo;
    }
    
    public void setTemperaturaSuelo(int temperaturaSuelo) {
        this.temperaturaSuelo = temperaturaSuelo;
    }
    public int getHumedadAmbiente() {
        return this.humedadAmbiente;
    }
    
    public void setHumedadAmbiente(int humedadAmbiente) {
        this.humedadAmbiente = humedadAmbiente;
    }
    public int getHumedadSuelo() {
        return this.humedadSuelo;
    }
    
    public void setHumedadSuelo(int humedadSuelo) {
        this.humedadSuelo = humedadSuelo;
    }
    public Date getFecha() {
        return this.fecha;
    }
    
    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }




}

