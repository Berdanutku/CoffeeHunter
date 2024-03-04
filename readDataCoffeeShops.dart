import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReadDataCoffeeShops extends StatelessWidget {
   ReadDataCoffeeShops({Key? key,required this.document}) : super(key: key);
   final String document;
  CollectionReference users=FirebaseFirestore.instance.collection("CoffeeShops");

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(document).get(),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.done){
            Map<String,dynamic> data=snapshot.data!.data() as Map<String,dynamic> ;
            return Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(alignment:Alignment.center,child: Image.network(data["Url"],fit: BoxFit.cover,width: 250,height: 250,)),
                    ],
                  ),
              Container(child: Text("Name: ${data["Name"]}"+ " "
                  +"\n\nAddress: ${data["Address"]}"+" "
                  +"\n\nRating: ${data["Rating"]}"),
                padding: EdgeInsets.all(8.0),),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        ElevatedButton(onPressed: (){}, child: Text("Make a Comment")),
                        ElevatedButton(onPressed: (){}, child: Text("Add to Favourites"))
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return Text("Loading...");
        });
  }
}
