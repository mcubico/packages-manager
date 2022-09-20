import 'package:qrlogistix/app/domain/models/zone_storge_model.dart';

abstract class IZoneStorageRepository {
  Future<List<ZoneStorageModel>> getAllById(String id);
}


