import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String _url = "https://blockchain.info/ticker";
  String _valor = "Veja quanto tá o bitcoin em reais";

  void _verificarMoeda() async{
    http.Response response = await http.get(_url);
    Map<String, dynamic> obj = json.decode(response.body);

    setState(() {
      _valor = "R\$ ${obj['BRL']["buy"]}";
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Preço do Bitcoin"),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("imagens/bitcoin.png"),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text(_valor,
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.w300)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: RaisedButton(
                color: Colors.orange,
                textColor: Colors.white,
                padding: EdgeInsets.only(left: 25, right: 25, top: 15, bottom: 15),
                child: Text("Atualizar",
                style: TextStyle(
                  fontSize: 16,

                ),),
                onPressed: _verificarMoeda,
              ),
            )
          ],
        ),
      ),
    );
  }
}
