import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/homePage2.dart';

class loginPage extends StatelessWidget {
   loginPage({Key? key}) : super(key: key);
   var userName;

  final formKey=GlobalKey<FormState>();

   late String eMail2;

   late String passWord2;

  final firebaseAuth=FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Text("Log in",
                style: TextStyle(fontSize: 60,fontStyle: FontStyle.italic,color: Colors.red),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text("Please enter your username and password",
                style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 120.0,right: 20,left: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrange),
                    ),
                        hintText: "E-Mail",
                    hintStyle: TextStyle(color: Colors.deepOrange),
                    border: OutlineInputBorder()
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Enter your e-mail";
                    }
                    else{
                      return null;
                    }
                  },
                  onSaved: (value){
                      eMail2=value!;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange),
                      ),
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.deepOrange),
                      border: OutlineInputBorder()
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Enter your password";
                    }
                    else{
                      return null;
                    }
                  },
                  onSaved: (value){
                    passWord2=value!;
                  },
                ),
              ),
              ElevatedButton(onPressed: () async {
                if(formKey.currentState!.validate()){
                  formKey.currentState!.save();
                  try{
                  if(eMail2!=null&&passWord2!=null) {
                    print("Login Successful");
                    final user = await firebaseAuth.signInWithEmailAndPassword(
                        email: eMail2, password: passWord2);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => homePage2(email: eMail2,)));
                  }
                  }
                  on FirebaseAuthException catch(e){
                    if(e.code=="user-not-found"||e.code=="wrong-password") {
                      showDialog(barrierDismissible: false, context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Error"),
                              content: Text("Username or password is wrong!"),
                              actions: [
                                MaterialButton(child: Text("Back"),
                                    onPressed: () => Navigator.pop(context))
                              ],
                            );
                          }
                      );
                    }
                  }
                }
              },
                  child:Text("Login")),
            ],
          ),
        ),
      )
    );
  }
}
