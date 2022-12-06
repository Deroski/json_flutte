/*
{
    "produto_id": "6347b9f5c9ce728d6479829b",
    "produto": "id ut magna",
    "endereço": "Lenox Road 14 , Lopezo, Delaware",
    "descricao": "Duis ex nostrud sit id labore ex consequat excepteur nostrud. Ullamco cupidatat dolore veniam enim officia magna esse aliquip pariatur duis nostrud.",
    "imagem": "http://www.clker.com/cliparts/4/e/9/9/1368304745713722286black-cat_256x256-md.png",
    "quantidade": "57",
    "preco": "557.25"
  }*/

class Produtos {
  final List produtos;

  Produtos(this.produtos);
}

class Produto {
  final String? produtoId;
  final String produto;
  final String? endereco;
  final String? descricao;
  final String imagem;
  final double? quantidade;
  final double? preco;

  Produto(this.produtoId, this.produto, this.endereco, this.descricao,
      this.quantidade, this.preco, this.imagem);

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(json['produt_id'], json['produto'], json['endereco'],
        json['descricao'], json['imagem'], json['quantidade'], json['preco']);
  }

  Map<String, dynamic> toJson() => {
        'produto_id': produtoId,
        'produto': produto,
        'endereço': endereco,
        'descricao': descricao,
        'imagem': imagem,
        'quantidade': quantidade,
        'preco': preco,
      };
}
