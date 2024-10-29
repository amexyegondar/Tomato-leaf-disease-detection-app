import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_classification/widgets/predict_widget.dart';
import 'package:images_picker/images_picker.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:tflite/tflite.dart';

class PredictScreen extends StatefulWidget {
  const PredictScreen({super.key});

  @override
  State<PredictScreen> createState() => _PredictScreenState();
}

class _PredictScreenState extends State<PredictScreen> {
  File? selectedImage;
  String? message = '';
  bool isfromgalleyscreen = true;
  bool isLoading = false;
  String? predictionResult;
  String? errorMessage;

  // Future getImage() async {
  //   final pickedImage = await ImagesPicker.pick(count: 1, pickType: PickType.image);
  //   if (pickedImage != null && pickedImage.isNotEmpty) {
  //     selectedImage = File(pickedImage.first.path);
  //     setState(() {});
  //   }
  // }

  // Future getimagefromCamera() async {
  //   final pickedImage = await ImagesPicker.openCamera();
  //   if (pickedImage != null && pickedImage.isNotEmpty) {
  //     selectedImage = File(pickedImage.first.path);
  //     setState(() {});
  //   }
  // }

  // Future uploadImage() async {
  //   if (selectedImage == null) return;

  //   setState(() {
  //     isLoading = true;
  //     predictionResult = null;
  //     errorMessage = null;
  //   });

  //   final request = http.MultipartRequest("POST", Uri.parse("https://d923-196-188-198-244.ngrok-free.app/upload"));
  //   final headers = {"Content_Type": "multipart/form-data"};
  //   request.files.add(
  //     http.MultipartFile(
  //       'image',
  //       selectedImage!.readAsBytes().asStream(),
  //       selectedImage!.lengthSync(),
  //       filename: selectedImage!.path.split("/").last,
  //     ),
  //   );
  //   request.headers.addAll(headers);

  //   try {
  //     final response = await request.send();
  //     final res = await http.Response.fromStream(response);
  //     final resJson = jsonDecode(res.body);
  //     setState(() {
  //       predictionResult = resJson['message'];
  //       isLoading = false;
  //     });
  //   } catch (e) {
  //     setState(() {
  //       errorMessage = e.toString();
  //       isLoading = false;
  //       print(e.toString());
  //     });
  //   }
  // }
 Future<void> loadModel() async {
    try {
      await Tflite.loadModel(
        model: 'lib/model/tomatoDisease.tflite', // Adjust the path to where your model is located
        labels: 'assets/labels.txt', // Optional: path to a file with labels
      );
    } catch (e) {
      print('Failed to load model: $e');
    }
  }

  Future getImage() async {
    final pickedImage = await ImagesPicker.pick(count: 1, pickType: PickType.image);
    if (pickedImage != null && pickedImage.isNotEmpty) {
      selectedImage = File(pickedImage.first.path);
      setState(() {});
    }
  }

  Future getimagefromCamera() async {
    final pickedImage = await ImagesPicker.openCamera();
    if (pickedImage != null && pickedImage.isNotEmpty) {
      selectedImage = File(pickedImage.first.path);
      setState(() {});
    }
  }

  Future<void> classifyImage() async {
    if (selectedImage == null) return;

    setState(() {
      isLoading = true;
      predictionResult = null;
      errorMessage = null;
    });

    try {
      
      final result = await Tflite.runModelOnImage(
        path: selectedImage!.path,
        numResults: 3,
        threshold: 0.5, 
      );

      if (result != null && result.isNotEmpty) {
        setState(() {
          predictionResult = result[0]['label']; 
          isLoading = false;
        });
      } else {
        setState(() {
          predictionResult = 'No result';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
        print(e.toString());
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ትንበያ', style: GoogleFonts.poppins()),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isfromgalleyscreen = true;
                        });
                      },
                      style:isfromgalleyscreen ? TextButton.styleFrom(
                         side:BorderSide(width: 2,color: Colors.green) 
                      ) : null,
                      child: Text("ከማህደር", style: GoogleFonts.poppins(color: Colors.black)),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isfromgalleyscreen = false;
                        });
                      },
                      style:isfromgalleyscreen ? null :  TextButton.styleFrom(
                         side:BorderSide(width: 2,color: Colors.green) 
                      ),
                      child: Text("ከካሜራ", style: GoogleFonts.poppins(color: Colors.black)),
                    ),
                  ],
                ),
                SizedBox(height: 50,),
                isfromgalleyscreen
                    ? PredictWidget(type: 'ከማህደር ይውሰዱ', getimage: getImage)
                    : PredictWidget(type: 'ፎቶ ያንሱ', getimage: getimagefromCamera),
                SizedBox(height: 16),
                selectedImage != null
                    ? Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: Image.file(selectedImage!),
                      )
                    : Text('ፋይል አልተመረጠም', style: GoogleFonts.poppins()),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: classifyImage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    minimumSize: Size(200, 40),
                  ),
                  child: Text("ተንብይ", style: GoogleFonts.poppins(color: Colors.white)),
                ),
                SizedBox(height: 16),
                if (isLoading) CircularProgressIndicator(
                  color: Colors.green,
                ),
                if (predictionResult != null)
                  Text('ውጤት: $predictionResult', style: GoogleFonts.poppins()),
                if (errorMessage != null)
                  Text('ስህተት: $errorMessage', style: GoogleFonts.poppins(color: Colors.red)),
                  if(predictionResult!=null) Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        
                        onPressed: (){
                          
                        },
                        icon: Icon(Icons.share_sharp,size: 30,)),
                        IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.bookmark,size: 30,)),
                    ],
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
