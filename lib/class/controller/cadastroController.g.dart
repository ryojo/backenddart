// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastroController.dart';

// **************************************************************************
// ShelfRouterGenerator
// **************************************************************************

Router _$cadastroControllerRouter(cadastroController service) {
  final router = Router();
  router.add('GET', r'/', service.getAll);
  router.add('POST', r'/adicionarUser/<nome>/<idade>', service.adicionarUser);
  return router;
}
