

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/loginPage2.dart';
import 'package:flutter_project/signUpPage.dart';

class firstPage extends StatefulWidget {
  const firstPage({Key? key,}) : super(key: key);

  @override
  State<firstPage> createState() => _firstPageState();
}

class _firstPageState extends State<firstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.coffee,
                color: Colors.red,
                size: 200,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 70.0),
                child: Text("Coffee Hunter",
                style: TextStyle(fontSize: 60,fontStyle: FontStyle.italic,color: Colors.red),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                  onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>loginPage())),
                  child:Text("Log in"),
                  style:
                  ElevatedButton.styleFrom(
                    fixedSize: Size(300, 50),
                      backgroundColor: Colors.red,
                    side: BorderSide(color:Colors.black,width: 3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))
                    ),
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                    )
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>signUpPage())),
                child:Text("Sign Up"),
                style:
                ElevatedButton.styleFrom(
                    fixedSize: Size(300, 50),
                    backgroundColor: Colors.red,
                    side: BorderSide(color:Colors.black,width: 3),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))
                    ),
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
