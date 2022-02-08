import 'package:flutter/material.dart';

class Listview2_Screen extends StatelessWidget {
  //lista estatica
  final List<String> options = [
    "Megaman",
    "Metal Gear",
    "Super Smash",
    "Final Fantasy"
  ];
  Listview2_Screen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: const Text(
              "List view 2",
            ),
          ),
          //elevation: 10,
          //backgroundColor: Colors.indigo,
        ),
        //ListView 'separated' es lo mismo que el 'buider' con la diferencia que se pueden añadir separaciones
        body: ListView.separated(
          //context para indicar del contexto del padre, index es el iterador
          itemBuilder: (context, index) => ListTile(
            title: Text(options[index]),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
            onTap: () {},
          ), //constructor de widgets

          separatorBuilder: (_, __) =>
              Divider(), //constructor de widget de separacion
          itemCount: options.length, //cantidad de elementos
        ));
  }
}
