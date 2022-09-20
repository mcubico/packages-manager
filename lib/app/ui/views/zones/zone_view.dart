import 'package:flutter/material.dart';

import 'package:qrlogistix/app/data/helpers/helpers.dart';
import 'package:qrlogistix/app/data/repositories/repositories.dart';
import 'package:qrlogistix/app/data/services/services.dart';
import 'package:qrlogistix/app/domain/enumerators/view_routes_enum.dart';
import 'package:qrlogistix/app/domain/models/models.dart';
import 'package:qrlogistix/app/router/app_router.dart';
import 'package:qrlogistix/app/ui/views/views.dart';

class ZoneHomeView extends StatelessWidget {
  const ZoneHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final http = HttpHelper('https://qrlogistixapi.azurewebsites.net');
    final repo = ZoneRepository(ZoneService(http));
    final storageRepo = StorageRepository(StorageService(http));
    final List<StorageModel> storages = [];
    storageRepo.all().then((value) => storages.addAll(value));

    return Scaffold(
      appBar: AppBar(
        title: const Image(
          image: NetworkImage(
            'https://app.qrlogistix.com/media/logos/simbolo_white.png',
          ),
          height: 40,
        ),
      ),
      body: FutureBuilder(
        future: repo.all(),
        builder: (context, AsyncSnapshot<List<ZoneModel>> snapshot) {
          if (!snapshot.hasData) return LoadingView();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: const Text(
                        'Zones',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.add, size: 15),
                      label: const Text('Add'),
                      onPressed: () => {},
                    ),
                  ),
                ],
              ),

              // List Zones
              Expanded(
                child: ListView.separated(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => ListTile(
                    // Title
                    title: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: snapshot.data![index].name,
                          style: TextStyle(
                            color: Colors.amber.shade900,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text:
                              ' - ${snapshot.data![index].active ? 'Active' : 'Inactive'}',
                          style: TextStyle(color: Colors.grey.shade800),
                        ),
                      ]),
                    ),

                    // Subtitle
                    subtitle: Container(
                      padding: const EdgeInsets.only(top: 5),
                      child: RichText(
                        text: TextSpan(children: [
                          const WidgetSpan(
                              child: Icon(Icons.business_outlined)),
                          TextSpan(
                            text: '  ${snapshot.data![index].nameStorage}',
                            style: TextStyle(color: Colors.grey.shade800),
                          ),
                        ]),
                      ),
                    ),

                    // Arrow Icon
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),

                    // On Tap
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.getViewRoute(ViewRoutesEnum.zoneDetail),
                        arguments: snapshot.data![index].zoneId,
                      );
                    },
                  ),

                  // Separator
                  separatorBuilder: (context, index) => const Divider(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
