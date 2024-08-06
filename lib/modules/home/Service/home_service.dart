import 'dart:convert';

import 'package:flutter_application/DB/cache_handler.dart';
import 'package:flutter_application/common/network/api_client.dart';
import 'package:flutter_application/utils/custom_toast.dart';

import '../../../common/network/api_urls.dart';
import '../../auth/model/auth_model.dart';

mixin HomeService {
  Future<AuthModel> getProfileService() async {
    String accessToken = await CacheHandler().getToken();

    AuthModel modelData = AuthModel.fromEmpty();
    var response = await ApiClient().getRequest(
      url: ApiUrls.getProfile,
      token: accessToken,
    );

    var result = jsonDecode(response.body);
    print("statusCode ${response.statusCode}");
    print("body  $result");

    if (response.statusCode == 200 || response.statusCode == 201) {
      if (result["status"] == true) {
        User data = User.fromJson(result["data"]);
        modelData = AuthModel(user: data, token: "");
        // await CacheHandler().setToken(modelData.token);
        // CustomAppToast().onSuccess(result["message"].toString());
      } else {
        CustomAppToast().onFail(result["message"].toString());
      }
    } else if (response.statusCode >= 400 || response.statusCode <= 404) {
      CustomAppToast().onFail(result["message"].toString());
    } else {
      CustomAppToast().onFail("Some thing want wrong.");
    }
    return modelData;
  }
}
