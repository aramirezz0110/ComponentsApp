import 'package:flutter/material.dart';
import 'package:flutter_components/theme/app_theme.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _sliderValue = 100;
  bool _sliderEnable = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sliders & Checks"),
      ),
      body: Column(
        children: [
          //.adaptive para que se adecue a la plataforma
          Slider.adaptive(
            activeColor: AppTheme.primary, //color
            divisions: 10, //puntos de anclaje
            min: 0, //valor minimo
            max: 400, //valor maximo
            value: _sliderValue, //valor del widget
            //para desactivar el slider si el checkbox esta deshabilitado
            onChanged: _sliderEnable
                ? (value) {
                    //actualizar el valor del widget
                    setState(() {
                      _sliderValue = value;
                    });
                  }
                : null,
          ),
          Checkbox(
              value: _sliderEnable,
              //onChanged: null, //to disable the check
              onChanged: (value) {
                setState(() {
                  _sliderEnable = value;
                });
              }),
          Center(child: Text("Checkbox list tile")),
          CheckboxListTile(
            activeColor: AppTheme.primary,
            title: Text("Habilitar Slider"),
            subtitle: Text("Subtitulo"),
            value: _sliderEnable,
            onChanged: (value) => setState(
              () {
                _sliderEnable = value;
              },
            ),
          ),
          Switch(
            activeColor: AppTheme.primary,
            value: _sliderEnable,
            onChanged: (value) => setState(
              () {
                _sliderEnable = value;
              },
            ),
          ),
          Text("Switch list tile"),
          SwitchListTile(
            title: Text("Habilitar slider"),
            subtitle: Text("Subtitulo"),
            activeColor: AppTheme.primary,
            value: _sliderEnable,
            onChanged: (value) => setState(
              () {
                _sliderEnable = value;
              },
            ),
          ),
          const AboutListTile(),
          Expanded(
            child: SingleChildScrollView(
              child: Image(
                image: const NetworkImage(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2b/MCM_2013_-_Batman_%288979342250%29.jpg/1200px-MCM_2013_-_Batman_%288979342250%29.jpg"),
                fit: BoxFit.contain,
                //se obtiene del valor del slider
                width: _sliderValue,
              ),
            ),
          ),
          SizedBox(height: 50)
        ],
      ),
    );
  }
}
