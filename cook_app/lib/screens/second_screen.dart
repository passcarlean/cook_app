import 'package:cookapp/navigation/bottomnav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  SecondScreen({Key key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);

    return Scaffold(
      bottomNavigationBar: BottomNav(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image.asset('assets/images/Egusi.jpg',
                fit: BoxFit.cover,
                ),
                Positioned(
                  top: 430,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    height: query.size.height * 0.30,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.70),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25), topLeft: Radius.circular(25)
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Flexible(
                            child: Text('Melon Soup',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Colors.black
                            ),)),
                        Flexible(
                            child: Text('Melon Soup Description Here, Egusi '
                                'seeds are melon seeds that grow primarily in'
                                ' the warm regions of Africa. It is composed of'
                                ' about 50% healthy fats and 30% protein, which'
                                ' makes it perfect for a low carb diet.',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),)),
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text('More Details',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                ),),
                              SizedBox(width: 5),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  child: InkWell(
                    onTap: () {},
                    child: ClipOval(
                      child: Container(
                        height: 50,
                        width: 50,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Color(0xffe67e22),
                        ),
                        child: Icon(Icons.arrow_back_ios),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  right: 20,
                  child: InkWell(
                    onTap: () {},
                    child: ClipOval(
                      child: Container(
                        height: 50,
                        width: 50,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Color(0xffe67e22),
                        ),
                        child: Icon(Icons.favorite_border),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
