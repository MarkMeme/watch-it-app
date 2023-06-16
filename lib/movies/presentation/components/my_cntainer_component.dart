import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyContainerComponent extends StatelessWidget {
  String title = '';
  Function callBackFunction;

  MyContainerComponent({required this.title, required this.callBackFunction});

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
              callBackFunction();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'See More ',
                    style: GoogleFonts.poppins(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                        color: Colors.white),
                  ),
                  const Icon(Icons.arrow_forward_ios,
                      size: 16.0, color: Colors.white)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
