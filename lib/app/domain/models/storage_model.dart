class StorageModel {
  final bool active;
  final String name;
  final String nameQr;
  final String storageId;
  final String? description;

  StorageModel({
    required this.active,
    required this.name,
    required this.nameQr,
    required this.storageId,
    this.description,
  });

  static const String activeDataName = 'Active';
  static const String descriptionDataName = 'Description';
  static const String nameDataName = 'Name';
  static const String nameQrDataName = 'NameQr';
  static const String storageIdDataName = 'StorageId';
}
