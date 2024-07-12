import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ItemRegisterPage extends StatefulWidget {
  const ItemRegisterPage({super.key});

  @override
  State<ItemRegisterPage> createState() => _ItemRegisterPageState();
}

class _ItemRegisterPageState extends State<ItemRegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(color: Color.fromARGB(255, 61, 85, 147) ,child: Container(color: Colors.white,),),
      ),
    );
  }
}
