import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';


class Notfication extends StatelessWidget{
  @override

  List<String> comments=['“ leaves are an integral part of the stem system. They are attached by a continuous vascular system to the rest of the plant so that free exchange of nutrients.”',
  '','','“ leaves are an integral part of the stem system. They are attached by a continuous vascular system to the rest of the plant so that free exchange of nutrients.”',
  '','“ leaves are an integral part of the stem system. They are attached by a continuous vascular system to the rest of the plant so that free exchange of nutrients.”',];
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
        itemBuilder: (context,index)=>notificationItem(index),
        separatorBuilder: (context,index)=> Container(
          height: 1,
          color: HexColor('#E8EBF0'),
        ),
        itemCount: 6,
    );
  }

  Widget notificationItem(int index)=>Container(
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage('https://img.freepik.com/free-photo/digital-displays-surrounding-us-from-everywhere_329181-11321.jpg?w=996&t=st=1661037461~exp=1661038061~hmac=6d77bc9a92e32891d078c134cbb57971843d4d2e91a60cc6bbbbda07c092d42d'),
            radius: 24.0,
          ),
          const SizedBox(width: 16.0,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dennis Nedry commented on Isla Nublar SOC2 compliance report',
                  style: GoogleFonts.poppins(
                    color: HexColor('#1A1F36'),
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if(comments[index] == '')
                  const SizedBox(height: 16.0,),
                if(comments[index] == '')
                  Row(
                  children: [
                    Container(
                      height: 80.0,
                      width: 4.0,
                      decoration: BoxDecoration(
                        color: HexColor('#DDDEE1'),
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                    ),
                    const SizedBox(width: 8.0,),
                     Expanded(
                      child: Text(
                        '“ leaves are an integral part of the stem system. They are attached by a continuous vascular system to the rest of the plant so that free exchange of nutrients.”',
                        style: GoogleFonts.roboto(
                          color: HexColor('#1A1F36'),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                  const SizedBox(height: 8.0,),
                Text(
                  'Yesterday at 11:42 PM',
                  style: GoogleFonts.roboto(
                    color: HexColor('#A5ACB8'),
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}