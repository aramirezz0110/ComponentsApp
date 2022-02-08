import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final String helperText;
  final IconData icon;
  final IconData suffixIcon;
  final TextInputType textInputType;
  final bool obscureText;

  final String formProperty;
  final Map<String, String> formValues;
  const CustomInputField({
    Key key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.icon,
    this.suffixIcon,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    @required this.formProperty,
    @required this.formValues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      autofocus:
          false, // true para que al ingresar a la pantalla se habra el campo
      textCapitalization: TextCapitalization
          .words, //para que las palabras se pongan en mayusculas
      keyboardType: textInputType,
      initialValue: "",
      //funcion que escucha los cambios en el campo
      onChanged: (value) {
        //para guardar los cambios en el mapa
        formValues[formProperty] = value;
        print('$formProperty: $value');
      },
      //para la validacion, si el valor es nulo se devuelve el mensaje de error
      validator: (value) {
        if (value == null) return "Este campo es requerido"; //mensaje de error
        return "Completado correctamente"; //mensaje de que todo esta correcto
      },
      //mostrar los mensajes de error o acierto del input, es una validacion manual
      autovalidateMode: AutovalidateMode.onUserInteraction,

      //local theme
      decoration: InputDecoration(
        hintText: hintText, //placeholder
        labelText: labelText, //title
        helperText: helperText, //campo en la parte de abajo

        //counterText: "3 de 10", //campo en la parte inferior
        //prefixIcon: Icon(Icons.shield_outlined), //icono al principio del texto
        suffixIcon: Icon(suffixIcon), //icono al final del texto
        icon: Icon(icon), //icono antes del texto
        //personalizacion de los bordes del campo
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
      ),
    );
  }
}
