import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PredictWidget extends StatelessWidget {
  final String type;
  final Function getimage;

  const PredictWidget({required this.type, required this.getimage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: ElevatedButton(
          onPressed: () {
            getimage();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            minimumSize: Size(200, 40),
          ),
          child: Text(type, style: GoogleFonts.poppins(color: Colors.black)),
        ),
      ),
    );
  }
}
