import 'package:flutter/material.dart';
import 'package:qrlogistix/app/data/helpers/helpers.dart';
import 'package:qrlogistix/app/data/repositories/repositories.dart';
import 'package:qrlogistix/app/data/services/services.dart';
import 'package:qrlogistix/app/domain/models/models.dart';
import 'package:qrlogistix/app/ui/views/views.dart';

// TODO: Convertir a StateFullWidget para que el nombre del widget se despliegue cuando carguen los datos de la zona
class ZoneDetailView extends StatelessWidget {
  const ZoneDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String zoneId = ModalRoute.of(context)?.settings.arguments as String;
    // ignore: unnecessary_cast
    final http = HttpHelper('https://qrlogistixapi.azurewebsites.net');
    final ZoneRepository repo = ZoneRepository(ZoneService(http));
    final ButtonStyle style =
        TextButton.styleFrom(foregroundColor: Theme.of(context).colorScheme.onPrimary);

    return Scaffold(
      // AppBar
      appBar: AppBar(
        title: const Text('Zone Detail'),
        actions: [
          TextButton(
            onPressed: () {},
            style: style,
            child: const Text('View'),
          ),
          TextButton(
            onPressed: () {},
            style: style,
            child: const Text('Edit'),
          )
        ],
      ),

      // Body
      body: FutureBuilder(
        future: repo.detail(zoneId),
        builder: (context, AsyncSnapshot<ZoneDetailModel> snapshot) {
          if (snapshot.data == null) return LoadingView();

          return ListView(
            children: [
              Card(
                child: ListTile(
                    leading: const Icon(Icons.all_inbox_rounded),
                    title: Text(snapshot.data!.name.toString())),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.storage_rounded),
                  title: const Text('Capacity'),
                  subtitle: Text(snapshot.data!.capacity.toString()),
                ),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.analytics_outlined),
                  title: const Text('Available'),
                  subtitle: Text(snapshot.data!.availableCapacity.toString()),
                ),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.pix),
                  title: const Text('Packages'),
                  subtitle: Text('0'),
                ),
              ),
              Card(
                child: Column(
                  children: [
                    const Image(
                      image: NetworkImage(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/QR_code_for_mobile_English_Wikipedia.svg/1200px-QR_code_for_mobile_English_Wikipedia.svg.png',
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Container(
                            padding: const EdgeInsets.only(top: 5),
                            child: RichText(
                              text: TextSpan(children: [
                                const WidgetSpan(child: Icon(Icons.print)),
                                TextSpan(
                                  text: 'Print',
                                  style: TextStyle(color: Colors.grey.shade800),
                                ),
                              ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                child: ListTile(
                  title: const Text('Storage'),
                  subtitle: Text(snapshot.data!.nameStorage.toString()),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                child: ListTile(
                  title: const Text('Color'),
                  subtitle: Text(snapshot.data!.color.toString()),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                child: ListTile(
                  title: const Text('Description'),
                  subtitle: Text(snapshot.data?.description != null
                      ? snapshot.data!.description.toString()
                      : 'no description'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
