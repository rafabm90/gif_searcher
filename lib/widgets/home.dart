import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _search = "";

  int _offSet = 0;

  _getGifs() async {
    http.Response response;

    _search == ""
        ? response = await http.get(
            "https://api.giphy.com/v1/gifs/trending?api_key=grCazAeSassSMVQNWF21r2IyJIG2rG1b&limit=20&rating=g")
        : response = await http.get(
            "https://api.giphy.com/v1/gifs/search?api_key=grCazAeSassSMVQNWF21r2IyJIG2rG1b&q=$_search&limit=20&offset=$_offSet&rating=g&lang=en");

    return json.decode(response.body);
  }

  @override
  void initState() {
    _getGifs().then((map){
      print(map);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
