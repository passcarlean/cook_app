import 'dart:convert';
import 'dart:async';

import 'package:cookapp/api/model.dart';
import 'package:cookapp/navigation/bottomnav.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class FirstScreen extends StatefulWidget {
  FirstScreen({Key key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  //COMMENTED OUT THIS BLOCK OF CODE AS I AWAIT OUR JSON DATA TO BE READY

  Future<List<MainData>> fetchInfo() async {
      var apiUrl = 'https://hngi.github.io/Team-Fierce-JSON/recipes.json'; //Json url goes here
      var result = await http.get(apiUrl);
      var usersJson = json.decode(result.body);

      List<MainData> mainData = [];

      for (var user in usersJson) {
        MainData recipe = MainData(user['state'],
            user['name'], user['id'], user['description'],
            user['ingredients'], user['imageLink'], user['videoLink'],
            user['steps']);
        mainData.add(recipe);
      }
      return mainData;
    }

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          SizedBox(height: 5.0),
        ],
        title: Padding(
          padding: const EdgeInsets.only(top: 9.0),
          child: Text(
            'Food Menu',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
        elevation: 5,
        centerTitle: true,
        backgroundColor: Colors.amber.withOpacity(.3),
      ),
      bottomNavigationBar: BottomNav(),
      body: Container(
          child: FutureBuilder(
            future: fetchInfo(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data != null) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data[index].name),
                    );
                  },
                  itemCount: snapshot.data == null ? 0 : snapshot.data.length,
                );
              } else {
                return Center(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(
                          backgroundColor: Colors.amber,
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Loading Data...',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          )),
    );
  }
}

