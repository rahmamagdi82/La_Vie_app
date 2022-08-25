import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:la_via_plant/shared/components/components.dart';

class ScanResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.transparent,
      backgroundColor:Colors.black,
      body: Stack(
        children: [
          Opacity(
            opacity: 0.4,
            child: Image.asset(
              'assets/images/background.png',
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 43.0,top: 15.0),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 55.0,
                              width: 55.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Color.fromRGBO(0, 0, 0, 0.64),
                              ),
                              child: Image.asset(
                                'assets/images/sun.png',
                              ),
                            ),
                            const SizedBox(width: 16.0,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    Container(
                                      child: Center(
                                        child: Text(
                                          '78',
                                          style: GoogleFonts.roboto(
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      height: 35.0,
                                      width: 40.0,
                                    ),
                                    Positioned(
                                      bottom: 19.0,
                                      left: 28.5,
                                      child:Text(
                                        '%',
                                        style: GoogleFonts.roboto(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),

                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    'Sun light',
                                    style: GoogleFonts.roboto(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 15.0,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 55.0,
                              width: 55.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Color.fromRGBO(0, 0, 0, 0.64),
                              ),
                              child: Image.asset(
                                'assets/images/water.png',
                              ),
                            ),
                            const SizedBox(width: 16.0,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    Container(
                                      child: Center(
                                        child: Text(
                                          '10',
                                          style: GoogleFonts.roboto(
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      height: 35.0,
                                      width: 40.0,
                                    ),
                                    Positioned(
                                      bottom: 19.0,
                                      left: 28.5,
                                      child:Text(
                                        '%',
                                        style: GoogleFonts.roboto(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),

                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    'Water Capacity',
                                    style: GoogleFonts.roboto(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 15.0,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 55.0,
                              width: 55.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Color.fromRGBO(0, 0, 0, 0.64),
                              ),
                              child: Image.asset(
                                'assets/images/thermometer.png',
                              ),
                            ),
                            const SizedBox(width: 16.0,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Stack(
                                      alignment: Alignment.topRight,
                                      children: [
                                        Container(
                                          child: Center(
                                            child: Text(
                                              '20',
                                              style: GoogleFonts.roboto(
                                                fontSize: 22.0,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          height: 35.0,
                                          width: 40.0,
                                        ),
                                        Positioned(
                                          bottom: 19.0,
                                          left: 30.5,
                                          child:Text(
                                            'o',
                                            style: GoogleFonts.roboto(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),

                                        ),
                                      ],
                                    ),
                                    Text(
                                      'c',
                                      style: GoogleFonts.roboto(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    'Temperature',
                                    style: GoogleFonts.roboto(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(23.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'SNAKE PLANT (SANSEVIERIA)'.toUpperCase(),
                              style: GoogleFonts.roboto(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                                color: HexColor('#000000'),
                              ),
                            ),
                            const SizedBox(height: 9.0,),
                            Text(
                              'Native to southern Africa,snake plants are well adapted to conditions similar to those in southern regions of the United States. Because of this, they may be grown outdoors for part of all of the year in USDA zones 8 and warmer',
                              style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: HexColor('#979797'),
                              ),
                            ),
                            const SizedBox(height: 16.0,),
                            Text(
                              'Common Snake Plant Diseases',
                              style: GoogleFonts.roboto(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                                color: HexColor('#000000'),
                              ),
                            ),
                            const SizedBox(height: 9.0,),
                            Expanded(
                              child: Text(
                                'A widespread problem with snake plants is root rot. This results from over-watering the soil of the plant and is most common in the colder months of the year. When room rot occurs, the plant roots can die due to a lack of oxygen and an overgrowth of fungus within the soil. If the snake plant\'s soil is soggy, certain microorganisms such as Rhizoctonia and Pythium can begin to populate and multiply, spreading disease throughout this.fjn vjf vfjkjnjhb dsjdfbhfc kdsnjdncjdcb djcdkjb ',
                                style: GoogleFonts.poppins(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                  color: HexColor('#979797'),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10.0,),
                            defaultButton(
                              function: (){},
                              text: 'Go To Blog',
                              radius: 10.0, height: 50.0,),
                          ],
                        ),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
