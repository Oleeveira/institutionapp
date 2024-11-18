import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:institutionapp/components/custom_text_field.dart';
import 'package:institutionapp/resources/constant_colors.dart';
import 'package:institutionapp/services/firebase_auth_methods.dart';
import 'package:flutter/foundation.dart';

class InstitutionRegisterPage extends StatefulWidget {
  const InstitutionRegisterPage({Key? key}) : super(key: key);

  @override
  State<InstitutionRegisterPage> createState() => _InstitutionRegisterPage();
}

class _InstitutionRegisterPage extends State<InstitutionRegisterPage> {
  // Controllers for text fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Firebase instances
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Form key to manage form state
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


  Future<void> signUpUser() async {
    try {
      // Create user with email and password
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text,
      );

      final user = userCredential.user;

      if (user != null) {
        // Check if user document already exists
        DocumentSnapshot doc = await _firestore.collection('users').doc(user.uid).get();

        if (!doc.exists) {
          // Create a new user document in Firestore
          await _firestore.collection('users').doc(user.uid).set({
            'username': nameController.text,
            'address': addressController.text,
            'number': phoneController.text,
            'createdOn': DateTime.now(),
          });
        }
      }
    } on FirebaseAuthException catch (e) {
      // Handle authentication errors
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error: ${e.message}'),
        backgroundColor: Colors.red,
      ));
    } catch (e) {
      // Handle other errors
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('An error occurred: $e'),
        backgroundColor: Colors.red,
      ));
    }
  }

  // Getter for current user
  User get user => _auth.currentUser!;

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
                        if (_formKey.currentState?.validate() ?? false) {
                          signUpUser();
                        }
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

  // Helper method to build text fields with labels
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