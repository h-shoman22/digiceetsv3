//part of the widgets section.
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void imagePickerModel(BuildContext context, {VoidCallback? onCameraTap, VoidCallback? onGalleryTap}) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,// Set width to full screen width
          height: 220,
          child: Column(
            children: [
              GestureDetector(
                onTap: onCameraTap,
                child: Card(
                  // ignore: avoid_unnecessary_containers
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration( color: Colors.grey),
                    child: const Text( "Camera",
                      style: 
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        
                    ),
                    
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: onGalleryTap,
                child: Card(
                  // ignore: avoid_unnecessary_containers
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration( color: Colors.grey),
                    child: const Text( "Gallery",
                      style: 
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        
                    ),
                    
                  ),
                ),
              )
              ],
          ),
          );
      });
}
