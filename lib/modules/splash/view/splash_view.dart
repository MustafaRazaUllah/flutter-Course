import 'package:flutter/material.dart';

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
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) =>  LoginView(),
        ),
      );
    });
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
