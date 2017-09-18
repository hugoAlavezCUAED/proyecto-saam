/*
estacion.h - Biblioteca para manejo de un cultivo
Created by Hugo Alavez, Agosto, 2017. Released into the public domain.
*/

#include "Cultivo.h"

/*Constructores*/
Cultivo::Cultivo(int id)
{
	_id = id;
}

Cultivo::Cultivo()
{
  _activo = false;
}

void Cultivo::InicializaCultivo(JsonObject& cultivo){
  JsonObject& tipoCultivo = cultivo["tipoCultivo"];
  int id = tipoCultivo["id"];
  if(id > 0){
    this->SetId(id);
    const char* nombre = tipoCultivo["nombre"];
    this->SetNombre(strdup(nombre));
    this->SetHumedadMin(tipoCultivo["humedadMin"]);
    this->SetHumedadMax(tipoCultivo["humedadMax"]);
    this->SetTemperaturaMin(tipoCultivo["temperaturaMin"]);
    this->SetTemperaturaMax(tipoCultivo["temperaturaMax"]);
    this->SetPeriodoRiego(tipoCultivo["periodoRiego"]);

    
    _activo = true;
  }
}

int Cultivo::GetId()
{
	return(_id);
}

void Cultivo::SetId(int id)
{
	_id = id;
}

char* Cultivo::GetNombre()
{
  return (_nombre);
}
void Cultivo::SetNombre(char* nombre)
{
  _nombre = nombre;
}

int Cultivo::GetHumedadMin()
{
  return(_humedadMin);
}

void Cultivo::SetHumedadMin(int humedadMin)
{
  _humedadMin = humedadMin;
}

int Cultivo::GetHumedadMax()
{
  return (_humedadMax);
}

void Cultivo::SetHumedadMax(int humedadMax)
{
  _humedadMax = humedadMax;
}

int Cultivo::GetTemperaturaMin()
{
  return(_temperaturaMin);
}

void Cultivo::SetTemperaturaMin(int temperaturaMin)
{
  _temperaturaMin = temperaturaMin;
}


int Cultivo::GetTemperaturaMax()
{
  return(_temperaturaMax);
}
    
void Cultivo::SetTemperaturaMax(int temperaturaMax)
{
  _temperaturaMax = temperaturaMax;
}

int Cultivo::GetPeriodoRiego()
{
  return (_periodoRiego);
}

void Cultivo::SetPeriodoRiego(int periodoRiego)
{
  _periodoRiego = periodoRiego;
}

void Cultivo::ToString()
{
  if(_activo){
    Serial.println("Cultivo activo");
  }
  else
  {
    Serial.println("Cultivo inactivo");
  }
  Serial.print("id: ");
  Serial.println(_id);
  Serial.print("nombre: ");
  Serial.println(_nombre);  
  Serial.print("Humedad minima: ");
  Serial.println(_humedadMin);
  Serial.print("Humedad maxima: ");
  Serial.println(_humedadMax);
  Serial.print("Temperatura minima: ");
  Serial.println(_temperaturaMin);
  Serial.print("Temperatura maxima: ");
  Serial.println(_temperaturaMax);
  Serial.print("Periodo de riego (horas): ");
  Serial.println(_periodoRiego);
}



