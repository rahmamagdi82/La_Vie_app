import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_via_plant/layout/lavia_layout.dart';
import 'package:la_via_plant/layout/login_register_layout.dart';
import 'package:la_via_plant/shared/components/components.dart';
import 'package:la_via_plant/shared/components/cubit/bloc_observe.dart';
import 'package:la_via_plant/shared/components/cubit/cubit.dart';
import 'package:la_via_plant/shared/components/cubit/states.dart';
import 'package:la_via_plant/shared/network/local/cash_helper.dart';
import 'package:la_via_plant/shared/network/remote/dio_helper.dart';
import 'package:la_via_plant/shared/style/colors.dart';
import 'package:material_color_generator/material_color_generator.dart';

import 'package:page_transition/page_transition.dart';
import 'modules/forget_password/forget_password_cubit/cubit.dart';
import 'modules/scan/scan_qr.dart';


Future<void> main() async {
  Widget widget;

  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.initial();
  await CashHelper.initial();
  token=CashHelper.getData(key: 'token');
  BlocOverrides.runZoned(
        () {
        if(token != null)
        {
          widget=LaViaLayout();
        }else
        {
          widget=LoginLayout();
        }
        runApp(MyApp(startWidget: widget,));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  Widget startWidget;

  MyApp({Key? key, required this.startWidget}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => LaviaCubit()..getProducts(),
        ),
        BlocProvider(
          create: (BuildContext context) => ForgetPasswordCubit(),
        )
      ],
      child: BlocConsumer<LaviaCubit, LaviaStates>(
        listener: (context, states) {},
        builder: (context, states) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: AnimatedSplashScreen(
              duration: 1000,
              splash: 'assets/images/splash.png',
              nextScreen: startWidget,
              splashTransition: SplashTransition.slideTransition,
              pageTransitionType: PageTransitionType.leftToRightWithFade,
              backgroundColor: Colors.white,
            ),
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                titleSpacing: 20.0,
                elevation: 0.0,
                backgroundColor: Colors.white,
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
              ),
              primarySwatch: generateMaterialColor(color: defaultColor),
            ),

          );
        },
      ),
    );
  }
}
