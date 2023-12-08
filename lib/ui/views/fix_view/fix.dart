import 'package:assignment_test/core/cubit/fix_cubit.dart';
import 'package:assignment_test/core/data/models/person_model.dart';
import 'package:assignment_test/ui/shared/custom_widgets/user_input.dart';
import 'package:assignment_test/ui/shared/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class FixTab extends StatefulWidget {
  const FixTab({Key? key}) : super(key: key);

  @override
  State<FixTab> createState() => _FixTabState();
}

class _FixTabState extends State<FixTab> {
  Person? person;
  String genderController = 'Male';
  num weight = 0;
  List<String> list = <String>['One', 'Two', 'Three', 'Four'];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    TextEditingController ageController = TextEditingController();
    TextEditingController heightController = TextEditingController();
    calcWeight(String gender, num height, int age) {
      Person person =
          PersonFactory().getPerson(gender: gender, age: age, height: height);

      setState(() {
        weight = person.getIdealWeight();
      });
    }

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                mainAxisExtent: 70),
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.all(10),
                color: Colors.red,
                height: 0,
                // width: MediaQuery.of(context).size.width * 0.4,
                child: Center(
                    child: Text(
                  '$index ',
                  style: const TextStyle(color: Colors.white),
                )),
              );
            },
          ),
          const Divider(
            thickness: 5,
            color: Colors.black,
          ),
          BlocProvider(
            create: (context) => FixCubit(),
            child: BlocBuilder<FixCubit, FixState>(
              builder: (context, state) {
                return Column(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Center(
                          child: Text(
                        'Counter: ${state.counter}',
                      )),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        context.read<FixCubit>().increaseCounter();
                      },
                      child: const Text('Increase Counter'),
                    )
                  ],
                );
              },
            ),
          ),
          const Divider(
            thickness: 5,
            color: Colors.black,
          ),
          Row(
            children: [
              Expanded(
                  child: UserInput(
                text: 'age',
                textInputType: TextInputType.number,
                controller: ageController,
              )),
              10.px,
              Expanded(
                  child: UserInput(
                text: 'height',
                textInputType: TextInputType.number,
                controller: heightController,
              )),
              10.px,
              DropdownButton<String>(
                hint: Text(genderController),
                items: <String>['Male', 'Female'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    genderController = value!;
                  });
                },
              )
            ],
          ),
          30.ph,
          Text('Ideal weight: $weight'),
          ElevatedButton(
              onPressed: () {
                calcWeight(genderController, int.parse(heightController.text),
                    int.parse(ageController.text));
              },
              child: const Text('Calculate weight'))
        ],
      ),
    );
  }
}
