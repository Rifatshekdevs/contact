import 'package:flutter/cupertino.dart';

class Contact {
  final String id;
  final String name;
  final String imageUrl;
  final String phoneNumber;

  Contact(
      {@required this.id,
      @required this.name,
      @required this.imageUrl,
      @required this.phoneNumber});
}
