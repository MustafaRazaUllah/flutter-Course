import 'package:flutter/material.dart';
import 'package:flutter_application/utils/loader.dart';

import '../../Root Navigation/View/root_navgation.dart';
import '../model/auth_model.dart';
import '../servivce/login_service.dart';

class LoginViewmode with LoginService {
  TextEditingController emailLogin =
      TextEditingController(text: "mustafa12@gmail.com");
  TextEditingController passwordLogin =
      TextEditingController(text: "Qwer@1234");

  onloginFunction(BuildContext context) async {
    try {
      showLoadingIndicator(context: context);
      AuthModel result = await onLoginService(
        body: {
          "emailOrUsername": emailLogin.text,
          "password": passwordLogin.text,
        },
      );

      // print("isResultisResultisResultisResultisResultisResult $isResult");
      if (result.token.isNotEmpty) {
        hideOpenDialog(context: context);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const RootNavigationView(),
          ),
          (route) => false,
        );
      } else {
        hideOpenDialog(context: context);
      }
    } catch (e) {
      print("object $e");
      hideOpenDialog(context: context);
    }
  }
}
