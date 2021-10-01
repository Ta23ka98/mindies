import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddContentModel extends ChangeNotifier {
  String? title;
  String? author;


  Future addContent() async {
    if (title == null || title == "") {
      throw "タイトルが入力されていません";
    }

    if (author == null || author == "") {
      throw "著者が入力されていません";
    }

    await FirebaseFirestore.instance.collection('books').add({
      'title': title,
      'author': author,
    });


  }
}