import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("TabBar View"),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.cloud_outlined),
              ),
              Tab(
                icon: Icon(Icons.beach_access_sharp),
              ),
              Tab(
                icon: Icon(Icons.brightness_5_sharp),
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          tileTabBar("this is cloud"),
          tileTabBar("this is beach"),
          tileTabBar("this is brightness"),
        ]),
      ),
    );
  }

  Widget tileTabBar(String title) {
    return Container(
      child: Center(
        child: Text(title),
      ),
    );
  }
}
