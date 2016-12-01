import oscP5.*; // -->se importan las librerías oscP5 y netP5
import netP5.*;

OscP5 oscP5; //--> definición del objeto
NetAddress direccionRemota;

int puerto;
String ip;

void setup(){

size (400, 400);
background (0);

ip = "127.0.0.1"; //-->dirección ip a donde se envían los mensajes (en este caso localhost)
puerto = 11112;

oscP5 = new OscP5(this, puerto); //-->inicialización del objeto

direccionRemota = new NetAddress(ip, puerto); //-->Entrada: mensajes de entrada por el puerto especificado

}

void draw(){

OscMessage mensaje1 = new OscMessage("/mouse/posicion"); //-->crea una etiqueta para el mensaje
OscMessage mensaje2 = new OscMessage("/mouse/posNorm"); //-->crea una etiqueta para el mensaje
mensaje1.add(mouseX); //-->se le agrega un dato (posición del mouse)
mensaje1.add(mouseY); //-->se le agrega otro dato
mensaje2.add(map (mouseX, 0, width, 0, 1.0));
mensaje2.add(map (mouseY, 0, height, 0, 1.0));

oscP5.send(mensaje1, direccionRemota); //-->Se envia el mensaje
oscP5.send(mensaje2, direccionRemota);

}