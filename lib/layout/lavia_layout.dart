import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_via_plant/modules/scan/scan_qr.dart';
import 'package:la_via_plant/shared/components/components.dart';
import 'package:la_via_plant/shared/components/cubit/cubit.dart';
import 'package:la_via_plant/shared/components/cubit/states.dart';

import '../shared/style/colors.dart';


class LaViaLayout extends StatelessWidget {

  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<LaviaCubit,LaviaStates>(
      listener: (context,states){
        if(states is ScanState)
          navigationTo(context, ScanqrCode());
      },
      builder: (context,states){
        return Scaffold(
          appBar: AppBar(
              title:Center(child:LaviaCubit.get(context).titles[LaviaCubit.get(context).currentIndex] ,),
            actions: (LaviaCubit.get(context).currentIndex == 2)?[
              FloatingActionButton(
                elevation: 0.0,
                onPressed: () {  },
                child: Icon(
                  Icons.question_mark,
                  color: Colors.white,
                ),
                mini: true,
              ),
            ]:[],
          ),
          body:LaviaCubit.get(context).screens[LaviaCubit.get(context).currentIndex],
          bottomNavigationBar: CurvedNavigationBar(
            key: _bottomNavigationKey,
            height: 50.0,
            items: <Widget>[
              InkWell(
                child: const Image(
                  image: AssetImage(
                    'assets/images/leave.png',
                  ),
                ),
                onTap: (){
                  LaviaCubit.get(context).changeScreens(0);
                },
              ),
              InkWell(
                child: const Image(
                  image: AssetImage(
                    'assets/images/qr-code-scan.png',
                  ),
                ),
                onTap: (){
                  LaviaCubit.get(context).changeScreens(1);
                },
              ),
              InkWell(
                child: const Image(
                  image: AssetImage(
                    'assets/images/Home.png',
                  ),
                ),
                onTap: (){
                  print('2');
                  LaviaCubit.get(context).changeScreens(2);
                },
              ),
              InkWell(
                child: const Image(
                  image: AssetImage(
                    'assets/images/Bell.png',
                  ),
                ),
                onTap: (){
                  LaviaCubit.get(context).changeScreens(3);
                },
              ),
              InkWell(
                child: const Image(
                  image: AssetImage(
                    'assets/images/person.png',
                  ),
                ),
                onTap: (){
                  LaviaCubit.get(context).changeScreens(4);
                },
              ),
            ],
            letIndexChange: (index)=>false,
            index: 2,
            color: Colors.white,
            buttonBackgroundColor: defaultColor,
            backgroundColor:Colors.white10,
          ),
        );
      },
    );
  }
}