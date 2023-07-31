import 'package:flutter/material.dart';

class DesktopView extends StatelessWidget {
  const DesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: height,
            width: width,
            color: Colors.red,
          ),
          Container(
            height: height,
            width: width,
            color: Colors.blue,
          ),
        ]),
      ),
    );
  }
}
