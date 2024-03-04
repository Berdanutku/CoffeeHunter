import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ReadData extends StatelessWidget {
   ReadData({Key? key,required this.document}) : super(key: key);
  final String document;
  CollectionReference users=FirebaseFirestore.instance.collection("Users");

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(document).get(),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.done){
            Map<String,dynamic> data=snapshot.data!.data() as Map<String,dynamic> ;
             return Text("Username: ${data["Username"]}"+ " "+"\nEmail: ${data["Email"]}"+" "+"\nAge: ${data["Age"]}"+"\nGender: ${data["Gender"]}");
          }
      return Text("Loading...");
    });
  }
}
