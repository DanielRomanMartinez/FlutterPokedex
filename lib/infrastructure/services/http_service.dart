import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_pokedex/domain/model/value_object/cached_response.dart';
import 'package:flutter_pokedex/domain/model/value_object/response.dart';
import 'package:flutter_pokedex/domain/services/http_service.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@Injectable(as: HttpService)
class FlutterHttpService implements HttpService {
  @override
  Future<CachedResponse> get(
    Uri url, {
    Map<String, String>? headers,
    bool cached = true,
  }) async {
    if (cached) {
      final FileInfo? file =
          await DefaultCacheManager().getFileFromCache(url.toString());

      if (file == null) {
        return _makeGetHttpPetition(url: url);
      } else {
        return CachedResponse(Response(
          statusCode: HttpStatus.ok,
          body: file.file.readAsStringSync(),
          bodyBytes: file.file.readAsBytesSync(),
          headers: const {
            HttpHeaders.contentTypeHeader: "application/json;charset=utf-8",
          },
        ));
      }
    } else {
      return _makeGetHttpPetition(url: url);
    }
  }

  @override
  Future<Response> delete(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    final http.Response response = await http.delete(
      url,
      headers: headers,
      body: body,
      encoding: encoding,
    );

    return Response(
      statusCode: response.statusCode,
      body: response.body,
      bodyBytes: response.bodyBytes,
      headers: response.headers,
    );
  }

  @override
  Future<Response> post(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    final http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
      encoding: encoding,
    );

    return Response(
      statusCode: response.statusCode,
      body: response.body,
      bodyBytes: response.bodyBytes,
      headers: response.headers,
    );
  }

  @override
  Future<Response> put(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    final http.Response response = await http.put(
      url,
      headers: headers,
      body: body,
      encoding: encoding,
    );

    return Response(
      statusCode: response.statusCode,
      body: response.body,
      bodyBytes: response.bodyBytes,
      headers: response.headers,
    );
  }

  Future<CachedResponse> _makeGetHttpPetition({
    required Uri url,
  }) async {
    final http.Response response = await http.get(
      url,
    );

    List<int> list = response.body.codeUnits;
    Uint8List fileBytes = Uint8List.fromList(list);
    DefaultCacheManager().putFile(url.toString(), fileBytes);

    return CachedResponse(Response(
      statusCode: HttpStatus.ok,
      body: response.body,
      bodyBytes: response.bodyBytes,
      headers: const {
        HttpHeaders.contentTypeHeader: "application/json;charset=utf-8",
      },
    ));
  }
}
