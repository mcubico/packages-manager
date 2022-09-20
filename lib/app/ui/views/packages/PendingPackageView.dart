import 'package:flutter/material.dart';
import 'package:qrlogistix/app/data/helpers/helpers.dart';
import 'package:qrlogistix/app/data/repositories/repositories.dart';
import 'package:qrlogistix/app/data/services/services.dart';

class PendingPackageView extends StatelessWidget {
  int _selectedIndex = 0;
  bool isActive = true;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Tab 0: Home'),
    Text('Tab 1: Business'),
    Text('Tab 2: School'),
  ];

  static const List<BottomNavigationBarItem> _navigationItems =
      <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
  ];

  void _onItemTapped(int index) {
    // setState(() {
    // _selectedIndex = index;
    //});
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_cast
    final http = HttpHelper('https://qrlogistixapi.azurewebsites.net');
    final PackageRepository repo = PackageRepository(PackageService(http));

    return Scaffold(
      appBar: AppBar(
        title: Text('PendingPackage'),
      ),
      body: Column(children: <Widget>[
        myBannerWidget(context),
        myOptionWidget(context),
        Container(
          alignment: Alignment.centerLeft,
          margin: new EdgeInsets.only(top: 20.0, left: 10.0),
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: const Text(
            "Your Packages",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        myListWidget(context),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        items: _navigationItems,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

Widget myBannerWidget(BuildContext context) {
  return Container(
      alignment: Alignment.centerRight,
      margin: new EdgeInsets.symmetric(vertical: 5.0),
      height: MediaQuery.of(context).size.height * 0.09,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.blue,
      ),
      child: const Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(
              left: 15,
              bottom: 20,
              right: 20,
              top: 20), //apply padding to some sides only
          child: Text(
            "Package to receive",
            style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 20,
                color: Color.fromARGB(255, 255, 255, 255)),
          ),
        ),
      ));
}

Widget myOptionWidget(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 20),
    height: MediaQuery.of(context).size.height * 0.08,
    width: MediaQuery.of(context).size.width,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        Container(
          width: 180,
          child: SizedBox(
            height: 100,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Image.network(
                  'https://cdn3.iconfinder.com/data/icons/delivery-flat-2/64/01-Delivery_man-512.png'),
              label: const Text("Request Delivery"),
              style: TextButton.styleFrom(
                  backgroundColor: Colors.blue[100],
                  foregroundColor: Colors.blue),
            ),
          ),
        ),
        const Spacer(),
        Container(
          width: 180,
          child: SizedBox(
            height: 100,
            child: Container(
              child: ElevatedButton.icon(
                  onPressed: () {
                    // Respond to button press
                  },
                  icon: Image.network(
                      'https://play-lh.googleusercontent.com/xae6H3MW4AbWrCJ1T7tvoEBR6slcjdHGSJdiqzgh0cvhUlOJl4-2oDDcsrNz6mTf01Q=w240-h480-rw'),
                  label: Text("My QR"),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.pink[50],
                      foregroundColor: Colors.pink[300])),
            ),
          ),
        ),
        const Spacer(),
      ],
    ),
  );
}

Widget myListWidget(BuildContext context) {
  return Container(
    margin: new EdgeInsets.symmetric(vertical: 5.0),
    height: MediaQuery.of(context).size.height * 0.50,
    width: MediaQuery.of(context).size.width,
    child: ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.map),
          title: Text('Map'),
        ),
        ListTile(
          leading: Icon(Icons.photo_album),
          title: Text('Album'),
        ),
        ListTile(
          leading: Icon(Icons.phone),
          title: Text('Phone'),
        ),
        ListTile(
          leading: Icon(Icons.unarchive),
          title: Text('unarchive'),
        ),
      ],
    ),
  );
}

btnOnClick() {}
