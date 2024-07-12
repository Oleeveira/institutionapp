import 'package:flutter/material.dart';

class CustomFormularyButton extends StatelessWidget {
  final Widget? child;
  final Function? onPressed;

  const CustomFormularyButton({super.key, this.child, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.75,
        height: MediaQuery.of(context).size.width * 0.15,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 61, 85, 147),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(15.0)),
        child: child,
      ),
    );
  }
}
