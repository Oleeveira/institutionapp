import 'package:firebase_auth/firebase_auth.dart';
import 'package:institutionapp/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:institutionapp/components/custom_text_field.dart';
import 'package:institutionapp/services/firebase_auth_methods.dart';

class LegalEntitiesLoginPage extends StatefulWidget {
  const LegalEntitiesLoginPage({super.key});

  @override
  State<LegalEntitiesLoginPage> createState() => _LegalEntitiesLoginPageState();
}

class _LegalEntitiesLoginPageState extends State<LegalEntitiesLoginPage> {
  final loginController = LoginController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void loginUser() async {
    FirebaseAuthMethods(FirebaseAuth.instance).loginWithEmail(
        email: emailController.text,
        password: passwordController.text,
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 214, 212, 212),
                Color.fromARGB(181, 5, 21, 94)
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: [0.6, 1.0],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  type: TextInputType.emailAddress,
                  controller: emailController,
                ),
                CustomTextField(
                  controller: passwordController,
                  type: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    loginUser();
                  },
                  // Ação de login,
                  child: const Text(
                    'Continuar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
