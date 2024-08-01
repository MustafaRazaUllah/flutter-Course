import 'package:flutter/material.dart';

import '../../Root Navigation/View/root_navgation.dart';
import '../model/auth_model.dart';
import '../servivce/login_service.dart';

class LoginViewmode with LoginService {
  TextEditingController emailLogin =
      TextEditingController(text: "mustafa12@gmail.com");
  TextEditingController passwordLogin =
      TextEditingController(text: "Qwer@1234");

  onloginFunction(BuildContext context) async {
    AuthModel result = await onLoginService(
      body: {
        "emailOrUsername": emailLogin.text,
        "password": passwordLogin.text,
      },
    );

    // print("isResultisResultisResultisResultisResultisResult $isResult");
    if (result.token.isNotEmpty) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const RootNavigationView(),
        ),
        (route) => false,
      );
    }
  }
}
