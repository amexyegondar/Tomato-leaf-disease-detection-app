import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class TextContainer extends StatelessWidget {
   TextContainer({required this.title,required this.description});
  final String title;
  final  String description;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
             width: MediaQuery.of(context).size.width*0.9
             ,
                decoration: BoxDecoration(
                  border: Border.all(width: 2,color: Colors.green),
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey
                ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(title,style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w600),),
                        SelectableText(description,style: GoogleFonts.poppins(),),
                      ],
                    ),
                  ),
                ),
    );
  }
}