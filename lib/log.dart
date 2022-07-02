import 'package:flutter/material.dart';

import 'package:project_se/main.dart';
import 'package:project_se/update.dart';
// import 'package:project_se/homepage.dart';

class Log extends StatefulWidget {
  const Log({ Key? key }) : super(key: key);

  @override
  _LogState createState() => _LogState();
}

class _LogState extends State<Log> {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding:EdgeInsets.symmetric(horizontal: 15,vertical: 20),
            child: Column(
              children: [
                //  Text("Welcome",style: TextStyle(fontSize: 30, color: Colors.black)),
                Text("Activity Details",style: TextStyle(fontSize: 30, color: Colors.blue)),
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
                SizedBox(height: 15,),
                TextField(
                  decoration: InputDecoration(
                      labelText: "Enter Work done",
                      labelStyle: TextStyle(fontSize: 15,color: Colors.grey.shade800),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                  ),

                ),
                SizedBox(height: 15,),
                TextField(
                  // obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Enter time",

                      labelStyle: TextStyle(fontSize: 15,color: Colors.grey.shade800),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                  ),
                  // readOnly: true,  //set it true, so that user will not able to edit text
                  // onTap: () async {
                  //   TimeOfDay pickedTime =  await showTimePicker(
                  //     initialTime: TimeOfDay.now(),
                  //     context: context,
                  //   );
                  //
                  //   if(pickedTime != null ){
                  //     print(pickedTime.format(context));   //output 10:51 PM
                  //     DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
                  //     //converting to DateTime so that we can further format on different pattern.
                  //     print(parsedTime); //output 1970-01-01 22:53:00.000
                  //     String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
                  //     print(formattedTime); //output 14:59:00
                  //     //DateFormat() is from intl package, you can format the time on any pattern you need.
                  //
                  //     setState(() {
                  //       timeinput.text = formattedTime; //set the value of text field.
                  //     });
                  //   }else{
                  //     print("Time is not selected");
                  //   }
                  // },
               //   keyboardType:TextInputType.phone,
                ),
                SizedBox(height: 15,),
                Container(
                  height: size.height / 14,
                  width: size.width,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: Colors.blue,
                      borderRadius: BorderRadius.circular(5)),
                  child: Text("Submit ",
                    style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.bold),),
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
                  // Log obj= new Log();
                  //     Navigator.push(context,
                  //   MaterialPageRoute(builder: (context)=> const Log()));
                  //Log screen

                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}