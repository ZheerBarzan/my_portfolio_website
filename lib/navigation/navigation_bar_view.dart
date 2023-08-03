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
    return ResponsiveBuilder(builder: (context, size) {
      if (size.isMobile) {
        return Container(
          height: 60,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(children: [
              const FlutterLogo(),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  icon: const Icon(Icons.menu))
            ]),
          ),
        );
      }
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
    NavigationItem("Projects"),
    NavigationItem("Skills"),
    NavigationItem("Blog"),
    NavigationItem("About Me"),
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
    final isSmall = MediaQuery.of(context).size.width < 900;
    return Padding(
      padding: const EdgeInsets.only(left: 64),
      child: InkWell(
        mouseCursor: MaterialStateMouseCursor.clickable,
        onTap: onPressed,
        child: Text(
          text,
          style: GoogleFonts.montserrat(fontSize: isSmall ? 17 : 24),
        ),
      ),
    );
  }
}
