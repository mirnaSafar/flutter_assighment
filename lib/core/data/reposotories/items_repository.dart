import 'package:assignment_test/core/data/models/common_response.dart';
import 'package:assignment_test/core/data/models/item_model.dart';
import 'package:assignment_test/core/data/network/endpoints/items_endpoints.dart';
import 'package:assignment_test/core/data/network/network_config.dart';
import 'package:assignment_test/core/enums/request_type.dart';
import 'package:assignment_test/core/utils/network_utils.dart';
import 'package:dartz/dartz.dart';

class ItemsRepository {
  Future<Either<String, List<ItemModel>>> getAllItems() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: ItemsEndpoints.getItems,
        headers:
            NetworkConfig.getHeaders(needAuth: false, type: RequestType.GET),
      ).then((response) {
        List<ItemModel> items = [];
        if (response != null) {
          CommonResponse<List<dynamic>> commonResponse =
              CommonResponse.fromJson(response);
          if (commonResponse.getStatus) {
            if (commonResponse.data != null) {
              for (var element in commonResponse.data!) {
                items.add(ItemModel.fromJson(element));
              }
            }
            return Right(items);
          } else {
            return const Left("failed to fetch");
          }
        } else {
          return const Left("failed to fetch");
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, Map<String, dynamic>>> getItemDetails(
      dynamic id) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        params: {
          "id": [id.toString()]
        },
        url: ItemsEndpoints.getItemDetails,
        headers:
            NetworkConfig.getHeaders(needAuth: false, type: RequestType.GET),
      ).then((response) {
        dynamic itemdetails;
        CommonResponse<dynamic> commonResponse =
            CommonResponse.fromJson(response);
        if (commonResponse.getStatus) {
          if (commonResponse.data != null) {
            itemdetails = commonResponse.data;
          }
          return Right(itemdetails);
        } else {
          return const Left("failed to fetch");
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
