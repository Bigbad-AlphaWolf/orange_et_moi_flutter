import 'package:flutter/material.dart';

class ServicesBoard extends StatefulWidget {
  const ServicesBoard({super.key});

  @override
  State<ServicesBoard> createState() => _ServicesBoardState();
}

class _ServicesBoardState extends State<ServicesBoard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Services"),
    );
  }
}
