// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$HttpApiService extends HttpApiService {
  _$HttpApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = HttpApiService;

  @override
  Future<Response<dynamic>> _getActualFilmsResponse(
      {String key = _kApiKey, String localize = 'ru-RU'}) {
    final $url = '/3/movie/now_playing';
    final $params = <String, dynamic>{'api_key': key, 'language': localize};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _getFilmResponse(int id) {
    final $url = '/3/movie/${id}5f3db21eab1266ec44623577da01412d';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
