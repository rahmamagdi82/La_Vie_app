import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class Search extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              keyboardType: TextInputType.text,
              onFieldSubmitted: (value){},
              decoration: InputDecoration(
                fillColor: HexColor('#F8F8F8'),
                filled: true,
                hintText: 'Search',
                hintStyle: GoogleFonts.roboto(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  color: HexColor('#979797'),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: HexColor('#979797'),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
            const SizedBox(height: 22.0,),
            Padding(
              padding: const EdgeInsets.only(left: 45.0),
              child: Text(
                'Recent searchs',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.0,
                  color: HexColor('#979797')
                ),
              ),
            ),
          const SizedBox(height: 21.0,),
          Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => historyItem(),
                separatorBuilder: (context,index)=>SizedBox(height: 34.0,),
                itemCount: 4,
              ),
            ),
        ],
      ),
    );
  }


  Widget historyItem()=> Padding(
    padding: const EdgeInsets.symmetric(horizontal: 43.0),
    child: Row(
      children: [
        Icon(
            Icons.access_time_outlined,
            color: HexColor('#979797')
        ),
        const SizedBox(width: 12.0,),
        Text(
          'GARDENIA PLANT'.toLowerCase(),
          style: GoogleFonts.roboto(
              fontWeight: FontWeight.w400,
              fontSize: 16.0,
              color: HexColor('#979797')
          ),
        ),
        const Spacer(),
        IconButton(
            icon:Icon(
                Icons.clear,
              color: HexColor('#979797'),
            ),
          onPressed: () {

          },
        ),
      ],
    ),
  );
}