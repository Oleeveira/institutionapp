class Item {
  final String id;
  final String nome;
  final String descricao;
  final String quantidade;
  final String categoria;
  final String usuarioId;
  final int statusDoacaoId;
  final DateTime dataDeCadastro;

  Item({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.quantidade,
    required this.categoria,
    required this.usuarioId,
    required this.statusDoacaoId,
    required this.dataDeCadastro,
  });

  Map<String,dynamic> toJson() => {
      'id' :id,
      'nome':nome,
      'desc':descricao,
      'qtd':quantidade,
      'categoria': categoria,
      'status':statusDoacaoId,
      'usuario':usuarioId,
      'dataDeCadastro':dataDeCadastro
    };
}
