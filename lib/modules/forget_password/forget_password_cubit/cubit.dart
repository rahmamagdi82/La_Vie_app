import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_via_plant/modules/forget_password/forget_password_cubit/states.dart';

import '../../../shared/network/end_points.dart';
import '../../../shared/network/remote/dio_helper.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordStates>{
  ForgetPasswordCubit() : super(ForgetPasswordInitialState());
  static ForgetPasswordCubit get(context)=>BlocProvider.of(context);

  void sendVerifyCode({
    required String email,
  }){
    emit(SendCodeLoadingState());
    DioHelper.postData(
        url: FORGETPASSWORD,
        data: {
          "email":email,
        }).then((value) {
      emit(SendCodeSuccessState());
    }).catchError((error){
      emit(SendCodeErrorState());
      print(error.toString());
    });
  }

  void verifyCode({
    required String email,
    required String otp,
  }){
    emit(VerifyCodeLoadingState());
    DioHelper.postData(
        url: VERIFYOTP,
        data: {
          "email":email,
          'otp':otp,
        }).then((value) {
      emit(VerifyCodeSuccessState());
    }).catchError((error){
      emit(VerifyCodeErrorState());
      print(error.toString());
    });
  }

  void resetPassword({
    required String email,
    required String otp,
    required String password,
  }){
    emit(ResetPasswordLoadingState());
    DioHelper.postData(
        url: RESETPASSWORD,
        data: {
          "email":email,
          'otp':otp,
          "password":password,
        }).then((value) {
      emit(ResetPasswordSuccessState());
    }).catchError((error){
      emit(ResetPasswordSuccessState());
      print(error.toString());
    });
  }
}