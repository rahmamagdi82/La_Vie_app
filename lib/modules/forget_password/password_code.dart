import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../shared/components/components.dart';
import 'add_new_password.dart';
import 'forget_password_cubit/cubit.dart';
import 'forget_password_cubit/states.dart';

class PasswordCode extends StatelessWidget
{

  var codeController=TextEditingController();
  var formKey=GlobalKey<FormState>();

  String email;
  PasswordCode({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit,ForgetPasswordStates>(
      listener: (BuildContext context, state) {  },
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
                    'Please Enter The Code Sent To Your Email.',
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
                      control: codeController,
                      validate: (value) {
                        if(value!.isEmpty){
                          return 'Enter verification code, please';
                        }else if(value.length != 6)
                        {
                          return 'Verification code is wrong';
                        }
                        else
                        {
                          return null;
                        }
                      },
                      type: TextInputType.number,
                      label: 'Code',
                    ),
                  ),
                  const SizedBox(height: 36.0,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: defaultButton(
                      radius: 5.0,
                      function: () {
                        if(formKey.currentState!.validate()){
                          ForgetPasswordCubit.get(context).verifyCode(
                            email: email,
                            otp: codeController.text,
                          );
                          navigationTo(context, NewPassword(email: email,otp:codeController.text,));
                        }
                      },
                      text: 'Verify',
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