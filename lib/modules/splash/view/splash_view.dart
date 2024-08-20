import 'package:flutter/material.dart';
import 'package:flutter_application/DB/cache_handler.dart';
import 'package:flutter_application/modules/Root%20Navigation/View/root_navgation.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';

import '../../auth/view/login_view.dart';

class SlashView extends StatefulWidget {
  const SlashView({super.key});

  @override
  State<SlashView> createState() => _SlashViewState();
}

class _SlashViewState extends State<SlashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      checkToken();
    });
  }

  checkToken() async {
    String accessToken = await CacheHandler().getToken();

    if (accessToken.isNotEmpty) {
      Get.offAll(const RootNavigationView());
      // Navigator.pushAndRemoveUntil(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => const RootNavigationView(),
      //   ),
      //   (route) => false,
      // );
    } else {
      Get.offAll(LoginView());
      // Navigator.of(context).pushAndRemoveUntil(
      //   MaterialPageRoute(
      //     builder: (context) => LoginView(),
      //   ),
      //   (route) => false,
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              "assets/backgrounds/IndianFood.jpeg",
              fit: BoxFit.cover,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 50),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Food App",
                style: TextStyle(
                  color: Color(0xFFfce8b3),
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
