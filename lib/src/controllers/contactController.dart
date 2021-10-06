import 'package:contact/src/models/contact.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class ContactController extends GetxController {
  final fullName = ''.obs;

  final phoneNumber = ''.obs;

  final contacts = RxList<Contact>();

  void addContact() {
    final contactData = Contact( 
        id: Uuid().v1(),
        name: fullName.value,
        imageUrl: 'assets/images/Avatar1.jpg',
        phoneNumber: phoneNumber.value);
    contacts.add(contactData);

    Get.back();
  }

  void deleteContact({@required String id}) {
    contacts.removeWhere((item) => item.id == id);

    Get.snackbar(
      'Successfully',
      'Contact Deleted',
      backgroundColor: Colors.white,
      icon: Icon(Icons.done),
      colorText: Colors.black,
      snackPosition: SnackPosition.TOP,
    );
  }

  void editContact({@required String id}) {
    final updateData = Contact(
      id: id,
      name: fullName.value,
      imageUrl: 'assets/images/Avatar1.jpg',
      phoneNumber: phoneNumber.value,
    );

    contacts[contacts.indexWhere((item) => item.id == id)] = updateData;
    Get.back();
  }
}

