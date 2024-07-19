import 'package:flutter/material.dart';
import 'package:institutionapp/components/profile_title_component.dart';

class ProfileCardComponent extends StatelessWidget {
  final String title;

  final Widget child;

  const ProfileCardComponent({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileTitleComponent(title: title),
          const SizedBox(height: 15),
          child,
        ],
      ),
    );
  }
}