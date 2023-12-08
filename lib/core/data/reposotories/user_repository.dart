import 'package:assignment_test/core/data/models/common_response.dart';
import 'package:assignment_test/core/data/network/endpoints/user_endpoints.dart';
import 'package:assignment_test/core/data/network/network_config.dart';
import 'package:assignment_test/core/enums/request_type.dart';
import 'package:assignment_test/core/utils/network_utils.dart';
import 'package:dartz/dartz.dart';

class UserRepository {
  Future<Either<String, bool>> login({
    required String userName,
    required String password,
  }) async {
    try {
      return NetworkUtil.sendRequest(
          type: RequestType.POST,
          url: UserEndpoints.login,
          headers:
              NetworkConfig.getHeaders(needAuth: false, type: RequestType.POST),
          body: {
            'userName': userName,
            'password': password,
          }).then((response) {
        if (response != null) {
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);

          if (commonResponse.getStatus) {
            return const Right(true);
          } else {
            return const Left("failed to login");
          }
        } else {
          return const Left("failed to login");
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
