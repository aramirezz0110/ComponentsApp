import 'package:flutter/material.dart';
import 'package:flutter_components/widgets/widgets.dart';

class InputsScreen extends StatelessWidget {
  const InputsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //para acceder a form, sirve para disparar algun estado
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
    final Map<String, String> formValues = {
      'first_name': 'Desmond',
      'last_name': 'Miles',
      'email': 'desmondm@gmail.com',
      'password': '123456',
      'role': 'admin',
    };
    return Scaffold(
      appBar: AppBar(
        title: Text("Inputs y Forms"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          //
          child: Form(
            key: myFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomInputField(
                    labelText: "Nombre",
                    hintText: "Nombre del usuario",
                    formValues: formValues,
                    formProperty: 'first_name'),
                SizedBox(height: 30),
                CustomInputField(
                    labelText: "Apellido",
                    hintText: "Apellido del usuario",
                    formValues: formValues,
                    formProperty: 'last_name'),
                SizedBox(height: 30),
                CustomInputField(
                    labelText: "Email",
                    hintText: "usuario@gmail.com",
                    textInputType: TextInputType.emailAddress,
                    formValues: formValues,
                    formProperty: 'email'),
                SizedBox(height: 30),
                CustomInputField(
                    labelText: "Contraseña",
                    hintText: "Contraseña",
                    obscureText: true,
                    formValues: formValues,
                    formProperty: 'password'),
                SizedBox(height: 30),
                //DROPDOWN
                DropdownButtonFormField<String>(
                  items: const [
                    DropdownMenuItem(value: 'admin', child: Text("Admin")),
                    DropdownMenuItem(value: 'visitor', child: Text("Visitor"))
                  ],
                  onChanged: (value) {
                    formValues['role'] = value;
                    print(value);
                  },
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    //para disparar las validaciones de todos los elementos del form
                    if (!myFormKey.currentState.validate()) {
                      //para dejar de mostrar el teclado
                      FocusScope.of(context).requestFocus(FocusNode());
                      print("Formulario no valido");
                      return;
                    }
                    print(formValues);
                  },
                  child: const SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        "Guardar",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
