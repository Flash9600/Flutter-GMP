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
  Future<Response<dynamic>> getActualFilms() {
    final $url = '/3/movie/now_playing';
    final $headers = {
      'api_key': '5f3db21eab1266ec44623577da01412d',
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getFilm(int id) {
    final $url = '/3/movie/${id}';
    final $headers = {
      'api_key': '5f3db21eab1266ec44623577da01412d',
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
