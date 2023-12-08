class PersonFactory {
  Person getPerson(
      {required String gender, required int age, required num height}) {
    if (gender == 'male') {
      return Male(age, height);
    } else {
      return Female(age, height);
    }
  }
}

abstract class Person {
  num age;
  num height;
  late num weight;
  // final String _gender;
  Person(this.age, this.height);

  num getIdealWeight();

  // if male weight = height / age * 10
  // if female weight = height / age * 9
}

class Female extends Person {
  // late num weight;

  Female(super.age, super.height);

  @override
  num getIdealWeight() {
    weight = height / age * 9;
    return weight;
  }
}

class Male extends Person {
  @override
  late num weight;
  Male(super.age, super.height);

  @override
  num getIdealWeight() {
    weight = height / age * 10;
    return weight;
  }
}
