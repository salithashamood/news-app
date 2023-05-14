import 'package:dio/dio.dart';
import 'package:utilities/utilities.dart';

enum HTTPMethod { get }

class ApiClient {
  late final Dio requestDio;
  static final ApiClient instance = ApiClient._internal();

  factory ApiClient() {
    return instance;
  }

  ApiClient._internal() {
    BaseOptions options = BaseOptions(
        // receiveTimeout: Duration(seconds: 60),
        // connectTimeout: Duration(seconds: 60)
        );
    requestDio = Dio(options);
    requestDio.options = options;
    requestDio.options.headers['Content-Type'] = 'application/json';
  }

  Future<Response> requestApi(String url, Map<String, dynamic> params) async {
    try {
      Response response = await requestDio.get(url, queryParameters: params);
      return response;
    } catch (error, stacktrace) {
      if (error is DioError) {
        throw handleError(error);
      } else {
        throw error;
      }
    }
  }

  String handleError(DioError error) {
    String errorDes = '';
    DioError dioError = error;
    switch (dioError.type) {
      case DioErrorType.cancel:
        errorDes = 'Request to API server to cancelled';
        break;
      case DioErrorType.connectionTimeout:
        errorDes = 'Connection timeout';
        break;
      case DioErrorType.unknown:
        errorDes =
            'Connecction to API server failed due to internet connection';
        break;
      case DioErrorType.receiveTimeout:
        errorDes = 'Receive timeout';
        break;
      case DioErrorType.sendTimeout:
        errorDes = 'Send timeout';
        break;
      default:
    }
    return errorDes;
  }
}
