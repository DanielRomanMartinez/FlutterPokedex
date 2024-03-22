import 'dart:convert';

import 'package:flutter_pokedex/domain/model/value_object/cached_response.dart';
import 'package:flutter_pokedex/domain/model/value_object/response.dart';

abstract class HttpService {
  Future<CachedResponse> get(
    Uri url, {
    Map<String, String>? headers,
    bool cached = true,
  });

  Future<Response> post(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  });

  Future<Response> put(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  });

  Future<Response> delete(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  });
}
