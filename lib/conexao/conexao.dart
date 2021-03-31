// implementando um padrão de projetos: singleton

import 'dart:async';

import 'package:postgres/postgres.dart';
import 'package:shelf/shelf.dart';

class Conexao {
  static final Conexao conexao = Conexao.internal();

  var _connection;
  factory Conexao.internal() {
    return conexao;
  }

  Conexao() {}

  get db async {
    if (_connection != null) {
      return _connection;
    } else {
      return _connection = await _inicializarBanco();
    }
  }

  _inicializarBanco() async {
    var inicializar = PostgreSQLConnection('localhost', 5432, "backend",
        username: "postgres", password: "bem vidos1");

    await inicializar.open();

    return inicializar;
  }

  // inserir usuarios na conta
  insert_user(String nome, int idade) async {
    PostgreSQLConnection id = await db;

    var banco = await id
        .query("INSERT INTO usuario (nome,idade) VALUES ('$nome',$idade)");

    return banco;
    // id.execute(banco.toString());
  }

  //busca usuarios
  buscar_user(String nome, int idade) async {
    PostgreSQLConnection ps = await db;
    var banco = await ps.query(
        "SELECT nome, idade FROM usuario WHERE nome='$nome' and idade=$idade");

    return banco;
  }

  //deletar o usuario da conta
  deletar_user(int id) async {
    PostgreSQLConnection ps = await db;

    var banco = ps.query("DELETE FROM usuario WHERE id=$id");

    return banco;
    //return ps.execute(banco.toString());
  }

  //deletar algo na coluna do usuario
  alterar_user(String nome, int id) async {
    PostgreSQLConnection ps = await db;

    var banco = ps.query("UPDATE usuario SET nome='$nome' WHERE id=$id");

    return banco;
  }
}
