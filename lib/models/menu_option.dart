//import 'package:flutter/material.dart' show IconData; //para solo mostrar algo especifico de la clase
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuOption {
  final String route;
  final IconData icon;
  final String name;
  final Widget screen;

  //metodo constructor
  MenuOption({
    @required this.route, //referencia a la ruta nombrada
    @required this.icon, //referencia al icono
    @required this.name, //referencia al contenido del widget
    @required this.screen, //referencia a la pantalla a mostrar
  });
}
