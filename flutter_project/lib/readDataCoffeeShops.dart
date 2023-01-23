import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/commentsPage.dart';

class ReadDataCoffeeShops extends StatefulWidget {
   ReadDataCoffeeShops({Key? key,required this.document,this.email,this.userName}) : super(key: key);
   final String document;
   final email;
   var userName;

  @override
  State<ReadDataCoffeeShops> createState() => _ReadDataCoffeeShopsState();
}

class _ReadDataCoffeeShopsState extends State<ReadDataCoffeeShops> {
   final fireStore=FirebaseFirestore.instance;

  CollectionReference users=FirebaseFirestore.instance.collection("CoffeeShops");

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(widget.document).get(),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.done){
            Map<String,dynamic> data=snapshot.data!.data() as Map<String,dynamic> ;
            var name=data["Name"];
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
                  +"\n\nRating: ${data["Rating"]}"+" "
              +"\n\nHours: ${data["Hours"]}"),
                padding: EdgeInsets.all(8.0),),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        ElevatedButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CommentsPage(email: widget.email,userName: widget.userName,document: widget.document,)));
                        }, child: Text("Make a Comment")),
                        ElevatedButton(onPressed: (){
                          setState(() {
                            var array=fireStore.collection("Users").doc(widget.email).collection("Favourites").doc(widget.email);
                            array.update({
                              "Name":FieldValue.arrayUnion([name]),
                              "Id":FieldValue.arrayUnion([widget.document])
                            });
                          });
                        }, child: Text("Add to Favourites"))
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
