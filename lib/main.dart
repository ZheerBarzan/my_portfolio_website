import 'package:flutter/material.dart';
import 'package:my_portfolio_website/header/header_view.dart';
import 'package:my_portfolio_website/navigation/navigation_bar_view.dart';
import 'package:responsive_builder/responsive_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Mr.ZHEER",
      debugShowCheckedModeBanner: false,
      home: PortfolioView(),
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
            Container(
              height: height,
              width: width,
              color: Colors.blue,
            ),
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
        if (!size.isMobile) return SizedBox();
        return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text("drawer header"),
              ),
              ListTile(
                title: const Text('item 1'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('item 2'),
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
