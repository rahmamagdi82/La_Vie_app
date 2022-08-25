import 'package:dio/dio.dart';

import '../../components/components.dart';

class DioHelper
{
 static late Dio dio;

 static initial(){
   dio=Dio(
     BaseOptions(
       headers: {
         "Authorization":token,
       },
       baseUrl: 'https://lavie.orangedigitalcenteregypt.com',
       receiveDataWhenStatusError: true,
     ),
   );
 }

 static Future<Response> getData({
   required String url,
   Map<String,dynamic>? query,
   String? token,
 })async
 {
   dio.options.headers= {
     "Accept":"application/json",
     "Authorization":'Bearer $token',
       };
  return await dio.get(
       url,
       queryParameters: query,
   );
 }

 static Future<Response> postData({
   required String url,
   Map<String,dynamic>? query,
   required Map<String,dynamic> data,
   String? token,
 })async
 {
   dio.options.headers= {
     "Authorization":token,
     "Content-Type":"application/json",
     "Accept":"application/json",
   };
   return await dio.post(
     url,
     data: data,
     queryParameters: query,
   );
 }

 // static Future<Response> patchData({
 //   required String url,
 //   required Map<String,dynamic> data,
 //   Map<String,dynamic>? query,
 //   required String token,
 // })async
 // {
 //   dio.options.headers= {
 //     "Authorization":token,
 //     "Content-Type":"application/json",
 //   };
 //   return await dio.patch(
 //     url,
 //     data: data,
 //     queryParameters: query,
 //   );
 // }
}