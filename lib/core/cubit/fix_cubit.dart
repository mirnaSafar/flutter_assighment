import 'package:bloc/bloc.dart';

part 'fix_state.dart';

class FixCubit extends Cubit<FixState> {
  FixCubit() : super(FixState(0));
  increaseCounter() {
    emit(FixState(state.counter + 1));
  }

  decreaseCounter() {
    emit(FixState(state.counter - 1));
  }
}
