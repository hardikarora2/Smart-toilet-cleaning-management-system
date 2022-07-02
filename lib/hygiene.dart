import 'package:flutter/material.dart';

import 'package:project_se/main.dart';
import 'package:project_se/update.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

// import 'package:project_se/homepage.dart';
int gas = 5, turbidity = 100;

class Hygiene extends StatefulWidget {
  const Hygiene({Key? key}) : super(key: key);

  @override
  _HygieneState createState() => _HygieneState();
}

class _HygieneState extends State<Hygiene> {
  @override
  static const String _title = 'Toilet Management';
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    int gass = 0, turb = 0;
    return Scaffold(
      appBar: AppBar(title: Center(child: Text(_title))),
      body: SafeArea(

        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              children: [
                //  Text("Welcome",style: TextStyle(fontSize: 30, color: Colors.black)),
                const Padding(
                  padding: EdgeInsets.fromLTRB(20,20,20,20),
                  child: Text("Hygiene Configuration",
                      style: TextStyle(fontSize: 30, color: Colors.blue)),
                ),
                // Center(
                //   child: Image.asset('assets/images/sign-up.png',
                //     width: 200,
                //     height: 200,),
                // ),
                // SizedBox(height: 15,),
                // TextField(
                //   decoration: InputDecoration(
                //       labelText: "Name",
                //       labelStyle: TextStyle(fontSize: 15,color: Colors.grey.shade800),
                //       border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                //   ),
                // ),
                // SizedBox(height: 15,),
                // TextField(
                //   decoration: InputDecoration(
                //       labelText: "Id",
                //       labelStyle: TextStyle(fontSize: 15,color: Colors.grey.shade800),
                //       border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                //   ),
                //
                // ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  onChanged: (value) {
                    if (value != "") gass = int.parse(value);
                  },
                  decoration: InputDecoration(
                      labelText: "Enter Gas Sensor Value",
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
                    if (value != "") turb = int.parse(value);
                  },
                  // obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Enter Turbidity Sensor Value",
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
                  onTap: () {
                    if (gass > gas && turb > turbidity) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("High Gas Sensor & Turbidity Value"),
                              content: Text("Please Take Care of Everything"),
                              actions: [
                                ElevatedButton(
                                  onPressed: ()
                                  {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Hygiene()),
                                    );
                                  },
                                  child: Text("Exit"),
                                ),
                              ],
                            );
                          });
                    } else if (gass > gas) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("High Gas Sensor Value"),
                              content: Text("Please Take Care of Gas Sensor"),
                              actions: [
                                ElevatedButton(
                                  onPressed: ()
                                  {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Hygiene()),
                                    );
                                  },
                                  child: Text("Exit"),
                                ),
                              ],
                            );
                          });
                    }
                    else if (turb > turbidity) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("High Turbidity Value"),
                              content: Text("Please Take Care of Turbidity"),
                              actions: [
                                ElevatedButton(
                                  onPressed: ()
                                  {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Hygiene()),
                                    );
                                  },
                                  child: Text("Exit"),
                                ),
                              ],
                            );
                          });
                    }
                    else
                      {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Everything is fine"),
                                content: Text("Good to go"),
                                actions: [
                                  ElevatedButton(
                                    onPressed: ()
                                  {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Hygiene()),
                                    );
                                  },
                                    child: Text("Exit"),
                                  ),
                                ],
                              );
                            });
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
                  // Hygiene obj= new Hygiene();
                  //     Navigator.push(context,
                  //   MaterialPageRoute(builder: (context)=> const Hygiene()));
                  //Hygiene screen
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
