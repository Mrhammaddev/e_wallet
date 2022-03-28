import 'package:e_wallet/Utils/constants.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      appBar: AppBar(
        title: Text("E-Wallet"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            child: Text("Hello World!!"),
          )
        ],
      )),
    );
  }
}
