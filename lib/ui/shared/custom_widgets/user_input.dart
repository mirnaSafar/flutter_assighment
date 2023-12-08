import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserInput extends StatefulWidget {
  UserInput(
      {super.key,
      required this.text,
      this.controller,
      this.validator,
      this.obscureText = false,
      this.suffixIcon,
      this.prefixIcon,
      this.textInputType});
  bool? obscureText;
  TextInputType? textInputType;
  final Icon? suffixIcon;
  final Icon? prefixIcon;
  final String text;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  @override
  State<UserInput> createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  bool obscureIcon = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top: height * 0.03),
      child: TextFormField(
        obscureText: obscureIcon,
        autovalidateMode: AutovalidateMode.always,
        validator: widget.validator,
        keyboardType: widget.textInputType,
        controller: widget.controller,
        decoration: InputDecoration(
          suffixIcon: widget.obscureText!
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      obscureIcon = !obscureIcon;
                    });
                  },
                  icon: Icon(obscureIcon
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined),
                )
              : widget.suffixIcon,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
          hintText: widget.text,
          prefixIcon: widget.prefixIcon,
          hintStyle: const TextStyle(
            color: Color.fromRGBO(182, 183, 183, 1),
          ),
          // filled: true,
          // fillColor: const Color.fromRGBO(242, 242, 242, 1),
          border: const OutlineInputBorder(borderSide: BorderSide()
              // borderRadius: BorderRadius.circular(30),
              ),
        ),
      ),
    );
  }
}
