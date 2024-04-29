// Copyright (c) 2022 Kodeco LLC

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.

// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
// distribute, sublicense, create a derivative work, and/or sell copies of the
// Software in any work that is designed, intended, or marketed for pedagogical
// or instructional purposes related to programming, coding,
// application development, or information technology.  Permission for such use,
// copying, modification, merger, publication, distribution, sublicensing,
// creation of derivative works, or sale is expressly withheld.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import '../classifier/classifier.dart';
import '../custom_widgets/custom_drawer.dart';
import '../main.dart';
import '../screens/more_detail_screen.dart';
import '../styles.dart';
import 'plant_photo_view.dart';

const _labelsFileName = 'assets/labels.txt';
const _modelFileName = 'model_unquant.tflite';

class PlantRecogniser extends StatefulWidget {
  const PlantRecogniser({super.key});

  @override
  State<PlantRecogniser> createState() => _PlantRecogniserState();
}

enum _ResultStatus {
  notStarted,
  notFound,
  found,
}

class _PlantRecogniserState extends State<PlantRecogniser> {
  bool _isAnalyzing = false;
  final picker = ImagePicker();
  File? _selectedImageFile;

  // Result
  _ResultStatus _resultStatus = _ResultStatus.notStarted;
  String _plantLabel = ''; // Name of Error Message
  double _accuracy = 0.0;

  late Classifier _classifier;

  bool _navigate = true;
  @override
  void initState() {
    super.initState();
    _loadClassifier();
  }

  Future<void> _loadClassifier() async {
    debugPrint(
      'Start loading of Classifier with '
      'labels at $_labelsFileName, '
      'model at $_modelFileName',
    );

    final classifier = await Classifier.loadWith(
      labelsFileName: _labelsFileName,
      modelFileName: _modelFileName,
    );
    _classifier = classifier!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black.withOpacity(0.5),
        title: const Text(
          'Plant Disease Detection',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: CustomDrawer(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Plant Recogniser',
                style: kTitleTextStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              _buildPhotolView(),
              const SizedBox(height: 10),
              _buildResultView(),
              const SizedBox(height: 20),
              _buildPickPhotoButton(
                title: 'Take a photo',
                source: ImageSource.camera,
              ),
              _buildPickPhotoButton(
                title: 'Pick from gallery',
                source: ImageSource.gallery,
              ),
              TextButton(
                onPressed: () {
                  if (mounted) {
                    setState(() {
                      _selectedImageFile = null;
                      _plantLabel = ''; // Name of Error Message
                      _accuracy = 0.0;
                      _resultStatus = _ResultStatus.notStarted;
                    });
                  }
                },
                child: Container(
                  width: 300,
                  height: 50,
                  color: Colors.green,
                  child: Center(
                      child: Text('Clear',
                          style: const TextStyle(
                            fontFamily: kButtonFont,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                            color: kColorLightYellow,
                          ))),
                ),
              ),
              _resultStatus == _ResultStatus.found
                  ? TextButton(
                      onPressed: () {
                        if (_plantLabel.isNotEmpty &&
                            _resultStatus == _ResultStatus.found) {
                          String label = _plantLabel
                              .substring(0, _plantLabel.indexOf('('))
                              .trim();
                          print('lable ${label}');
                          Get.to(() => MoreDetailScreen(
                                diseaseName: label,
                                image: _selectedImageFile,
                              ));
                        }
                      },
                      child: Container(
                        width: 300,
                        height: 50,
                        color: Colors.green,
                        child: Center(
                            child: Text('More',
                                style: const TextStyle(
                                  fontFamily: kButtonFont,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                  color: kColorLightYellow,
                                ))),
                      ),
                    )
                  : SizedBox()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPhotolView() {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        PlantPhotoView(file: _selectedImageFile),
        _buildAnalyzingText(),
      ],
    );
  }

  Widget _buildAnalyzingText() {
    if (!_isAnalyzing) {
      return const SizedBox.shrink();
    }
    return const Text('Analyzing...', style: kAnalyzingTextStyle);
  }

  Widget _buildPickPhotoButton({
    required ImageSource source,
    required String title,
  }) {
    return TextButton(
      onPressed: () => _onPickPhoto(source),
      child: Container(
        width: 300,
        height: 50,
        color: Colors.green,
        child: Center(
            child: Text(title,
                style: const TextStyle(
                  fontFamily: kButtonFont,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: kColorLightYellow,
                ))),
      ),
    );
  }

  void _setAnalyzing(bool flag) {
    setState(() {
      _isAnalyzing = flag;
    });
  }

  void _setNavigation(bool navigation) {
    setState(() {
      _navigate = navigation;
    });
  }

  void _onPickPhoto(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile == null) {
      return;
    }

    final imageFile = File(pickedFile.path);
    setState(() {
      _selectedImageFile = imageFile;
    });

    _analyzeImageAndSave(imageFile);
  }

  Future<void> _analyzeImageAndSave(File image) async {
    _setNavigation(false);
    _setAnalyzing(true);

    final imageInput = img.decodeImage(image.readAsBytesSync())!;
    final resultCategory = _classifier.predict(imageInput);

    final result = resultCategory.score >= 0.8
        ? _ResultStatus.found
        : _ResultStatus.notFound;
    final plantLabel = resultCategory.label;
    final accuracy = resultCategory.score;

    _setAnalyzing(false);

    setState(() {
      _resultStatus = result;
      _plantLabel = plantLabel;
      _accuracy = accuracy;
    });

    if (_resultStatus == _ResultStatus.found) {
      // Save image to Firebase Storage
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('images/${DateTime.now().millisecondsSinceEpoch}.jpg');
      final uploadTask = storageRef.putFile(image);
      final snapshot = await uploadTask.whenComplete(() {});

      // Get the download URL of the uploaded image
      final imageUrl = await snapshot.ref.getDownloadURL();

      // Save the URL and static data to Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('History')
          .add({
        'name': _plantLabel,
        'imageUrl': imageUrl,
        'accuracy': (_accuracy * 100).toStringAsFixed(2),
        'timestamp': DateTime.now()
      });
      _setNavigation(true);
    }
  }

  Widget _buildResultView() {
    var title = '';

    if (_resultStatus == _ResultStatus.notFound) {
      title = 'Fail to recognise';
    } else if (_resultStatus == _ResultStatus.found) {
      title = _plantLabel;
    } else {
      title = '';
    }

    //
    var accuracyLabel = '';
    if (_resultStatus == _ResultStatus.found) {
      accuracyLabel = 'Accuracy: ${(_accuracy * 100).toStringAsFixed(2)}%';
    }

    return Column(
      children: [
        Text(title, style: kResultTextStyle),
        const SizedBox(height: 10),
        Text(accuracyLabel, style: kResultRatingTextStyle)
      ],
    );
  }
}
