import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_classification/model/tomato_diseaes.dart';
import 'package:image_classification/widgets/disease_card_widget.dart';
import 'package:image_classification/service/tomato_disease_service.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({super.key});

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  TextEditingController _querycontroller = TextEditingController();
  List<dynamic> _filteredDiseases = tomato_disease;
  
  @override
  void initState() {
    super.initState();
    _filteredDiseases = tomato_disease;
    _querycontroller.addListener(_filterDiseases);
  }
  void _filterDiseases() {
    String query = _querycontroller.text.toLowerCase();
    setState(() {
      _filteredDiseases = _filteredDiseases.where((disease) {
        return disease.name.toLowerCase().contains(query) ||
            disease.cause.toLowerCase().contains(query);
      }).toList();
    });
  }


  @override
  void dispose() {
    _querycontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.84,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: GoogleFonts.poppins(),
                  autofocus: false,
                  controller: _querycontroller,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                      labelText: 'ፈልግ',
                      labelStyle:
                          GoogleFonts.poppins(color: Colors.grey, fontSize: 13)),
                ),
               
              ),
               Text("ጤናማ 🍅",style:TextStyle(
                  fontSize:25,
                  fontWeight:FontWeight.w900,
                )),
              Expanded(
                child: ListView.builder(
                  itemCount: _filteredDiseases.length,
                  itemBuilder: (BuildContext context, int index) {
                    var disease = _filteredDiseases[index];
                    return DiseaseCardWidget(disease: disease);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
