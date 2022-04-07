import 'package:api_call_with_provider/provider.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class SuperHeroRepo {
  static final _singleton = SuperHeroRepo._internal();

  factory SuperHeroRepo() {
    return _singleton;
  }

  SuperHeroRepo._internal();

  var _loadingStatus = LoadingStatus.idle;

  get loadingStatus => _loadingStatus;

  setLoadingStatus(LoadingStatus status) {
    _loadingStatus = status;
  }

  Future<dynamic> getSuperHeroData() async {
    _loadingStatus = LoadingStatus.loading;
    var _response = await http.get(Uri.parse('https://protocoderspoint.com/jsondata/superheros.json'));

    switch (_response.statusCode) {
      case 200:
        {
          _loadingStatus = LoadingStatus.idle;

          return jsonDecode(_response.body);
        }

      default:
        {
          _loadingStatus = LoadingStatus.idle;
        }
    }
  }
}
