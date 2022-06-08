import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_buy/Controllers/shop_controller.dart';
import 'package:smart_buy/Widgets/texts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Get.offNamed('/home'),
    );
  }

  @override
  Widget build(BuildContext context) {
    ShopController shopController = Get.put(ShopController(),permanent: true);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          height: size.height,
          width: size.width,
          alignment: Alignment.center,
          child: const HeadingWidget(
           text:  'Smart Buy',
          )),
    );
  }
}
