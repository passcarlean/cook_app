import 'package:cookapp/navigation/bottomnav.dart';
import 'package:flutter/material.dart';



class FirstScreen extends StatefulWidget {
  FirstScreen({Key key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  //COMMENTED OUT THIS BLOCK OF CODE AS I AWAIT OUR JSON DATA TO BE READY

  //Future<dynamic> fetchInfo() async {
  //    var apiUrl = ''; //Json url goes here
  //    var result = await http.get(apiUrl);
  //
  //    var users = List<MainData>();
  //
  //    if (result.statusCode == 200) {
  //      var usersJson = json.decode(result.body);
  //      for (var user in usersJson) {
  //        users.add(MainData.fromJson(user));
  //      }
  //    }
  //    return users;
  //  }

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);

    return Scaffold(
      bottomNavigationBar: BottomNav(),
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: MainClipper(),
            child: Container(     //To be wrapped with future builder later
              height: query.size.height * 0.45,
              color: Colors.amber,

            ),
          ),
        ],
      ),
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