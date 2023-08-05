import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ProjectView extends StatelessWidget {
  const ProjectView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (_, size) {
      if (size.isMobile) return const ProjectMobileView();
      return const ProjectDesktopView();
    });
  }
}

class ProjectMobileView extends StatelessWidget {
  const ProjectMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class ProjectDesktopView extends StatelessWidget {
  const ProjectDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: height * 0.9,
      width: width * 0.8,
      color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            "Projects",
            style: GoogleFonts.montserrat(fontSize: 60),
          )
        ],
      ),
    );
  }
}
