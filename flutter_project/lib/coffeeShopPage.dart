import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/readDataCoffeeShops.dart';

class CoffeeShopPage extends StatelessWidget {
   CoffeeShopPage({Key? key,this.doc,this.email,this.userName}) : super(key: key);
   final doc;
   final email;
   var userName;
   var fireStore=FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coffee Shop Details"),
      ),
      body:Padding(
        padding: const EdgeInsets.only(left: 60.0),
        child: FutureBuilder(
            builder:(context,snapshot){
              return ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context,index){
                    return ListTile(
                      title: ReadDataCoffeeShops(document: doc,email: email,userName: userName,),
                    );
                  }
              );
            }
        ),
      ),
    );
  }
}
