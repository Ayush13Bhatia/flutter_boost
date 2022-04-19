import 'package:flutter/material.dart';
import 'package:flutter_boost_sample/add_page.dart';
import 'package:flutter_boost_sample/data_base.dart';

import 'boost_model.dart';

class Boostpage extends StatefulWidget {
  const Boostpage({Key? key}) : super(key: key);
  static const routeName = '/boost';

  @override
  State<Boostpage> createState() => _BoostpageState();
}

class _BoostpageState extends State<Boostpage> {
  late List<BoostModel>? boostList = [];

  @override
  void initState() {
    super.initState();
    refreshNotes();
  }

  bool isLoading = false;

  Future refreshNotes() async {
    setState(() => isLoading = true);
    boostList = await BoostDatabase.instance.readAllNotes();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                AddPage.routeName,
              );
            },
            icon: const Icon(
              Icons.add_a_photo_rounded,
            ),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: boostList?.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: const Icon(Icons.image),
                title: Text(boostList![index].name),
                subtitle: Text('${boostList![index].age}'),
                trailing: const Icon(Icons.person),
              ),
            );
          }),
    );
  }
}
