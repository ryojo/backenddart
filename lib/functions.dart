import 'dart:convert';

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
      username: 'postgres', password: "666");
  await connection.open();

  Router app = Router();

  app.get("/", (Request request) {
    return Response.ok("está funcionando");
  });

  //criar usuario

  app.post("/adicionarUser/<nome>/<idade>",
      (Request request, String nome, String idade) async {
    var idadee = int.tryParse(idade);
    List<List<dynamic>> results = await connection
        .query("INSERT INTO usuario (nome,idade) VALUES ('$nome',$idadee)");

    return Response.ok("salvo com sucesso! $results  ");
  });

// buscar lista usuário
  app.get("/buscar_dados", (Request request) async {
    List<List<dynamic>> read =
        await connection.query("SELECT nome, idade FROM usuario");

    print(read.toList());

    return Response.ok("busca:" + read.toString());
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

    List<List<dynamic>> delete =
        await connection.query("DELETE FROM usuario WHERE id=$inid");

    return Response.ok("Excluido da lista! ");
  });

  //alterar user
  app.put("/alterar_user/<id>/<nome>",
      (Request request, String id, String nome) async {
    final inid = int.tryParse(id);

    List<List<dynamic>> update = await connection
        .query("UPDATE usuario SET nome='$nome' WHERE id=$inid");

    return Response.ok(" usuario alterado ");
  });

  return app(request);
}
