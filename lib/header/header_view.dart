import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return Container(
      height: height,
      width: width * 0.8,
      child: Row(
        children: [
          Expanded(
            child: Column(
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 17, horizontal: 15),
                    child: Text(
                      "Email Me",
                      style: GoogleFonts.montserrat(fontSize: 24),
                    ),
                  ),
                )
              ],
            ),
          ),
          const FlutterLogo(
            size: 300,
          ),
        ],
      ),
    );
  }
}
