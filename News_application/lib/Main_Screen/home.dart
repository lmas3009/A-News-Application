import 'package:News_application/Main_Screen/nav.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert' show jsonDecode;

import 'package:webview_flutter/webview_flutter.dart';

class Homepage extends StatefulWidget {
  Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  
  List data,details,data1=[];


  Future<String> getData() async {
    var response = await http.get(
      Uri.encodeFull("http://newsapi.org/v2/top-headlines?country=in&apiKey=311e497348614fdd89a8fe2590cf4aae"),
      headers: {
        "Accept": "application/json"
      }
    );

    this.setState(() {
      Map<String, dynamic> map = jsonDecode(response.body);
      data = map["articles"];
    });
    
    return "Success!";
  }

  Future<String> getcountrydata(String selectedItem) async {
    var response = await http.get(
      Uri.encodeFull("http://newsapi.org/v2/top-headlines?country="+selectedItem+"&apiKey=311e497348614fdd89a8fe2590cf4aae"),
      headers: {
        "Accept": "application/json"
      }
    );

    this.setState(() {
      Map<String, dynamic> map = jsonDecode(response.body);
      data1 = map["articles"];
    });
    
    return "Success!";
  }

String selectedValue;
List<DropdownMenuItem> items=[];

  String _imageveri( Map<String, dynamic> data){
      if(data["urlToImage"]!=null){
        return data["urlToImage"];
      }
      else{
        return "https://beyondma.com/wp-content/uploads/2017/04/default-image.jpg";
      }
    }

  String timeveri(Map<String, dynamic> data){
    String time = data["publishedAt"].toString().substring(11,19);
    String veri;
    if(int.parse(time.substring(0,2))<=12){
      return time+" AM";
    }
    else{
      return time+" PM";
    }
  }
  


  @override
  void initState(){
    this.getData();
    getcountrydata("in");
  }


Country _country = Country.IN;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:ListView(
          children: <Widget>[
          Column(
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
              child: 
              CarouselSlider(
                  items: items1,
                  options: CarouselOptions(
                      aspectRatio: 5/2,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: false,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                      carouselController: _carouselController
                  )
                )
              /*Container(
                height: 100,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(0),topRight: Radius.circular(20),bottomLeft: Radius.circular(20)),
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
                    children: <Widget>[
                      Text("Hong Kong postpones legistal elelctions for a year over coranavirus - CNN",textAlign: TextAlign.left,),
                      Container(margin: const EdgeInsets.only(top: 15),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("2020-07-31",style: TextStyle(fontWeight: FontWeight.bold),),
                          Text("11:54:00 AM",style: TextStyle(fontWeight: FontWeight.bold),),
                        ],
                      )
                    ],
                  )
                ),
              ),*/
            ),
            Container(padding: const EdgeInsets.all(10),),
            Padding(
              padding: const EdgeInsets.all(8.0),
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
                        getcountrydata(_country.isoCode.toLowerCase());
                      });
                    },
                    selectedCountry: _country,
                  )
            ),
            ),
            Container(margin: const EdgeInsets.only(top: 20),),
            Container(
              height: 600,
             child:data1.length == 0? new Container(
               margin: const EdgeInsets.only(top: 150),
               child: Text("No Data Found",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)): ListView.builder(
            itemCount: data1.length,
            itemBuilder: (BuildContext context, int index){
              return
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>View(data1[index])));
                },
            child:Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(bottom: 20),
              height: 290,
              width: 340,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black,
                  )
                ]
              ),
              alignment: Alignment.center,
              child: Column(  
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                height: 160,
                width: 320,
                margin: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: Colors.black,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                image: DecorationImage(image: NetworkImage(_imageveri(data1[index])),
                fit: BoxFit.fill
                )
                ),
                ),
                Container(margin: const EdgeInsets.only(top: 5,left: 10),
                  child: Text(data1[index]["source"]["name"],textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                Container(margin: const EdgeInsets.only(top: 10,left: 10,bottom: 10),
                child:Text(data1[index]["title"],textAlign: TextAlign.left,softWrap: true,overflow: TextOverflow.clip,maxLines: 2),
                ),
                Container(padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                        Text(data1[index]["publishedAt"].toString().substring(0,10),style: TextStyle(fontWeight: FontWeight.bold),),
                        Text(timeverify(data1[index]),style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),
                ),
                
                ],
              )
            )
            );
            }
             )
            )
          ],
        ),],
        )
      ),
    );
  }
}
String _selectedItem;

CarouselController _carouselController = new CarouselController();

final List<Widget> items1 = [
          Container(
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white
            ),
            alignment: Alignment.center,
            child: Container(
              height: 100,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(0),topRight: Radius.circular(20),bottomLeft: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black
                  )
                ]
              ),
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                    children: <Widget>[
                      Text("Hong Kong postpones legistal elelctions for a year over coranavirus - CNN",textAlign: TextAlign.left,),
                      Container(margin: const EdgeInsets.only(top: 15),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("2020-07-31",style: TextStyle(fontWeight: FontWeight.bold),),
                          Text("11:54:00 AM",style: TextStyle(fontWeight: FontWeight.bold),),
                        ],
                      )
                    ],
                  ),
              ),
            )
          ),
          Container(
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white
            ),
            alignment: Alignment.center,
            child: Container(
              height: 100,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(0),topRight: Radius.circular(20),bottomLeft: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black
                  )
                ]
              ),
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                    children: <Widget>[
                      Text("Hong Kong postpones legistal elelctions for a year over coranavirus - CNN",textAlign: TextAlign.left,),
                      Container(margin: const EdgeInsets.only(top: 15),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("2020-07-31",style: TextStyle(fontWeight: FontWeight.bold),),
                          Text("11:54:00 AM",style: TextStyle(fontWeight: FontWeight.bold),),
                        ],
                      )
                    ],
                  )
              ),
            )
          ),
          ];


  String timeverify(Map<String, dynamic> data){
    String time = data["publishedAt"].toString().substring(11,19);
    if(int.parse(time.substring(0,2))<=12){
      return time+" AM";
    }
    else{
      return time+" PM";
    }
  }

  String vericontent(Map<String, dynamic> data){
    if(data["content"]!=null){
      return data["content"];
    }
    else{
      return "No Content";
    }
  }
  String veridis(Map<String, dynamic> data){
    if(data["description"]!=null){
      return data["description"];
    }
    else{
      return "No Content";
    }
  }


class View extends StatelessWidget {
  View(this.data, {Key key}) : super(key: key);
  Map<String, dynamic>  data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Navbar()));
          },
          child: Container(
            width: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),topRight: Radius.circular(20)),
            ),
            child: Icon(Icons.arrow_back,color: Colors.black,size: 30,),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        child:Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20),
                height: 220,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                image: DecorationImage(image: NetworkImage(data["urlToImage"]),
                fit: BoxFit.cover
                )
              ),
            ), 
            Container(
              padding: const EdgeInsets.all(30),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text("Published At:",style: TextStyle(fontWeight: FontWeight.bold),),
                        Text(data["publishedAt"].toString().substring(0,10),style: TextStyle(fontWeight: FontWeight.bold),),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text("Published Time:",style: TextStyle(fontWeight: FontWeight.bold),),
                        Text(timeverify(data),style: TextStyle(fontWeight: FontWeight.bold),),
                      ],
                    ),
                ],
              ),
            ),
            Container(
              child: Padding(padding: const EdgeInsets.only(left:20,right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("Headlines",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                    Container(margin: const EdgeInsets.only(top: 10)),
                    Text(data["title"],),
                    Container(margin: const EdgeInsets.only(top: 30)),
                    Text("Description",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                    Container(margin: const EdgeInsets.only(top: 10)),
                    Text(veridis(data,),maxLines: 5,),
                    Container(margin: const EdgeInsets.only(top: 30)),
                    Text("Main Content",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                    Container(margin: const EdgeInsets.only(top: 10)),
                    Text(vericontent(data,),maxLines: 4,),
                   Center(
                     child:InkWell(
                       onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>Webviews(data)));
                       },
                       child: Container(
                      margin: const EdgeInsets.only(top: 30),
                      height: 60,
                      width: 280,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 15,
                            color: Color(0x29000000)
                          )
                        ]
                      ),
                      child: Center(
                        child: Text("Read More",style: TextStyle(fontSize: 25,color: Color(0xFF707070))),
                      ),
                    ),
                     )
                   )
                  ],
                ),
              )
            )
          ],
        )
      ),
    );
  }
}



class Webviews extends StatelessWidget {
  Webviews(this.data, {Key key}) : super(key: key);
  Map<String,dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data["source"]["name"]),
        automaticallyImplyLeading: false,
      ),
      body:WebView(
        initialUrl: data["url"],
        javascriptMode: JavascriptMode.unrestricted,
      )
    );
  }
}

