import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Agify"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView(
            children: [
              SizedBox(
                child: Container(
                  padding: const EdgeInsets.all(50),
                  child: const TextField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        labelText: "User Name",
                        border: OutlineInputBorder(),
                        hintText: "User Name",
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.red,
                          width: 2.0,
                        ))),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 200, right: 200),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Save"),
                ),
              )
            ],
          ),
        ));
  }
}
