import 'dart:async';

import 'package:qrlogistix/app/data/helpers/helpers.dart';
import 'package:qrlogistix/app/domain/enumerators/enumerators.dart';
import 'package:qrlogistix/app/domain/models/models.dart';

class StorageService {
  final HttpHelper _http;

  StorageService(this._http);

  Future<HttpResultModel<List<StorageModel>>> all() async {
    final response = await _http.request<List<StorageModel>>(
      '/api/Storages/GetList',
      method: HttpMethodEnum.get,
      headers: _getHeaders(),
      parser: (data) {
        List<StorageModel> dataResponse = [];
        for (var storage in data) {
          dataResponse.add(
            StorageModel(
              active: storage[StorageModel.activeDataName],
              description: storage[StorageModel.descriptionDataName],
              name: storage[StorageModel.nameDataName],
              nameQr: storage[StorageModel.nameQrDataName],
              storageId: storage[StorageModel.storageIdDataName],
            ),
          );
        }

        return dataResponse;
      },
    );

    _printResults(response);

    return response;
  }

    Future<HttpResultModel<List<ZoneStorageModel>>> allById(String id) async {
    final response = await _http.request<List<ZoneStorageModel>>(
      '/api/Storages/GetZonesByStorage/$id',
      method: HttpMethodEnum.get,
      headers: _getHeaders(),
      parser: (data) {
        List<ZoneStorageModel> dataResponse = [];
        for (var zone in data) {
          dataResponse.add(
            ZoneStorageModel(
              zoneId: zone[ZoneStorageModel.zoneIdDataName],
              name: zone[ZoneStorageModel.nameDataName],
              color: zone[ZoneStorageModel.colorDataName],
              numberPackages: zone[ZoneStorageModel.numberPackagesDataName]
            ),
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
