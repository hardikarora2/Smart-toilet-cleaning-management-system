import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:project_se/main.dart';
// import 'package:project_se/update.dart';
// import 'package:project_se/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_se/update.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override

  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String name = "", id = "", email = "", contact = "", password = "";
  @override
  static const String _title = 'Toilet Management';
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Center(child: Text(_title))),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              children: [
                //  Text("Welcome",style: TextStyle(fontSize: 30, color: Colors.black)),
                Text("Sign Up",
                    style: TextStyle(fontSize: 30, color: Colors.blue)),
                // Center(
                //   child: Image.asset('assets/images/sign-up.png',
                //     width: 200,
                //     height: 200,),
                // ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  onChanged: (value) {
                    name = value;
                  },
                  decoration: InputDecoration(
                      labelText: "Name",
                      labelStyle:
                          TextStyle(fontSize: 15, color: Colors.grey.shade800),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  onChanged: (value) {
                    id = value;
                  },
                  decoration: InputDecoration(
                      labelText: "Id",
                      labelStyle:
                          TextStyle(fontSize: 15, color: Colors.grey.shade800),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: InputDecoration(
                      labelText: "Email ID",
                      labelStyle:
                          TextStyle(fontSize: 15, color: Colors.grey.shade800),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  onChanged: (value) {
                    contact = value;
                  },
                  // obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Contact No.",
                      labelStyle:
                          TextStyle(fontSize: 15, color: Colors.grey.shade800),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  onChanged: (value) {
                    password = value;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle:
                          TextStyle(fontSize: 15, color: Colors.grey.shade800),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () async {

                    if (name == '' ||
                        id == ''   ||
                        email == '' ||
                        contact == ''||
                        password == ''
                        )
                    {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Fill all the fields"),
                        ),
                      );
                      return;
                    }
                    bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(email);
                    if (!emailValid) {
                      // Text("Enter Valid Email");
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Enter Valid Email")));
                      return;
                    }
                    if(contact.length!=10)
                    {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Enter Valid contact number")));
                      return;
                    }
                    bool passValid = RegExp(r'^(?=.*?[a-z])(?=.*?[0-9]).{8,}$')
                        .hasMatch(password);
                    if (!passValid) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              "Password should be of length 8 and atleast one numeric and one character value"),
                        ),
                      );
                      return;
                    }











                    try {
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: id + "@gmail.com", password: password);
                      await FirebaseFirestore.instance.collection('user').add({
                        'name': name,
                        'email': email,
                        'phone': contact,
                        'id': id,
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Update();
                          },
                        ),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            e.toString(),
                          ),
                        ),
                      );
                    }
                  },
                  child: Container(
                    height: size.height / 14,
                    width: size.width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "Submit ",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                // SizedBox(height: 15,),
                // Container(
                //   height: size.height / 14,
                //   width: size.width,
                //   alignment: Alignment.center,
                //   decoration: BoxDecoration(color: Colors.red,
                //       borderRadius: BorderRadius.circular(5)),
                //   child: Text("Cancel ",
                //     style: TextStyle(color: Colors.white,
                //         fontWeight: FontWeight.bold),),
                // ),

                TextButton(
                  child: const Text(
                    'Cancel',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.pop(context);

                    //   ctxt,
                    //   new MaterialPageRoute(builder: (ctxt) => const MyApp()),
                  },

                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const MyApp()),
                  // );
                  // Navigator.of(context).popUntil((route) => route.isFirst);
                  // Signup obj= new Signup();
                  //     Navigator.push(context,
                  //   MaterialPageRoute(builder: (context)=> const Signup()));
                  //signup screen
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
