import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:la_via_plant/modules/register/register_cubit/cubit.dart';
import 'package:la_via_plant/modules/register/register_cubit/states.dart';

import '../../layout/lavia_layout.dart';
import '../../shared/components/components.dart';
import '../../shared/components/cubit/cubit.dart';
import '../../shared/network/local/cash_helper.dart';

class Signup extends StatelessWidget
{

  var firstNameController=TextEditingController();
  var lastNameController=TextEditingController();
  var emailController=TextEditingController();
  var passwordController= TextEditingController();
  var confirmPasswordController=TextEditingController();
  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>RegisterCubit(),
      child: BlocConsumer<RegisterCubit,RegisterStates>(
        listener: (BuildContext context, Object? state) {
          if(state is RegisterSuccessState) {
            CashHelper.putData(
                key: "token",
                value: RegisterCubit.get(context).user.data!.accessToken)
                .then((value) {
              token = CashHelper.getData(key: "token");
              LaviaCubit.get(context).getProducts();
              navigationAndFinish(context, LaViaLayout());
            });
          }
          else if (state is RegisterErrorState)
          {
            toast(
              message: "Please check the data, some of them are wrong",
              color: Colors.red,
            );
          }
        },
        builder: (BuildContext context, state) {
          return Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: defaultTextFormField(
                              control: firstNameController,
                              validate: (value) {
                                if(value!.isEmpty){
                                  return 'First name must not be empty';
                                }else
                                {
                                  return null;
                                }
                              },
                              type: TextInputType.emailAddress,
                              label: 'First Name',
                            ),
                          ),
                          const SizedBox(width: 17.0,),
                          Expanded(
                            child: defaultTextFormField(
                              control: lastNameController,
                              validate: (value) {
                                if(value!.isEmpty){
                                  return 'Last name must not be empty';
                                }else
                                {
                                  return null;
                                }
                              },
                              type: TextInputType.emailAddress,
                              label: 'Last Name',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30.0,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: defaultTextFormField(
                        control: emailController,
                        validate: (value) {
                          if(value!.isEmpty){
                            return 'Email must not be empty';
                          }else
                          {
                            return null;
                          }
                        },
                        type: TextInputType.emailAddress,
                        label: 'E-mail',
                      ),
                    ),
                    const SizedBox(height: 30.0,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: defaultTextFormField(
                        control: passwordController,
                        validate: (value) {
                          if(value!.isEmpty){
                            return 'Password must not be empty';
                          }else if(value.length < 8){
                            return 'Password must be longer than or equal to 8 characters';
                          }else
                          {
                            return null;
                          }
                        },
                        type: TextInputType.visiblePassword,
                        label: 'Password',
                        obscure:true,
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
                        obscure:true,
                      ),
                    ),
                    const SizedBox(height: 36.0,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: defaultButton(
                        radius: 5.0,
                        function: () {
                          if(formKey.currentState!.validate()){
                            RegisterCubit.get(context).userRegister(
                                firstName: firstNameController.text,
                                lastName:lastNameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                            );
                          }
                        },
                        text: 'Register',
                        height: 46.24,
                      ),
                    ),
                    const SizedBox(height: 33.0,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 1.0,
                              color: HexColor('#979797'),
                            ),
                          ),
                          const SizedBox(width: 10.0,),
                          Text(
                            'or continue with',
                            style: GoogleFonts.roboto(
                              color: HexColor('#979797'),
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(width: 10.0,),
                          Expanded(
                            child: Container(
                              height: 1.0,
                              color: HexColor('#979797'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 34.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        InkWell(
                          onTap: (){},
                          child: const Image(
                            image:AssetImage('assets/images/google.png'),
                            height: 46.0,
                            width: 47.0,
                          ),
                        ),
                        const SizedBox(width: 15.0,),
                        InkWell(
                          onTap: (){},
                          child: const Image(
                            image:AssetImage('assets/images/facebook.png'),
                            height: 46.0,
                            width: 47.0,
                          ),
                        ),
                      ],
                    ),
                    const Align(
                      alignment: AlignmentDirectional.bottomStart,
                      child: Image(
                        image: AssetImage(
                          "assets/images/tree-signup.png",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

}