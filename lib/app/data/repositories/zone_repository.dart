import 'package:qrlogistix/app/data/services/services.dart';
import 'package:qrlogistix/app/domain/interfaces/interfaces.dart';
import 'package:qrlogistix/app/domain/models/models.dart';

class ZoneRepository implements IZoneRepository {
  final ZoneService _api;

  ZoneRepository(this._api);

  @override
  Future<List<ZoneModel>> all() {
    final response = _api.all().then((value) => value.data!);
    return response;
  }

  @override
  Future<List<ZoneModel>> allByStorageId(String storageId) {
    final response = _api.allByStorageId(storageId).then((value) => value.data!);
    return response;
  }

  @override
  Future<ZoneDetailModel> detail(String zoneId) {
    final response = _api.detail(zoneId).then((value) => value.data!);
    return response;
  }
}
