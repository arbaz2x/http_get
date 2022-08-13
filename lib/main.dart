import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final url ="https://jsonplaceholder.typicode.com/posts";
  var _postJson =[];

  void fetchPost() async{
    try {
      final response = await get(Uri.parse(url));
     final jsonData= jsonDecode(response.body) as List;

     setState(() {
       _postJson =jsonData;
     });

    } catch(err) {}

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPost();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView.builder(
            itemCount: _postJson.length,
            itemBuilder: (context,i){
             final post =_postJson[i];
              return Text("Title : ${post["title"]} \n Body :${post["body"]}\n\n");
            }
        ),
      ),
    );
  }
}
