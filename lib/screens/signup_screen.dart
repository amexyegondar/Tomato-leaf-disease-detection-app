import 'package:flutter/material.dart';
import 'package:image_classification/main.dart';
import 'package:image_classification/screens/home_screen_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  final TextEditingController _usernameController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
        title:  Text("መመዝገቢያ",
         style: GoogleFonts.poppins( 
          
          fontSize: 30,
          fontWeight: FontWeight.w700
          ),
          
        ),
        backgroundColor:const Color.fromARGB(255, 255, 255, 255),
        leading: null,
        
       ),
       body:
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                  
              children: [
              TextFormField(
              style: GoogleFonts.poppins(),
              controller: _usernameController,
              decoration:  InputDecoration(
              prefixIcon:Icon(Icons.person) ,
              border: OutlineInputBorder(),
              labelText: 'መጠቀሚያ ስም ያስገቡ',
              labelStyle: GoogleFonts.poppins(color: Colors.grey,fontSize:13)
              ),
                        ),
            const SizedBox(
              height: 20,
            ),
              TextFormField(
                style: GoogleFonts.poppins(),
                controller: _emailController,
              decoration:  InputDecoration(
              prefixIcon:Icon(Icons.email) ,
              border: OutlineInputBorder(),
              labelText: 'ኢሜል ያስገቡ',
              labelStyle: GoogleFonts.poppins(color: Colors.grey,fontSize:13)
              ),
                        ),
            const SizedBox(height: 20,),
            TextFormField(
              style: GoogleFonts.poppins(),
              controller: _passwordController,
               obscureText: true,
            decoration:  InputDecoration(
            prefixIcon: Icon(Icons.lock,
            ),
            
            border: OutlineInputBorder(),
            labelText: 'የይለፍ ቃል ያስገቡ',
            labelStyle: GoogleFonts.poppins(color: Colors.grey,fontSize:13)
            ),
                      ),
            const SizedBox(height: 20,),
            Tohome(_emailController,_passwordController),
            const SizedBox(
              height: 20,
            ),
                   const Tologin(),
            
            ] 
            )
            ),
          ),
        ),
        
        
       
    )
          
    ;
  }
}

class Tologin extends StatelessWidget {
  const Tologin({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text('አካውንት አለኝ።',style: GoogleFonts.poppins(),),
            GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyApp()));
          },
          child:  Text(
            "ግባ",
            style: GoogleFonts.poppins(color: Colors.blueAccent, fontWeight: FontWeight.bold),
          ),
        )
          ],
        );
  }
}

class Tohome extends StatefulWidget {
  final TextEditingController _emailController;

  final TextEditingController _passwordController;



  const Tohome(this._emailController,this._passwordController, {super.key});

  @override
  State<Tohome> createState() => _TohomeState();
}

class _TohomeState extends State<Tohome> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
          
          style: const ButtonStyle(
            minimumSize: WidgetStatePropertyAll<Size>(Size(250,40)),
             backgroundColor: WidgetStatePropertyAll<Color>(Color.fromARGB(255, 70, 224, 23)),
            
          ),
          onPressed: (){
            FirebaseAuth.instance.createUserWithEmailAndPassword(email: widget._emailController.text, password: widget._passwordController.text).
            then((value) {
           Navigator.push(context,MaterialPageRoute(builder: (context)=>const HomeScreenWidget()));
          print("New account created");
            } ).onError((error, stackTrace) {
              print(error.toString());
            });
          }, 
        
        child:  Text("ተመዝገብ",style: GoogleFonts.poppins(),));
  }
}