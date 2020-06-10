import 'package:cookapp/navigation/bottomnav.dart';
import 'package:flutter/material.dart';



class DetailsScreen extends StatefulWidget {
  DetailsScreen({Key key}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Full Details',
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 22,
        ),),
        centerTitle: true,
        backgroundColor: Color(0xffe67e22).withOpacity(.8),
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
          SizedBox(height: 1.0),
          Container(
            height: query.size.height * 0.34,
            decoration: BoxDecoration(
            ),
            child: ListView(
              physics: AlwaysScrollableScrollPhysics(),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 2.0, bottom: 2.0),
                  child: Column(
                    children: <Widget>[
                      Details(
                        title: 'Description',
                        description: 'Test description text',
                      ),
                      SizedBox(height: 4.0),
                      Details(
                        title: 'Ingredients',
                        description: 'Test ingredient text',
                      ),
                      SizedBox(height: 4.0),
                      Details(
                        title: 'Cooking Method',
                        description: 'Test how to cook text',
                      ),
                      SizedBox(height: 3.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 1,)
        ],
      ),
    );
  }
}

class Details extends StatelessWidget {
  final String description;
  final String title;

  const Details({
    Key key, this.description, this.title,
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
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
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
                  child: Text(description,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15.3,
                    ),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
