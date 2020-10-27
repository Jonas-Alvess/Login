import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:list2/pages/AdminPage.dart';
import 'package:list2/pages/MemberPage.dart';
import 'package:list2/register.dart';
import 'Home.dart';


void main() => runApp(new MyApp());

String username='';
String id_usuario='';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      theme: buildTheme(),
      debugShowCheckedModeBanner: false,
      title: 'Login Localhost',
      home: new MyHomePage(),
      routes: <String,WidgetBuilder>{
        '/AdminPage': (BuildContext context)=> new AdminPage(username: username, id_usuario:id_usuario),
        '/Home': (BuildContext context)=> new Home(username: username, id_usuario:id_usuario),
        '/MemberPage': (BuildContext context)=> new MemberPage(username: username, id_usuario:id_usuario),

      },
    );
  }

  ThemeData buildTheme() {
    final ThemeData base = ThemeData();
    return base.copyWith(
      hintColor: Colors.white,
      primaryColor: Colors.yellow[500],
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          color: Colors.blue,
        ),
        labelStyle: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController user=new TextEditingController();
  TextEditingController pass=new TextEditingController();

  String msg='';


  Future<List> _login() async {
    final response = await http.post("http://192.168.1.146/logado/login.php", body: {
      "username": user.text,
      "password": pass.text,
      //"id":id,
    });

    var datauser = json.decode(response.body);

    if(datauser.length==0){
      setState(() {
        msg="Login Fail";
      });
    }else{
      if(datauser[0]['level']=='admin'){
        Navigator.pushReplacementNamed(context, '/Home');
      }else if(datauser[0]['level']=='member'){
        Navigator.pushReplacementNamed(context, '/MemberPage');
      }

      setState(() {
        username= datauser[0]['username'];
        id_usuario= datauser[0]['id_usuario'];
      });

    }

    return datauser;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.red[900],

        //appBar: AppBar(title: Text("Login"),),

        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 70, left: 30, right: 30),
          child: Column(
            children: <Widget>[
              /*Text('Login', style: new TextStyle(
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 2.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
//                      Shadow(
//                        offset: Offset(10.0, 10.0),
//                        blurRadius: 2.0,
//                        color: Color.fromARGB(125, 0, 0, 255),
//                      ),
                  ],
                  color: hexToColor("#F2A03D"), fontSize: 25.0),),*/

              /*Container(
                height: 200,
                width: 200,
                child: CircleAvatar(
                  backgroundImage: AssetImage("imagens/ss.png"

                  ),
                ),
              ),*/

              /*Image.asset("imagens/ss.png",
                  ),*/

              new Padding(padding: EdgeInsets.only(top: 50.0)),


              new TextFormField(
                controller: user,
                decoration: new InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(color: Colors.white)
                  ),
                  labelText: "Usuário",
                  prefixIcon: const Icon(Icons.person, color: Colors.white,),
                  fillColor: Colors.black,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(
                        color: Colors.white
                    ),
                  ),
                  //fillColor: Colors.green
                ),

                keyboardType: TextInputType.emailAddress,
                style: new TextStyle(
                  fontFamily: "Poppins",
                  color: Colors.black,
                ),
              ),


              Padding(
                padding: EdgeInsets.all(10.0),
//                child: Text('Hello World!'),
              ),

              new TextFormField(
                controller: pass,
                obscureText: true,
                decoration: new InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(color: Colors.white)
                  ),
                  labelText: "Senha",
                  prefixIcon: const Icon(Icons.remove_red_eye , color: Colors.white,),
                  fillColor: Colors.black,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(
                    ),
                  ),
                  //fillColor: Colors.green
                ),

                style: new TextStyle(
                  fontFamily: "Poppins",
                  color: Colors.black,
                ),
              ),

              Padding(
                padding: EdgeInsets.all(12.0),
//                child: Text('Hello World!'),
              ),

              RaisedButton(

                child: Text("Login",style: TextStyle(color: Colors.white, fontSize: 20)
                ),
                color: Colors.yellow[800],
                padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32)
                ),
                onPressed: (){
                  _login();
                },
              ),

              SizedBox(
                height: 3,
              ),

              RaisedButton(

                child: Text("Cadastrar", style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                color: Colors.yellow[800],
                padding: EdgeInsets.fromLTRB(25, 5, 25, 5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32)
                ),
                onPressed: () {
                  Navigator.push(
                    context,

                    MaterialPageRoute(
                      builder: (context) => Register(),

                    ),
                  );
                },
              ),

              Text(msg,style: TextStyle(fontSize: 20.0,color: Colors.red),)


            ],
          ),
        )
    );
  }


  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

}