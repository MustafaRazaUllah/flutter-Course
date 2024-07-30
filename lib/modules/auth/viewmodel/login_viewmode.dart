import 'package:flutter/material.dart';

import '../servivce/login_service.dart';

class LoginViewmode with LoginService {
  TextEditingController emailLogin = TextEditingController();
  TextEditingController passwordLogin = TextEditingController();

  onloginFunction() {
    onLoginService(
      body: {
        "emailOrUsername": emailLogin.text,
        "password": passwordLogin.text,
      },
    );
  }
}
