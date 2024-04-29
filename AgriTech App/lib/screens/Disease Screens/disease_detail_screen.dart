import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Models/disease_model.dart';

class DiseaseDetailScreen extends StatelessWidget {
  final Disease disease;
  dynamic image;

  DiseaseDetailScreen({required this.disease, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Disease Detail',
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.black.withOpacity(0.5),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.green, style: BorderStyle.solid),
              color: Colors.green.withOpacity(0.2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: image is String
                      ? Image.asset(
                          image,
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        )
                      : Image.file(
                          image,
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                ),
                SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    text: 'Disease Name: ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 2,
                        fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(
                        text: disease.name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 22),
                RichText(
                  text: TextSpan(
                    text: 'Disease Cause: ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 2,
                        fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(
                        text: disease.cause,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 22),
                RichText(
                  text: TextSpan(
                    text: 'Disease Solution: ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 2,
                        fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(
                        text: disease.solution,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
