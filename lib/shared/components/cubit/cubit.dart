import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:la_via_plant/models/product_model.dart';
import 'package:la_via_plant/modules/home.dart';
import 'package:la_via_plant/modules/scan/scan_qr.dart';
import 'package:la_via_plant/shared/components/components.dart';
import 'package:la_via_plant/shared/components/cubit/states.dart';
import 'package:la_via_plant/shared/network/remote/dio_helper.dart';

import '../../../modules/blogs.dart';
import '../../../modules/notfication.dart';
import '../../../modules/profile.dart';
import '../../network/end_points.dart';

class LaviaCubit extends Cubit<LaviaStates> {
  LaviaCubit() : super(InitialState());

  static LaviaCubit get(context) => BlocProvider.of(context);

  List types=['All','Plants','Seeds','Tools'];
  List screens = [BlogsScreen(),ScanqrCode(),HomeScreen(),Notfication(),ProfileScreen()];
  List titles = [
    Text(
      'Blogs',
      style: GoogleFonts.roboto(
        color: HexColor('#000000'),
        fontWeight: FontWeight.w500,
        fontSize: 19.0,
      ),
    ),
    const SizedBox(),
    const Image(
      image: AssetImage(
        "assets/images/logo.png",
      ),
    ),
    Text(
      'Notification',
     style: GoogleFonts.roboto(
        color: HexColor('#000000'),
        fontWeight: FontWeight.w500,
        fontSize: 19.0,
      ),
    ),
    const SizedBox(),
  ];

  int currentIndex = 2;
  void changeScreens(int x) {
    if (x == 1) {
      emit(ScanState());
    }
    else {
      currentIndex = x;
      emit(ChangeState());
    }
  }

ProductModel productModel=ProductModel();
  var listOfProducts=[];
  void getProducts(){
    emit(GetProductsLoadingState());
    DioHelper.getData(
        url: HOME,
        token: token,
    ).then((value) {
      productModel=ProductModel.fromJson(value.data);
      listOfProducts = productModel.data!;
      listOfProducts.forEach((element) {
        counter.add(1);
      });
      emit(GetProductsSuccessState());
    }).catchError((error){
      emit(GetProductsErrorState(error.toString()));
      print(error.toString());
    });
  }

  void filterProducts(String type) {
    listOfProducts=[];
    counter=[];
    emit(GetFilterProductsLoadingState());
    productModel.data!.forEach((element) {
      if(element.type==type){
        listOfProducts.add(element);
        counter.add(1);
        print(listOfProducts);
        emit(GetFilterProductsSuccessState());
      }
    });
  }

  List<bool> select=[true,false,false,false];
  void changeBorderColor(int index){
    for(int i=0;i<select.length;i++)
      {
        if(index != i){
          select[i]=false;
          emit(ChangeBorderColorState());
        }else
          {
            select[i]=true;
            emit(ChangeBorderColorState());
          }
      }
  }

  List <int> counter=[];
  void increase(int index){
    counter[index]++;
    getTotalPrice();
    emit(ChangeCounterState());
  }

  void decrease(int index){
    if(counter[index] > 1) {
      counter[index]--;
    }
    getTotalPrice();
    emit(ChangeCounterState());
  }

  List<Map<String,dynamic>> listOfCart=[];
  num totalPrice=0;
  void addToCart(Product model, int index){
    listOfCart.add({
      'product':model,
      'index':index,
    });
    getTotalPrice();
    emit(AddToCartState());
  }

  void removeFromCart(int index){
    counter[listOfCart[index]['index']]=1;
    listOfCart.removeAt(index);
    getTotalPrice();
    emit(RemoveFromCartState());
  }

  void getTotalPrice(){
    totalPrice=0;
    for(int i=0;i<listOfCart.length;i++){
      totalPrice += ((listOfCart[i]['product'].price)*counter[listOfCart[i]['index']]);
    }
  }

}