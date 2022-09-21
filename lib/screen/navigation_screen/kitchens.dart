import 'package:flutter/material.dart';

class kitchens extends StatefulWidget {
  const kitchens({Key? key}) : super(key: key);

  @override
  State<kitchens> createState() => _kitchensState();
}

class _kitchensState extends State<kitchens> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("kitchens")),
    );
  }
}
