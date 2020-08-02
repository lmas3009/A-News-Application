import 'package:flutter/material.dart';

bool isSwitched = false;
bool isSwitched1 = false;
bool isSwitched2 = false;

class Menu extends StatefulWidget {
  Menu({Key key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 11,
                    color: Colors.black
                  )
                ]
              ),
              alignment: Alignment.center,
              child: Container(
                height: 100,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8,
                    color: Colors.black
                  )
                ]
                ),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Phone Number",textAlign: TextAlign.left,),
                      Container(margin: const EdgeInsets.only(top: 15),),
                      Text("+91 0000 0000 00",textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      Container(margin: const EdgeInsets.only(top: 5),),
                      Divider(
                        height: 2,
                        color: Colors.grey,
                      ),
                     
                    ],
                  )
                ),
              ),
            ),
               Center(
               child:Container(
                 margin: const EdgeInsets.only(top: 20),
                 height: 50,
                 width: 300,
                 decoration: BoxDecoration(
                   color: Colors.grey[200],
                   borderRadius: BorderRadius.circular(20)
                 ),
                 child: Center(
                   child: Text("Notifications",style: TextStyle(color: Colors.grey[500],fontSize: 20),),
                 ),
               )
               ),
               Padding(
                 padding: const EdgeInsets.only(left: 20,right: 20),
               child:Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                    Container(margin: const EdgeInsets.only(top: 40),),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                    Text("In-app notification",style: TextStyle(color: Colors.grey,fontSize: 18),),
                     Switch(
                      value: isSwitched,
                      onChanged: (value) {
                        isSwitched = value;
                        setState(() {
                            isSwitched = value;
                            print(isSwitched);
                        });
                      },
                      activeTrackColor: Colors.lightBlue,
                      activeColor: Colors.blue,
                    ),
                    ]),
                    Container(margin: const EdgeInsets.only(top: 5),),
                    Divider(
                      color: Colors.grey,
                      height: 1,
                    ),
                    Container(margin: const EdgeInsets.only(top: 40),),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                    Text("New Trending",style: TextStyle(color: Colors.grey,fontSize: 18),),
                     Switch(
                      value: isSwitched1,
                      onChanged: (value) {
                        isSwitched1 = value;
                        setState(() {
                            isSwitched1 = value;
                            print(isSwitched1);
                        });
                      },
                      activeTrackColor: Colors.lightBlue,
                      activeColor: Colors.blue,
                    ),
                    ]),
                    Container(margin: const EdgeInsets.only(top: 5),),
                    Divider(
                      color: Colors.grey,
                      height: 1,
                    ),
                    Container(margin: const EdgeInsets.only(top: 40),),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                    Text("Wheather notification",style: TextStyle(color: Colors.grey,fontSize: 18),),
                     Switch(
                      value: isSwitched2,
                      onChanged: (value) {
                        isSwitched2 = value;
                        setState(() {
                            isSwitched2 = value;
                            print(isSwitched2);
                        });
                      },
                      activeTrackColor: Colors.lightBlue,
                      activeColor: Colors.blue,
                    ),
                    ]),
                    Container(margin: const EdgeInsets.only(top: 5),),
                    Divider(
                      color: Colors.grey,
                      height: 1,
                    ),
                 ],
               ),
               ),
               
                   
               Center(
               child:Container(
                 margin: const EdgeInsets.only(top: 50),
                 height: 50,
                 width: 300,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10),
                   border: Border.all(width: 1,color: Colors.blue[600])
                 ),
                 child: Center(
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                       Icon(Icons.power_settings_new,color: Colors.blue),
                       Text("LOGOUT",style: TextStyle(color: Colors.blue,fontSize: 20),),
                     ],
                   )
                 ),
               )
               ),
            ],
          ),
        )
    );
  }
}