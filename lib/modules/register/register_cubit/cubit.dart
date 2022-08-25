import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_via_plant/modules/register/register_cubit/states.dart';

import '../../../models/login_model.dart';
import '../../../shared/network/end_points.dart';
import '../../../shared/network/remote/dio_helper.dart';


class RegisterCubit extends Cubit<RegisterStates>{
  RegisterCubit() : super(RegisterInitialState());
  static RegisterCubit get(context)=>BlocProvider.of(context);

  LoginModel user=LoginModel();
  void userRegister({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }){
    emit(RegisterLoadingState());
    DioHelper.postData(
    url: REGISTER,
    data: {
      "firstName":firstName,
      "lastName":lastName,
      "email":email,
      "password":password,
    }).then((value) {
      print(value.data['message'][0]);
      user=LoginModel.fromJson(value.data);
      emit(RegisterSuccessState(user));
    }).catchError((error){
      emit(RegisterErrorState(error.toString()));
      print(error.toString());
    });
  }

}