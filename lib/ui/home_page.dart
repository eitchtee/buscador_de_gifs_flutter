import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  String _search;
  int _offset = 0;
  
  Future<Map> _getGifs() async {
    http.Response response;
    
    if (_search == null)
      response = await http.get("https://api.giphy.com/v1/gifs/trending?api_key=tuHI1iaQrWj1iZYnt8LlIr3xSWPeRWPs&limit=20&rating=g");
    else
      response = await http.get("https://api.giphy.com/v1/gifs/search?api_key=tuHI1iaQrWj1iZYnt8LlIr3xSWPeRWPs&q=$_search&limit=20&offset=$_offset&rating=g&lang=pt");

    return json.decode(response.body);
  }


  @override
  void initState() {
    super.initState();

    _getGifs().then((value) {print(value);});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.network("https://developers.giphy.com/static/img/dev-logo-lg.7404c00322a8.gif"),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(10.0),
          child: TextField(
            decoration: InputDecoration(
              labelText: "Pesquise por um gif",
              labelStyle: TextStyle(color: Colors.white),
              border: OutlineInputBorder(),
            ),
            style: TextStyle(color: Colors.white, fontSize: 18.0),
            textAlign: TextAlign.center,
          ),)
        ],
      ),
    );
  }
}
