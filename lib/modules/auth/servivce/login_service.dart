import 'dart:convert';

import '../../../common/network/api_client.dart';
import '../../../common/network/api_urls.dart';
import '../../../utils/custom_toast.dart';

mixin LoginService {
  Future<bool> onLoginService({
    required Map body,
  }) async {
    bool isResult = false;
    var response = await ApiClient().postRequest(
      url: ApiUrls.login,
      body: body,
    );

    var result = jsonDecode(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      if (result["status"] == true) {
        isResult = true;
        CustomAppToast().onSuccess(result["message"].toString());
      } else {
        CustomAppToast().onFail(result["message"].toString());
      }
    } else if (response.statusCode >= 400 || response.statusCode <= 404) {
      CustomAppToast().onFail(result["message"].toString());
    } else {
      CustomAppToast().onFail("Some thing want wrong.");
    }
    return isResult;
  }
}
