import 'package:flutter/material.dart';
import 'package:flutter_components/theme/app_theme.dart';

class CustomCardType2 extends StatelessWidget {
  final String imageUrl;
  final String name;
  const CustomCardType2({Key key, @required this.imageUrl, @required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias, //para que el contenido no supere los bordes
      //para personalizar el redondeado de la tarjeta
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      shadowColor:
          AppTheme.primary.withOpacity(0.5), //la intensidad de la sombra
      elevation: 10,
      child: Column(
        children: [
          // const Text("Image"),
          // //Image() aloja la imagen de manera directa
          // const Image(
          //   image: NetworkImage(
          //       "https://photographylife.com/wp-content/uploads/2017/01/What-is-landscape-photography.jpg"),
          // ),
          // const Text("FadeIn Image"),
          // //FadeInImage() aloja la imagen y tambien incluye una imagen de fondo mientras se carga la imagen
          FadeInImage(
            //cargado local
            placeholder: AssetImage("assets/images/jar-loading.gif"),
            //"https://photographylife.com/wp-content/uploads/2017/01/What-is-landscape-photography.jpg"
            image: NetworkImage(imageUrl),
            width: double.infinity,
            height: 230,
            fit: BoxFit.cover, //para que la imagen se adapte al contenedor
            fadeInDuration:
                Duration(milliseconds: 300), //tiempo en que tarda en cargar
          ),
          //en caso de que envien el nombre recien mostrar el widget
          if (name != null)
            Container(
              alignment: AlignmentDirectional.centerEnd,
              padding: const EdgeInsets.only(
                right: 20,
                top: 10,
                bottom: 10,
              ),
              child: Text(name),
            )
        ],
      ),
    );
  }
}
