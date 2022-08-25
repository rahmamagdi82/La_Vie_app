import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:la_via_plant/layout/lavia_layout.dart';
import 'package:la_via_plant/modules/login/login_cubit/cubit.dart';
import 'package:la_via_plant/modules/login/login_cubit/states.dart';
import 'package:la_via_plant/shared/components/cubit/cubit.dart';

import '../../shared/components/components.dart';
import '../../shared/network/local/cash_helper.dart';
import '../../shared/style/colors.dart';
import '../forget_password/forget_password.dart';

class Login extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
          listener: (context, states) {
            if(states is LoginSuccessState) {
              CashHelper.putData(
                  key: "token",
                  value: LoginCubit
                      .get(context)
                      .user
                      .data!
                      .accessToken)
                  .then((value) {
                token = CashHelper.getData(key: "token");
                LaviaCubit.get(context).getProducts();
                navigationAndFinish(context, LaViaLayout());
              });
            }
              else if (states is LoginErrorState)
                {
                  toast(
                    message: "Incorrect Email or Password",
                    color: Colors.red,
                  );
                }
              },
          builder: (context, states) {
            return Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: defaultTextFormField(
                          control: emailController,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Email must be not empty';
                            } else {
                              return null;
                            }
                          },
                          type: TextInputType.emailAddress,
                          label: 'Email',
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: defaultTextFormField(
                          control: passwordController,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Password must be not empty';
                            } else {
                              return null;
                            }
                          },
                          type: TextInputType.visiblePassword,
                          label: 'Password',
                          obscure: true,
                        ),
                      ),
                      const SizedBox(
                        height: 36.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: defaultButton(
                          radius: 5.0,
                          function: () {
                            if (formKey.currentState!.validate()) {
                              LoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          text: 'Login',
                          height: 46.24,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            navigationTo(context, ForgetPassword());
                          },
                          child: Text(
                            'Forget password?',
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.0,
                              color: defaultColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
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
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              'or continue with',
                              style: GoogleFonts.roboto(
                                color: HexColor('#979797'),
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                              child: Container(
                                height: 1.0,
                                color: HexColor('#979797'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 34.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: const Image(
                              image: AssetImage('assets/images/google.png'),
                              height: 46.0,
                              width: 47.0,
                            ),
                          ),
                          const SizedBox(
                            width: 15.0,
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Image(
                              image: AssetImage('assets/images/facebook.png'),
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
                            "assets/images/tree_left.png",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
