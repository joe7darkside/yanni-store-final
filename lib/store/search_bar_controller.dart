import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchbarController extends GetxController {
  final TextEditingController filter = TextEditingController();
  final dio = Dio();
  String searchBar = "";
  List filteredNames = [];
  List names = [];
  List titles = [];
  Icon searchIcon = Icon(Icons.search, color: Colors.white);
  Widget appBarTitle = Text('Store');
  void getItemsName() async {
    Uri url = Uri.parse('https://jsonplaceholder.typicode.com/todos/');
    http.Response response = await http.get(
      // host API
      url,
    );
    List tempList = [];
    List tempList2 = [];

    var body = json.decode(response.body);
    print(body);
    for (var i = 0; i < body.length; i++) {
      tempList.add(body[i]['id']);
      tempList2.add(body[i]['title']);
    }
    names = tempList;
    titles = tempList2;
    // print(names);
  }

  void searchBarChange() {
    if (searchIcon.icon == Icons.search) {
      print("s");
      searchIcon = Icon(Icons.close);
      appBarTitle = TextField(
          controller: filter,
          autofocus: true,
          decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              hintText: 'Search...'));
      update();
    } else {
      print("2");

      searchIcon = Icon(Icons.search);
      appBarTitle = Text('Store');
      filteredNames = names;
      filter.clear();
      update();
    }
  }
}
