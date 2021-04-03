# Hello world example

This example handles HTTP GET requests by responding with 'Hello, World!'.

```dart
// lib/functions.dart
import 'package:functions_framework/functions_framework.dart';
import 'package:shelf/shelf.dart';

@CloudFunction()
Response function(Request request) => Response.ok('Hello, World!');
```

## Simulate a hosted environment on your own machine

// estou fazendo um backend formado 100% de uso da linguagem dart.

tendo os pacotes utilizados

functionframework, shelf e shelf_router.

requisitos da máquina: 

computador Lenovo ideadpad 320
Sistema Operacional Ubuntu 20.04
Memória ram 8GB
HD de 1TB

________________________________________________________________________

passo a passo de criar o projeto 

para utilizar os pacotes você precisa utilizar um pacote que até esqueci de mencionar: dartfn.

primeiramente vai no site do dart package.io

pesquisa por dartfn 

e instalar pelo pub get.

se não for direto a instalação escreve assim

dart pub get install dartfn

espere ele carregar os arquivos, em seguida digite esse comando caso o dartfn para ter certeza que instalou:

dartf generate -h


primeiro cria uma pasta vazia. 

vai aparecer os comandos para começar um novo projeto.
 
 então procure por helloworld e digite:

dartfn generate helloword 

em seguida ele carrega todos as pastas para começar os projetos principalmente os pacotes que falei anteriormente.


definitivamente eu fiz um restful com banco de dados local.

em seguida veja nuns exemplos que eu fiz nesse projeto 

ah utuliza um postman ou insomia para fazer um teste 

outra caso queira iniciar o projeto rodando um build e o servidor


BUILD
primeiro no vscode na barra "terminal" procura por "run build task"
em seguida procura por : "dart pub run build_runner watch"


SERVIDOR DART

e depois rodar o seu servidor abrindo o diretorio do projeto em seguida 
digite no terminal: "dart bin/server.dart" 


 // agora com a novas pastas incluindo uma arquitetura MVC básica, feito sem nenhuma teoria. 