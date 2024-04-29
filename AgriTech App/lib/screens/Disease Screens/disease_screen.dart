import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Models/disease_model.dart';
import 'Widgets/disease_list.dart';

Future<String> _loadDiseaseData() async {
  return rootBundle.loadString('assets/disease_data.json');
}

class DiseasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black.withOpacity(0.5),
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(
          'Disease Categories',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/background.jpg'), // Adjust the path to your background image
            fit: BoxFit.cover,
          ),
        ),
        child: FutureBuilder(
          future: _loadDiseaseData(),
          builder: (context, AsyncSnapshot<String> snapshot) {
            if (snapshot.hasData) {
              List<Disease> diseases = parseDiseases(snapshot.data!);
              return DiseaseList(diseases: diseases);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
