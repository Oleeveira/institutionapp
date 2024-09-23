class NecessidadeModel {
  final int id;
  final String name;
  final String descricao;
  final int quantidade;
  final int categoriaId;
  final int usuarioId;
  final int statusDoacaoId;
  final DateTime dataDeCadastro;

  NecessidadeModel({
    required this.id,
    required this.name,
    required this.descricao,
    required this.quantidade,
    required this.categoriaId,
    required this.usuarioId,
    required this.statusDoacaoId,
    required this.dataDeCadastro,
  });
}
