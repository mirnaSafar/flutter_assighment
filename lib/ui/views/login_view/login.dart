import 'package:assignment_test/core/cubit/internet_cubit.dart';
import 'package:assignment_test/core/cubit/login_cubit.dart';
import 'package:assignment_test/core/enums/message_type.dart';
import 'package:assignment_test/core/utils/general_utils.dart';
import 'package:assignment_test/ui/shared/custom_widgets/custom_button.dart';
import 'package:assignment_test/ui/shared/custom_widgets/custom_toast.dart';
import 'package:assignment_test/ui/shared/custom_widgets/user_input.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginTab extends StatelessWidget {
  LoginTab({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _submitForm(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      BlocProvider.of<LoginCubit>(context)
          .login(_usernameController.text, _passwordController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          UserInput(
            controller: _usernameController,
            text: "Username",
          ),
          UserInput(
            controller: _passwordController,
            text: "Password",
            obscureText: true,
          ),
          MultiBlocListener(
            listeners: [
              BlocListener<InternetCubit, InternetState>(
                listener: (context, internetstate) {
                  if (internetstate is InternetDisconnected) {
                    showSnackbar(context, 'Internet Disconnected');
                  }
                  if (internetstate is InternetConnected) {
                    showSnackbar(context, 'Internet Connected');
                  }
                },
              ),
              BlocListener<LoginCubit, LoginState>(
                listener: (context, state) {
                  monitorLoggingProcess(state);
                },
              ),
            ],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                onPressed: () {
                  _submitForm(context);
                },
                text: 'Login',
              ),
            ),
          )
        ],
      ),
    );
  }

  void monitorLoggingProcess(LoginState state) {
    if (state is UserLoggingFailed) {
      BotToast.closeAllLoading();

      CustomToast.showMessage(
          message: 'failed to login', messageType: MessageType.WARNING);
    } else if (state is UserLoggedIn) {
      BotToast.closeAllLoading();

      CustomToast.showMessage(
          message: 'loggedIn successfully ', messageType: MessageType.SUCCESS);
    } else if (state is UserLoggingProgress) {
      customLoader();
    } else {
      showNoConnectionMessage();
    }
  }
}
