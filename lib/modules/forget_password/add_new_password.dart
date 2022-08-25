import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../layout/login_register_layout.dart';
import '../../shared/components/components.dart';
import 'forget_password_cubit/cubit.dart';
import 'forget_password_cubit/states.dart';

class NewPassword extends StatelessWidget
{

  var passwordController= TextEditingController();
  var confirmPasswordController=TextEditingController();
  var formKey=GlobalKey<FormState>();

  String email;
  String otp;
  NewPassword({Key? key,required this.email,required this.otp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit,ForgetPasswordStates>(
      builder: (BuildContext context, state) {
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
                    'Your New Password Must Be Different From Previously Used Password.',
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
                      control: passwordController,
                      validate: (value) {
                        if(value!.isEmpty){
                          return 'Password must be not empty';
                        }else
                        {
                          return null;
                        }
                      },
                      type: TextInputType.visiblePassword,
                      label: 'New password',
                      obscure: true,
                    ),
                  ),
                  const SizedBox(height: 30.0,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: defaultTextFormField(
                      control: confirmPasswordController,
                      validate: (value) {
                        if(value!.isEmpty){
                          return 'Re-Enter password';
                        }else if(passwordController.text != confirmPasswordController.text)
                        {
                          return 'Confirm password is wrong';
                        } else
                        {
                          return null;
                        }
                      },
                      type: TextInputType.visiblePassword,
                      label: 'Confirm password',
                      obscure: true,
                    ),
                  ),
                  const SizedBox(height: 36.0,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: defaultButton(
                      radius: 5.0,
                      function: () {
                        if(formKey.currentState!.validate()){
                          ForgetPasswordCubit.get(context).resetPassword(
                              email: email,
                              otp: otp,
                              password: passwordController.text,
                          );
                          navigationAndFinish(context, LoginLayout());
                        }
                      },
                      text: 'Reset Password',
                      height: 46.24,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      listener: (BuildContext context, Object? state) {},

    );
  }
}