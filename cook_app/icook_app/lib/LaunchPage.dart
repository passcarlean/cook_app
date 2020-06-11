import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icookapp/FadeAnimation.dart';
import 'package:icookapp/HomePage.dart';
import 'package:page_transition/page_transition.dart';

class LaunchPage extends StatefulWidget {
  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> with TickerProviderStateMixin{
  AnimationController _animationController;
  Animation<double> _animation;

  bool _textVisible = true;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 100)
    );

    _animation = Tween<double>(
        begin: 1.0,
        end: 25.0
    ).animate(_animationController);

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  void _onTap() {
    setState(() {
      _textVisible = false;
    });

    _animationController.forward().then((f) =>
        Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: HomePage()))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/icook.png'),

//                fit: BoxFit.fitHeight
            ),
//                shape: BoxShape.rectangle,
//            color: Colors.black38


        ),

        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(.9),
                    Colors.white.withOpacity(.8),
                    Colors.white.withOpacity(.2)

                  ]
              )
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[

                FadeAnimation(1.2,
                  ScaleTransition(
                      scale: _animation,
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.yellow,
                                    Colors.orange
                                  ]
                              )
                          ),
                          child: AnimatedOpacity(
                            opacity: _textVisible ? 1.0 : 0.0,
                            duration: Duration(milliseconds: 50),
                            child: MaterialButton(
                              onPressed: () => _onTap(),
                              minWidth: double.infinity,
                              child: Text(" Nigerian Recipes", style: TextStyle(color: Colors.white),),
                            ),
                          )
                      )),
                ),
                SizedBox(height: 30,),
                FadeAnimation(1.4,
                    AnimatedOpacity(
                      opacity: _textVisible ? 1.0 : 0.0,
                      duration: Duration(milliseconds: 50),

                    )),
                SizedBox(height: 30,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}