import 'package:qrlogistix/app/domain/models/models.dart';
import 'package:qrlogistix/app/domain/models/package_model.dart';

abstract class IPackageRepository {
  Future<List<PackageModel>> getAll();
}
