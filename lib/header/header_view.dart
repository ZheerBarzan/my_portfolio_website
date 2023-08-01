import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (_, size) {
        if (size.isMobile) return HeaderMobileView();
        return Container(
          height: height,
          width: width * 0.8,
          child: const Row(
            children: [
              Expanded(
                child: HeaderBody(),
              ),
              FlutterLogo(
                size: 300,
              ),
            ],
          ),
        );
      },
    );
  }
}

class HeaderBody extends StatelessWidget {
  const HeaderBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "I'm a Mobile/Game ",
          style: GoogleFonts.montserrat(fontSize: 60),
        ),
        Text(
          "Developer </> ",
          style: GoogleFonts.montserrat(fontSize: 60),
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          "Computer Engineer mainly working on App/Game development with Flutter framework, Python and Unreal Engine. ",
          style: GoogleFonts.montserrat(fontSize: 24),
        ),
        const SizedBox(
          height: 40,
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.redAccent,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 15),
            child: Text(
              "Email Me",
              style: GoogleFonts.montserrat(fontSize: 24),
            ),
          ),
        )
      ],
    );
  }
}

class HeaderMobileView extends StatelessWidget {
  const HeaderMobileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Container(
        height: height * 9,
        width: width,
        child: Column(
          children: [
            FlutterLogo(
              size: height * 0.3,
            ),
            const SizedBox(
              height: 30,
            ),
            const HeaderBody(),
          ],
        ),
      ),
    );
  }
}
