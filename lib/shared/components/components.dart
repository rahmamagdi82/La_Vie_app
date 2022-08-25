import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../style/colors.dart';

String? token;

Future navigationTo(context,widget)=>Navigator.push(
    context,
    MaterialPageRoute(
        builder:(context)=> widget)
);

Future navigationAndFinish(context,widget)=>Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder:(context)=> widget,
    ),
        (route){
      return false;
    }
);

Widget defaultTextFormField({
  required String? Function(String?) validate,
  required TextEditingController control,
  required TextInputType type,
  required String label,
  bool obscure = false,
  VoidCallback? tap,
  VoidCallback? submit(String)?,
  VoidCallback? change(String)?,
})=>Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      label,
      style: GoogleFonts.roboto(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: HexColor('#6F6F6F'),
      ),
    ),
    const SizedBox(height: 5.0,),
    TextFormField(
      validator: validate,
      controller: control,
      keyboardType: type,
      onTap: tap,
      onChanged: change,
      onFieldSubmitted: submit,
      obscureText: obscure,
      decoration: InputDecoration(
        errorMaxLines: 2,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    ),
  ],
);

Widget defaultButton({
  required VoidCallback function,
  required String text,
  required double radius,
  required double height,

})=>Container(
  height: height,
  width: double.infinity,
  clipBehavior: Clip.antiAliasWithSaveLayer,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
  ),
  child: MaterialButton(
    textColor: Colors.white,
    color: defaultColor,
    onPressed:function,
    child: Text(
      text,
      style: GoogleFonts.roboto(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.0,
      ),
    ),
  ),
);

///Colors of Toast
//error->red
//succes->green
//worning->amber
void toast({
  required String message,
  Color? color=Colors.amber,
})=>Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: color,
    textColor: Colors.white,
    fontSize: 16.0
);