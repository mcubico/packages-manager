class ZoneStorageModel {
  final String zoneId;
  final String? name;
  final String? color;
  final int? numberPackages;


  ZoneStorageModel({
    required this.zoneId,
    this.name,
    this.color,
    this.numberPackages
  });

  static const String zoneIdDataName = 'ZoneId';
  static const String nameDataName = 'Name';
  static const String colorDataName = 'Color';
  static const int numberPackagesDataName = 0;
}