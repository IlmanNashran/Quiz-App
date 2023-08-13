import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
//import 'package:provider/provider.dart';

class GamePageProvider extends ChangeNotifier {
  final Dio _dio = Dio();
  final int _maxQuestions = 10;

  List? questions; //get query api input
  int _currentQuestionCount = 0;

  BuildContext context;

  GamePageProvider({required this.context}) {
    _dio.options.baseUrl = "https://opentdb.com/api.php";
    _getQuestionsFromApi();
  }

  //function for get api data qeury
  Future<void> _getQuestionsFromApi() async {
    var _response = await _dio.get(
      '',
      queryParameters: {
        'amount': 10,
        'type': 'boolean',
        'difficulty': 'easy',
      }, //get url attribute query
    );
    var _data = jsonDecode(
      _response.toString(),
    );
    questions = _data["results"];
    notifyListeners();
  }

  String getCurrentQuestions() {
    return questions![_currentQuestionCount]["question"];
  }
}
