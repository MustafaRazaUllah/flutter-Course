import 'package:flutter/material.dart';

class SlashView extends StatelessWidget {
  const SlashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Splash",
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("This is a body"),
            const Text("This is a body"),
            const SizedBox(height: 40),
            Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  border: Border.all(
                    width: 5,
                    color: Colors.red,
                  ),
                  gradient: const LinearGradient(
                    colors: [Colors.blue, Colors.red],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey
                          .withOpacity(0.5), // Shadow color with opacity
                      blurRadius: 50.0, // Blur radius for softness
                      spreadRadius: 10.0, // How far the shadow spreads
                      offset: const Offset(5.0, 5.0), // Shadow offset (x, y)
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(50),
                child: const Icon(
                  Icons.add,
                  size: 40,
                  color: Colors.amber,
                )
                // Image.asset(
                //   "assets/icons/cameraviewfinder.png",
                // ),
                ),
          ],
        ),
      ),
    );
  }
}
