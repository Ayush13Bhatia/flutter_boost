import 'package:flutter/material.dart';
import 'package:flutter_boost_sample/boost_page.dart';

import 'boost_model.dart';
import 'data_base.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);
  static const routeName = '/add';

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  String? name;
  int age = 0;

  TextEditingController nameController = TextEditingController();
  // TextEditingController ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Name",
              ),
              onChanged: (val) {
                setState(() {
                  name = val;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              // controller: ageController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Age",
              ),
              onChanged: (val) {
                setState(() {
                  age = int.parse(val);
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () {
                    addNote(name!, age);
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Boostpage()));
                  },
                  child: const Text(
                    'add',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future addNote(String name, int age) async {
  final boost = BoostModel(
    // id: 123455,
    name: name,
    age: age,
  );
  print(boost.age);
  print(boost.name);

  await BoostDatabase.instance.create(boost);
}
