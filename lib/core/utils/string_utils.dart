//   bool isEmail(String value) {
//   RegExp regExp = RegExp(
//       r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$");
//   return regExp.hasMatch(value);
// }

bool isPassword(String value) {
  RegExp regExp =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  return regExp.hasMatch(value);
}

bool isName(String value) {
  RegExp regExp = RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
  return regExp.hasMatch(value);
}

bool isLastName(String value) {
  RegExp regExp = RegExp(r"^\s*([A-Za-z]{1,})*$");
  return regExp.hasMatch(value);
}

bool isAddress(String value) {
  RegExp regExp = RegExp(r'^[0-9a-zA-Z\s,-/]+$');
  return regExp.hasMatch(value);
}

bool isMobile(String value) {
  RegExp regExp = RegExp(r'^\+?00963[0-9]{9}$');
  return regExp.hasMatch(value);
}

bool isValidSyriaMobileNumber(String value) {
  RegExp regex = RegExp(r'^(!?(\+|00)?(963)|0)?9\d{8}$');
  return regex.hasMatch(value);
}

bool isage18(String value) {
  RegExp regExp = RegExp(r'^(?:1[8-9]|[2-9][0-9])$');
  return regExp.hasMatch(value);
}

bool isEmail(String value) {
  RegExp regExp = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  return regExp.hasMatch(value);
}

bool isValidNumber(String value) {
  RegExp regExp =
      RegExp(r'^(?:\+971|00971|0)?(?:50|51|52|55|56|2|3|4|6|7|9)\d{7}$');
  return regExp.hasMatch(value);
}

bool validPassword(String password) {
  RegExp passExp =
      RegExp(r'^(?=.*[^a-zA-Z\d\s])(?=.*[a-zA-Z])[@$!%*?&a-zA-Z\d]$');
  // return passExp.hasMatch(password);
  return true;
}
