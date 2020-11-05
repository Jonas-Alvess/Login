import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../Home.dart';
import '../main.dart';

class Ocorrencia extends StatefulWidget {

  final String username;
  final String id_usuario;

  const Ocorrencia({Key key, this.id_usuario, this.username}) : super(key: key);

  @override
  _OcorrenciaState createState() => _OcorrenciaState();
}

class _OcorrenciaState extends State<Ocorrencia> {
  TextEditingController local = TextEditingController();
  TextEditingController dia = TextEditingController();
  TextEditingController hora = TextEditingController();
  TextEditingController numero_vitimas = TextEditingController();
  TextEditingController nome_vitimas = TextEditingController();
  TextEditingController telefone = TextEditingController();
  TextEditingController rg = TextEditingController();


  Future register() async {
    var url = "http://jcatechnology.com.br/ss/create.php";
    var response = await http.post(url, body: {
      "id_usuario": widget.id_usuario,
      "local": local.text,
      "dia": dia.text,
      "hora": hora.text,
      "numero_vitimas": numero_vitimas.text,
      "nome_vitimas": nome_vitimas.text,
      "telefone": telefone.text,
      "rg": rg.text,


    });
    var data = json.decode(response.body);
    if (data == "Error") {
      /*FlutterToast(context).showToast(
          child: Text(
            'User allready exit!',
            style: TextStyle(fontSize: 25, color: Colors.red),
          ));*/
      Fluttertoast.showToast(
        msg: "Usuário já existe",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        fontSize: 20.0,
      );
    } else {
      /* FlutterToast(context).showToast(
          child: Text('Registration Successful',
              style: TextStyle(fontSize: 25, color: Colors.green)));*/
      Fluttertoast.showToast(
        msg: "Cadastro realizado com sucesso!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        fontSize: 20.0,
      );
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(),),);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red[900],
      /*appBar: AppBar(
        title: Text(
          'Registrar ocorrência',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),*/
      body: SingleChildScrollView(
        padding:EdgeInsets.fromLTRB(8.0, 20, 8.0, 4.0),
        child: Column(
          children: <Widget>[
            Padding(
              //new Padding(padding: EdgeInsets.only(top: 50.0)),
              padding:EdgeInsets.fromLTRB(8.0, 20, 8.0, 4.0),
              child: Text(
                'Registrar ocorrência',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white),
              ),
            ),

            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Local da Ocorrência',
                  prefixIcon: Icon(Icons.my_location, color: Colors.white,),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                controller: local,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Data da Ocorrência',
                  prefixIcon: Icon(Icons.assignment, color: Colors.white,),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                controller: dia,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Hora da Ocorrência',
                  prefixIcon: Icon(Icons.access_time, color: Colors.white,),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                controller: hora,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(

                decoration: InputDecoration(
                  labelText: 'Número de Vítimas',
                  prefixIcon: Icon(Icons.accessibility_new, color: Colors.white,),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                controller: numero_vitimas,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Nome da Vítima',
                  prefixIcon: Icon(Icons.record_voice_over, color: Colors.white,),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                controller: nome_vitimas,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Telefone da Vítima',
                  prefixIcon: Icon(Icons.phone, color: Colors.white,),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                controller: telefone,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'RG da Vítima',
                  prefixIcon: Icon(Icons.perm_identity, color: Colors.white,),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                controller: rg,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                color: Colors.pink,
                child: Text('Registrar Ocorrência',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                onPressed: () {
                  register();
                },
              ),
            ),
          ],
        ),
      )
        );
  }
}