import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_se/hygiene.dart';
// import 'package:project_se/homepage.dart';
import 'package:project_se/main.dart';
// import 'package:project_se/update.dart';
// import 'package:project_se/homepage.dart';

class Update extends StatefulWidget {
  const Update({Key? key}) : super(key: key);

  @override
  _UpdateState createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  String name = "", id = "", email = "", contact = "";
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
                Text("Update",
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
                GestureDetector(
                  onTap: () async {
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
                    var resp = await FirebaseFirestore.instance
                        .collection('user')
                        .get();
                    for (int i = 0; i < resp.docs.length; i++) {
                      if (resp.docs[i]['id'] == id) {
                        resp.docs[i].reference.update({
                          'name': name,
                          // 'id': id1
                          'email': email,
                          'phone': contact
                        });
                        break;
                      }
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Hygiene()),
                    );
                  },
                  child: Container(
                    height: size.height / 14,
                    width: size.width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "Update ",
                      style: TextStyle(
                        fontSize: 19,
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
                    'Remind Me Later',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Hygiene()),
                    );

                    //   ctxt,
                    //   new MaterialPageRoute(builder: (ctxt) => const MyApp()),
                  },

                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const MyApp()),
                  // );
                  // Navigator.of(context).popUntil((route) => route.isFirst);
                  // Update obj= new Update();
                  //     Navigator.push(context,
                  //   MaterialPageRoute(builder: (context)=> const Update()));
                  //Update screen
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
