import 'package:contact/src/controllers/contactController.dart';
import 'package:contact/src/pages/addContactPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactsPage extends StatelessWidget {
  final contactController = Get.put(ContactController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List'),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Obx(
              () => ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: contactController.contacts.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = contactController.contacts[index];

                  return Column(
                    children: [
                      ListTile(
                        leading: Image.asset(item.imageUrl),
                        title: Text('${item.name}'),
                        subtitle: Text('${item.phoneNumber}'),
                        trailing: Container(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                iconSize: 30,
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  Get.to(
                                    AddContactPage(
                                      name: item.name,
                                      phoneNumber: item.phoneNumber,
                                      id: item.id,
                                    ),
                                  );
                                },
                              ),
                              IconButton(
                                iconSize: 30,
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  contactController.deleteContact(id: item.id);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddContactPage());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
