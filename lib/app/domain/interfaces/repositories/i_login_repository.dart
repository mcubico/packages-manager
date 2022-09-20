import 'package:qrlogistix/app/domain/models/models.dart';

abstract class ILoginRepository {
  Future<LoginModel> login(String username, String password);
}
