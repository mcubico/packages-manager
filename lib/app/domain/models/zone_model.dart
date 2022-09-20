class ZoneModel {
  final String zoneId;
  final String storageId;
  final String? name;
  final String? color;
  final String? nameStorage;
  final bool active;
  final int? capacity;
  final int? availableCapacity;
  final String nameQr;

  ZoneModel({
    required this.zoneId,
    required this.storageId,
    required this.active,
    required this.nameQr,
    this.name,
    this.color,
    this.nameStorage,
    this.capacity,
    this.availableCapacity,
  });

  static const String zoneIdDataName = 'ZoneId';
  static const String storageIdDataName = 'StorageId';
  static const String nameDataName = 'Name';
  static const String colorDataName = 'Color';
  static const String nameStorageDataName = 'NameStorage';
  static const String activeDataName = 'Active';
  static const String capacityDataName = 'Capacity';
  static const String availableCapacityDataName = 'AvailableCapacity';
  static const String nameQrDataName = 'NameQr';
}
