import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyContainerComponent extends StatelessWidget {
  String title = '';

  MyContainerComponent({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(
        16.0,
        24.0,
        16.0,
        8.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
                fontSize: 19,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.15,
                color: Colors.white),
          ),
          InkWell(
            onTap: () {
              /// TODO : NAVIGATION TO Top Rated Movies Screen
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  Text(
                    'See More',
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(Icons.arrow_forward_ios, size: 16.0, color: Colors.white)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
