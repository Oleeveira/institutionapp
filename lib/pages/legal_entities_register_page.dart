import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:institutionapp/components/custom_text_field.dart';
import 'package:institutionapp/resources/constant_colors.dart';
import 'package:institutionapp/services/firebase_auth_methods.dart';
import 'package:flutter/foundation.dart';

class InstitutionRegisterPage extends StatefulWidget {
  const InstitutionRegisterPage({super.key});

  @override
  State<InstitutionRegisterPage> createState() => _InstitutionRegisterPage();
}

class _InstitutionRegisterPage extends State<InstitutionRegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    addressController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  buttonPress() {
    String email = emailController.text;
    String password = passwordController.text;
    String name = nameController.text;
    String address = addressController.text;
    String phone = phoneController.text;

    if (_formKey.currentState!.validate()) {
      FirebaseAuthMethods(FirebaseAuth.instance).signUpWithEmail(
          name: name,
          email: email,
          password: password,
          adress: address,
          number: phone,
          context: context);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 214, 212, 212),
                ConstantsColors.CorPrinciapal,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: [0.6, 1.0],
            ),
          ),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildTextFieldWithLabel(
                        'Nome: ', TextInputType.text, nameController),
                    const SizedBox(height: 20),
                    _buildTextFieldWithLabel(
                        'Telefone: ', TextInputType.phone, phoneController),
                    const SizedBox(height: 20),
                    _buildTextFieldWithLabel(
                        'E-mail', TextInputType.emailAddress, emailController),
                    const SizedBox(height: 20),
                    _buildTextFieldWithLabel(
                        'Endereço: ', TextInputType.text, addressController),
                    const SizedBox(height: 20),
                    _buildTextFieldWithLabel('Senha: ',
                        TextInputType.visiblePassword, passwordController),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ConstantsColors.CorPrinciapal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        buttonPress();
                      },
                      child: const Text(
                        'Confirmar',
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
        ),
      ),
    );
  }

  Widget _buildTextFieldWithLabel(
      String label, TextInputType inputType, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: ConstantsColors.CorPrinciapal,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          CustomTextField(
            type: inputType,
            controller: controller,
          ),
        ],
      ),
    );
  }
}
