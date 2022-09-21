import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kitchen/controller/home_controller.dart';

class Dishes extends StatefulWidget {
  const Dishes({Key? key}) : super(key: key);

  @override
  State<Dishes> createState() => _DishesState();
}

class _DishesState extends State<Dishes> {



  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Dishes"),
      ),
    );
  }
}
