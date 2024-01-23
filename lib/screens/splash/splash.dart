import 'package:flutter/material.dart';
import '/animations/entrance_fader.dart';
import '/configs/app.dart';
import '/providers/theme_provider.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _nextScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      final cache = Hive.box("app");
      final storeId = cache.get("storeId");
      final printIp = cache.get("printIp");
      if (storeId != null &&
          printIp != null &&
          printIp != "" &&
          storeId != "") {
        Navigator.pushNamed(context, '/home');
      } else {
        Navigator.pushNamed(context, '/setting');
      }
    });
  }

  void initTheme() {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    themeProvider.init();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initTheme();
      _nextScreen();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Scaffold(
        body: Center(
      child: EntranceFader(
          duration: const Duration(milliseconds: 300),
          offset: const Offset(0, 20),
          child: Image.asset(
            "assets/icons/logo.png",
          )),
    ));
  }
}
