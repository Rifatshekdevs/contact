import 'package:contact/src/controllers/contactController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddContactPage extends StatefulWidget {
  final String id;
  final String name;
  final String phoneNumber;

  AddContactPage({
    this.id,
    this.name,
    this.phoneNumber,
  });

  @override
  _AddContactPageState createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  final contactController = Get.put(ContactController(), permanent: true);

  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void initState() {
    nameController.text = widget.name;
    phoneController.text = widget.phoneNumber;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.id != null ? 'update Contact' : 'Add contact'),
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 12,
              ),
              TextField(
                controller: nameController,
                onChanged: contactController.fullName,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.5),
                    ),
                    labelText: 'Full Name'),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: phoneController,
                onChanged: contactController.phoneNumber,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.5),
                    ),
                    labelText: 'Phone Number'),
              ),
              SizedBox(
                height: 12,
              ),
              SizedBox(
                width: Get.width,
                child: TextButton.icon(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(StadiumBorder()),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blueAccent),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  onPressed: () {
                    widget.id != null
                        ? contactController.editContact(id: widget.id)
                        : contactController.addContact();
                  },
                  icon: Icon(Icons.add),
                  label: Text(widget.id != null ? 'Update' : 'Add'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
