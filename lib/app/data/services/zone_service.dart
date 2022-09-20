import 'dart:async';

import 'package:qrlogistix/app/data/helpers/helpers.dart';
import 'package:qrlogistix/app/domain/enumerators/enumerators.dart';
import 'package:qrlogistix/app/domain/models/models.dart';

class ZoneService {
  final HttpHelper _http;

  ZoneService(this._http);

  Future<HttpResultModel<List<ZoneModel>>> all() async {
    final response = await _http.request<List<ZoneModel>>(
      '/api/Zones/GetList',
      method: HttpMethodEnum.get,
      headers: _getHeaders(),
      parser: (data) {
        List<ZoneModel> dataResponse = [];
        for (var zone in data) {
          dataResponse.add(
            ZoneModel(
              zoneId: zone[ZoneModel.zoneIdDataName],
              storageId: zone[ZoneModel.storageIdDataName],
              active: zone[ZoneModel.activeDataName],
              nameQr: zone[ZoneModel.nameQrDataName],
              name: zone[ZoneModel.nameDataName],
              color: zone[ZoneModel.colorDataName],
              nameStorage: zone[ZoneModel.nameStorageDataName],
              capacity: zone[ZoneModel.capacityDataName],
              availableCapacity: zone[ZoneModel.availableCapacityDataName],
            ),
          );
        }

        return dataResponse;
      },
    );

    _printResults(response);

    return response;
  }

  Future<HttpResultModel<List<ZoneModel>>> allByStorageId(String storageId) async {
    final response = await _http.request<List<ZoneModel>>(
      '/api/Zones/GetList?storageId=$storageId',
      method: HttpMethodEnum.get,
      headers: _getHeaders(),
      parser: (data) {
        List<ZoneModel> dataResponse = [];
        for (var zone in data) {
          dataResponse.add(
            ZoneModel(
              zoneId: zone[ZoneModel.zoneIdDataName],
              storageId: zone[ZoneModel.storageIdDataName],
              active: zone[ZoneModel.activeDataName],
              nameQr: zone[ZoneModel.nameQrDataName],
              name: zone[ZoneModel.nameDataName],
              color: zone[ZoneModel.colorDataName],
              nameStorage: zone[ZoneModel.nameStorageDataName],
              capacity: zone[ZoneModel.capacityDataName],
              availableCapacity: zone[ZoneModel.availableCapacityDataName],
            ),
          );
        }

        return dataResponse;
      },
    );

    _printResults(response);

    return response;
  }



  Future<HttpResultModel<ZoneDetailModel>> detail(String zoneId) async {
    final response = await _http.request<ZoneDetailModel>(
      '/api/Zones/GetDetailedInformation/$zoneId',
      method: HttpMethodEnum.get,
      headers: _getHeaders(),
      parser: (data) {
        data = data[0];
        ZoneDetailModel dataResponse = ZoneDetailModel(
          zoneId: data[ZoneDetailModel.zoneIdDataName],
          qrId: data[ZoneDetailModel.qrIdDataName],
          storageId: data[ZoneDetailModel.storageIdDataName],
          nameStorage: data[ZoneDetailModel.nameStorageDataName],
          name: data[ZoneDetailModel.nameDataName],
          color: data[ZoneDetailModel.colorDataName],
          description: data[ZoneDetailModel.descriptionDataName],
          capacity: data[ZoneDetailModel.capacityDataName],
          availableCapacity: data[ZoneDetailModel.availableCapacityDataName],
          nameQr: data[ZoneDetailModel.nameQrDataName],
          active: data[ZoneDetailModel.activeDataName],
        );

        return dataResponse;
      },
    );

    _printResults(response);

    return response;
  }

  Map<String, String> _getHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Basic dGVzdDoxMjM0NTY3ODk=',
        'X-TENANT': 'ED1',
        'X-TOKEN': 'asadsdsa'
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
