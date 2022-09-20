import 'package:qrlogistix/app/domain/models/models.dart';

abstract class IStorageRepository {
  Future<List<StorageModel>> all();
}