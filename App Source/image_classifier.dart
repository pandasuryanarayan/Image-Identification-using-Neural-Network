import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tensorflow_lite_flutter/tensorflow_lite_flutter.dart';
import 'dart:io';

class ImageClassifier extends StatefulWidget {
  const ImageClassifier({super.key});

  @override
  State<ImageClassifier> createState() => _ImageClassifierState();
}

class _ImageClassifierState extends State<ImageClassifier> {
  File? _image;
  List? _result;
  String _confidence = "";
  String _name = "";

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "lib/image_identification.tflite", // Path to your TFLite model
      labels: "lib/labels.txt", // Path to your labels file
    );
  }

  classifyImage(File image) async {
    var result = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 1, // Return the top result
      threshold: 0.8, // Confidence threshold
      imageMean: 0.0, // Use 0.0 if your model expects pixel values in [0,1]
      imageStd: 1.0, // Use 1.0 if your model expects pixel values in [0,1]
    );

    setState(() {
      _result = result;
      _name = _result != null ? _result![0]['label'] : "Unknown";
      _confidence = _result != null
          ? (_result![0]['confidence'] * 100.0).toStringAsFixed(2) + "%"
          : "";
    });
  }

  pickImage() async {
    final picker = ImagePicker();
    var image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Classifier Using CNN"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image == null
                ? const Text(
                    "No image selected.",
                    style: TextStyle(fontSize: 24), // Increased font size
                  )
                : Image.file(_image!),
            const SizedBox(height: 16),
            _result == null
                ? Container()
                : Text(
                    "Detected: $_name\nConfidence: $_confidence",
                    style: const TextStyle(fontSize: 24), // Increased font size
                  ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: pickImage,
              child: const Text(
                "Pick Image from Gallery",
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }
}
