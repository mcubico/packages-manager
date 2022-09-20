class ZoneDetailModel {
  final String zoneId;
  final String qrId;
  final String storageId;
  final String? nameStorage;
  final String? name;
  final String? color;
  final String? description;
  final int capacity;
  final int availableCapacity;
  final String nameQr;
  final bool active;

  ZoneDetailModel({
    required this.zoneId,
    required this.storageId,
    required this.qrId, 
    this.description,
    required this.active,
    required this.nameQr,
    required this.capacity,
    required this.availableCapacity,
    this.name,
    this.color,
    this.nameStorage,
  });

  static const String zoneIdDataName = 'ZoneId';
  static const String qrIdDataName = 'QrId';
  static const String storageIdDataName = 'StorageId';
  static const String nameStorageDataName = 'NameStorage';
  static const String nameDataName = 'Name';
  static const String colorDataName = 'Color';
  static const String descriptionDataName = 'Description';
  static const String capacityDataName = 'Capacity';
  static const String availableCapacityDataName = 'AvailableCapacity';
  static const String nameQrDataName = 'NameQr';
  static const String activeDataName = 'Active';
}
