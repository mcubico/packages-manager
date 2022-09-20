class PackageModel {
  final String packageId;
  final String residentId;
  final String? storageId;
  final String? zoneId;
  final String apartmentId;
  final String buildingId;
  final String qrId;
  final String? entryDate;
  final String? deliveryDate;
  final String? createdDate;
  final String? updatedDate;
  final bool? delivered;
  final String? nameZone;
  final String? color;
  final String? nameStorage;
  final String? flat;
  final String? nomenclatureApartment;
  final String? nomenclatureBuilding;
  final bool verified;
  final int currentStatus;
  final String? nameQr;
  final String? nameResident;
  final String? receivedBy;
  final String? createdBy;
  final String? updatedBy;
  final String? deliveredBy;

  PackageModel(
      {required this.packageId,
      required this.residentId,
      this.storageId,
      this.zoneId,
      required this.apartmentId,
      required this.buildingId,
      required this.qrId,
      this.entryDate,
      this.deliveryDate,
      this.createdDate,
      this.updatedDate,
      this.delivered,
      this.nameZone,
      this.color,
      this.nameStorage,
      this.flat,
      this.nomenclatureApartment,
      this.nomenclatureBuilding,
      required this.verified,
      required this.currentStatus,
      this.nameQr,
      this.nameResident,
      this.receivedBy,
      this.createdBy,
      this.updatedBy,
      this.deliveredBy});

  static const String packageIdDataName = 'PackageId';
  static const String residentIdDataName = 'ResidentId';
  static const String storageIdDataName = 'StorageId';
  static const String zoneIdDataName = 'ZoneId';
  static const String apartmentIdDataName = 'ApartmentId';
  static const String buildingIdDataName = 'BuildingId';
  static const String qrIdDataName = 'QrId';
  static const String entryDateDataName = 'EntryDate';
  static const String deliveryDateDataName = 'DeliveryDate';
  static const String createdDateDataName = 'CreatedDate';
  static const String updatedDateDataName = 'UpdatedDate';
  static const String deliveredDataName = 'Delivered';
  static const String nameZoneDataName = 'NameZone';
  static const String colorDataName = 'Color';
  static const String nameStorageDataName = 'NameStorage';
  static const String flatDataName = 'Flat';
  static const String nomenclatureApartmentDataName = 'NomenclatureApartment';
  static const String nomenclatureBuildingDataName = 'NomenclatureBuilding';
  static const String verifiedDataName = 'Verified';
  static const String currentStatusDataName = 'CurrentStatus';
  static const String nameQrDataName = 'NameQr';
  static const String nameResidentDataName = 'NameResident';
  static const String receivedByDataName = 'ReceivedBy';
  static const String createdByDataName = 'CreatedBy';
  static const String updatedByDataName = 'UpdatedBy';
  static const String deliveredByDataName = 'DeliveredBy';
}
