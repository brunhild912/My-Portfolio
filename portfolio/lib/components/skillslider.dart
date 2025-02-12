import 'dart:async';
import 'package:flutter/material.dart';

class SkillsSlider extends StatefulWidget {
  const SkillsSlider({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SkillsSliderState createState() => _SkillsSliderState();
}

class _SkillsSliderState extends State<SkillsSlider>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late Timer _timer;

  final List<String> skills = [
    "Flutter",
    "Dart",
    "Firebase",
    "Node.js",
    "JavaScript",
    "REST API",
    "UI/UX Design",
    "Git",
    "MongoDB",
    "Express.js",
    "GraphQL",
    "SQL"
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    // Auto-scroll timer
    _timer = Timer.periodic(Duration(milliseconds: 50), (timer) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.offset + 1.5, // Adjust speed
          duration: Duration(milliseconds: 50),
          curve: Curves.linear,
        );
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60, // Adjust as needed
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(), // Prevent manual scrolling
        itemCount: skills.length * 2, // Duplicate for infinite effect
        itemBuilder: (context, index) {
          final skill = skills[index % skills.length]; // Loop skills
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                  spreadRadius: 2,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: Text(
                skill,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }
}
