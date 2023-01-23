import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/coffeeShopPage.dart';
import 'package:flutter_project/readDataCoffeeShops.dart';

class ReadFavourites extends StatefulWidget {
   ReadFavourites({Key? key,this.email,this.username}) : super(key: key);
var email;
var username;
  @override
  State<ReadFavourites> createState() => _ReadFavouritesState();
}
CollectionReference users=FirebaseFirestore.instance.collection("Users");
class _ReadFavouritesState extends State<ReadFavourites> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: FutureBuilder<DocumentSnapshot>(
            future: users.doc(widget.email).collection("Favourites").doc(widget.email).get(),
            builder: (context,snapshot){
              try {
                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> data = snapshot.data!.data() as Map<String,dynamic>;
                  Object initial=0;
                  var initial2="";
                  var b = data["Name"].length;
                  print(b);
                  if (b == 1) {
                    return ElevatedButton.icon(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CoffeeShopPage(doc: data["Id"][0],userName: widget.username,)));
                    }, icon: Icon(Icons.favorite),
                    label: Text("1- ${data["Name"][0]}",
                        style: TextStyle( fontSize: 20)));
                  }
                  else if (b == 2) {
                    return Column(
                      children: [
                        ElevatedButton.icon(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CoffeeShopPage(doc: data["Id"][0],userName: widget.username)));
                        }, icon: Icon(Icons.favorite),
                            label: Text("1- ${data["Name"][0]}",
                                style: TextStyle( fontSize: 20))),
                        ElevatedButton.icon(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CoffeeShopPage(doc: data["Id"][1],userName: widget.username)));
                        }, icon: Icon(Icons.favorite),
                            label: Text("2- ${data["Name"][1]}",
                                style: TextStyle( fontSize: 20)))
                      ],
                    );
                  }
                  else if (b == 3) {
                    return Column(
                      children: [
                        ElevatedButton.icon(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CoffeeShopPage(doc: data["Id"][0],userName: widget.username)));
                        }, icon: Icon(Icons.favorite),
                            label: Text("1- ${data["Name"][0]}",
                                style: TextStyle( fontSize: 20))),
                        ElevatedButton.icon(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CoffeeShopPage(doc: data["Id"][1],userName: widget.username)));
                        }, icon: Icon(Icons.favorite),
                            label: Text("2- ${data["Name"][1]}",
                                style: TextStyle( fontSize: 20))),
                        ElevatedButton.icon(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CoffeeShopPage(doc: data["Id"][2],userName: widget.username)));
                        }, icon: Icon(Icons.favorite),
                            label: Text("3- ${data["Name"][2]}",
                                style: TextStyle( fontSize: 20)))

                      ],
                    );
                  }
                  else if (b == 4) {
                    return Column(
                      children: [
                        ElevatedButton.icon(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CoffeeShopPage(doc: data["Id"][0],userName: widget.username)));
                        }, icon: Icon(Icons.favorite),
                            label: Text("1- ${data["Name"][0]}",
                                style: TextStyle( fontSize: 20))),
                        ElevatedButton.icon(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CoffeeShopPage(doc: data["Id"][1],userName: widget.username)));
                        }, icon: Icon(Icons.favorite),
                            label: Text("2- ${data["Name"][1]}",
                                style: TextStyle( fontSize: 20))),
                        ElevatedButton.icon(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CoffeeShopPage(doc: data["Id"][2],userName: widget.username)));
                        }, icon: Icon(Icons.favorite),
                            label: Text("3- ${data["Name"][2]}",
                                style: TextStyle( fontSize: 20))),
                        ElevatedButton.icon(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CoffeeShopPage(doc: data["Id"][3],userName: widget.username)));
                        }, icon: Icon(Icons.favorite),
                            label: Text("4- ${data["Name"][3]}",
                                style: TextStyle( fontSize: 20)))
                      ],
                    );
                  }
                  else if (b == 5) {
                    return Column(
                      children: [
                        ElevatedButton.icon(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CoffeeShopPage(doc: data["Id"][0],userName: widget.username)));
                        }, icon: Icon(Icons.favorite),
                            label: Text("1- ${data["Name"][0]}",
                                style: TextStyle( fontSize: 20))),
                        ElevatedButton.icon(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CoffeeShopPage(doc: data["Id"][1],userName: widget.username)));
                        }, icon: Icon(Icons.favorite),
                            label: Text("2- ${data["Name"][1]}",
                                style: TextStyle( fontSize: 20))),
                        ElevatedButton.icon(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CoffeeShopPage(doc: data["Id"][2],userName: widget.username)));
                        }, icon: Icon(Icons.favorite),
                            label: Text("3- ${data["Name"][2]}",
                                style: TextStyle( fontSize: 20))),
                        ElevatedButton.icon(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CoffeeShopPage(doc: data["Id"][3],userName: widget.username)));
                        }, icon: Icon(Icons.favorite),
                            label: Text("4- ${data["Name"][3]}",
                                style: TextStyle( fontSize: 20))),
                        ElevatedButton.icon(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CoffeeShopPage(doc: data["Id"][4],userName: widget.username)));
                        }, icon: Icon(Icons.favorite),
                            label: Text("5- ${data["Name"][4]}",
                                style: TextStyle( fontSize: 20)))
                      ],
                    );
                  }
                  else {
                    return Column(
                      children: [
                        ElevatedButton.icon(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CoffeeShopPage(doc: data["Id"][0],userName: widget.username)));
                        }, icon: Icon(Icons.favorite),
                            label: Text("1- ${data["Name"][0]}",
                                style: TextStyle( fontSize: 20))),
                        ElevatedButton.icon(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CoffeeShopPage(doc: data["Id"][1],userName: widget.username)));
                        }, icon: Icon(Icons.favorite),
                            label: Text("2- ${data["Name"][1]}",
                                style: TextStyle( fontSize: 20))),
                        ElevatedButton.icon(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CoffeeShopPage(doc: data["Id"][2],userName: widget.username)));
                        }, icon: Icon(Icons.favorite),
                            label: Text("3- ${data["Name"][2]}",
                                style: TextStyle( fontSize: 20))),
                        ElevatedButton.icon(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CoffeeShopPage(doc: data["Id"][3],userName: widget.username)));
                        }, icon: Icon(Icons.favorite),
                            label: Text("4- ${data["Name"][3]}",
                                style: TextStyle( fontSize: 20))),
                        ElevatedButton.icon(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CoffeeShopPage(doc: data["Id"][4],userName: widget.username)));
                        }, icon: Icon(Icons.favorite),
                            label: Text("5- ${data["Name"][4]}",
                                style: TextStyle( fontSize: 20))),
              Text("\nFavourites List is full!\nYou can add maximum 5 coffee shops.",
              style: TextStyle(fontSize: 30)),
                      ],
                    );
                  }
                }
              }
              catch(e){
                print("You don't have any favourite Coffee Shop");
              }
              return Padding(
                padding: const EdgeInsets.only(top: 200.0),
                child: Text("You don't have any favourite Coffee Shop!",style: TextStyle(color: Colors.red,fontSize: 17 ),),
              );
            }),
      ),
    );
  }
}
