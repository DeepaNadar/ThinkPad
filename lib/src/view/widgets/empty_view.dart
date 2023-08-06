import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../res/assets.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
              AnimationAssets.empty,
              width: MediaQuery.of(context).size.width*.35,
            ),
            Text("Fill the void with your thoughts. Tap + to start",style: GoogleFonts.poppins()),
            SizedBox(height: MediaQuery.of(context).size.height*.2,),
      ],
    );
  }
}