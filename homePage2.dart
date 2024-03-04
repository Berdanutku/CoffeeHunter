

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/changeProfile.dart';
import 'package:flutter_project/firstPage.dart';
import 'package:flutter_project/nearbyCoffeeShops.dart';
import 'package:flutter_project/readData.dart';

class homePage2 extends StatelessWidget {
   homePage2({Key? key,this.email}) : super(key: key);

   var email;


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
              child: ElevatedButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangeProfile(doc: email,))),
                  child:Text("Change the profile"),
              ),
            ),
            ElevatedButton(onPressed:()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>NearbyCoffeeShops())),
                child: Text("Show Nearby Coffee Shops")),
            ElevatedButton(onPressed: (){}, child: Text("Favourite Coffee Shops"))
          ],
        ),
      ),
    );
  }
}
