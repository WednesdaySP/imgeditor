import 'dart:io';
import 'package:border_blur/border_blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:imgeditor/screens/frames.dart';
import 'package:imgeditor/screens/image_controller.dart';


class HomePage extends StatelessWidget {
  final File? backimage;
  final String? shape;
  final ImageController imageController = Get.put(ImageController());

  HomePage({super.key, this.shape, this.backimage});

  check() {
    if (shape == 'Heart') {
      return HeartClipper();
    }
    if (shape == 'Square') {
      return SquareClipper();
    }
    if (shape == 'Rectangle') {
      return RectangleClipper();
    }
    if (shape == 'Circle') {
      return CircleClipper();
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    double hght = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.white,
        foregroundColor: const Color.fromARGB(255, 96, 94, 94),
        title: const Text(
          'Add Image / Icon',
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontFamily: 'SourceSerif',

          ),
        ),
        leading: IconButton(
          onPressed: () {
            SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 89, 88, 88),
            size: 30,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: hght * 0.19,
                width: wid * 90,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color.fromARGB(255, 96, 94, 94)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Container(
                      height: hght * 0.1,
                      padding: const EdgeInsets.all(20),
                      child: const Text(
                        'Upload Image',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: 'SourceSerif',
                          color: Color.fromARGB(255, 96, 94, 94),
                          
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(2)),
                      ),
                      onPressed: () => imageController.getImage(context),
                      child: const Text(
                        'Choose from Device',
                        style: TextStyle(fontFamily: 'SourceSarif', color: Colors.white, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              ClipPath(
                clipper: check(),
                child: Container(
                  height: hght * 0.6,
                  width: wid * 0.9,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(0)),
                  child: backimage != null
                      ? SizedBox(
                          height: hght * 0.1,
                          width: wid * 0.95,
                          child: Stack(
                            children: [
                              Image.file(
                                backimage!,
                                fit: BoxFit.cover,
                              ),
                              const BorderBlur(
                                blur: 15.0,
                                padding: 30.0,
                                radius: 2,
                              ),
                            ],
                          ),
                        )
                      : const Text('No image selected'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
