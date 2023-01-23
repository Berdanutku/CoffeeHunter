import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/coffeeOwnerPage.dart';

class EditCoffeePage extends StatefulWidget {
   EditCoffeePage({Key? key,this.document}) : super(key: key);
  var document;

  @override
  State<EditCoffeePage> createState() => _EditCoffeePageState();
}

class _EditCoffeePageState extends State<EditCoffeePage> {
  var name;
  var address;
  var hours;
  var url;
  final formKey=GlobalKey<FormState>();
  final fireStore=FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Coffee Page"),
      ),
      body: Form(
        key: formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange),
                      ),
                      hintText: "Enter the name of Coffee Shop",
                      hintStyle: TextStyle(color: Colors.deepOrange),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Enter the name of Coffee Shop";
                      }
                      else{
                        return null;
                      }
                    },
                    onSaved: (value){
                      name=value!;
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
                      hintText: "Enter the address of Coffee Shop",
                      hintStyle: TextStyle(color: Colors.deepOrange),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Enter the address of Coffee Shop";
                      }
                      else{
                        return null;
                      }
                    },
                    onSaved: (value){
                      address=value!;
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
                      hintText: "Enter the hours of Coffee Shop",
                      hintStyle: TextStyle(color: Colors.deepOrange),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Enter the hours of Coffee Shop";
                      }
                      else{
                        return null;
                      }
                    },
                    onSaved: (value){
                      hours=value!;
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
                      hintText: "Enter the url of the picture for Coffee Shop",
                      hintStyle: TextStyle(color: Colors.deepOrange),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Enter the url of the picture for Coffee Shop";
                      }
                      else{
                        return null;
                      }
                    },
                    onSaved: (value){
                      url=value!;
                    },
                  ),
                ),
                ElevatedButton.icon(onPressed: (){
                  setState(() {
                    if(formKey.currentState!.validate()){
                      formKey.currentState!.save();
                      fireStore.collection("CoffeeShops").doc(widget.document).update({"Name":name,"Address":address,"Hours":hours,"Url":url});
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>CoffeeOwnerPage(password: widget.document,)));
                    }
                  });
                }, icon: Icon(Icons.save),
                label: Text("Save"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
