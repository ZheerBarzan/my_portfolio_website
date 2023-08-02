import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio_website/header/header_view.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavigationBarView extends StatelessWidget {
  const NavigationBarView({super.key});

  @override
  Widget build(BuildContext context) {
    //final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return ResponsiveBuilder(builder: (
      context,
      size,
    ) {
      final onPressed = () => print("click");

      return Container(
        height: 100,
        width: width * 0.8,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            const FlutterLogo(),
            const Spacer(),
            for (var item in NavigationItem.navigationItems)
              NavigationBarItem(onPressed: onPressed, text: item.text)
          ],
        ),
      );
    });
  }
}

class NavigationItem {
  final String text;
  NavigationItem(this.text);

  static final navigationItems = [
    NavigationItem("project"),
    NavigationItem("Skills"),
    NavigationItem("blog"),
    NavigationItem("about me"),
  ];
}

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final void Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 64),
      child: InkWell(
        mouseCursor: MaterialStateMouseCursor.clickable,
        onTap: onPressed,
        child: Text(
          text,
          style: GoogleFonts.montserrat(fontSize: 24),
        ),
      ),
    );
  }
}
