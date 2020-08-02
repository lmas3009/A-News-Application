import 'package:News_application/Main_Screen/nav.dart';
import 'package:flutter/material.dart';

class Phoneauth extends StatefulWidget {
  Phoneauth({Key key}) : super(key: key);

  @override
  _PhoneauthState createState() => _PhoneauthState();
}

class _PhoneauthState extends State<Phoneauth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("A News Application",style: TextStyle(fontSize: 30,),),
              Container(margin: const EdgeInsets.only(top:50)),
              Container(margin: const EdgeInsets.only(top:30)),
              SizedBox(height: 100),
              Container(
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green,
                boxShadow: [
                BoxShadow(
                color: const Color(0xff000000),
                offset: Offset(0, 3),
                blurRadius: 6,
                )
                ]
                ),
                child:OutlineButton(           
                splashColor: Colors.black,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Navbar(),));
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                highlightElevation: 0,
                borderSide: BorderSide(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.phone ,color: Colors.white,),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                          child: Text(
                          'Sign in with Phone',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            backgroundColor: Colors.green,
                          ),
                        ),
                        )
                    ],
                  ),
                ),
               )
              )
            ],
          ),
        ),
      )
    );
  }
}