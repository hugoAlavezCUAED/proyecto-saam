/*
estacion.h - Biblioteca para manejo de un cultivo
Created by Hugo Alavez, Agosto, 2017. Released into the public domain.
*/
#ifndef Estacion_h
#define Estacion_h
#define DHTTYPE DHT11


#include <Arduino.h>
#include <ArduinoJson.h>
#include <DHT.h>

class Cultivo
{
	public: 
		Cultivo(int id); 
		Cultivo();
    void InicializaCultivo(JsonObject& cultivo);
		int GetId();
		void SetId(int id);
    char* GetNombre();
    void SetNombre(char* nombre);
    int GetHumedadMin();
    void SetHumedadMin(int humedadMin);
    int GetHumedadMax();
    void SetHumedadMax(int humedadMax);
    int GetTemperaturaMin();
    void SetTemperaturaMin(int temperaturaMin);
    int GetTemperaturaMax();
    void SetTemperaturaMax(int temperaturaMax);
    int GetPeriodoRiego();
    void SetPeriodoRiego(int periodoRiego);
    void ToString();
	private:
  boolean _activo;
	int _id;
  char* _nombre; 
  int _humedadMin;
  int _humedadMax;
  int _temperaturaMin;
  int _temperaturaMax;
  int _periodoRiego;
  
};

#endif
