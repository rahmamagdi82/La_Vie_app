import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../modules/login/login.dart';
import '../modules/register/register.dart';
import '../shared/style/colors.dart';

class LoginLayout extends StatefulWidget
{

  @override
  State<LoginLayout> createState() => _LoginLayoutState();
}

class _LoginLayoutState extends State<LoginLayout> {

  bool selectLogin = true;
  bool selectSignup = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Align(
            alignment: AlignmentDirectional.topEnd,
            child: Image(
                image: AssetImage(
                    "assets/images/tree.png",
                ),
            ),
          ),
          const Center(
            child: Image(
              image: AssetImage(
                "assets/images/logo.png",
              ),
            ),
          ),
          const SizedBox(height: 44.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  TextButton(
                    onPressed: (){
                      setState(() {
                        selectSignup=true;
                        selectLogin=false;
                      });
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        color: (selectSignup) ? defaultColor : HexColor('#8A8A8A'),
                        fontWeight: FontWeight.w400,
                        fontSize: 18.0,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                  if(selectSignup)
                    Container(
                      width: 44.5,
                      height: 1.0,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: defaultColor,
                            width: 3.0,
                          ),
                        ),
                      ),
                    )
                ],
              ),
              const SizedBox(
                width: 100.0,
              ),
              Column(
                children: [
                  TextButton(
                    onPressed: (){
                      setState(() {
                        selectSignup=false;
                        selectLogin=true;
                      });
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: (selectLogin) ? defaultColor : HexColor('#8A8A8A'),
                        fontWeight: FontWeight.w400,
                        fontSize: 18.0,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                  if(selectLogin)
                    Container(
                      width: 44.5,
                      height: 1.0,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: defaultColor,
                            width: 3.0,
                          ),
                        ),
                      ),
                    )
                ],
              ),
            ],
          ),
          SizedBox(height: 30.0,),
          if(selectLogin)
             Login(),
          if(selectSignup)
            Signup(),
        ],
      ),
    );
  }
}