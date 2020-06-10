import 'package:cookapp/navigation/bottomnav.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Full Details'),
          centerTitle: true,
          backgroundColor: Color(0xffe67e22).withOpacity(.5),
        ),
        resizeToAvoidBottomPadding: true,
        bottomNavigationBar: BottomNav(),
        body: Column(
          children: <Widget>[
            Container(
              height: query.size.height * 0.4,
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
            ),
            SizedBox(height: 3.0),
            Container(
              height: query.size.height * 0.33,
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: ListView(
                physics: AlwaysScrollableScrollPhysics(),
                children: <Widget>[
                  Container(height: 500, color: Colors.black,),
                  Container(height: 300, color: Colors.red,),
                ],
              ),
            ),
            SizedBox(height: 0.5,)
          ],
        ),
      ),
    );
  }
}
