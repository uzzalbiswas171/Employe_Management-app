import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../deleteData/deletedata.dart';

class StafManagment extends StatefulWidget {
  const StafManagment({Key? key}) : super(key: key);

  @override
  State<StafManagment> createState() => _StafManagmentState();
}

class _StafManagmentState extends State<StafManagment> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('users').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("employee Management"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.00),
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        child:StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                return Container(
                  height: 120,
                  margin: EdgeInsets.only(
                    top: 20,
                  ),
                  alignment: Alignment.center,
                  child: Card(
                    color: Colors.amber,
                    elevation: 10,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [

                              Text("fname : ${data['fname']}",style: TextStyle(
                                fontSize: 17,
                              ),),
                              SizedBox(height: 10,),
                              Text("lname : ${data['lname']}",style: TextStyle(
                                fontSize: 17,
                              ),)
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("phone : ${data['phone']}",style: TextStyle(
                                fontSize: 17,
                              ),),
                              SizedBox(height: 10,),
                              Text("age : ${data['age']}",style: TextStyle(
                                fontSize: 17,
                              ),)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("address : ${data['add']}",style: TextStyle(
                                fontSize: 17,
                              ),),
                              InkWell(
                                onTap:() {
                                  AA();
                                },
                                child: Text(" Delete ",style: TextStyle(
                                  fontSize: 17,
                                ),),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              
                // return ListTile(
                //   title: Text("${data['full_name']}"),
                //   subtitle: Text("${data['company']}"),
                // );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
