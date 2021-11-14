import 'package:chopper/chopper.dart';

part 'http_api_service.chopper.dart';

const String _kApiKeyHeader = '5f3db21eab1266ec44623577da01412d';

@ChopperApi(baseUrl: '/3/movie')
abstract class HttpApiService extends ChopperService {
  static HttpApiService create() {
    final client = ChopperClient(
      baseUrl: 'https://api.themoviedb.org',
      services: [
        _$HttpApiService(),
      ],
      converter: const JsonConverter(),
    );

    return _$HttpApiService(client);
  }

  @Get(
    path: '/now_playing',
    headers: {'api_key': _kApiKeyHeader},
  )
  Future<Response> getActualFilms();

  @Get(
    path: '/{id}',
    headers: {'api_key': _kApiKeyHeader},
  )
  Future<Response> getFilm(@Path('id') int id);
}
