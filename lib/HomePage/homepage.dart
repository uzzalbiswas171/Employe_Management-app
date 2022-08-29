import 'package:blogappdemo/Note/note.dart';
import 'package:blogappdemo/register.dart';
import 'package:flutter/material.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("NOTE APP"),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.amberAccent[200],
            image: DecorationImage(image: AssetImage("mpic/ulogo.png"),fit: BoxFit.fill)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage(),));
                },
                child: Container(
                  height: 50,
                  width: 150,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: Colors.blue,
                  ),
                  child: Text("ADD employee"),
                ),
              ),

              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => StafManagment(),));
                },
                child: Container(
                  height: 50,
                  width: 150,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: Colors.blue,
                  ),
                  child: Text("See employee"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
