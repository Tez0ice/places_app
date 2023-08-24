import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:places_mobile_app/models/place_list.dart';
import 'package:places_mobile_app/widgets/placeDetail.dart';
import "placeDetail.dart";
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //
  // var places = [
  //   {
  //     "name": "Hotel Besar",
  //     "address": "Bangi",
  //     "email": "sdsad@gmail.com",
  //     "image_url": "https://pix10.agoda.net/hotelImages/741/7412184/7412184_19051820120074593178.jpg?s=1024x768",
  //     "phone_number":"01321131ewqe",
  //     "description": "Wery Big Hotel",
  //     "avg_rating": "10.00"
  //   },
  // ];
  var places = [

  ];

  void initState(){
    super.initState();
    fetchPlaces().then((value)=> {
      setState((){
        places = value;
      })
    });
  }

// untuk call "futures" fucntion we called it use .then instead of normal such as var fuc = sum(1+2)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page"),),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: places.length,
          itemBuilder: (context,index){
            return Card(
              child: ListTile(
                leading: Image.network(places[index].imageUrl!),
                title: Text(places[index].name!),
                subtitle: Text(places[index].address!),
                trailing: Icon(Icons.chevron_right),
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder:
                   (context)=> DetailPlace(place: places[index] ,)));
                }
              ),
            );
          }),
    );
  }
}

Future <List<PlaceList>> fetchPlaces() async {
  final response = await http
      .get(Uri.parse('https://places-api-service.onrender.com/api/places'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return PlaceList.placesFromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}