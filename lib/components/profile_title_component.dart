import 'package:flutter/material.dart';


class ProfileTitleComponent extends StatelessWidget {
  final String title;

  const ProfileTitleComponent({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.w500,
        fontSize: 18,
      ),
    );
  }
}
