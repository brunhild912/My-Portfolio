import 'package:portfolio/components/color_scheme.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/components/space_widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  Color githubIconColor = MyColors.text2;
  Color linkedinIconColor = MyColors.text2;
  Color xingIconColor = MyColors.text2;
  Color upworkIconColor = MyColors.text2;
  Color menuIconColor = Colors.grey;
  Color arrowdownIconColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            // Positioned image inside the Stack
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                  //add boxes etc
                  ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              height: screenHeight * 0.7,
              width: screenWidth * 0.9,
              decoration: BoxDecoration(
                // border: Border.all(width: 8.0, color: MyColors.accent1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceEvenly, // Centers everything inside the row
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Navbar - Left Most Column
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MouseRegion(
                        onEnter: (_) =>
                            setState(() => menuIconColor = MyColors.accent1),
                        onExit: (_) =>
                            setState(() => menuIconColor = Colors.grey),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.menu,
                            color: menuIconColor,
                            size: 20,
                          ),
                          hoverColor: Colors.transparent,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 10.0, left: 5.0),
                        child: Column(
                          children: [
                            // Social Icons
                            buildSocialIcon(
                                'assets/images/github.svg', githubIconColor,
                                (color) {
                              setState(() => githubIconColor = color);
                            }, "https://github.com/brunhild912"),
                            buildSocialIcon(
                                'assets/images/linkedin.svg', linkedinIconColor,
                                (color) {
                              setState(() => linkedinIconColor = color);
                            }, "https://www.linkedin.com/in/aribaa/"),
                            buildSocialIcon(
                                'assets/images/xing.svg', xingIconColor,
                                (color) {
                              setState(() => xingIconColor = color);
                            }, "https://www.xing.com/profile/Ariba_Anjum/web_profiles"),
                            buildSocialIcon(
                                'assets/images/upwork.svg', upworkIconColor,
                                (color) {
                              setState(() => upworkIconColor = color);
                            }, "https://www.upwork.com/freelancers/~010d04f51b00e16ab4"),
                          ],
                        ),
                      ),
                      MouseRegion(
                        onEnter: (_) => setState(
                            () => arrowdownIconColor = MyColors.accent1),
                        onExit: (_) =>
                            setState(() => arrowdownIconColor = Colors.grey),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            size: 20,
                            color: arrowdownIconColor,
                          ),
                          hoverColor: Colors.transparent,
                        ),
                      ),
                    ],
                  ),

                  // Centered Intro Section (Inside Expanded for dynamic space allocation)
                  Expanded(
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              'W E L C O M E   TO   M Y   D I G I T A L   R E A L M',
                              style: myTheme.textTheme.bodyLarge),
                          addVerticalSpace(screenWidth * 0.01),
                          Text(
                              'Where creativity meets code, and ideas turn into reality. '),
                          addVerticalSpace(screenWidth * 0.01),
                          Text('I\'m Ariba Anjum'),
                          addVerticalSpace(screenWidth * 0.01),
                          Text(
                              ' A Flutter Software Engineer crafting seamless, user-friendly \nmobile experiences that bring visions to life—one app at a time!'),
                          addVerticalSpace(screenWidth * 0.03),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Learn More'),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Image Section - Right
                  SizedBox(
                    width: screenWidth * 0.4,
                    height: screenHeight * 0.5,
                    child: Image.asset(
                      'assets/images/home2.png',
                      width: screenWidth * 0.4,
                      height: screenHeight * 0.4,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSocialIcon(
      String assetPath, Color iconColor, Function(Color) onHover, String url) {
    final ValueNotifier<bool> isHovered = ValueNotifier(false);

    return ValueListenableBuilder(
      valueListenable: isHovered,
      builder: (context, hovered, child) {
        return MouseRegion(
          onEnter: (_) {
            isHovered.value = true;
            onHover(MyColors.accent2);
          },
          onExit: (_) {
            isHovered.value = false;
            onHover(MyColors.text2);
          },
          child: AnimatedScale(
            duration: const Duration(milliseconds: 200),
            scale: hovered ? 1.2 : 1.0, // Zoom effect on hover
            child: IconButton(
              icon: SvgPicture.asset(
                assetPath,
                colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                width: 20,
                height: 20,
              ),
              iconSize: 20,
              onPressed: () {
                _launchUrl(url);
              },
              hoverColor: Colors.transparent,
            ),
          ),
        );
      },
    );
  }

  Future<void> _launchUrl(String _url) async {
    final Uri url = Uri.parse(_url);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
