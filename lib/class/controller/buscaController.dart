import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../conexao/conexao.dart';
part 'buscaController.g.dart';

class buscaController {
  var banco = Conexao();

  @Route.get("/lista/<nome>/<idade>")
  Future<Response> lista(Request request, String nome, String idade) async {
    var idadee = int.tryParse(idade);
    List<List<dynamic>> json = await banco.buscar_user(nome, idadee);

    for (var row in json) {
      print("listados" + row.toList().toString());
    }
    try {
      return Response.ok("listados: " + json.toList().toString());
    } catch (erro) {
      if (erro != json) {
        return Response.notFound("não encontrado na pesquisa" + erro);
      }
    }
  }

  Router get busca => _$buscaControllerRouter(this);
}
