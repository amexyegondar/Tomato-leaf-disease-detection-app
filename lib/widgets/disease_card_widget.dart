import 'package:flutter/material.dart';
import 'package:image_classification/model/tomato_diseaes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_classification/screens/chat_screen.dart';
import 'package:image_classification/screens/disease_detail_screen.dart';
import 'package:image_classification/screens/predict_screen.dart';
class DiseaseCardWidget extends StatelessWidget {
const DiseaseCardWidget({required this.disease});
final TomatoDisease disease;
  @override
  Widget build(BuildContext context) {
    return Container(
     child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(disease.name,style: GoogleFonts.poppins(fontSize: 20,fontWeight:FontWeight.w600),),
              Container(
                width: MediaQuery.of(context).size.width*0.9,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(image:AssetImage(disease.imageURL[1]),fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(5),
                ),
                
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("መንሰኤ",style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                  SelectableText(disease.cause,style: GoogleFonts.poppins(fontSize: 12)),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DiseaseDetailScreen(disease: disease)));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))  ,
                      minimumSize: Size(100, 40),
                    ), 
                    child: Text("ዝርዝር",style:GoogleFonts.poppins(color:Colors.black))),
                  ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen()));

                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))  ,
                      minimumSize: Size(100, 40),
                      side: BorderSide(color: Colors.green,width: 1)
                    ),  
                  child: Text("ይገናኙ",style:GoogleFonts.poppins(color:Colors.black))),
                ],
              )
            ],
          ),
        ),
      )
     
    );
  }
}