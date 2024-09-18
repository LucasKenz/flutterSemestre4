import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; //pode ser qualquer nome
import 'dart:convert'

class App extends StatefulWidget{
  State<App> createState(){
   return AppState();
  } 
}

class AppState extends State<App>{
  int numeroImagens = 0;

  void obterImagem() async {
    // http.get(uri.parse('url da pexels'));
    // https://api.pexels.com/v1/search?query=people&page=1&per_page=1
    final url = Uri.https(
      'api.pexels.com',
      '/v1/search', // para acessar uma busca, a documentação diz que o endereço é esse
      {'query' : 'people', 'page' : '1', 'per_page' : '1'} // paginação = page per page, imagens por página, criar pequenas coleções de páginas
    );

    final req = http.Request('get', url);
    // o que fizemos nesse bloco equivale a irmos no site do navegador e digitar o url
    // quando apertamos enter ele carrega exatamente a url

    req.headers.addAll({ 
      // mapa = pares chave valor
      'Authotization' : 
      'chave da pexels'
    }); // daqui obtemos um StreamedResponse

    final result = await req.send();
    final response = await http.Response.fromStream(result); // agora não é mais object future
    final mapa = json.decode(response.body);
    final imagem = ImageModel.fromJSON(mapa); // fromJSON é uma construtor de ImageModel, se vermos ImageModel tem 2 cosntrutores.

    ///final resultadoDaPexels = req.send(//é iobound); // não posso fazer isso, pois não posso esperar que o resuldadoDaPexels fique bloqueado
    // existe uma única tread, linha de execução, que executa tudo que ocorre, inlcusive o send, toda interação visual inclusa
    // ou seja vai ficar carregando a página, congela a interface gráfica, 
    // na págian qunado clicamos no + ficamos presos esperando pelo resultado, não podemos esperar de maneira síncrona

    // não podemos fazer operções single thread em conexão

    // faremos uma função agendada para o futuro, que não é iobound
    // 

    req.send().then((result){
      // vamos tratar o resultado, para não ficar como StreamedResponse
      http.Response.fromStream(result).then((response){
        // agora temos a resposta, da resposta pegamos o corpo
        //print(response.body); // temos um json de resposta, gigante, o corpo da resposta é o json da pexels
        // conversão de json para mapa

        final mapa = json.decode(response.body); // sai de string e passei para mapa
        //var test = print(mapa['nome']) // devolve null, // se tentarmos manipular o null tomamos erro em tempo de execução
        final imagem = ImageModel.fromJSON(mapa);
        print(imagem); // instance of 'ImageModel'

        // temos que fazer uma sobrecrista do método toString(), fazer nosso própria representação
        // usamos override com ImageModel -> ir para aru=quivo imagemodel
        
      });

       // -> resulta num future que vai me possibilitar fazer a operação
    }); // equivale a faça a operação futura e então
    // future = possibilidade de obter uma resposta para uma operação demorada, execução futura 
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      home: Scaffold(
        appBar :  AppBar(
          title: const Text("Minhas Imagens"),
        ), 
        floatingActionButton: FloatingActionButton(
          onPressed: () { 
            obterImage(); // Resulta em void
            // onPressed: obterImagem() -> onPressed requer uma função, e obterImagem() devolve void (tipo de retorno) -> erro em compilação

            setState(() {
              numeroImagens++;         
            });
          },
          child: Icon(Icons.add),
        ), 
      )
    ); 
  }
}

