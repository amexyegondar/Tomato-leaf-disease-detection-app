import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_classification/model/tomato_diseaes.dart';
import 'package:image_classification/widgets/text_container.dart';

class DiseaseDetailScreen extends StatelessWidget {
  DiseaseDetailScreen({required this.disease});
  final TomatoDisease disease;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _showImageDialog(context, disease.imageURL);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: MediaQuery.of(context).size.height * 0.22,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(disease.imageURL[0]),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(width: 2, color: Colors.green),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          _showImageDialog(context, disease.imageURL);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: MediaQuery.of(context).size.height * 0.22,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(disease.imageURL[1]),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(width: 2, color: Colors.green),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                TextContainer(title: "መንሰኤ", description: disease.cause),
                const SizedBox(height: 20),
                TextContainer(title: "መከላከያ", description: disease.prevention),
                const SizedBox(height: 20),
                TextContainer(title: "መፈወሻ", description: disease.treatment),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))  ,
                      minimumSize: Size(100, 40),
                    ), 
                    child: Text("ይመለሱ",style:GoogleFonts.poppins(color:Colors.black))),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showImageDialog(BuildContext context, List<dynamic> imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,

          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: imageUrl.length,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  Icon(Icons.arrow_back_ios_new_outlined,size: 30,color:Colors.white),
                 Image.asset(imageUrl[index],),
                  Icon(Icons.arrow_forward_ios_outlined,color:Colors.white)
                ],
              );
            },
          ),
        );
      },
    );
  }
}
