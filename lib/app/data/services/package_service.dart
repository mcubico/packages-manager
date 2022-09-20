import 'dart:async';

import 'package:qrlogistix/app/data/helpers/helpers.dart';
import 'package:qrlogistix/app/domain/enumerators/enumerators.dart';
import 'package:qrlogistix/app/domain/models/models.dart';

class PackageService {
  final HttpHelper _http;

  PackageService(this._http);

  Future<HttpResultModel<List<PackageModel>>> getAll() async {
    final response = await _http.request<List<PackageModel>>(
      '/api/Packages/GetList',
      method: HttpMethodEnum.get,
      
      headers: _getHeaders(),
      parser: (data) {
        List<PackageModel> dataResponse = [];
        for (var package in data) {
          dataResponse.add(
            PackageModel(
                packageId: package[PackageModel.packageIdDataName],
                residentId: package[PackageModel.residentIdDataName],
                storageId: package[PackageModel.storageIdDataName],
                zoneId: package[PackageModel.zoneIdDataName],
                apartmentId: package[PackageModel.apartmentIdDataName],
                buildingId: package[PackageModel.buildingIdDataName],
                qrId: package[PackageModel.qrIdDataName],
                entryDate: package[PackageModel.entryDateDataName],
                deliveryDate: package[PackageModel.deliveryDateDataName],
                createdDate: package[PackageModel.createdDateDataName],
                updatedDate: package[PackageModel.updatedDateDataName],
                delivered: package[PackageModel.deliveredDataName],
                nameZone: package[PackageModel.nameZoneDataName],
                color: package[PackageModel.colorDataName],
                nameStorage: package[PackageModel.nameStorageDataName],
                flat: package[PackageModel.flatDataName],
                nomenclatureApartment:
                    package[PackageModel.nomenclatureApartmentDataName],
                nomenclatureBuilding:
                    package[PackageModel.nomenclatureBuildingDataName],
                verified: package[PackageModel.verifiedDataName],
                currentStatus: package[PackageModel.currentStatusDataName],
                nameQr: package[PackageModel.nameQrDataName],
                nameResident: package[PackageModel.nameResidentDataName],
                receivedBy: package[PackageModel.receivedByDataName],
                createdBy: package[PackageModel.createdByDataName],
                updatedBy: package[PackageModel.updatedByDataName],
                deliveredBy: package[PackageModel.deliveredByDataName]),
          );
        }

        return dataResponse;
      },
    );

    _printResults(response);

    return response;
  }

  Map<String, String> _getHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Barer $token',
        'X-TENANT': 'ED1',
      };

  void _printResults(HttpResultModel response) {
    print('Result object type: ${response.data}');
    print('Result data: ${response.data}');
    print('Result data runtimeType: ${response.data.runtimeType}');
    print('Result statusCode: ${response.statusCode}');

    final error = response.error;
    if (error == null) return;

    print('Result error: $error');
    print('Result error data: ${error.data}');
    print('Result error exception: ${error.exception}');
    print('Result error stacktrace: ${error.stackTrace}');
  }
}
