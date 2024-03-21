import 'dart:io';

import 'package:flutter_pokedex/domain/model/value_object/response.dart';

class CachedResponse {
  Response response;
  FileStat? cachedFileStat;

  CachedResponse(
    this.response, {
    this.cachedFileStat,
  });
}
