import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'Disease Screens/Models/disease_model.dart';
import 'Disease Screens/disease_detail_screen.dart';

class MoreDetailScreen extends StatelessWidget {
  final String diseaseName;
  final File? image;

  MoreDetailScreen({required this.diseaseName, required this.image});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadDiseaseData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Disease Details'),
            ),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Disease Details'),
            ),
            body: Center(
              child: Text('Error loading disease data'),
            ),
          );
        } else {
          List<Disease> diseases = parseDiseases(snapshot.data.toString());
          // Find the disease with the matching name
          Disease? selectedDisease;
          for (var disease in diseases) {
            if (disease.name == diseaseName) {
              selectedDisease = disease;
              break;
            }
          }

          if (selectedDisease == null) {
            // Handle case where disease is not found
            return Scaffold(
              appBar: AppBar(
                title: Text('Disease Details'),
              ),
              body: Center(
                child: Text('Disease not found'),
              ),
            );
          }

          // Display details of the found disease
          return DiseaseDetailScreen(
            disease: selectedDisease,
            image: image,
          );
        }
      },
    );
  }
}

Future<String> _loadDiseaseData() async {
  return rootBundle.loadString('assets/disease_data.json');
}
