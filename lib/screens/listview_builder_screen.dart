import 'package:flutter/material.dart';
import 'package:flutter_components/theme/app_theme.dart';

class ListViewBuilderScreen extends StatefulWidget {
  const ListViewBuilderScreen({Key key}) : super(key: key);

  @override
  State<ListViewBuilderScreen> createState() => _ListViewBuilderScreenState();
}

class _ListViewBuilderScreenState extends State<ListViewBuilderScreen> {
  final List<int> imagesIds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  //para escuchar los cambios en la lista se requiere de un controlador
  final ScrollController scrollController = ScrollController();
  bool isLoading = false; //flag de la carga

  @override
  void initState() {
    super.initState();
    //se añade un listener par saber su estado actual
    scrollController.addListener(() {
      //print('${scrollController.position.pixels}, ${scrollController.position.maxScrollExtent}');
      double currentPos = scrollController.position.pixels;
      double limit = scrollController.position.maxScrollExtent;
      if (currentPos + 500 >= limit) {
        //add5();
        fetchData();
      }
    });
  }

  //para añadir mas elementos al final
  void add5() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
    setState(() {});
  }

  //metodo de espera para los datos
  Future fetchData() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});
    await Future.delayed(Duration(milliseconds: 3000)); //espera de 3 seg
    add5();
    isLoading = false;
    setState(() {});
    scrollController.animateTo(scrollController.position.pixels + 120,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn);
  }

  //funcion para el RefreshIndicator
  Future<void> onRefresh() async {
    await Future.delayed(Duration(milliseconds: 2000)); //espera de 3 seg
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    add5();
  }

  @override
  Widget build(BuildContext context) {
    //para obtener el tamaño de pantalla del dispositivo
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black, //color de fondo
      body: Stack(
        children: [
          RefreshIndicator(
            //Usign Future<void> function
            onRefresh: onRefresh,
            color: AppTheme.primary,
            child: ListView.builder(
                //para habilitar la animacion del espacio extra al principio y final del listview
                physics: const BouncingScrollPhysics(),
                controller: scrollController,
                //cantidad de elementos
                itemCount: imagesIds.length,
                //widget a construir
                itemBuilder: (BuildContext context, int index) {
                  return FadeInImage(
                    width: double.infinity,
                    height: 300,
                    //para el relleno de la imagen
                    fit: BoxFit.cover,
                    placeholder: AssetImage("assets/images/jar-loading.gif"),
                    //image: NetworkImage("https://picsum.photos/id/237/200/300")//url api por defecto
                    image: NetworkImage(
                        "https://picsum.photos/500/300?image=${imagesIds[index]}"),
                  ); //
                }),
          ),
          if (isLoading)
            Positioned(
              bottom: 40,
              //'30' porque es la mitad del ancho del widget interno
              left: size.width * 0.5 - 30,
              child: _LoadingIcon(),
            )
        ],
      ),
    );
  }
}

class _LoadingIcon extends StatelessWidget {
  const _LoadingIcon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        shape: BoxShape.circle, //para bordes redondeados
      ),
      child: CircularProgressIndicator(
        color: AppTheme.primary,
      ),
    );
  }
}
