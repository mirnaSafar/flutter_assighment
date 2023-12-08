import 'package:assignment_test/core/enums/data_type.dart';
import 'package:assignment_test/main.dart';

class SharedPrefrenceRepostory {
  //!Keys------

//!Main Function
  setPreference(
      {required DataType dataType,
      required String key,
      required dynamic value}) async {
    switch (dataType) {
      case DataType.INT:
        await globalSharedPreference!.setInt(key, value);
        break;
      case DataType.STRING:
        globalSharedPreference!.setString(key, value);
        break;
      case DataType.DOUBLE:
        await globalSharedPreference!.setDouble(key, value);
        break;
      case DataType.BOOL:
        await globalSharedPreference!.setBool(key, value);
        break;
      case DataType.STRINGLIST:
        await globalSharedPreference!.setStringList(key, value);
        break;
    }
  }

  dynamic getPreferenc({required String key}) {
    return globalSharedPreference!.get(key);
  }
}
