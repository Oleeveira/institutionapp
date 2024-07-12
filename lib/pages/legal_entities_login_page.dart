//Tela de login para instituições

import 'package:flutter/material.dart';
import 'package:institutionapp/components/custom_formulary_button.dart';
import 'package:institutionapp/components/custom_text_field.dart';

class LegalEntitiesLoginPage extends StatelessWidget {
  const LegalEntitiesLoginPage({super.key});

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
                      children: <Widget>[
                        CustomTextField(
                          label: 'Email',
                          hint: 'Username',
                          type: TextInputType.name,
                        ),
                        CustomTextField(
                          label: 'Senha',
                          hint: 'Password',
                          type: TextInputType.visiblePassword,
                        ),
                        SizedBox(height: 20),
                        CustomFormularyButton(
                          onPressed: () {
                            // Ação de login
                          },
                          child: Text(
                            'Continuar',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                      ]),
                ))));
  }
}
