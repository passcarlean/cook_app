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

  Future<dynamic> fetchInfo() async {
      var apiUrl = 'https://hngi.github.io/Team-Fierce-JSON/recipes.json'; //Json url goes here
      var result = await http.get(apiUrl);

      var users = List<MainData>();

      if (result.statusCode == 200) {
        var usersJson = json.decode(result.body);
        for (var user in usersJson) {
          users.add(MainData.fromJson(user));
        }
      }
      return users;
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
              if (snapshot != null) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          children: <Widget>[
                            Image.asset('assets/images/Egusi.jpg'),
                            Container(
                            ),
                          ],
                        ),
                      ),
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
                          backgroundColor: Colors.green,
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

class MainClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 78);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
   return false;
  }
}