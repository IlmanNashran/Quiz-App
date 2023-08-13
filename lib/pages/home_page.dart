import 'package:flutter/material.dart';
import 'package:quiz_app/pages/game_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  double? _deviceHeight, _deviceWidth;
  double _currentDifficultyLevel = 0;
  final List<String> _difficultyTexts = ["Easy", "Medium", "Hard"];

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: _deviceWidth! * 0.10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [_appTitle(), _difficultySlider(), _startGameButton()],
            ),
          ),
        ),
      ),
    );
  }

//fucntion for title
  Widget _appTitle() {
    return Column(
      children: [
        const Text(
          "QUIZ APP",
          style: TextStyle(
              color: Colors.white, fontSize: 40, fontWeight: FontWeight.w500),
        ),
        Text(
          _difficultyTexts[_currentDifficultyLevel.toInt()],
          style: const TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

//function for slider level
  Widget _difficultySlider() {
    return Slider(
      label: "Diffculty",
      min: 0,
      max: 2,
      divisions: 2,
      value: _currentDifficultyLevel,
      onChanged: (_value) {
        setState(
          () {
            _currentDifficultyLevel = _value;
          },
        );
      },
    );
  }

  //navigate to startgame
  Widget _startGameButton() {
    return MaterialButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext _context) {
              return GamePage(
                  difficultyLevel:
                      _difficultyTexts[_currentDifficultyLevel.toInt()]
                          .toLowerCase());
            },
          ),
        );
      },
      color: Colors.blue,
      minWidth: _deviceWidth! * 0.80,
      height: _deviceHeight! * 0.10,
      child: const Text(
        "Start",
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
    );
  }
}
