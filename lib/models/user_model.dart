import 'package:flutter/material.dart';
import 'package:institutionapp/models/necessidade_model.dart';

class User {
  Image pic;
  final int id;
  final String nome;
  String email;
  String password;
  final int authId;
  final String telefone;
  final bool ativo;
  final DateTime dataCadastro;
  final List<Item> necessidades;

   User({
    required this.pic,
    required this.id,
    required this.nome,
    required this.email,
    required this.password,
    required this.authId,
    required this.telefone,
    required this.ativo,
    required this.dataCadastro,
    required this.necessidades,
  });

}