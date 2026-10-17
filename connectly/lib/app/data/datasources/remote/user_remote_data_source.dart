import 'package:connectly/app/data/models/remote_user_model.dart';
import 'package:dio/dio.dart';
import 'package:logger/web.dart';

class UserRemoteDataSource {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  final Logger _logger = Logger();
  UserRemoteDataSource() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          _logger.d('REQUEST: ${options.method} ${options.uri}');
          handler.next(options);
        },
        onResponse: (response, handler) {
          _logger.i(
            'RESPONSE: ${response.statusCode} ${response.requestOptions.uri}',
          );
          handler.next(response);
        },
        onError: (error, handler) async {
          final options = error.requestOptions;
          final retryCount = options.extra['retryCount'] as int? ?? 0;

          final isGetRequest = options.method.toUpperCase() == 'GET';

          final isRetryableError =
              error.type == DioExceptionType.connectionTimeout ||
              error.type == DioExceptionType.sendTimeout ||
              error.type == DioExceptionType.receiveTimeout ||
              error.type == DioExceptionType.connectionError ||
              [500, 502, 503, 504].contains(error.response?.statusCode);

          if (!isGetRequest || !isRetryableError || retryCount >= 2) {
            _logger.e(
              'REQUEST FAILED: ${error.message}',
              error: error,
              stackTrace: error.stackTrace,
            );
            handler.next(error);
            return;
          }

          options.extra['retryCount'] = retryCount + 1;

          _logger.w(
            'Retrying GET request (${retryCount + 1}/2): ${options.uri}',
          );

          await Future.delayed(Duration(milliseconds: 500));

          try {
            final response = await _dio.fetch<dynamic>(options);
            handler.resolve(response);
          } on DioException catch (retryError) {
            handler.next(retryError);
          }
        },
      ),
    );
  }

  Future<List<RemoteUserModel>> getUsers() async {
    final response = await _dio.get('/users');

    final users = response.data as List;

    return users
        .map((user) => RemoteUserModel.fromJson(user as Map<String, dynamic>))
        .toList();
  }

  Future<RemoteUserModel> addUser(RemoteUserModel user) async {
    final response = await _dio.post(
      '/users',
      data: {'name': user.name, 'email': user.email, 'phone': user.phone},
    );

    return RemoteUserModel.fromJson(response.data as Map<String, dynamic>);
  }
}
