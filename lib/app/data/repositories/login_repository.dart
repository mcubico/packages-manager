import 'dart:io';

import 'package:qrlogistix/app/data/services/services.dart';
import 'package:qrlogistix/app/domain/interfaces/interfaces.dart';
import 'package:qrlogistix/app/domain/models/models.dart';

class LoginRepository implements ILoginRepository {
  final LoginService _api;

  LoginRepository(this._api);

  @override
  Future<LoginModel> login(String userName, String password) async {
    final response = await _api.login(userName, password).then((value) async {
      if (value.statusCode == HttpStatus.ok) {
        return value.data!;
      }

      return LoginModel(
        errors: value.data != null
            ? value.data?.errors
            : value.error?.data['Message'],
        isSuccess: false,
      );
    });

    return response;
  }
}
