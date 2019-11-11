import 'package:flutter/material.dart';
import 'package:lazarus/validador.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AgregarColegio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar colegio'),
      ),
      body: ListView(
        children: <Widget>[
          FormAC(),
        ],
      ),
    );
  }
}

class FormAC extends StatefulWidget {
  @override
  _FormACState createState() => _FormACState();
}

class _FormACState extends State<FormAC> with Validar {
  final _agregarColegioKey = GlobalKey<FormState>();
  bool tipo = false;
  String nombre = '';
  String descripcion = '';
  String direccion = '';

  String opcionSeleccionada;

  List<String> _tipos = ['Publica', 'Privada'];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _agregarColegioKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              icon: Icon(Icons.school),
              hintText: 'Ingrese el nombre del colegio',
              labelText: 'Nombre del Colegio',
              fillColor: Colors.red,
            ),
            validator: validarEspacio,
            onSaved: (String value) {
              nombre = value;
            },
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              icon: Icon(Icons.description),
              hintText: 'Agrege una descripción',
              labelText: 'Descripcion',
              fillColor: Colors.red,
            ),
            validator: validarEspacio,
            onSaved: (String value) {
              descripcion = value;
            },
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              icon: Icon(Icons.location_on),
              hintText: 'Agrege una dirección',
              labelText: 'Direccion',
              fillColor: Colors.red,
            ),
            validator: validarEspacio,
            onSaved: (String value) {
              direccion = value;
            },
          ),
          CheckboxListTile(
            onChanged: (f) {
              setState(() {
                tipo = !tipo;
              });
            },
            value: tipo,
            title: tipo
                ? Text(
                    'Privada',
                  )
                : Text(
                    'Publica',
                  ),
            subtitle: Text('Seleccionar para privada'),
          ),
          Padding(
            padding: EdgeInsets.only(top: 50),
            child: RaisedButton(
              child: Text('Agregar Escuela'),
              onPressed: () {
                if (_agregarColegioKey.currentState.validate()) {
                  _agregarColegioKey.currentState.save();
                  final Map<String, dynamic> datos = {
                    'Nombre': nombre,
                    'Tipo': tipo,
                    'Descripcion': descripcion,
                    'Direccion': direccion
                  };

                  http.post(
                      'https://lazarus-10b6e.firebaseio.com/colegios.json',
                      body: json.encode(datos));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
