import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextInputType type;
  final String hint;
  final String label;
  final _formKey = GlobalKey<FormState>();
  final bool
      textarea; // Novo parâmetro para definir a a quntidade mínima de linhas

  CustomTextField({
    super.key,
    required this.type,
    required this.hint,
    required this.label,
    this.textarea = false,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Digite aqui';
                }
                return null;
              },
              keyboardType: type,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(255, 243, 243, 243),
                  hintText: hint,
                  labelText: label,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0))),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
          ),
        ],
      ),
    );
  }
}
