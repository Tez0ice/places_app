import 'package:flutter/material.dart';
import 'package:places_mobile_app/models/place_list.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPlace extends StatefulWidget {
  PlaceList place;

  DetailPlace({super.key,required this.place});

  @override
  State<DetailPlace> createState() => _DetailPlaceState();
}

class _DetailPlaceState extends State<DetailPlace> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Page"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 12,),
              Image.network(widget.place.imageUrl,height: 250, width: 250,
              ),
              SizedBox(height: 12,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Place Name: ",style: GoogleFonts.openSans(fontSize: 18),),
                  Text(widget.place .name!,style: GoogleFonts.openSans(fontSize: 16),),
                ],
              ),
              SizedBox(height: 12,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Place address: ",style: GoogleFonts.openSans(fontSize: 18),),
                  Text(widget.place.address!,style: GoogleFonts.openSans(fontSize: 16),),
                ],
              ),
              SizedBox(height: 12,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Place Description: ",style: GoogleFonts.openSans(fontSize: 18),),
                  Text(widget.place.description!,style: GoogleFonts.openSans(fontSize: 16),),
                ],
              ),
              SizedBox(height: 12,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Place Description: ",style: GoogleFonts.openSans(fontSize: 18),),
                  Text(widget.place.description!,style: GoogleFonts.openSans(fontSize: 16),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

