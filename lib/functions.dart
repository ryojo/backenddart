import 'dart:convert';

import 'package:backenddart/conexao/conexao.dart';

import 'package:functions_framework/functions_framework.dart';
import 'package:postgres/postgres.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'dart:async';
import 'dart:core';

@CloudFunction()
FutureOr<Response> function(Request request) async {
  //banco de dados
  var connection = PostgreSQLConnection('localhost', 5432, 'backend',
      username: 'postgres', password: "bem vidos1");
  await connection.open();

  Router app = Router();

  app.get("/", (Request request) {
    return Response.ok("está funcionando");
  });

  var banco = Conexao();

  //criar usuario

  app.post("/adicionarUser/<nome>/<idade>",
      (Request request, String nome, String idade) async {
    var idadee = int.tryParse(idade);

    var insert = await banco.insert_user(nome, idadee);

    return Response.ok("cadastro de: $nome sua idade é $idadee  ");
  });

// buscar lista usuário
  app.get("/buscar_dados/<nome>/<idade>", (
    Request request,
    String nome,
    String idade,
  ) async {
    var idadee = int.tryParse(idade);

    List<List<dynamic>> read = await banco.buscar_user(nome, idadee);
    print(read.toList());
    return Response.ok("busca:" + read.toList().toString());
  });

  //busca pelo nome do usuario
  app.get("/buscar/<nome>", (Request request, dynamic nome) async {
    List<List<dynamic>> busca =
        await connection.query("SELECT nome FROM usuario where nome='$nome'");

    print("procura por" + busca.toList().toString());

    if (busca != null) {
      return Response.ok(" Procura por: $busca ");
    } else
      return Response.notFound(
        "Usuario inexistente ",
      );
  });

  //remover a pessoa toda da lista.
  app.delete("/deletar_user/<id>", (Request request, String id) async {
    final inid = int.tryParse(id);

    var delete = await banco.deletar_user(inid);

    return Response.ok("Excluido da lista! ");
  });

  //alterar user
  app.put("/alterar_user/<nome>/<id>",
      (Request request, String nome, String id) async {
    var inid = int.parse(id);
    var update = await banco.alterar_user(nome, inid);
    return Response.ok(" usuario alterado ");
  });

  return app(request);
}
