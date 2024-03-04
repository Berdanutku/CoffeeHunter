
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/loginPage2.dart';

class signUpPage extends StatefulWidget {
  const signUpPage({Key? key}) : super(key: key);

  @override
  State<signUpPage> createState() => _signUpPageState();
}

class _signUpPageState extends State<signUpPage> {
  late String userName;
  late String passWord;
  late String eMail;
  late String rePass;
  late String age;
  bool isGenderMale=false;
  bool isGenderFemale=false;
  late String gender;
  final formKey=GlobalKey<FormState>();
  final firebaseAuth=FirebaseAuth.instance;
  final fireStore=FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Text("Sign Up",
                style: TextStyle(fontSize: 60,fontStyle: FontStyle.italic,color: Colors.red),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Text("Please enter the necessary informations",
                  style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,color: Colors.black),
                ),
              ),
    Padding(
          padding: const EdgeInsets.all(6.0),
          child: TextFormField(
          decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepOrange),
          ),
          hintText: "Username",
          hintStyle: TextStyle(color: Colors.deepOrange),
          border: OutlineInputBorder()
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
            userName=value!;
            },
          ),
    ),
    Padding(
          padding: const EdgeInsets.all(6.0),
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
              eMail=value!;
            },
          ),
    ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange),
                      ),
                      hintText: "Age",
                      hintStyle: TextStyle(color: Colors.deepOrange),
                      border: OutlineInputBorder()
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
          padding: const EdgeInsets.all(6.0),
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
              passWord=value!;
            },
          ),
    ),
    Padding(
          padding: const EdgeInsets.all(6.0),
          child: TextFormField(
            obscureText: true,
          decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepOrange),
          ),
          hintText: "Confirm Password",
          hintStyle: TextStyle(color: Colors.deepOrange),
          border: OutlineInputBorder()
          ),
            validator: (value){
              if(value!.isEmpty){
                return "Enter your password again";
              }
              else{
                return null;
              }
            },
            onSaved: (value){
              rePass=value!;
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

              ElevatedButton(onPressed: () async {
                if(formKey.currentState!.validate()){
                  formKey.currentState!.save();
                  if(userName!=null&&passWord!=null&&eMail!=null&&rePass!=null&&age!=null&&gender!=null&&passWord==rePass){
                    print("Register Succesful");
                    var user= await firebaseAuth.createUserWithEmailAndPassword(email: eMail, password: passWord);
                    try{
                      final data= fireStore.collection("Users").doc(eMail);
                      final json={"Username" : userName,
                        "Email" : eMail,
                        "Age" : age,
                        "Gender": gender};
                      await data.set(json);
                    }
                    catch(e){
                      print("Error");
                    }
                    formKey.currentState!.reset();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>loginPage()));
                  }
                  else{
                    showDialog(barrierDismissible: false,context: context,
                        builder: (BuildContext context){
                          return AlertDialog(
                            title: Text("Error"),
                            content: Text("The passwords are not same"),
                            actions: [
                              MaterialButton(child:Text("Back"),onPressed: ()=>Navigator.pop(context))
                            ],
                          );
                        }
                    );
                  }
                }
              }, child:
              Text("Sign Up")
              ),
            ],
          ),
        ),
      ),
    );
  }

}
