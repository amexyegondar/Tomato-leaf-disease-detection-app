import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title:  Text('ማንነት',
          style: GoogleFonts.poppins(),
          ),
         
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Color.fromRGBO(207, 154, 40, 1),
                      child: CircleAvatar(
                        radius: 45,
                       backgroundImage: AssetImage("assets/agric.jpg"),                      ),
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.verified,color:Colors.green),
                      Text("የተረጋገጠ",style: GoogleFonts.poppins(),)
                    ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      'አቶ አበበ',
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Center(
                    child: Text(
                      'mike.s@example.com',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Color.fromRGBO(38, 54, 69, 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(onPressed: (){}, 
                      child: Text(
                        "የግብርና ባለሞያ",
                        style: GoogleFonts.poppins(),
                      ),
                      style: TextButton.styleFrom(
                        side: BorderSide(color:Color.fromRGBO(38, 54, 69, 1),),
                        minimumSize: Size(100, 40),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))
                      ),
                      ),SizedBox(width: 10,),
                       TextButton(onPressed: (){}, 
                      child: Text(
                        "10 አመት",
                        style: GoogleFonts.poppins(color: Colors.green),
                      ),
                      style: TextButton.styleFrom(
                        side: BorderSide(color:Color.fromRGBO(38, 54, 69, 1),),
                        minimumSize: Size(100, 40),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))
                      ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("እኔ የግብርና ባለሙያ ነኝ። ",style: GoogleFonts.poppins(),),
                  ),
                  ListTile(
                    leading: Icon(Icons.logout, color: Color.fromRGBO(38, 54, 69, 1)),
                    title: Text('ይውጡ', style: GoogleFonts.poppins(color: Color.fromRGBO(38, 54, 69, 1))),
                    trailing: Icon(Icons.arrow_forward_ios, color: Color.fromRGBO(38, 54, 69, 1)),
                    onTap: () {
                      // Handle logout tap
                    },
                  ),
                    
                  
            
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
