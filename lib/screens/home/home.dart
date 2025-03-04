import 'package:flutter/material.dart';
import 'package:flutter_book/screens/appointments/appointments.dart';
import 'package:flutter_book/screens/contacts/contacts.dart';
import 'package:flutter_book/screens/home/tabs.dart';
import 'package:flutter_book/screens/tasks/tasks.dart';

import '../notes/notes.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(length: 4, child: Scaffold(
      appBar: AppBar(
        title: const Text('FlutterBook'),
        bottom: const TabBar(tabs: appTabs)
      ),
      body: const TabBarView(children: [
        Appointments(), Contacts(), Notes(), Tasks()
      ]),
    ));
  }
}
