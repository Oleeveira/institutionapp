import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:institutionapp/components/custom_text_field.dart';
import 'package:institutionapp/components/menu_bar.dart';
import 'package:institutionapp/components/pop_up_menu.dart';

class ItemRegisterPage extends StatefulWidget {
  const ItemRegisterPage({super.key});

  @override
  State<ItemRegisterPage> createState() => _ItemRegisterPageState();
}

class _ItemRegisterPageState extends State<ItemRegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 3, 32, 106),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 75.0),
            child: Material(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0)),
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20.0, top: 45.0),
                  child: Column(
                    children: [
                      Flexible(
                        child: CustomTextField(
                          type: TextInputType.name,
                          hint: "Nome do produto",
                        ),
                      ),
                      Flexible(
                        child: CustomTextField(
                          type: TextInputType.multiline,
                          hint: "Descrição",
                        ),
                      ),
                      Flexible(
                        child: CustomTextField(
                          type: TextInputType.number,
                          hint: "Quantidad",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
