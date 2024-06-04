import 'package:flutter/material.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:imgeditor/screens/Home_Page.dart';
import 'package:imgeditor/screens/dialog_controller.dart';


class DialogBox extends StatelessWidget {
  final File? image;
  final DialogController dialogController = Get.put(DialogController());

  DialogBox({super.key, this.image});

  @override
  Widget build(BuildContext context) {
    double wid = MediaQuery.of(context).size.width;
    List frames = ['assets/images/1.png', 'assets/images/2.png', 'assets/images/3.png', 'assets/images/4.png'];
    List shapelist = ['Heart', 'Square', 'Circle', 'Rectangle'];

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 120, horizontal: 30),
      shape: const BeveledRectangleBorder(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'Uploaded Image',
            style: TextStyle(
              
              fontWeight: FontWeight.w300,
              fontFamily: 'SourceSerif',
              color: Color.fromARGB(255, 116, 115, 115),
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 5),
          Container(
            height: 150,
            width: 100,
            child: image != null
                ? Image.file(
                    image!,
                    fit: BoxFit.cover,
                  )
                : const Text(''),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 10),
              buildShapeButton(wid, 'Original', null),
              buildShapeButton(wid, frames[0], shapelist[0]),
              buildShapeButton(wid, frames[1], shapelist[1]),
              buildShapeButton(wid, frames[2], shapelist[2]),
              buildShapeButton(wid, frames[3], shapelist[3]),
              const SizedBox(width: 10),
            ],
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              backgroundColor: Colors.teal,
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            onPressed: () {
              print('Shape selected: ${dialogController.shape.value}'); // Debugging
              print('Image selected: $image'); // Debugging
             
                Navigator.push(
                   context, MaterialPageRoute( 
                    builder: (context) => HomePage(
                      shape: dialogController.shape.value, backimage: image),
                       ), );
            },
            child: const Text(
              'Use this image',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildShapeButton(double width, String framePath, String? shape) {
    return Container(
      padding: const EdgeInsets.all(3),
      height: width * 0.1,
      width: width * 0.1,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          print('$shape selected');
          dialogController.setShape(shape);
        },
        child: framePath == 'Original'
            ? const Padding(
                padding: EdgeInsets.only(left: 3, top: 5),
                child: Text(
                  'Org',
                  style: TextStyle(fontSize: 15),
                ),
              )
            : Image.asset(framePath),
      ),
    );
  }
}

