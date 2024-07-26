import 'dart:developer';
import 'dart:io';

import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class FetchContactsScreen extends StatefulWidget {
  @override
  State<FetchContactsScreen> createState() => _FetchContactsScreenState();
}

class _FetchContactsScreenState extends State<FetchContactsScreen> {
  Iterable<Contact>? _contacts;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestContactPermission();
  }

  Future<void> requestContactPermission() async {
    var status = await Permission.contacts.status;
    await Permission.contacts.request();
    if (status.isDenied) {
      await Permission.contacts.request();
    }
    if (await Permission.contacts.isGranted) {
     getContacts();
    } else {
     openAppSettings();
    }
  }
  Future<void> getContacts() async {
    Iterable<Contact> contacts = await ContactsService.getContacts();

    setState(() {
      _contacts = contacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Conatact Screen",
          style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
      ),
      body: _contacts != null
          ? ListView.builder(
        itemCount: _contacts!.length,
        itemBuilder: (context, index) {
          Contact contact = _contacts!.elementAt(index);
          return ListTile(
            title: Text(
              contact.displayName ?? '',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
            subtitle: Text(
              contact.phones!.isNotEmpty
                  ? contact.phones!.first.value!
                  : 'No phone number',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
            ),
          );
        },
      )
          : Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
