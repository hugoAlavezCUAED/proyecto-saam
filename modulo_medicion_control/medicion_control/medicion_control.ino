/*
modulo de medicion y control
Created by Hugo Alavez, Agosto, 2017. Released into the public domain.
*/

#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>
#include <ArduinoJson.h>

#include "Cultivo.h"

//char* ssid     ="";
//char* password ="";



const char* ssid     = "Totalplay-5C83";
const char* password = "5C83165CGbxh8WQw";
const char* linea = "\n===============";
const char* mensajeEnter =" Después pulsa la tecla Enter";
const char* host = "132.248.48.64";
const char* hostapp = "/saamicroservices/";
const char* hostport = "8080";

Cultivo cultivo0;
Cultivo cultivo1;
int value = 0;
/*Datos de la estacion*/
int idEstacion = -1;
char* nombreEstacion = "";
double lat = 0;
double lon = 0;



void setup() {
  Serial.begin(115200);
  
  getSSID();
  getSSIDPassword();
  conectToWifi();

  getHost();
  getIdEstacion();
  getDatosEstacion();
  delay(1000);
}


void loop() {
  datosGenerales();
  value++;
  delay(30000);

}

void datosGenerales() {
  Serial.println(linea);
  Serial.print("id estacion:");
  Serial.println(idEstacion);
  Serial.println(nombreEstacion);
  Serial.print("latitud: ");
  Serial.println(lat,6);
  Serial.print("longitud: ");
  Serial.println(lon,6);
  Serial.println();
  Serial.print(value);
  Serial.println(linea);

  cultivo0.ToString();
  cultivo1.ToString();

}

void getIdEstacion(){
  String respuesta ="";
  Serial.print ("\n\nIntroduce el número de estacion."); 
  Serial.println(mensajeEnter);
  while(respuesta == ""){
     respuesta = Serial.readStringUntil ('\n'); 
  }
  idEstacion =  respuesta.toInt();
}

void getSSID(){}
void getHost(){}
void getSSIDPassword(){}


void getDatosEstacion() {
  String datosEstacion = getConfigurationEstacion();
  if (datosEstacion.length() > 0) {
    Serial.println(datosEstacion.length());
    Serial.println(datosEstacion);
  }
  char json[datosEstacion.length() + 1];
  datosEstacion.toCharArray(json, datosEstacion.length() + 1);
  StaticJsonBuffer<1800> jsonBuffer;
  JsonObject& estacionJson = jsonBuffer.parseObject(json); 
  if (!estacionJson.success()) {
    Serial.println("parseObject() failed");
  }
  idEstacion = estacionJson["id"];
  const char* nombre = estacionJson["nombre"];
  nombreEstacion = strdup(nombre);
  lat = estacionJson["latitud"];
  lon = estacionJson["longitud"];

  JsonObject& c0 = estacionJson["cultivos"][0];
  JsonObject& c1 = estacionJson["cultivos"][1];

  cultivo0.InicializaCultivo(c0);
  cultivo1.InicializaCultivo(c1);
}

String getConfigurationEstacion() {
  String result = "";
  if (WiFi.status() == WL_CONNECTED) {
    Serial.print("connecting to ");
    Serial.println(host);
    HTTPClient http;
    String url = "http://";
    url += host;
    url += ":";
    url += hostport;
    url += hostapp;
    url += "estacion/";
    url += idEstacion;
    Serial.println(url);
    http.begin(url);
    int httpCode = http.GET();
    Serial.println("Code request");
    Serial.println(httpCode);
    if (httpCode > 0) {
      result = http.getString();
    }
    http.end();
  }
  return result;
}

void conectToWifi() {
  // We start by connecting to a WiFi network
  Serial.println();
  Serial.print("Conectando a la red ");
  Serial.println(ssid);
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.println("WiFi connected");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());
}

