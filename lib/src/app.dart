import 'package:flutter/material.dart';

class App extends StatefulWidget{
  State<App> createState(){
   return AppState();
  } 
}

class AppState extends State<App>{
  int numeroImagens = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      home: Scaffold(
        appBar :  AppBar(
          title: const Text("Minhas Imagens"),
        ), 
        floatingActionButton: FloatingActionButton(
          onPressed: () { 
            //numeroImagens++;
            setState(() {
              // funções de dart são de primeira classe, podem ser passadas para parâmetros, etc
              numeroImagens++;
              // o que o correu da 20 para 21? é verdade que 0 -> 1 quando clicar no botão
              // 21 e 20 fazem a mesma coisa, mas a tela é atualizada na 21 ao clicar no botão, se esperamos que a tela é atualizada
              // se não quisermos que a tela recarregue, então poderia ficar como a 20
            });
          },
          child: Icon(Icons.add),
        ), 
      )
    ); 
  }
}

