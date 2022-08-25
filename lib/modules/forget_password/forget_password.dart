import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:la_via_plant/modules/forget_password/password_code.dart';

import '../../shared/components/components.dart';
import 'forget_password_cubit/cubit.dart';
import 'forget_password_cubit/states.dart';

class ForgetPassword extends StatelessWidget
{

  var emailController=TextEditingController();
  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit,ForgetPasswordStates>(
      listener: (BuildContext context, state) {
      },
      builder: (BuildContext context, Object? state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: Image(
                      image: AssetImage(
                        "assets/images/tree.png",
                      ),
                    ),
                  ),
                  const SizedBox(height: 15.0,),
                  Text(
                    'Please Enter Your Email Address To Receive a Verification Code.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: HexColor('#3A3A3A'),
                    ),
                  ),
                  const SizedBox(height: 35.0,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: defaultTextFormField(
                      control: emailController,
                      validate: (value) {
                        if(value!.isEmpty){
                          return 'Email must be not empty';
                        }else
                        {
                          return null;
                        }
                      },
                      type: TextInputType.emailAddress,
                      label: 'Email',
                    ),
                  ),
                  const SizedBox(height: 36.0,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: defaultButton(
                      radius: 5.0,
                      function: () {
                        if(formKey.currentState!.validate()){
                          ForgetPasswordCubit.get(context).sendVerifyCode(email: emailController.text);
                          navigationTo(context, PasswordCode(email: emailController.text,));
                        }
                      },
                      text: 'Send',
                      height: 46.24,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}