import 'dart:convert';
import 'package:http/http.dart';
import 'package:qrlogistix/app/domain/enumerators/enumerators.dart';
import 'package:qrlogistix/app/domain/models/models.dart';

typedef Parser<T> = T Function(dynamic data);

class HttpHelper {
  final String baseUrl;

  HttpHelper(this.baseUrl);

  Future<HttpResultModel<T>> request<T>(
    String endpoint, {
    HttpMethodEnum method = HttpMethodEnum.get,
    Map<String, String> headers = const {},
    Map<String, String> queryParameters = const {},
    dynamic body,
    Parser<T>? parser,
    Duration timeout = const Duration(seconds: 10),
  }) async {
    late int statusCode = 500;
    dynamic data;

    try {
      Uri url = _makeUrl(endpoint, queryParameters);
      late Response response;

      body = _parseBody(body);
      response = await _sendRequest(
        url: url,
        method: method,
        headers: headers,
        body: body,
        timeout: timeout,
      );

      data = _parseResponseData(response.body);
      statusCode = response.statusCode;

      if (statusCode >= 400) {
        throw HttpErrorModel(
          exception: null,
          stackTrace: StackTrace.current,
          data: data,
        );
      }

      return HttpResultModel<T>(
          data: parser != null ? parser(data) : data,
          statusCode: statusCode,
          error: null);
    } catch (exception, stackTrace) {
      if (exception is HttpErrorModel) {
        return HttpResultModel<T>(
          data: null,
          statusCode: statusCode,
          error: exception,
        );
      }

      // Se presentó un error en la comunicación con el servidor
      return HttpResultModel<T>(
        data: data,
        error: HttpErrorModel(
          exception: exception,
          stackTrace: stackTrace,
          data: data,
        ),
        statusCode: statusCode,
      );
    }
  }

  Uri _makeUrl(String endpoint, Map<String, String> queryParameters) {
    late Uri url;

    if (_urlContainHttpOrHttps(endpoint)) {
      url = Uri.parse(endpoint);
    } else {
      url = Uri.parse('$baseUrl$endpoint');
    }

    if (queryParameters.isNotEmpty) {
      url = url.replace(
        queryParameters: {...url.queryParameters, ...queryParameters},
      );
    }

    return url;
  }

  bool _urlContainHttpOrHttps(String endpoint) =>
      endpoint.startsWith('http://') || endpoint.startsWith('https://');

  Future<Response> _sendRequest({
    required Uri url,
    required HttpMethodEnum method,
    required Map<String, String> headers,
    required dynamic body,
    required Duration timeout,
  }) {
    late Client client;

    client = Client();
    switch (method) {
      case HttpMethodEnum.get:
        return client.get(url, headers: headers).timeout(timeout);
      case HttpMethodEnum.post:
        return client.post(url, headers: headers, body: body).timeout(timeout);
      case HttpMethodEnum.put:
        return client.put(url, headers: headers, body: body).timeout(timeout);
      case HttpMethodEnum.patch:
        return client.patch(url, headers: headers, body: body).timeout(timeout);
      case HttpMethodEnum.delete:
        return client
            .delete(url, headers: headers, body: body)
            .timeout(timeout);
    }
  }

  dynamic _parseBody(dynamic body) {
    try {
      return json.encode(body);
    } catch (_) {
      return body;
    }
  }

  dynamic _parseResponseData(dynamic data) {
    try {
      return json.decode(data);
    } catch (_) {
      return data;
    }
  }
}
