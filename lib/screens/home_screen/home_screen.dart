import '/configs/app.dart';
import '/configs/app_typography.dart';
import 'package:flutter/material.dart';

import '/configs/color_palatte.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Scaffold(
      backgroundColor: ColorPalette.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Flexible(
            flex: 5,
            child: Container(
              width: double.infinity,
              child: const Image(
                  fit: BoxFit.fitHeight,
                  image: AssetImage("assets/images/banners/home.banner.png")),
            ),
          ),
          Flexible(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                    gradient: Gradients.homeBlackGradientBackground,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                child: Row(children: [
                  Expanded(
                    flex: 2,
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/lang');
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Gọi Món Tại Đây",
                                style: AppText.h1b!.copyWith(
                                    color: ColorPalette.textBlackColor,
                                    fontFamily: "DeterminationSans")),
                          ],
                        )),
                  ),
                  const Flexible(
                      flex: 1,
                      child: Image(
                        image: AssetImage("assets/images/OrderHere.png"),
                      ))
                ]),
              ))
        ],
      ),
    );
  }
}
