import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:qrlogistix/app/data/helpers/helpers.dart';
import 'package:qrlogistix/app/data/repositories/repositories.dart';
import 'package:qrlogistix/app/data/services/services.dart';
import 'package:qrlogistix/app/domain/models/login_model.dart';

class LoginFormProvider extends ChangeNotifier {
  String _email = '';
  String _password = '';
  String _errorMessage = '';
  String _errorMessageAuthentication = '';
  bool __emailModified = false;
  bool __passwordModified = false;
  bool _isLoading = false;
  bool? __authenticationWasSuccessful;

  final formKey = GlobalKey<FormState>();
  final storage = const FlutterSecureStorage();

  bool rememberMe = false;
  bool get emailModified => __emailModified;
  set _emailModified(bool value) {
    __emailModified = value;
    notifyListeners();
  }

  bool get passwordModified => __passwordModified;
  set _passwordModified(bool value) {
    __passwordModified = value;
    notifyListeners();
  }

  bool? get authenticationWasSuccessful => __authenticationWasSuccessful;
  set _authenticationWasSuccessful(bool value) {
    __authenticationWasSuccessful = value;
    notifyListeners();
  }

  String get errorMessage => _errorMessage;
  String get errorMessageAuthentication => _errorMessageAuthentication;

  String get email => _email;
  set email(String value) {
    if (!__emailModified) {
      _emailModified = true;
      notifyListeners();
    }

    _email = value;
  }

  String get password => _password;
  set password(String value) {
    _passwordModified = true;
    _password = value;
    notifyListeners();
  }

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() => formKey.currentState?.validate() ?? false;

  bool isValidEmail() {
    _cleanErrorMessage();

    if (email.isEmpty) {
      _errorMessage = 'Required';
      return false;
    }

    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);

    if (regExp.hasMatch(email)) return true;

    _errorMessage = 'The email address is wrong';
    return false;
  }

  bool isValidPassword() {
    _cleanErrorMessage();

    if (password.isEmpty) {
      _errorMessage = 'Required';
      return false;
    }

    return true;
  }

  Future<LoginModel?> login() async {
    isLoading = true;
    final http = HttpHelper(baseUrl);
    final LoginRepository repo = LoginRepository(LoginService(http));

    LoginModel? userData;
    await repo.login(email, password).then(
      (value) async {
        _authenticationWasSuccessful = value.errors == null;
        if (!__authenticationWasSuccessful!) {
          _errorMessageAuthentication = value.errors!;
        }

        await storage.write(key: 'token', value: value.message);
        userData = value;

        isLoading = false;
      },
    );

    return userData;
  }

  Future logout() async {
    await storage.delete(key: 'token');
    return;
  }

  Future<String> getToken() async {
    return await storage.read(key: 'token') ?? '';
  }

  void _cleanErrorMessage() => _errorMessage = '';
}
