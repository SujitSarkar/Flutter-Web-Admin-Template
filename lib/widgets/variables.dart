import 'package:flutter/material.dart';

class Variables{

  ///This is the entire multi-level list displayed by this app
  static List<Entry> sideBarMenuList(){
    final List<Entry> data = <Entry>[
      Entry('Doctors', <Entry>[
        Entry('All Doctor'),
        Entry('New Doctor'),
        Entry('Register New Doctor'),
      ]),
      Entry('Patients', <Entry>[
        Entry('All Patient'),
        Entry('New Patient'),
      ]),
      Entry('Medicines', <Entry>[
        Entry('All Medicine'),
        Entry('Add Medicine'),
      ]),
      Entry('Blogs', <Entry>[
        Entry('All Blog'),
        Entry('Write Blog'),
      ]),
      Entry('Representatives', <Entry>[
        Entry('All Representative'),
        Entry('Add Representative'),
      ]),
      Entry('Discount Shop', <Entry>[
        Entry('All Shop'),
        Entry('Add Shop'),
      ]),
      Entry('Notifications', <Entry>[
        Entry('All Notification'),
        Entry('Send Notification'),
      ]),
      Entry('Problems', <Entry>[
        Entry('Patient Problems'),
        Entry('Doctor Problems'),
      ]),
      Entry('Payments', <Entry>[
        Entry('Discount Shop Payments'),
        Entry('Appointment Payments'),
      ]),
      Entry('Update Payment', <Entry>[
        Entry('Dollar Unit & Appointment Charge'),
      ]),
    ];
    return data;
  }
}

class Entry {
  final String title;
  final List<Entry>children; //Since this is an expansion list...children can be another list of entries.

  Entry(this.title,[this.children = const <Entry>[]]);
}
