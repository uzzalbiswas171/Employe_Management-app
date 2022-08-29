import 'package:blogappdemo/Note/note.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _fnameController=TextEditingController();
  TextEditingController _lnameController=TextEditingController();
  TextEditingController _phoneController=TextEditingController();
  TextEditingController _ageController=TextEditingController();
  TextEditingController _addreeController=TextEditingController();
  final _formkey= GlobalKey<FormState>();


  String ? fname, lname, phone, age, add;

  Widget build(BuildContext context) {

    CollectionReference users = FirebaseFirestore.instance.collection('users');
    Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
      return users
          .add({
        'fname': _fnameController.text, // John Doe
        'lname': _lnameController.text, // Stokes and Sons
        'phone': _phoneController.text, // 42
        'age': _ageController.text, // 42
        'add': _addreeController.text // 42
      });
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("ADD Employee"),
      ),
    backgroundColor: Colors.blue,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.lightGreenAccent,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Padding(
            padding: EdgeInsets.all(10.00),
            child: SingleChildScrollView(
              child: Form(
                key:_formkey,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                          border: Border.all(
                              color: Colors.white,
                              width: 1
                          )
                      ),
                      height: 40,
                      margin: EdgeInsets.all(10),
                      child: TextFormField(
                        validator:(value){
                            if(value!.isEmpty){
                            return "fname";
                            }},
                        controller: _fnameController,
                        decoration: InputDecoration(
                          hintText: "Enter fast name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                          )
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          border: Border.all(
                              color: Colors.white,
                              width: 1
                          )
                      ),
                      child: TextFormField(
                        validator:(value){
                          if(value!.isEmpty){
                            return "Last name";
                          }},
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500
                        ),
                        controller: _lnameController,
                        decoration: InputDecoration(
                            hintText: "Enter last name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                            )
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          border: Border.all(
                              color: Colors.white,
                              width: 1
                          )
                      ),
                      child: TextFormField(
                        validator:(value){
                          if(value!.isEmpty){
                            return "Enter phone";
                          }},
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500
                        ),
                        controller: _phoneController,
                        decoration: InputDecoration(
                            hintText: "Enter phone",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                            )
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          border: Border.all(
                              color: Colors.white,
                              width: 1
                          )
                      ),
                      child: TextFormField(
                        validator:(value){
                          if(value!.isEmpty){
                            return "Enter age";
                          }},
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500
                        ),
                        controller: _ageController,
                        decoration: InputDecoration(
                            hintText: "Enter age",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                            )
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                        border: Border.all(
                          color: Colors.white,
                          width: 1
                        )
                      ),
                      child: TextFormField(
                        validator:(value){
                          if(value!.isEmpty){
                            return "Enter address";
                          }},
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500
                        ),
                        controller: _addreeController,
                        decoration: InputDecoration(
                            hintText: "Enter address",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                            )
                        ),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            setState((){
                              fname=_fnameController.text.toString();
                              lname=_fnameController.text.toString();
                              phone=_phoneController.text.toString();
                              age=_ageController.text.toString();
                              add=_addreeController.text.toString();
                            });
    if(_formkey.currentState!.validate()) {
      print("Submit Sucess full",);
      addUser();
      _fnameController.text="";
      _lnameController.text="";
      _phoneController.text="";
      _ageController.text="";
      _addreeController.text="";
    }

                          },
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(11),
                                color: Colors.grey,
                              ),
                              height: 60,
                              width: 150,
                              alignment: Alignment.center,
                              margin: EdgeInsets.all(10),
                              child: Text("ADD value")
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => StafManagment(),));
                          },
                          child: Container(
                            width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(11),
                                color: Colors.grey,
                              ),
                              height: 60,
                              alignment: Alignment.center,
                              margin: EdgeInsets.all(10),
                              child: Text("See Employe")
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
