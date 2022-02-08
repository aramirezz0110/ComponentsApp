//LISTVIEW CON ELEMENTOS ESTATICOS

import 'package:flutter/material.dart';

class Listview1_Screen extends StatelessWidget {
  //lista estatica
  final List<String> options = [
    "Megaman",
    "Metal Gear",
    "Super Smash",
    "Final Fantasy"
  ];
  Listview1_Screen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List view 1"),
      ),
      body: ListView(
        children: [
          // ListTile(
          //   leading: Icon(Icons.lock_clock_sharp),
          //   title: Text("Adios mundo"),
          //   onTap: () {},
          //)

          //MOSTRAR LOS ELEMENTOS DE LA LISTA ESTATICA
          ...options
              .map((game) => ListTile(
                    title: Text(game),
                    trailing: Icon(Icons.arrow_forward_ios_outlined),
                    onTap: () {},
                  ))
              .toList()
        ],
      ),
    );
  }
}
