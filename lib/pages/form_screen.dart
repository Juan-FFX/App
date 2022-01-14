import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sistemas/providers/form_provider.dart';
import 'package:sistemas/themes/colors_list.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
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
      const SizedBox(height: 30),
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

class _Form extends StatefulWidget {
  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names

    return Column(children: <Widget>[
      FormBuilder(
        key: _formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(children: <Widget>[
          const Text('Nombre del Sistema',
              style: TextStyle(fontSize: 20, color: Colors.black)),
          FormBuilderTextField(
            name: 'Nombre',
            maxLines: 1,
            obscureText: false,
            readOnly: false,
            decoration:
                const InputDecoration(prefixIcon: Icon(Icons.phonelink)),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(context,
                  errorText: "Este campo no puede estar vacio"),
              FormBuilderValidators.numeric(context),
              FormBuilderValidators.max(context, 70),
            ]),
            // ignore: avoid_print
            onChanged: (value) => print(value),
            valueTransformer: (value) => value.toString().trim(),
          ),
          FormBuilderTextField(
            name: '',
            maxLines: 1,
            obscureText: false,
            readOnly: false,
            decoration:
                const InputDecoration(prefixIcon: Icon(Icons.phonelink)),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(context,
                  errorText: "Este campo no puede estar vacio"),
              FormBuilderValidators.minLength(context, 5),
              FormBuilderValidators.maxLength(context, 30),
            ]),
            // ignore: avoid_print
            onChanged: (value) => print(value),
            valueTransformer: (value) => value.toString().trim(),
          ),
          const SizedBox(height: 20),
          const Text('Lenguajes',
              style: TextStyle(fontSize: 20, color: Colors.black)),
          FormBuilderFilterChip(
            name: 'Lenjuages',
            alignment: WrapAlignment.center,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(0),
              labelText: '',
            ),
            options: const [
              FormBuilderFieldOption(value: 'Test', child: Text('VUE')),
              FormBuilderFieldOption(value: 'Test 1', child: Text('PYTHON')),
              FormBuilderFieldOption(value: 'Test 2', child: Text('DART')),
            ],
          ),
          const SizedBox(height: 50),
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
                _formKey.currentState!.save();
                if (_formKey.currentState!.validate()) {
                  {
                    Navigator.pushReplacementNamed(context, 'homePage');
                  }
                } else {
                  print("validation failed");
                }
              })),
        ]),
      )
    ]);
  }
}
