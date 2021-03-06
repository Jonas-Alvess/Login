import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'listas_imagens_videos/card_video_image.dart';

Color color = Colors.white;
class Home extends StatefulWidget {
  final String username;
  final String id_usuario;

  const Home({Key key, this.username, this.id_usuario}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // declaração
  List<dynamic> listaApi = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: FutureBuilder(
        // FutureBuilder é componente que renderiza de acordo com a resposta da requisição
        future: http.get(
            'http://jcatechnology.com.br/ss/video.php'), // A chamada para api (ou qualquer chamada assincrona)
        // initialData: http.Response,
        builder: (context, snapshot) {
          // Verifica se foi retornadoa alguma informação da requisição, pois mesmo sem ter terminado a requisição o builder é chamado.
          if (snapshot.hasData) {
            // Convertendo os dados da resposta para mapa
            listaApi = jsonDecode(snapshot.data.body);

            return ListView.builder(
              itemCount: listaApi.length,
              itemBuilder: (context, index) {
                return CardVideoImage(
                  media: listaApi[index],
                );
              },
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}