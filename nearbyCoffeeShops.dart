import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/coffeeShopPage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NearbyCoffeeShops extends StatefulWidget {
   NearbyCoffeeShops({Key? key}) : super(key: key);

  @override
  State<NearbyCoffeeShops> createState() => _NearbyCoffeeShopsState();
}

class _NearbyCoffeeShopsState extends State<NearbyCoffeeShops> {
  var fireStore=FirebaseFirestore.instance.collection("CoffeeShops");
  late GoogleMapController gcontroller;
  static const CameraPosition initialPosition=CameraPosition(target: LatLng(37.42796133580664, -122.085749655962),zoom: 14);
  Set<Marker> markers={};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nearby Coffee Shops"),
      ),
      body: GoogleMap(
        initialCameraPosition: initialPosition,
        markers: markers,
        mapType: MapType.normal,
        onMapCreated:(GoogleMapController controller){
          gcontroller=controller;
        },
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: () async {
        Position position=await currentPosition();
        gcontroller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(position.latitude,position.longitude),zoom: 14)));
        markers.add(Marker(markerId: MarkerId("Current Location"),
            position: LatLng(position.latitude,position.longitude),
            infoWindow:InfoWindow(title: "Current Location"),icon: BitmapDescriptor.defaultMarkerWithHue(120.0)));
        markers.add(Marker(markerId: MarkerId("Starbucks"),
            position: LatLng(38.45914213914959, 27.094495296335605),
            infoWindow: InfoWindow(title: "Starbucks"),
            onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CoffeeShopPage(doc: "WJWNDfqF1GD1BZrpQXrX",)));
            }));
        markers.add(Marker(markerId: MarkerId("Goche's Coffee"),
            position:LatLng(38.45725708736823, 27.096215933418645),
            infoWindow: InfoWindow(title:"Goche's Coffee"),
            onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CoffeeShopPage(doc: "jEyURoKz3UAariLg08eS",)));
            }));
        markers.add(Marker(markerId: MarkerId("Las Habitas"),
            position:LatLng(38.458204010818285, 27.094883111350754),
            infoWindow: InfoWindow(title:"Las Habitas"),
            onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CoffeeShopPage(doc: "Ery4VcdOJVGd0FXXoOz0",)));
            }));
        markers.add(Marker(markerId: MarkerId("The Leaf Coffee Shop"),
            position:LatLng(38.464048294476186, 27.088258926552403),
            infoWindow: InfoWindow(title:"The Leaf Coffee Shop"),
            onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CoffeeShopPage(doc: "dWGdLd8aalvq0JHh7Nfr",)));
            }));
        markers.add(Marker(markerId: MarkerId("Espello Coffee House"),
            position:LatLng(38.45916734368823, 27.09864443984116),
            infoWindow: InfoWindow(title:"Espello Coffee House"),
            onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CoffeeShopPage(doc: "G1u08vHJI9MCzo9fan4n",)));
            }));
        markers.add(Marker(markerId: MarkerId("ingo coffee"),
            position:LatLng(38.46189769247125, 27.093140547001365),
            infoWindow: InfoWindow(title:"ingo coffee"),
            onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CoffeeShopPage(doc: "e3qv2D8EMeM5izSNnNiU",)));
            }));
        markers.add(Marker(markerId: MarkerId("The Optimist Co."),
            position:LatLng(38.456680536095064, 27.0970673009399),
            infoWindow: InfoWindow(title:"The Optimist Co."),
            onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CoffeeShopPage(doc: "jzhvINy9mCdYpXL2KxES",)));
            }));
        markers.add(Marker(markerId: MarkerId("Tuck Coffee x Etc"),
            position:LatLng(38.46413834391457, 27.090146052239515),
            infoWindow: InfoWindow(title:"Tuck Coffee x Etc"),
            onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CoffeeShopPage(doc: "szskXiFVk9Skzkp81Nwl",)));
            }));
        markers.add(Marker(markerId: MarkerId("Waldo Coffee Co."),
            position:LatLng(38.456862650693, 27.09437795550952),
            infoWindow: InfoWindow(title:"Waldo Coffee Co."),
            onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CoffeeShopPage(doc: "vJbOjfP2lBLOsttqC6pW",)));
            }));
        markers.add(Marker(markerId: MarkerId("Kelvin Photo'n Coffee"),
            position:LatLng(38.46161449877776, 27.08961058237298),
            infoWindow: InfoWindow(title:"Kelvin Photo'n Coffee"),
            onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CoffeeShopPage(doc: "wa4dC4p8Cway3fA1tInM",)));
            }));
        setState(() {
        });
      },
          label: Text("Show the nearby coffee shops"),
      icon: Icon(Icons.location_on),),
    );
  }
  Future<Position> currentPosition()async{
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled=await Geolocator.isLocationServiceEnabled();

    if(!serviceEnabled){
      return Future.error("Location services are disabled");
    }
    permission=await Geolocator.checkPermission();
    if(permission==LocationPermission.denied){
      permission=await Geolocator.requestPermission();

      if(permission==LocationPermission.denied){
        return Future.error("Location permission denied");
      }
    }
    if(permission==LocationPermission.deniedForever){
      return Future.error("Location permissions are permanently denied");
    }
    Position position=await Geolocator.getCurrentPosition();
    return position;
  }
}

