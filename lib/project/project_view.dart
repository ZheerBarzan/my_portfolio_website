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
      //color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            "Projects",
            style: GoogleFonts.montserrat(fontSize: 60),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var items in ProjectItems)
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        items.image,
                        height: 500,
                      ),
                      Text(
                        items.title,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      const SizedBox(),
                      Text(
                        items.description,
                        style: TextStyle(fontSize: 17),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            for (final tech in items.technologies)
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Chip(
                                  label: Text(tech),
                                ),
                              )
                          ],
                        ),
                      )
                    ],
                  ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProjectItem {
  final String image;
  final String title;
  final String description;
  final List<String> technologies;

  ProjectItem({
    required this.image,
    required this.title,
    required this.description,
    required this.technologies,
  });
}

final ProjectItems = [
  ProjectItem(
      image: "images/1.png",
      title: "Project gauss",
      description:
          "A calculator application that is built for IOS and Android and named after the great German mathematician Johann Carl Friedrich Gauss.",
      technologies: [
        'Flutter',
        'Dart',
      ]),
  ProjectItem(
    image: "images/2.png",
    title: "MineSweeper Game",
    description: "A simple retro game of minesweeper ",
    technologies: [
      "Flutter",
      "Dart",
    ],
  ),
  ProjectItem(
    image: "images/chess.png",
    title: "Chess Game",
    description: "comming soon ",
    technologies: [
      "Flutter",
      "Dart",
    ],
  ),
];
