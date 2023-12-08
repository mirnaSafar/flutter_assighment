import 'package:assignment_test/core/data/reposotories/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future login(String userName, String password) async {
    emit(UserLoggingProgress());

    UserRepository().login(userName: userName, password: password).then(
        (value) => value.fold(
            (l) => emit(UserLoggingFailed()), (r) => emit(UserLoggedIn())));
  }
}
