import 'dart:mirrors';

//uma regra de neĝocio com cadastro com seus atributos onde serão
//tratados através de um Map.

class cadastroModel {
  String nome;
  int idade;

  cadastroModel({this.nome, this.idade});

  Map toMap() {
    Map<String, dynamic> map = {"nome": this.nome, "idade": this.idade};
    return map;
  }
}
