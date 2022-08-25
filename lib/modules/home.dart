import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:la_via_plant/modules/cart_screen.dart';
import 'package:la_via_plant/modules/login/login_cubit/states.dart';
import 'package:la_via_plant/modules/search.dart';
import 'package:la_via_plant/shared/components/cubit/cubit.dart';
import 'package:la_via_plant/shared/components/cubit/states.dart';

import '../models/product_model.dart';
import '../shared/components/components.dart';
import '../shared/style/colors.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LaviaCubit, LaviaStates>(
      listener: (context, states) {},
      builder: (context, states) {
        return Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          navigationTo(context, Search());
                        },
                        child: Container(
                          height: 46.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: HexColor('#F8F8F8'),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 17.0, right: 13.5),
                                child: Icon(
                                  Icons.search,
                                  color: HexColor('#979797'),
                                ),
                              ),
                              Text(
                                'Search',
                                style: GoogleFonts.roboto(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                  color: HexColor('#979797'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16.0,),
                    Container(
                      height: 46.0,
                      decoration: BoxDecoration(
                        color: defaultColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          navigationTo(context, CartScreen());
                        },
                        minWidth: 1.0,
                        child: Image.asset(
                          'assets/images/cart.png',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 26.0,),
                Container(
                  height: 35.0,
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => filterItems(LaviaCubit.get(context).types[index],context,index),
                    separatorBuilder: (context, index) => SizedBox(width: 16.0,),
                    itemCount: LaviaCubit.get(context).types.length,
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Container(
                      color: Colors.white,
                      child: GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        mainAxisSpacing: 1.0,
                        crossAxisSpacing: 1.0,
                        childAspectRatio: 1 / 1.61,
                        children: List.generate(
                          LaviaCubit.get(context).listOfProducts.length,
                              (index) {
                            return item(LaviaCubit.get(context).listOfProducts[index],context,index);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget filterItems(type,context,index) => Container(
        decoration: BoxDecoration(
          color: HexColor('#F8F8F8'),
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            width: 2.0,
            color: (LaviaCubit.get(context).select[index])?defaultColor:HexColor('#F8F8F8'),
          ),
        ),
        child: MaterialButton(
          onPressed: () {
            if(type=='Plants'){
              LaviaCubit.get(context).filterProducts('PLANT');
              LaviaCubit.get(context).changeBorderColor(1);
            }else if(type=='Seeds')
            {
              LaviaCubit.get(context).filterProducts('SEED');
              LaviaCubit.get(context).changeBorderColor(2);
            }else if(type=='Tools')
            {
              LaviaCubit.get(context).filterProducts('TOOL');
              LaviaCubit.get(context).changeBorderColor(3);
            }else
              {
                LaviaCubit.get(context).getProducts();
                LaviaCubit.get(context).changeBorderColor(0);
              }
          },
          minWidth: 1.0,
          child: Text(
            '$type',
            style: GoogleFonts.roboto(
              color: HexColor('#979797',),
              fontWeight: FontWeight.w400,
              fontSize: 16.0,
            ),
          ),
        ),
      );

  Widget item(Product model,context,index) {
   return Stack(
      alignment: Alignment.topLeft,
      children: <Widget>[
        Container(
          height: 227.0,
          width: 176.0,
          margin: EdgeInsets.only(top: 60.0),
          child: Card(
            shadowColor: HexColor('#000000'),
            elevation: 9.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 27.0, right: 11.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        child: Container(
                          height: 20.0,
                          width: 20.0,
                          color: HexColor('#F7F6F7'),
                          child: const Icon(
                            Icons.remove,
                            color: Colors.grey,
                            size: 15.0,
                          ),
                        ),
                        onTap: () {
                          LaviaCubit.get(context).decrease(index);
                        },
                      ),
                      const SizedBox(width: 7.0,),
                      Text(
                        '${LaviaCubit.get(context).counter[index]}',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          color: HexColor('#000000'),
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                        ),
                      ),
                      const SizedBox(width: 7.0,),
                      InkWell(
                        child: Container(
                          height: 20.0,
                          width: 20.0,
                          color: HexColor('#F7F6F7'),
                          child: const Icon(
                            Icons.add,
                            color: Colors.grey,
                            size: 15.0,
                          ),
                        ),
                        onTap: () {
                          LaviaCubit.get(context).increase(index);
                        },
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Text(
                    '${model.name}'.toUpperCase(),
                    style: GoogleFonts.roboto(
                      color: HexColor('#000000'),
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Text(
                    '${model.price} egp'.toUpperCase(),
                    style: GoogleFonts.roboto(
                      color: HexColor('#000000'),
                      fontWeight: FontWeight.w500,
                      fontSize: 12.0,
                    ),
                  ),
                ),
                const SizedBox(height: 7.0,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0,),
                  child: defaultButton(
                    radius: 10.0,
                    function: () {
                      LaviaCubit.get(context).addToCart(model,index);
                      },
                    text: "Add To Cart",
                    height: 35.0,
                  ),
                ),
                const SizedBox(height: 20.0,),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 6.0),
          child: Image(
            width: 76.0,
            height: 155.0,
            image: NetworkImage(
              'https://lavie.orangedigitalcenteregypt.com${model.imageUrl}',
            ),
          ),
        ),
      ],
    );
  }
}