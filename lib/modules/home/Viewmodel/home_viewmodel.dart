import 'package:flutter/cupertino.dart';
import 'package:flutter_application/utils/loader.dart';

import '../../auth/model/auth_model.dart';
import '../Service/home_service.dart';

class HomeViewmodel with HomeService {
  AuthModel userData = AuthModel.fromEmpty();

  Future<bool> getProfileMethod(BuildContext context) async {
    bool isResult = false;
    try {
      showLoadingIndicator(context: context);
      userData = await getProfileService();
      hideOpenDialog(context: context);
      if (userData.user.email.isNotEmpty) {
        isResult = true;
      }

      print("userData Email ${userData.user.email}");
    } catch (e) {
      print("object $e");
      hideOpenDialog(context: context);
    }

    return isResult;
  }
}
