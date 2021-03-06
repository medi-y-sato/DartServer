// https://github.com/dart-lang/dart-tutorials-samples/blob/master/httpserver/bin/hello_world_server.dart

// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Replies "Hello, world!" to all requests.
// Use the URL localhost:4040 in your browser.
import 'dart:io';
import 'dart:async';

const httpListenPort = 4040;

Future main() async {
  var server = await HttpServer.bind(
    InternetAddress.loopbackIPv4,
    httpListenPort,
  );
  print('Listening on localhost:${server.port}');

  await for (HttpRequest request in server) {
    request.response
      ..write('Hello, world!')
      ..close();
  }
}
