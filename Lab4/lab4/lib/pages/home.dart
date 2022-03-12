import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lab4/services/agify.dart';

class Home extends StatefulWidget {
  final AgifyServices _agifyServise;

  const Home({Key? key})
      : _agifyServise = const AgifyServices(),
        super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();

  String? _name;
  int? _age;

  void onSubmit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final calculateAge = await widget._agifyServise.getAgeFromName(_name!);

      setState(() {
        _age = calculateAge;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Find Age"),
      ),
      body: Column(
        children: [
          Form(
              key: _formKey,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Character Name",
                      border: OutlineInputBorder(),
                      hintText: "Character Name",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2.0,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter the name";
                      }

                      return null;
                    },
                    onSaved: (String? value) {
                      setState(() {
                        if (value != null) _name = value;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: SizedBox(
                    width: 200,
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          padding: const EdgeInsets.all(20)),
                      onPressed: onSubmit,
                      child: const Text("Get Age"),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: SizedBox(
                      width: 200,
                      height: 50,
                      child: Text(
                        _age == null ? "Enter Name" : "Age is $_age",
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ]))
        ],
      ),
    );
  }
}
