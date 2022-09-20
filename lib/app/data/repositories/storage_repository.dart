import 'package:qrlogistix/app/data/services/services.dart';
import 'package:qrlogistix/app/domain/interfaces/interfaces.dart';
import 'package:qrlogistix/app/domain/models/models.dart';


class StorageRepository implements IStorageRepository {
  final StorageService _api;

  StorageRepository(this._api);

  @override
  Future<List<StorageModel>> all() {
    final response = _api.all().then((value) => value.data!);
    return response;
  }

 @override
  Future<List<ZoneStorageModel>> allById(String id) {
    final response = _api.allById(id).then((value) => value.data!);
    return response;
  }
}
