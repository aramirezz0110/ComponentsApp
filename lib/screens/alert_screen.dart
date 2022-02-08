import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({Key key}) : super(key: key);
  void displayDialogIOS(BuildContext context) {
    showCupertinoDialog(
      //barrierDismissible: true, //para que se cierre al tocar fuera del contenedor
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text("Alert Dialog IOS"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Este es el contenido loquita!"),
              SizedBox(
                height: 10,
              ),
              FlutterLogo(
                size: 100,
              )
            ],
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Colors.red),
                )),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Ok"),
            ),
          ],
        );
      },
    );
  }

  void displayDialogAndroid(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        //widget de cuadro emergente
        return AlertDialog(
          elevation: 5,
          title: Text("Loquitas!"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Este es el contenido loquita!"),
              SizedBox(
                height: 10,
              ),
              FlutterLogo(
                size: 100,
              )
            ],
          ),
          scrollable: true, //opcion de scroll dentro de la pantalla
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context), child: Text("Cancel")),
            TextButton(
                onPressed: () => Navigator.pop(context), child: Text("Ok")),
          ],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(10)),
        );
      },
      barrierDismissible:
          true, //permite cerrar el dialogo cuando se presiona sobre la sombra
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Center(
      //     child: Text("Alert Screen"),
      //   ),
      // ),
      body: Center(
          child: ElevatedButton(
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Text(
            "Show Alert",
            style: TextStyle(fontSize: 16),
          ),
        ),
        //para hacer algo de cauerdo a la plataforma en la que este la app
        onPressed: () => Platform.isAndroid
            ? displayDialogAndroid(context)
            : displayDialogIOS(context),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context); //para volver atras
        },
        child: const Icon(Icons.close),
      ),
    );
  }
}
