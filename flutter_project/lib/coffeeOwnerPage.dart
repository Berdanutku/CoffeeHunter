import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/editCoffeePage.dart';

class CoffeeOwnerPage extends StatefulWidget {
   CoffeeOwnerPage({Key? key,this.password}) : super(key: key);
   var password;

  @override
  State<CoffeeOwnerPage> createState() => _CoffeeOwnerPageState();
}

class _CoffeeOwnerPageState extends State<CoffeeOwnerPage> {
  Widget coffeeShopPage(){
    CollectionReference users=FirebaseFirestore.instance.collection("CoffeeShops");
    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(widget.password).get(),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.done){
            Map<String,dynamic> data=snapshot.data!.data() as Map<String,dynamic> ;
            return Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>EditCoffeePage(document: widget.password,)));
                        }, icon: Icon(Icons.edit),
                        label: Text("Edit the page")),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coffee Owner Page"),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                  builder:(context,snapshot){
                    return ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context,index){
                          return ListTile(
                            title:coffeeShopPage(),
                          );
                        }
                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
