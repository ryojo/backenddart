import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../conexao/conexao.dart';
part 'buscaController.g.dart';

class buscaController {
  var banco = Conexao();
  bool _status = true;

  //  filtrar o usuário por nome e idade numa lista sem organização 'todos'
  @Route.get("/lista/<nome>/<idade>")
  Future<Response> lista(Request request, String nome, String idade) async {
    var idadee = int.tryParse(idade);
    List<List<dynamic>> json = await banco.buscar_user(nome, idadee);

    for (var row in json) {
      print("listados" + row.toList().toString());
    }
    //tratamento em caso não encontrar o usuário
    if (json.isNotEmpty) {
      return Response.ok("buscando por: $json");
    } else {
      return Response.notFound("usuário não foi encontrado!");
    }
  }

  Router get busca => _$buscaControllerRouter(this);
}
