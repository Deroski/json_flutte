import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:json_flutter_training/detalhes_produto.dart';
import 'dart:convert';
import 'produtos_model.dart';
import 'detalhes_produto.dart';

class ListarProdutos extends StatefulWidget {
  ListarProdutos({Key? key}) : super(key: key);

  @override
  State<ListarProdutos> createState() => _ListarProdutosState();
}

class _ListarProdutosState extends State<ListarProdutos> {
  List<String> listaProdutos =
      List<String>.generate(20, (i) => 'Produto ${i + 1}');

  Future<List<Produto>?> _getProdutos() async {
    Uri uri = Uri.parse(
        'https://api.json-generator.com/templates/I_4qI9E06t2P/data?access_token=v8f3ilpyh1kl6ov3tq65mx4h15i913nh3dvnzodj');
    print(uri);

    var response = await http.get(uri);
    var dados = json.decode(response.body) as List;

    //print(dados);

    List<Produto> produtos = [];

    dados.forEach((element) {
      //print(element);

      Produto produto = Produto(
        element['produt_id'],
        element['produto'],
        element['endereco'],
        element['descricao'],
        double.parse(element['quantidade'].toString()),
        double.parse(element['preco'].toString()),
        element['imagem'],
      );

      produtos.add(produto);
    });
    return produtos;
    //print(produtos);
  }

  @override
  Widget build(BuildContext context) {
    print(listaProdutos.length);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 194, 177, 216),
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 7, 249, 201),
                Color.fromARGB(200, 153, 88, 238),
                Color.fromARGB(255, 3, 0, 3),
              ], begin: Alignment.bottomRight, end: Alignment.centerLeft),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('App Sales JSON'),
            ],
          ),
          titleSpacing: 50,
          elevation: 100,
        ), //snapshot é uma imagem tatica do dado, uma foto daquele momento
        body: FutureBuilder(
            future: _getProdutos(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Center(child: Text('Carregando...'));
              } else {
                return ListView.builder(
                  reverse: false,
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, indice) {
                    return ListTile(
                      leading: Image.network(snapshot.data[indice].imagem),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${snapshot.data[indice].produto}',
                            style: TextStyle(fontSize: 20),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                //'R\$' no flutter
                                'R\$' + snapshot.data[indice].preco.toString(),
                                style: TextStyle(
                                  color: Color.fromARGB(255, 9, 185, 33),
                                  fontStyle: FontStyle.italic,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      subtitle: Text(
                        snapshot.data[indice].descricao
                                .toString()
                                .substring(0, 30) +
                            '...',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      onTap: () {
                        print(
                            'O produto selecionado foi ${snapshot.data[indice].produto}, na posição $indice');
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return DetalhesProduto(
                            produtoId: snapshot.data[indice].produtoId,
                            produto: snapshot.data[indice].produto,
                            descricao: snapshot.data[indice].descricao,
                            imagem: snapshot.data[indice].imagem,
                            preco: snapshot.data[indice].preco,
                          );
                        }));
                      },
                    );
                  },
                );
              }
            }),
      ),
    );
  }
}
