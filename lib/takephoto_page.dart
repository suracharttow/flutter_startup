import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TakePhotoPage extends StatefulWidget {
  const TakePhotoPage({Key? key}) : super(key: key);

  @override
  State<TakePhotoPage> createState() => _TakePhotoPageState();
}

enum AppState { clear, picking, picked, cropped }

class _TakePhotoPageState extends State<TakePhotoPage> {
  bool isLoading = false;

  AppState state = AppState.clear;
  File? mainImageFile;
  final ImagePicker imagePicker = ImagePicker();
  late String fileName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Take Photo'),
        elevation: 10,
        backgroundColor: const Color(0xFF765EFC),
        leading: Container(
          padding: const EdgeInsets.all(5),
          child: Image.asset('assets/images/logo.png'),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        color: Colors.black12,
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              alignment: Alignment.center,
              color: Colors.white,
              height: 200,
              child: isLoading
                  ? Text('Loading...')
                  : mainImageFile != null
                      ? Image.file(
                          mainImageFile!,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          'assets/images/placeholder.png',
                        ),
            ),
            Container(
              alignment: Alignment.center,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                    onPressed: () async {
                      // --- Pick Gallery
                      _pickImage(ImageSource.gallery);
                    },
                    child: const Text('Pick Gallery'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red,
                    ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                    onPressed: () {
                      // --- Take Photo
                      _pickImage(ImageSource.camera);
                    },
                    child: const Text('Take Photo'),
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    setState(() {
      isLoading = true;
    });

    try {
      final picked = await imagePicker.pickImage(source: source);

      if (picked != null) {
        setState(() {
          mainImageFile = File(picked.path);
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }
}
