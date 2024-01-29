import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_template/cubits/user/cubit.dart';
import 'package:flutter_template/providers/user_provider.dart';
import 'package:flutter_template/screens/login_screen/login_screen.dart';
import 'package:flutter_template/utils/logging/logger.dart';

import '/cubits/product/cubit.dart';
import '/cubits/store/cubit.dart';
import '/models/product.dart';
import '/models/store.dart';
import '/providers/store_provider.dart';
import '/screens/home_screen/home_screen.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/adapters.dart';
import '/providers/tab_provider.dart';
import '/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'configs/core_theme.dart' as theme;
import 'screens/no_internet_screen/no_internet_screen.dart';
import 'screens/splash/splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<String> deviceInfo() async {
  String deviceIdentifier = '';
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  if (kIsWeb) {
    final WebBrowserInfo webInfo = await deviceInfo.webBrowserInfo;
    deviceIdentifier = webInfo.vendor! +
        webInfo.userAgent! +
        webInfo.hardwareConcurrency.toString();
  } else {
    if (Platform.isAndroid) {
      final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceIdentifier = androidInfo.id;
    } else if (Platform.isIOS) {
      final IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceIdentifier = iosInfo.identifierForVendor!;
    } else if (Platform.isLinux) {
      final LinuxDeviceInfo linuxInfo = await deviceInfo.linuxInfo;
      deviceIdentifier = linuxInfo.machineId!;
    }
  }
  return deviceIdentifier;
}

void main() async {
  await Hive.initFlutter("v1");

  await dotenv.load(fileName: ".env");

  Hive.registerAdapter<Store>(StoreAdapter());
  Hive.registerAdapter<Product>(ProductAdapter());
  await Hive.openBox('app');
  await Hive.openBox('menubox');
  await Hive.openBox('storesbox');
  await Hive.openBox('productBox');
  await Hive.openBox('storeId');
  await Hive.openBox('menu');
  await Hive.openBox('cart');
  await Hive.openBox('userBox');
  await Hive.openBox('user');

  String deviceId = await deviceInfo();

  final cache = Hive.box('app');

  cache.put("deviceId", deviceId);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MultiProvider(
        providers: [
          // BlocProvider(create: (_) => ArticlesCubit()),
          BlocProvider(create: (_) => StoresCubit()),
          BlocProvider(create: (_) => ProductCubit()),
          BlocProvider(create: (_) => UserCubit()),
          // BlocProvider(create: (_) => TopHeadlinesCubit()),
          ChangeNotifierProvider(create: (_) => StoreProvider()),
          ChangeNotifierProvider(create: (_) => UserProvider()),
          ChangeNotifierProvider(create: (_) => TabProvider()),
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
          // ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ],
        child: Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            return MaterialChild(
              provider: themeProvider,
            );
          },
        ));
  }
}

class MaterialChild extends StatelessWidget {
  final ThemeProvider provider;
  MaterialChild({
    Key? key,
    required this.provider,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final storeProvider = Provider.of<StoreProvider>(context);
    // storeProvider
    return StreamBuilder<ConnectivityResult>(
        stream: Connectivity().onConnectivityChanged,
        builder: (context, snapshot) {
          printOut("${snapshot.error}");
          if (snapshot.hasData) {
            final connectivityResult = snapshot.data;
            if (connectivityResult == ConnectivityResult.none) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                home: NoInternetScreen(),
              );
            }
            return FutureBuilder(
              future: storeProvider.loadFromCache(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return ScreenUtilInit(
                    designSize: const Size(800, 1280),
                    minTextAdapt: true,
                    splitScreenMode: true,
                    builder: (context, child) {
                      return MaterialApp(
                        title: 'Flutter Template',
                        debugShowCheckedModeBanner: false,
                        themeMode:
                            provider.isDark ? ThemeMode.dark : ThemeMode.light,
                        theme: theme.themeLight,
                        darkTheme: theme.themeDark,
                        initialRoute: '/login',
                        routes: {
                          '/login': (context) => const LoginScreen(),
                          '/splash': (context) => const SplashScreen(),
                          '/home': (context) => const HomeScreen(),
                        },
                      );
                    });
              },
            );
            ;
          } else if (snapshot.hasError) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: NoInternetScreen(),
            );
          }

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: NoInternetScreen(),
          );
          // return Center(child: CircularProgressIndicator());
        });
  }
}
