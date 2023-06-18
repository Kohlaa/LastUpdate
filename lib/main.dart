import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garduation/bloc/cubit.dart';
import 'package:garduation/network/remote/dio_helper.dart';
import 'package:garduation/payment/core/network/dio.dart';
import 'bloc_observer.dart';
import 'layout/parking_layout.dart';
import 'modules/auth/login/login.dart';
import 'network/local/cache_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  HttpOverrides.global = MyHttpOverrides();
  Widget widget;
  // WidgetsFlutterBinding.ensureInitialized();
  await DioHelperPayment.init();
  late String? token = CacheHelper.getData(key: 'token');

  if (token != null) {
    widget = Layout();
  } else {
    widget = const LoginScreen();
  }
  runApp(MyApp(startWidget: widget,));
}

class MyApp extends StatelessWidget {
  final Widget? startWidget;

  const MyApp({super.key, this.startWidget});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GradCubit>(
      create: (BuildContext context) => GradCubit()..getParking(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: startWidget,
        // home: SearchScreen(),
      ),
    );
  }
}
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
