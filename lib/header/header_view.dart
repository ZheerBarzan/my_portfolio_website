import 'package:auto_size_text/auto_size_text.dart';
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
        if (size.isMobile) return const HeaderMobileView();
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
  final bool? isMobile;

  const HeaderBody({super.key, this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          "I'm a Mobile/Game ",
          style: GoogleFonts.montserrat(fontSize: 60),
          maxLines: 1,
        ),
        AutoSizeText(
          "Developer </> ",
          style: GoogleFonts.montserrat(fontSize: 60),
          maxLines: 1,
        ),
        const SizedBox(
          height: 40,
        ),
        AutoSizeText(
          "Computer Engineer mainly working on App/Game development with Flutter framework, Python and Unreal Engine. ",
          style: GoogleFonts.montserrat(fontSize: 24),
          maxLines: 3,
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
            padding: EdgeInsets.symmetric(
              vertical: isMobile ?? false ? 10 : 15,
              horizontal: isMobile ?? false ? 10 : 15,
            ),
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
            const HeaderBody(
              isMobile: true,
            ),
          ],
        ),
      ),
    );
  }
}
