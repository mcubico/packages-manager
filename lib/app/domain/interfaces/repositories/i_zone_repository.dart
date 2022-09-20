import 'package:qrlogistix/app/domain/models/models.dart';

abstract class IZoneRepository {
  Future<List<ZoneModel>> all();
  Future<ZoneDetailModel> detail(String id);
}