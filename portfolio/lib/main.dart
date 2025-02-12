import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/components/color_scheme.dart';
import 'package:portfolio/components/space_widgets.dart';
import 'package:portfolio/pages/portfolio_home.dart';
import 'package:portfolio/pages/projects.dart';
import 'package:portfolio/providers/navigation_provider';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NavigationProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Flutter Portfolio',
      theme: myTheme,
      home: Portfolio(),
    );
  }
}

class Portfolio extends StatefulWidget {
  const Portfolio({super.key});

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  final List<Widget> _pages = [
    const PortfolioHomePage(),
    const MyProjects(),
    const AwardsCertificationsPage(),
    const ContactMePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildNavItem("HOME", 0),
              addHorizontalSpace(25),
              _buildNavItem("PORTFOLIO", 1),
              addHorizontalSpace(40),
              Container(
                width: 150,
                height: 160,
                child: SvgPicture.asset('assets/images/logo-svg.svg'),
              ),
              addHorizontalSpace(40),
              _buildNavItem("ACCOMPLISHMENTS", 2),
              addHorizontalSpace(25),
              _buildNavItem("CONTACT", 3),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: _pages[navigationProvider.selectedIndex],
    );
  }

  // Function to create navigation buttons
  Widget _buildNavItem(String title, int index) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final ValueNotifier<bool> isHovered = ValueNotifier(false);

    return ValueListenableBuilder(
      valueListenable: isHovered,
      builder: (context, hovered, child) {
        return MouseRegion(
          onEnter: (_) => isHovered.value = true,
          onExit: (_) => isHovered.value = false,
          child: AnimatedScale(
            duration: const Duration(milliseconds: 200),
            scale: hovered ? 1.2 : 1.0, // Zoom effect on hover
            child: TextButton(
              onPressed: () => navigationProvider.updateIndex(index),
              child: Text(title,
                  style: myTheme.appBarTheme.titleTextStyle?.copyWith(
                    fontWeight: navigationProvider.selectedIndex == index
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: navigationProvider.selectedIndex == index
                        ? MyColors.accent2
                        : MyColors.text2,
                  )),
            ),
          ),
        );
      },
    );
  }
}

// ========== Different Pages (Customize these) ==========

class WorkGalleryPage extends StatelessWidget {
  const WorkGalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text("Work Gallery", style: TextStyle(fontSize: 24)));
  }
}

class AwardsCertificationsPage extends StatelessWidget {
  const AwardsCertificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text("Awards & Certifications", style: TextStyle(fontSize: 24)));
  }
}

class ContactMePage extends StatelessWidget {
  const ContactMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text("Contact Me", style: TextStyle(fontSize: 24)));
  }
}
