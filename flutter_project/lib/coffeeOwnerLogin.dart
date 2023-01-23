import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/coffeeOwnerPage.dart';

class CoffeeOwnerLogin extends StatefulWidget {
  const CoffeeOwnerLogin({Key? key}) : super(key: key);

  @override
  State<CoffeeOwnerLogin> createState() => _CoffeeOwnerLoginState();
}

class _CoffeeOwnerLoginState extends State<CoffeeOwnerLogin> {
  final formKey=GlobalKey<FormState>();
  var passWord2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coffee Owner Login"),
      ),
      body: Form(
        key: formKey,
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange),
                      ),
                      hintText: "Enter the unique code of the Coffee Shop",
                      hintStyle: TextStyle(color: Colors.deepOrange),
                      border: OutlineInputBorder()
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Enter the unique code of the Coffee Shop";
                    }
                    else{
                      return null;
                    }
                  },
                  onSaved: (value){
                    passWord2=value!;
                    print(passWord2);
                  },
                ),
              ),
              ElevatedButton(onPressed: (){
                if(formKey.currentState!.validate()){
                  formKey.currentState!.save();
                  print(passWord2);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CoffeeOwnerPage(password: passWord2,)));
                }
              },
                  child: Text("Log in"))
            ],
          ),
        ),
      ),
    );
  }
}
