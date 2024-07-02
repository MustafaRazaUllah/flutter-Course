import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.purple.withOpacity(0.3),
                      ),
                      child: const Center(child: Text("Back"))
                      // const Icon(
                      //   Icons.arrow_back_ios_rounded,
                      //   size: 20,
                      //   color: Colors.purple,
                      // ),
                      ),
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text("Login View"),
                ),
              ],
            ),
          )),
    );
  }
}
