import 'dart:convert';

import 'package:app/function.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String url = '';
  var data;
  String output = 'Initial Output';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple Flask App')),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextField(
              onChanged: (value) {
                // url = 'http://10.42.0.1:5000/api?query=' + value.toString();
                // url = 'http://10.42.0.1:5000/my_Get';
                url = 'http://10.42.0.1:5000/my_Post';
              },
            ),
            TextButton(
                onPressed: () async {
                  data = await postData(url);
                  var decoded = jsonDecode(data);
                  setState(() {
                    // output = decoded['output'];
                    output = decoded['value'];
                  });
                },
                child: Text(
                  'Fetch ASCII Value',
                  style: TextStyle(fontSize: 20),
                )),
            Text(
              output,
              style: TextStyle(fontSize: 40, color: Colors.green),
            )
          ]),
        ),
      ),
    );
  }
}
