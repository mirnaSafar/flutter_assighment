import 'package:assignment_test/core/data/reposotories/shared_prefernces.dart';
import 'package:assignment_test/core/enums/request_type.dart';

class NetworkConfig {
  static String BASE_API = '/';
  static String getFullApiRoute(String apiroute) {
    return BASE_API + apiroute;
  }

  static Map<String, String>? getHeaders(
      {bool needAuth = true,
      RequestType? type,
      Map<String, String>? extraHeaders}) {
    return {
      // if (needAuth)
      //   "Authorization":
      //       "Bearer ${SharedPrefrenceRepostory().getTokenInfo()?.accessToken ?? ''}",
      if (type != RequestType.GET)
        "Content-Type": type == RequestType.MULTIPART
            ? "multipart/form-data"
            : "application/json",
      ...extraHeaders ?? {}
    };
  }
}
