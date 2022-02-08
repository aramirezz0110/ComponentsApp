import 'package:flutter/material.dart';
import 'package:flutter_components/router/app_routes.dart';
import 'package:flutter_components/screens/home_screen.dart';
import 'package:flutter_components/theme/app_theme.dart';
import 'screens/screens.dart'; //archivo en el cual se encuentran todas la referencias

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      //home: Listview1_Screen() //llamado a la clase
      //home: Listview2_Screen(),
      initialRoute: AppRoutes
          .initialRoute, //otra forma de mostrar la primera ruta por defecto, tiene que ser con una ruta definida
      routes: AppRoutes
          .getAppRoutes(), //referencia al archivo que contiene todas las rutas
      //para ruta dinamica
      onGenerateRoute: AppRoutes.onGenerateRoute,
      //definicion del tema
      //theme: ThemeData.dark(), //tema oscuro
      //para sobreescribir las propiedades del tema
      theme: AppTheme.lightTheme,
    );
  }
}
