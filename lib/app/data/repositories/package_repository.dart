import 'package:qrlogistix/app/data/services/services.dart';
import 'package:qrlogistix/app/domain/interfaces/interfaces.dart';
import 'package:qrlogistix/app/domain/models/models.dart';

class PackageRepository implements IPackageRepository {
  final PackageService _api;

  PackageRepository(this._api);

  @override
  Future<List<PackageModel>> getAll() {
    final response = _api.getAll().then((value) => value.data!);
    return response;
  }
}
