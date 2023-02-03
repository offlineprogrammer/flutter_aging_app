import 'package:flutter/material.dart';

import 'data/celebrities.dart';
import 'model/celebrity.dart';
import 'widgets/celebrity_image.dart';
import 'widgets/select_age_button.dart';
import 'widgets/select_celebrity_dropdown.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showold = false;
  final List<Celebrity> celebritiesList = List.of(celebrities);

  late Celebrity selectedCelebrity;

  @override
  void initState() {
    selectedCelebrity = celebritiesList.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            SelectCelebrityDropdown(
              celebritiesList: celebritiesList,
              onCelebritySelected: (Celebrity value) {
                setState(() {
                  selectedCelebrity = value;
                });
              },
              selectedCelebrity: selectedCelebrity,
            ),
            const SizedBox(
              height: 30,
            ),
            SelectAgeButton(
              text: _showold ? 'Get Younger' : 'Get Older',
              onAgeChanged: () {
                setState(() {
                  _showold = !_showold;
                });
              },
            ),
            const SizedBox(
              height: 50,
            ),
            AnimatedCrossFade(
              firstChild: CelebrityImage(
                imageName: selectedCelebrity.imageOld,
              ),
              secondChild: CelebrityImage(
                imageName: selectedCelebrity.imageYoung,
              ),
              crossFadeState: _showold
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(seconds: 1),
            ),
          ],
        ),
      ),
    );
  }
}
