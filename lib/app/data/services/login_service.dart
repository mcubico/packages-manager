import 'dart:async';

import 'package:qrlogistix/app/data/helpers/helpers.dart';
import 'package:qrlogistix/app/domain/enumerators/enumerators.dart';
import 'package:qrlogistix/app/domain/models/models.dart';

class LoginService {
  final HttpHelper _http;

  LoginService(this._http);
  Future<HttpResultModel<LoginModel>> login(
      String userName, String password) async {
    final response = await _http.request<LoginModel>(
      '/api/Auth/Login',
      method: HttpMethodEnum.post,
      body: {"Email": userName, "Password": password},
      headers: _getHeaders(),
      parser: (data) {
        LoginModel dataResponse = LoginModel(
          message: data[LoginModel.messageDataName],
          isSuccess: data[LoginModel.isSuccessDataName],
          errors: data[LoginModel.errorsDataName],
          expireDate: data[LoginModel.expireDateDataName],
          userId: data[LoginModel.userIdDataName],
          tenantName: data[LoginModel.tenantNameDataName],
          roleName: data[LoginModel.roleNameDataName],
        );

        token = dataResponse.message;
        return dataResponse;
      },
    );

    _printResults(response);

    return response;
  }

  void _printResults(HttpResultModel response) {
    print('Result object type: ${response.data}');
    print('Result data: ${response.data}');
    print('Result data runtimeType: ${response.data.runtimeType}');
    print('Result statusCode: ${response.statusCode}');

    final error = response.error;
    if (error == null) return;

    print('Result error: $error');
    print('Result error data: ${error.data}');
    print('Result error exception: ${error.exception}');
    print('Result error stacktrace: ${error.stackTrace}');
  }

  Map<String, String> _getHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
}
