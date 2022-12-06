import 'package:flutter/material.dart';

class DetalhesProduto extends StatefulWidget {
  final String? produtoId;
  final String? produto;
  final String? descricao;
  final String? imagem;
  final double? preco;

  DetalhesProduto(
      {Key? key,
      this.produtoId,
      this.produto,
      this.descricao,
      this.imagem,
      this.preco})
      : super(key: key);

  @override
  State<DetalhesProduto> createState() => _DetalhesProdutoState();
}

class _DetalhesProdutoState extends State<DetalhesProduto> {
  int _opcaoSelecionada = 0;

  @override
  Widget build(BuildContext context) {
    print(widget.produto);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 194, 177, 216),

        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 7, 249, 201),
                Color.fromARGB(255, 109, 2, 197),
                Color.fromARGB(255, 3, 0, 3),
              ], begin: Alignment.bottomRight, end: Alignment.centerLeft),
            ),
          ),

          title: Text(
            'Descrição do Produto:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          //titleSpacing: 100,
          elevation: 100,
        ), //snapshot é ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Column(
                  children: [
                    Image.network(
                      widget.imagem.toString(),
                      fit: BoxFit.fill,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 30),
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 109, 2, 197),
                              Color.fromARGB(255, 2, 179, 195),
                              Color.fromARGB(255, 3, 0, 3),
                            ],
                            begin: Alignment.bottomRight,
                            end: Alignment.centerLeft,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            widget.produto.toString(),
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 50),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 109, 2, 197),
                              Color.fromARGB(255, 2, 179, 195),
                              Color.fromARGB(255, 3, 0, 3),
                            ],
                            begin: Alignment.bottomRight,
                            end: Alignment.centerLeft,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            widget.descricao.toString(),
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 80),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 30),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 109, 2, 197),
                              Color.fromARGB(255, 2, 179, 195),
                              Color.fromARGB(255, 255, 255, 255),
                            ],
                            begin: Alignment.bottomRight,
                            end: Alignment.centerLeft,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'R\$' + widget.preco.toString(),
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 240, 239, 239),
                            padding: EdgeInsets.fromLTRB(23, 10, 23, 10),
                          ),
                          child: Text(
                            'Back',
                            style: TextStyle(
                                fontSize: 25,
                                color: Color.fromARGB(255, 42, 42, 42)),
                          ),
                          onPressed: (() {
                            print('Clicou no botão da tela2');

                            Navigator.pop(context);
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
