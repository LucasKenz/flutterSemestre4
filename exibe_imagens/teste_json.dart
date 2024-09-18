import 'dart:convert';
class PessoaModel{
  //String nome; // precisamos inicializar
  late String nome; // prometemos que a inicialização vai acontecer mais tarde, quando for instanciado
  late int idade;

  // construtor
  PessoaModel(this.nome, this.idade); // com isso idade para de chiar pois o construtor assegura que pessoa nascem com nome e idade

  // // equivalente em java
  // public PessoaModel(String nome, int idade){
  //   this.nome = nome;
  //   this.idade = idade;
  // }

  // construtor nomeado
  PessoaModel.nome(pessoaMapa){
    pessoaMapa['nome']; // podemos construir uma pessoa com nome null
    pessoaMapa['idade'];
  }

  PessoaModel.fromJson(pessoaJSON){
    var pessoaMapa = json.decode(pessoaJSON);
    nome = pessoaMapa['nome'];
    idade = pessoaMapa['idade'];
  }
}

void main(){
  var pessoaJSON = '{"nome": "Ana}, "idade" : 18}';

  //conversão para mapa
  var pessoaMapa = json.decode(pessoaJSON);
  var pessoaModel = PessoaModel.fromJson(pessoaJSON);
  print(pessoaModel.idade);
  print(pessoaModel.nome);


  // var pessoaModel = PessoaModel(
  //   pessoaMapa['nome'],
  //   pessoaMapa['idade']
  // );

  // print(pessoaModel.nome);

  // a cada pessoa temos que rfazer um decode e passar 1 a 1 nome e idade


  // var veiculosJSON = '''[
  //   {
  //     "marca": "Vw",
  //     "modelo": "Gol",
  //     "preco" : 10
  //   },
  //   {
  //     "marca" : "Chevrolet",
  //     "modelo" : "corsa",
  //     "preco" : 20
  //   }
  // ]''';

  // //adicionar preço para cada veiculo, 
  // //mostrar o preço médio
  // var veiculos = json.decode(veiculosJSON);
  // print(veiculos);
  // print(veiculos.runtimeType);
  // var media = 0.0;

  // for (final veiculo in veiculos){
  //   print(veiculo);
  //   print(veiculo['marca']);
  //   print(veiculo['modelo']);
  //   media += veiculo['preco'];
    
  // }

  // print(veiculos.length == 0?
  // "estoque vazio" :
  // //"valor médio : ${media / veiculos.lenght}"); // não podmeos deixar assim, precisamos passar sobre o todo o toStringAsFixed
  // "valor médio : ${(media / veiculos.lenght).toStringAsFixed(2)}");
}
