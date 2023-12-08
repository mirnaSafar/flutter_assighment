import 'package:assignment_test/core/data/models/person_model.dart';
import 'package:bloc/bloc.dart';

part 'fix_state.dart';

class FixCubit extends Cubit<FixState> {
  FixCubit() : super(FixState(0, 0.0));
  increaseCounter() {
    emit(FixState(state.counter + 1, state.weight));
  }

  decreaseCounter() {
    emit(FixState(state.counter - 1, state.weight));
  }

  getIdealWeight(String gender, int age, num height) {
    final person =
        PersonFactory.getPerson(age: age, gender: gender, height: height);
    num weight = person.getIdealWeight();
    emit(FixState(state.counter - 1, weight));
  }
}
