import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'dart:async';

import '../../conexao/conexao.dart';
part 'cadastroController.g.dart';

class cadastroController {
  var banco = Conexao();

  @Route.get("/")
  FutureOr<Response> getAll(Request request) async {
    return Response.ok("está funcionando");
  }

  //criar usuario
  @Route.post('/adicionarUser/<nome>/<idade>')
  FutureOr<Response> adicionarUser(
      Request request, String nome, String idade) async {
    var idadee = int.tryParse(idade);

    var insert = await banco.insert_user(nome, idadee);
    try {
      return Response.ok("cadastro de: $nome sua idade é $idadee  ");
    } catch (erro) {
      return Response.notFound(erro + 'erro de conexão');
    }
  }

  Router get route => _$cadastroControllerRouter(this);
}
