import 'package:flutter/material.dart';

import '../../Root Navigation/View/root_navgation.dart';
import '../servivce/login_service.dart';

class LoginViewmode with LoginService {
  TextEditingController emailLogin =
      TextEditingController(text: "mustafa12@gmail.com");
  TextEditingController passwordLogin =
      TextEditingController(text: "Qwer@1234");

  onloginFunction(BuildContext context) async {
    bool isResult = await onLoginService(
      body: {
        "emailOrUsername": emailLogin.text,
        "password": passwordLogin.text,
      },
    );

    print("isResultisResultisResultisResultisResultisResult $isResult");
    if (isResult) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const RootNavigationView(),
        ),
      );
    }
  }
}
