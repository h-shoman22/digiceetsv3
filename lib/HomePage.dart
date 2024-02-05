// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:main/image_picker_class.dart';
import 'package:main/login_page.dart';
import 'package:main/model_dialog.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DigiCeets'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to DigiCeets Home Page!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement any action you want on the home page
                // For example, you might want to navigate back to login page
                Get.offAll(() => LoginPage());
              },
              child: Text('Logout'),
            ),
            SizedBox(
              height: 5,
            ),
            FloatingActionButton.extended(
              onPressed: () {
                imagePickerModel(context, onCameraTap: () {
                  log("Camera");
                  pickImage(source: ImageSource.camera).then((value) {
                    if (value != '') {}
                  });
                }, onGalleryTap: () {
                  log("Gallery");
                  pickImage(source: ImageSource.gallery).then((value) {
                    if (value != '') {}
                  });
                });
              },
              tooltip: "Increment",
              label: const Text("Scan Photo"),
            )
          ],
        ),
      ),
    );
  }
}
