import 'package:assignment_test/core/data/network/network_config.dart';

class ItemsEndpoints {
  static String getItems = NetworkConfig.getFullApiRoute('items');
  static String getItemDetails = NetworkConfig.getFullApiRoute('item');
}
