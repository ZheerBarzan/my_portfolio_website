import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio_website/header/header_view.dart';
import 'package:my_portfolio_website/navigation/navigation_bar_view.dart';
import 'package:my_portfolio_website/project/project_view.dart';
import 'package:responsive_builder/responsive_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mr.ZHEER",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
            displayMedium:
                GoogleFonts.montserrat(color: Colors.black, fontSize: 30)),
      ),
      home: const PortfolioView(),
    );
  }
}

class PortfolioView extends StatelessWidget {
  const PortfolioView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      endDrawer: const DrawerView(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const NavigationBarView(),
            HeaderView(height: height, width: width),
            const ProjectView(),
            Container(height: height, width: width, color: Colors.white),
          ],
        ),
      ),
    );
  }
}

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (_, size) {
        if (!size.isMobile) return const SizedBox();
        return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white,
                      Colors.blue,
                    ],
                  ),
                  color: Colors.blue,
                ),
                child: Text("Z H E E R  B A R Z A N"),
              ),
              for (var item in NavigationItem.navigationItems)
                ListTile(
                  title: Text(item.text),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}
