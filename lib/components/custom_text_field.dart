import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextInputType type;
  final String hint;
  final _formKey = GlobalKey<FormState>();
  final bool
      textarea; // Novo parâmetro para definir a a quntidade mínima de linhas

  CustomTextField({
    super.key,
    required this.type,
    required this.hint,
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
                  helperText: hint,
                  border: OutlineInputBorder( 
                    borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),                     
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
