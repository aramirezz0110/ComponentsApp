import 'package:flutter/material.dart';
import 'package:flutter_components/models/models.dart';
import 'package:flutter_components/router/app_routes.dart';
import 'package:flutter_components/screens/listview1_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);
  //List<MenuOption> menu = AppRoutes.menuOptions;
  @override
  Widget build(BuildContext context) {
    final List<MenuOption> menuOptions = AppRoutes.menuOptions;
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Componentes en Flutter",
        )),
        elevation: 0, //sombra de elevacion
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          title: Text(menuOptions[index].name),
          leading: Icon(menuOptions[index].icon),
          onTap: () {
            //navegar con datos de tipo 'Route'
            // Route route =
            //     MaterialPageRoute(builder: (context) => Listview1_Screen());
            // Navigator.push(context, route);

            //navegar utilizando nombres de referencia
            Navigator.pushNamed(context, menuOptions[index].route);
          },
        ),
        separatorBuilder: (_, __) => Divider(),
        itemCount: menuOptions.length,
      ),
    );
  }
}
