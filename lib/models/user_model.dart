class User {
  final int id;
  final String nome;
  String email;
  String password;
  final int authId;
  final String telefone;
  final bool ativo;
  final DateTime dataCadastro;

   User({
    required this.id,
    required this.nome,
    required this.email,
    required this.password,
    required this.authId,
    required this.telefone,
    required this.ativo,
    required this.dataCadastro,
  });

}