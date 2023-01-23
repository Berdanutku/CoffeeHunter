import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentsPage extends StatefulWidget {
  CommentsPage({Key? key,this.email,this.userName,this.document}) : super(key: key);
  var email;
  var userName;
  var document;

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  var fireStore=FirebaseFirestore.instance;
  TextEditingController controller=TextEditingController();
  var docId=[];
  var a=0;
  Future getDocId()async{
    await FirebaseFirestore.instance.collection("CoffeeShops").doc(widget.document).collection("Comments").get().then(
            (snapshot) => snapshot.docs.forEach(
                (element) {
              docId.add(element.reference.id);
            }));
  }
  Widget commentChild(data1){
    CollectionReference users=FirebaseFirestore.instance.collection("CoffeeShops");
    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(widget.document).collection("Comments").doc(data1).get(),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.done){
            Map<String,dynamic> data=snapshot.data!.data() as Map<String,dynamic> ;
            if(a==0)
              return ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
                    child: ListTile(
                      leading: GestureDetector(
                        child: Container(
                          height: 50.0,
                          width: 50.0,
                          decoration: new BoxDecoration(
                              color: Colors.blue,
                              borderRadius: new BorderRadius.all(Radius.circular(50))),
                        ),
                      ),
                      title: Text(
                        data["Username"]??'default value',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(data['Comment']??'default value'),
                    ),
                  )
                ],
              );
          }
          return commentChild2(data1);
        });
  }
  Widget commentChild2(data1){
    CollectionReference users1=FirebaseFirestore.instance.collection("CoffeeShops");
    return FutureBuilder<DocumentSnapshot>(
        future: users1.doc(widget.document).collection("Comments").doc(data1).get(),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.done){
            Map<String,dynamic> data2=snapshot.data!.data() as Map<String,dynamic> ;
            if(a==1)
              return ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
                    child: ListTile(
                      leading: GestureDetector(
                        child: Container(
                          height: 50.0,
                          width: 50.0,
                          decoration: new BoxDecoration(
                              color: Colors.blue,
                              borderRadius: new BorderRadius.all(Radius.circular(50))),
                        ),
                      ),
                      title: Text(
                        data2["Username"]??'default value',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(data2['Comment']??'default value'),
                    ),
                  )
                ],
              );
          }
          return Text("");
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comments Page"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getDocId(),
                builder: (context,snapshot){
                  return ListView.builder(
                      itemCount:docId.length,
                      itemBuilder: (context,index){
                        return ListTile(
                          title: commentChild(docId[index]),
                        );
                      });
                }),
          ),
          ListTile(
            title: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                labelText: "Write a comment...",
              ),
            ),
            trailing: OutlinedButton.icon(
              onPressed: (){
                setState(()  {
                  final data= fireStore.collection("CoffeeShops").doc(widget.document).collection("Comments").doc(widget.email);
                  final json={"Username" : widget.userName,
                    "Comment":controller.text
                  };
                  data.set(json);
                  a++;
                  docId.length=0;

                });
              },
              label: Text("Send"), icon: Icon(Icons.send),
            ),
          )
        ],
      ),
    );
  }
}
