import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
//import 'package:provider/provider.dart';

class GamePageProvider extends ChangeNotifier {
  final Dio _dio = Dio();

  BuildContext context;

  GamePageProvider({required this.context}) {
    _dio.options.baseUrl = "https://opentdb.com/api.php";
    print("hello");
  }
}
