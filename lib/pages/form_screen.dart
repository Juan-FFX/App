import 'package:flutter/material.dart';
import 'package:sistemas/providers/form_provider.dart';
import 'package:sistemas/themes/colors_list.dart';
import 'package:sistemas/ui/input_decorations.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          alignment: Alignment.bottomLeft,
          color: Colors.black,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => const HomePage()));
          },
        ),
        title: const Text(
          "Admin \nSistemas, SSC  ",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 19.0),
        ),
        centerTitle: true,
        backgroundColor: ColorList.backgroundBody,
      ),
      body: SafeArea(
        child: SingleChildScrollView(child: _formPage(context)),
      ),
    );
  }
}

Widget _formPage(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const SizedBox(height: 70),
      _body(),
    ],
  );
}

Widget _body() {
  return Column(
    mainAxisSize: MainAxisSize.max,
    children: [
      Padding(
        padding: const EdgeInsets.only(
          left: 30.0,
          right: 30.0,
        ),
        child: ChangeNotifierProvider(
            create: (_) => LoginFromProvider(), child: _Form()),
      ),
    ],
  );
}

class _Form extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final SForm = Provider.of<LoginFromProvider>(context);

    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: 50), // margen para correo y contra
      child: Form(
        key: SForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextFormField(
            autocorrect: false,
            decoration: InputDecorations.authInputDecorations(
              hintText: '',
              labelText: 'Nombre del sistema',
            ),
            validator: (value) {
              if (value != null && value.length <= 1) {
                return 'Campo sin rellenar';
              }
            },
          ),
          const SizedBox(height: 20),
          TextField(
            maxLines: 4,
            decoration: const InputDecoration(
                hintText: 'Descripción', border: OutlineInputBorder()),
            onChanged: (_) {},
          ),
          const SizedBox(height: 20),
          DropdownButton<String>(
            hint: const Text('Situacion'),
            items: <String>['Produccion', 'Postproduccion ', 'Desarrollo']
                .map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (_) {},
          ),
          const SizedBox(height: 20),
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecorations(
              hintText: '',
              labelText: 'Servidor',
            ),
            validator: (value) {
              if (value != null && value.length <= 1) {
                return 'Campo sin rellenar';
              }
            },
          ),
          const SizedBox(height: 20),
          DropdownButton<String>(
            hint: const Text('Lenguaje'),
            items: <String>['Vue', 'Python', 'Dart'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (_) {},
          ),
          const SizedBox(height: 20),
          TextFormField(
            autocorrect: false,
            decoration: InputDecorations.authInputDecorations(
              hintText: '',
              labelText: 'Base_id',
            ),
            validator: (value) {
              if (value != null && value.length <= 1) {
                return 'Campo sin rellenar';
              }
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            autocorrect: false,
            decoration: InputDecorations.authInputDecorations(
              hintText: '',
              labelText: 'Dominio',
            ),
            validator: (value) {
              if (value != null && value.length <= 1) {
                return 'Campo sin rellenar';
              }
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            autocorrect: false,
            decoration: InputDecorations.authInputDecorations(
              hintText: '',
              labelText: 'Path',
            ),
            validator: (value) {
              if (value != null && value.length <= 1) {
                return 'Campo sin rellenar';
              }
            },
          ),
          const SizedBox(height: 40),
          MaterialButton(
              color: const Color.fromARGB(255, 22, 146, 177),
              child: const Text(
                'Guardar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: (() {
                {
                  if (!SForm.isValidForm()) return;
                  Navigator.pushReplacementNamed(context, 'homePage');
                }
              })),
          const SizedBox(height: 50),
        ]),
      ),
    );
  }
}
