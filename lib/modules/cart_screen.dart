import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:la_via_plant/shared/components/components.dart';
import 'package:la_via_plant/shared/components/cubit/cubit.dart';
import 'package:la_via_plant/shared/components/cubit/states.dart';
import 'package:la_via_plant/shared/style/colors.dart';

import '../models/product_model.dart';
class CartScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LaviaCubit,LaviaStates>(
       listener: (context,states){},
      builder: (context,states){
         List<Map<String,dynamic>> list =LaviaCubit.get(context).listOfCart;
         return ConditionalBuilder(
           fallback: (BuildContext context) =>Scaffold(
             backgroundColor: Colors.white,
             appBar: AppBar(
               automaticallyImplyLeading: false,
               title: Text(
                 'My Cart',
                 style: GoogleFonts.roboto(
                   fontSize: 25.0,
                   fontWeight: FontWeight.w700,
                   letterSpacing: 0.2,
                 ),
               ),
             ),
             body: Padding(
               padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 59.0),
               child: Column(
                 children: [
                   Image.asset(
                     'assets/images/empty_cart.png',
                     width: 250.0,
                     height: 244.0,
                   ),
                   const SizedBox(height: 40.0,),
                   Text(
                     'Your cart is empty',
                     textAlign: TextAlign.center,
                     style: GoogleFonts.roboto(
                       fontSize: 24.0,
                       fontWeight: FontWeight.w700,
                     ),
                   ),
                   const SizedBox(height: 10.0,),
                   Text(
                     'Sorry, the keyword you entered cannot be found, please check again or search with another keyword.',
                     textAlign: TextAlign.center,
                     style: GoogleFonts.roboto(
                       fontSize: 18.0,
                       letterSpacing: 0.2,
                       fontWeight: FontWeight.w400,
                       color: HexColor('#212121').withOpacity(0.61),
                     ),
                   ),
                 ],
               ),
             ),
           ),
           builder: (BuildContext context) =>Scaffold(
             backgroundColor: Colors.white,
             appBar: AppBar(
               centerTitle: true,
               leading: IconButton(
                 onPressed: () {
                   Navigator.pop(context);
                 },
                 icon: const Icon(
                   Icons.arrow_back,
                 ),),
               title: Text(
                 'My Cart',
                 style: GoogleFonts.roboto(
                   fontSize: 25.0,
                   fontWeight: FontWeight.w700,
                 ),
               ),
             ),
             body: Column(
               children: [
                 Expanded(
                   child: ListView.builder(
                     itemBuilder: (context,index)=>cartItem(list[index],index,context),
                     itemCount: list.length,
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.all(40.0),
                   child: Column(
                     children: [
                     Row(
                       children: [
                         Text(
                           'Total',
                           textAlign: TextAlign.center,
                           style: GoogleFonts.inter(
                             fontSize: 20.0,
                             fontWeight: FontWeight.w600,
                             color: Colors.black.withOpacity(0.75),
                           ),
                         ),
                         Spacer(),
                         Row(
                           children: [
                             Text(
                               '${LaviaCubit.get(context).totalPrice.toDouble()}',
                               style: GoogleFonts.inter(
                                 fontSize: 16.25,
                                 fontWeight: FontWeight.w800,
                                 color: defaultColor,
                               ),
                             ),
                             Text(
                               ' Egp',
                               style: GoogleFonts.inter(
                                 fontSize: 21.44,
                                 fontWeight: FontWeight.w600,
                                 color: defaultColor,
                               ),
                             ),
                           ],
                         ),

                       ],
                     ),
                       const SizedBox(height: 36.0,),
                       defaultButton(
                           function: (){},
                           text: 'Checkout ',
                           radius: 10.0,
                           height: 51.0,
                       ),
                   ],
                   ),
                 ),
               ],
             ),
           ),
           condition: list.isNotEmpty,
         );
      },
    );
  }

  Widget cartItem(Map<String,dynamic> list,int index,context){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 10.0,
        shadowColor: HexColor('#5A5959'),
        shape: RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(15.0),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 14.0,horizontal: 11.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        colors: [Colors.black12, Colors.black12],
                      ).createShader(bounds);
                    },
                    blendMode: BlendMode.srcATop,
                    child: Image(
                      image: NetworkImage(
                        'https://lavie.orangedigitalcenteregypt.com${list['product'].imageUrl}',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 28.0),
                child: Container(
                  height: 145.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${list['product'].name}',
                        style: GoogleFonts.roboto(
                          color: HexColor('#000000'),
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0,
                        ),
                      ),
                      const SizedBox(height: 16.0,),
                      Text(
                        '${list['product'].price} EGP',
                        style: GoogleFonts.roboto(
                          color: defaultColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.23,
                        ),
                      ),
                      const SizedBox(height: 19.0,),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: HexColor('#F8F8F8'),
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: (){
                                    LaviaCubit.get(context).decrease(list['index']);
                                  },
                                  icon: Icon(
                                    Icons.remove,
                                    color: defaultColor,
                                  ),
                                ),
                                Text(
                                  '${LaviaCubit.get(context).counter[list['index']]}',
                                  style: GoogleFonts.inter(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.0,
                                  ),
                                ),
                                IconButton(
                                  onPressed: (){
                                    LaviaCubit.get(context).increase(list['index']);
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    color: defaultColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: (){
                              LaviaCubit.get(context).removeFromCart(index);
                            },
                            icon: Icon(
                              Icons.delete,
                              color: defaultColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}