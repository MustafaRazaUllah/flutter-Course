import 'dart:convert';

import '../../../common/network/api_client.dart';
import '../../../common/network/api_urls.dart';
import '../../../utils/custom_toast.dart';

mixin LoginService {
  void onLoginService({
    required Map body,
  }) async {
    var response = await ApiClient().postRequest(
      url: ApiUrls.login,
      body: body,
    );

    var result = jsonDecode(response.body);

    if (result["status"] == true) {
      print("Success");
      print(result["message"].toString());
      // AppToast().onSuccess(result["message"].toString());
    } else {
      print("Fail");
      print(result["message"].toString());
      // AppToast().onFail(result["message"].toString());
    }
  }
}
