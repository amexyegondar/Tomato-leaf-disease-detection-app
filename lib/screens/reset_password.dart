import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _emailController=TextEditingController();
  String msg='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
       body:Padding(
         padding: const EdgeInsets.all(8.0),
         child: Container(
         
          child: Column(
         
            children: [
              const SizedBox(height: 100,),
              Card(
                child: TextField(
                  style: GoogleFonts.poppins(),
                controller: _emailController,
                 decoration: InputDecoration(
                  hintText: "ኢሜል ያስገቡ",
                  hintStyle: GoogleFonts.poppins(),
                  border: OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.email), 
                 ),
                ),
         
              ),
              Text(msg,style: GoogleFonts.poppins(),),
               const SizedBox(height: 50,),
              ElevatedButton.icon(
                onPressed: (){
              FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text).then((value) {
                setState(() {
                  msg='ማረጋገጫ መልእክት ልከንሎታል።';
                });
                _emailController.text="";
              }).onError((error, stackTrace) {
                print(error.toString());
                   setState(() {
                  msg=error.toString();
                  _emailController.text="";
                });
              });
                }, 
                icon: const Icon(Icons.restore), 
                label:  Text("እንደገና ያስቀምጡ",style: GoogleFonts.poppins(),),
                
                style:ButtonStyle(
                  backgroundColor:WidgetStateProperty.all(const Color.fromARGB(255, 105, 223, 109)),
                  minimumSize:WidgetStateProperty.all(const Size(200, 50)) ,
                  
                  shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))),
              )
            ],
          ),
         ),
       ),
    );
  }
}