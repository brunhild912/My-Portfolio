import 'package:flutter/material.dart';
import 'package:portfolio/components/color_scheme.dart';
import 'package:portfolio/components/skillslider.dart';
import 'package:portfolio/components/space_widgets.dart';

class MyProjects extends StatefulWidget {
  const MyProjects({super.key});

  @override
  State<MyProjects> createState() => _MyProjectsState();
}

class _MyProjectsState extends State<MyProjects> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
            left: 16.0, right: 16.0, bottom: 16.0, top: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "My Skills",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20), // Spacing
            SkillsSlider(),
            addVerticalSpace(40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildProjectContainer(
                    screenWidth: screenWidth, screenHeight: screenHeight),
                buildProjectContainer(
                    screenWidth: screenWidth, screenHeight: screenHeight),
                buildProjectContainer(
                    screenWidth: screenWidth, screenHeight: screenHeight),
                buildProjectContainer(
                    screenWidth: screenWidth, screenHeight: screenHeight),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class buildProjectContainer extends StatelessWidget {
  const buildProjectContainer({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
      width: screenWidth * 0.2,
      height: screenHeight * 0.4,
      decoration: BoxDecoration(
        color: Color(0xff080D26),
        border: Border.all(width: 1.0, color: Color(0xff1D2541)),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/sample.png'),
            Text(
              'C  O  D  I  E  F  Y',
              style: myTheme.textTheme.bodyLarge?.copyWith(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            Text(
              '01',
              style: myTheme.textTheme.bodyLarge?.copyWith(
                fontSize: 14,
                color: MyColors.accent2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
