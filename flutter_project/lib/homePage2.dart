import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/changeProfile.dart';
import 'package:flutter_project/favouritesPage.dart';
import 'package:flutter_project/firstPage.dart';
import 'package:flutter_project/nearbyCoffeeShops.dart';
import 'package:flutter_project/readData.dart';

class homePage2 extends StatelessWidget {
   homePage2({Key? key,this.email,this.userName}) : super(key: key);
   var email;
   var userName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Coffee Hunter"),
        actions: [
          GestureDetector(
            onTap: (){
              FirebaseAuth.instance.signOut();
              Navigator.push(context,MaterialPageRoute(builder: (context)=>firstPage()));
            },
            child: Icon(Icons.logout_rounded),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Icon(
              Icons.person_sharp,
              size: 200,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 60.0),
                child: FutureBuilder(
                    builder:(context,snapshot){
                    return ListView.builder(
                      itemCount: 1,
                        itemBuilder: (context,index){
                          return ListTile(
                            title: ReadData(document: email),
                          );
                        }
                    );
                    }
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 100.0),
              child: ElevatedButton.icon(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangeProfile(doc: email))),
                  label:Text("Change the profile"),
                icon: Icon(Icons.edit),
              ),
            ),
            ElevatedButton.icon(onPressed:()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>NearbyCoffeeShops(email: email,userName: userName,))),
                label: Text("Show Nearby Coffee Shops"),icon: Icon(Icons.coffee_outlined)),
            ElevatedButton.icon(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>FavouritesPage(email: email,username: userName,))), label: Text("Favourite Coffee Shops"),icon: Icon(Icons.favorite),),
          ],
        ),
      ),
    );
  }
}
