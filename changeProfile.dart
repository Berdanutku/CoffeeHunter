import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/homePage2.dart';

class ChangeProfile extends StatefulWidget {
   ChangeProfile({Key? key,this.doc}) : super(key: key);
   var doc;

  @override
  State<ChangeProfile> createState() => _ChangeProfileState();
}

class _ChangeProfileState extends State<ChangeProfile> {
  late String username;

  late String age;

  var gender;

  bool isGenderMale=false;

  bool isGenderFemale=false;

  final fireStore=FirebaseFirestore.instance;
  final formKey=GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change the profile"),
      ),
      body: Form(
        key: formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange),
                      ),
                      hintText: "Enter your new username",
                      hintStyle: TextStyle(color: Colors.deepOrange),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Enter your username";
                      }
                      else{
                        return null;
                      }
                    },
                    onSaved: (value){
                      username=value!;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange),
                      ),
                      hintText: "Enter your new age",
                      hintStyle: TextStyle(color: Colors.deepOrange),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Enter your age";
                      }
                      else{
                        return null;
                      }
                    },
                    onSaved: (value){
                      age=value!;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:100.0),
                  child: Row(
                    children: [
                      Text("Male"),
                  Checkbox(value: isGenderMale, onChanged:(value){
                      setState(() {
                        isGenderMale=value!;
                        gender="Male";
                      });
                  }),
                  Text("Female"),
                  Checkbox(value: isGenderFemale, onChanged: (value){
                      setState(() {
                        isGenderFemale=value!;
                        gender="Female";
                      });
                  }),
                  ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(onPressed: (){
                    setState(() {
                      if(formKey.currentState!.validate()){
                        formKey.currentState!.save();
                        fireStore.collection("Users").doc(widget.doc).update({"Username":username,"Age":age,"Gender":gender});
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>homePage2(email: widget.doc)));
                      }
                    });
                    },
                      child: Text("Save")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
