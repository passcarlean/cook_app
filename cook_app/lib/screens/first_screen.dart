import 'dart:convert';
import 'dart:async';

import 'package:cookapp/api/model.dart';
import 'package:cookapp/navigation/bottomnav.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:transparent_image/transparent_image.dart';

class FirstScreen extends StatefulWidget {
  FirstScreen({Key key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  //COMMENTED OUT THIS BLOCK OF CODE AS I AWAIT OUR JSON DATA TO BE READY

  Future<List<MainData>> fetchInfo() async {
    var apiUrl =
        'https://hngi.github.io/Team-Fierce-JSON/recipearrays.json'; //Json url goes here
    var result = await http.get(apiUrl);
    var usersJson = json.decode(result.body);

    List<MainData> mainData = [];

    for (var user in usersJson) {
      MainData recipe = MainData(
        user['id'],
        user['state'],
        user['name'],
        user['description'],
        user['ingredients'],
        user['steps'],
        user['imageLink'],
        user['videoLink'],
      );
      mainData.add(recipe);
    }
    return mainData;
  }

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {Navigator.popUntil(context, ModalRoute.withName('/screen1'));},
            child: Icon(Icons.arrow_back_ios),
          ),
          actions: <Widget>[
            SizedBox(height: 5.0),
          ],
          title: Padding(
            padding: const EdgeInsets.only(top: 9.0),
            child: Text(
              'Food Menu',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 22,
              ),
            ),
          ),
          elevation: 5,
          centerTitle: true,
          backgroundColor: Color(0xffe67e22).withOpacity(.8),
        ),
        bottomNavigationBar: BottomNav(),
        body: Container(
            child: FutureBuilder(
          future: fetchInfo(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data != null) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10.0, top: 10.0, bottom: 5.0),
                    child: SingleChildScrollView(
                      child: Stack(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                height: query.size.height * 0.3,
                                width: query.size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.0)),
                                child: FadeInImage.memoryNetwork(
                                  placeholder: kTransparentImage,
                                  image: snapshot.data[index].imageLink,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 5),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.amber.withOpacity(.25),
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(25),
                                      bottomLeft: Radius.circular(25)),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailsScreen(
                                              snapshot.data[index])),
                                    );
                                  },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            snapshot.data[index].name,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w800,
                                                color: Colors.black),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              Text(
                                                'Details',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                              ),
                                              SizedBox(width: 3),
                                              Icon(Icons.arrow_forward_ios),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Text(
                                        snapshot.data[index].description,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
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
      ),
    );
  }

  void moveToHome() {
    Navigator.popUntil(context, ModalRoute.withName('/screen1'));
  }
}

class DetailsScreen extends StatelessWidget {
  final MainData data;

  DetailsScreen(this.data);

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.favorite_border,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
        elevation: 5,
        title: Text(
          data.name,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xffe67e22).withOpacity(.8),
      ),
      resizeToAvoidBottomPadding: true,
      bottomNavigationBar: BottomNav(),
      body: Column(
        children: <Widget>[
          Container(
            height: query.size.height * 0.35,
            width: query.size.width,
            decoration: BoxDecoration(
              color: Colors.amber,
            ),
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: data.imageLink,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 1.0),
          Container(
            height: query.size.height * 0.34,
            decoration: BoxDecoration(),
            child: ListView(
              physics: AlwaysScrollableScrollPhysics(),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 2.0, bottom: 2.0),
                  child: Column(
                    children: <Widget>[
                      Details(
                        title: 'Description',
                        description: data.description,
                      ),
                      SizedBox(height: 4.0),
                      Details(
                        title: 'Ingredients',
                        description: data.ingredients,
                      ),
                      SizedBox(height: 4.0),
                      Details(
                        title: 'Cooking Method',
                        description: data.steps,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 1,
          )
        ],
      ),
    );
  }
}

class Details extends StatelessWidget {
  final String description;
  final String title;

  const Details({
    Key key,
    this.description,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amber.withOpacity(.06),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.amber.withOpacity(.12),
                  border: Border.all(
                    color: Colors.amber.withOpacity(.35),
                    width: 0.1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 2.0),
            Row(
              children: <Widget>[
                Flexible(
                  child: Text(
                    description,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15.3,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

