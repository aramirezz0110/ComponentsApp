import 'package:flutter/material.dart';
import 'package:flutter_components/models/models.dart';
import 'package:flutter_components/screens/screens.dart';

class AppRoutes {
  //datos definidos como estaticos pueden ser empleados en cualquier parte de la aplicacion
  static const initialRoute = '/home';
  //referencia a models
  static final menuOptions = <MenuOption>[
    // MenuOption(
    //   route: "/home",
    //   icon: Icons.home,
    //   name: "Home screen",
    //   screen: HomeScreen(),
    // ),
    MenuOption(
      route: "/listview1",
      icon: Icons.list,
      name: "List View 1",
      screen: Listview1_Screen(),
    ),
    MenuOption(
      route: "/listview2",
      icon: Icons.list_alt_outlined,
      name: "List View 2",
      screen: Listview2_Screen(),
    ),
    MenuOption(
      route: "/alert",
      icon: Icons.notifications,
      name: "Alert Screen",
      screen: AlertScreen(),
    ),
    MenuOption(
      route: "/card",
      icon: Icons.card_giftcard,
      name: "Card Screen",
      screen: CardScreen(),
    ),
    MenuOption(
        route: "/avatar",
        icon: Icons.supervised_user_circle_outlined,
        name: "Circle avatar",
        screen: AvatarScreen()),
    MenuOption(
        route: "/animated",
        icon: Icons.play_circle_outline_rounded,
        name: "Animated container",
        screen: AnimatedScreen()),
    MenuOption(
      route: "/inputs",
      icon: Icons.input_outlined,
      name: "Inputs Screen",
      screen: InputsScreen(),
    ),
    MenuOption(
      route: "/slider",
      icon: Icons.slideshow_outlined,
      name: "Slider Screen",
      screen: SliderScreen(),
    ),
    MenuOption(
        route: "/listviewbuilder",
        icon: Icons.list_outlined,
        name: "Infinite Scroll and pull refresh",
        screen: ListViewBuilderScreen()),
  ];
  //llenado de la ruta desde la lista de modelos
  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({"/home": (BuildContext context) => HomeScreen()});
    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }
    return appRoutes;
  }

  // //referencias a todas las rutas de la aplicacion
  // static Map<String, Widget Function(BuildContext)> routes = {
  //   //"nombreReferencia" : (BuildContext context)=> NombreClaseScreeen()
  //   "/home": (BuildContext context) => HomeScreen(),
  //   "/listview1": (BuildContext context) => Listview1_Screen(),
  //   "/listview2": (BuildContext context) => Listview2_Screen(),
  //   "/alert": (BuildContext context) => AlertScreen(),
  //   "/card": (BuildContext context) => CardScreen(),
  // };
  //para la ruta dinamica o por defecto
  static Route<dynamic> onGenerateRoute(RouteSettings settings) =>
      MaterialPageRoute(builder: (context) => Listview1_Screen());
}
