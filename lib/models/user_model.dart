class UsuarioModel {
  final int id;
  final String nome;
  final String email;
  final int authId;
  final String telefone;
  final bool ativo;
  final DateTime dataCadastro;

  const UsuarioModel({
    required this.id,
    required this.nome,
    required this.email,
    required this.authId,
    required this.telefone,
    required this.ativo,
    required this.dataCadastro,
  });
}