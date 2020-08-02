import 'package:flutter/material.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert' show jsonDecode;
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

class Wheather extends StatefulWidget {
  Wheather( {Key key}) : super(key: key);
  

  @override
  _WheatherState createState() => _WheatherState();
}

Map<String, dynamic> location1,current1;
String imgurl,winddir;

class _WheatherState extends State<Wheather> {

   Future<String> getData() async {
    var response = await http.get(
      Uri.encodeFull("http://api.weatherstack.com/current?access_key=9d08ecd871eadd427c4f59e3389198ed&query=Hyderabad,Telangana"),
      headers: {
        "Accept": "application/json"
      }
    );
    

    this.setState(() {
      Map<String, dynamic> map = jsonDecode(response.body);
       Map<String, dynamic> location = map["location"];
       Map<String, dynamic> currentloc = map["current"];
       location1 = location;
       current1 = currentloc;
    });

    imgurl = current1["weather_icons"].toString().substring(1,current1["weather_icons"].toString().length-1);

    if(current1["wind_dir"].toString()=="W"){
      winddir="West";
    }
    else if(current1["wind_dir"].toString()=="N"){
      winddir="North";
    }
    else if(current1["wind_dir"].toString()=="E"){
      winddir="East";
    }
    else{
      winddir="South";
    }
    
    return "Success!";
  }


  

  @override
  void initState(){
    this.getData();
  }

  
Country _country = Country.IN;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
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
              height: 200,
              width: 320,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black
                  )
                ]
              ),
              child: Padding(padding: const EdgeInsets.only(left:20,right:20),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          Row(
                            children: <Widget>[
                              Text("Temperature: ",style: TextStyle(fontWeight: FontWeight.bold),),
                              Text(current1["temperature"].toString()+"*C"),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text("Wind Speed: ",style: TextStyle(fontWeight: FontWeight.bold),),
                              Text(current1["wind_speed"].toString()+" kmph"),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text("Humidity: ",style: TextStyle(fontWeight: FontWeight.bold),),
                              Text(current1["humidity"].toString()+" kmph"),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text("cloudcover: ",style: TextStyle(fontWeight: FontWeight.bold),),
                              Text(current1["cloudcover"].toString()+"%"),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text("Wind Direction: ",style: TextStyle(fontWeight: FontWeight.bold),),
                              Text(winddir.toUpperCase()),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text("Is_day: ",style: TextStyle(fontWeight: FontWeight.bold),),
                              Text(current1["is_day"].toString().toUpperCase()),
                            ],
                          ),
                        ],
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          image: NetworkImage(imgurl),
                          fit: BoxFit.cover
                        )
                      ),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                    Text(location1["country"].toString()+", "+location1["name"],style: TextStyle(fontWeight: FontWeight.bold),),
                    Text(location1["localtime"],style: TextStyle(fontWeight: FontWeight.bold),),
                  ],)
                )
                ],
                )
              ),
            )
          ),
          Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                height: 55,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 8,
                        color: Colors.black
                      )
                    ]
                    ),
                  child: CountryPicker(
                    dense: false,
                    showFlag: false,
                    showName: true,
                    onChanged: (Country name){
                      print(name.isoCode);
                      setState(() {
                        _country = name;
                      });
                    },
                    selectedCountry: _country,
                  )
            ),
            ),
          ],
        )
      )
    );
  }
}