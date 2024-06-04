import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imgeditor/screens/Home_Page.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _navigatehome();

  }

  _navigatehome() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Get.to(HomePage());
  }

  @override
  Widget build(BuildContext context) {
    double hght = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Scaffold(
            body: SafeArea(
                child: Stack(
      children: [
        Container(
          height: hght,
          width: wid,
          child: Image.asset('assets/images/splash.jpg', fit: BoxFit.cover),
        ),
       
      ],
    ))));
  }
}