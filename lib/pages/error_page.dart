import 'dart:ffi';

import 'package:bwa_cozy/pages/home_page.dart';
import 'package:bwa_cozy/theme.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset("assets/images/404.png", width: 300)),
            SizedBox(height: 70),
            Text(
              "Where are you going",
              style: blackTextStyle.copyWith(fontSize: 24),
            ),
            SizedBox(height: 14),
            Text(
              "Seems like the page that you were\n requested is already gone",
              style: greyTextStyle.copyWith(fontSize: 16),
            ),
            SizedBox(height: 50),
            Container(
              height: 50,
              width: 210,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: purpleColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(17),
                  ),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                    (route) => false,
                  );
                },
                child: Text(
                  "Back to home",
                  style: whiteTextStyle.copyWith(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
