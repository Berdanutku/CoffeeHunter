import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/readFavourites.dart';

class FavouritesPage extends StatelessWidget {
   FavouritesPage({Key? key,this.email,this.username}) : super(key: key);
var email;
var username;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite Coffee Shops"),
      ),
      body: ListView.separated(itemBuilder: (context,index){
        return ListTile(
          title: ReadFavourites(email: email,),
        );
      },
          separatorBuilder: (BuildContext context,int index)=>Divider(),
          itemCount: 1),
    );
  }
}
