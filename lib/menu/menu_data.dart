import 'package:alfredo_restaurant/rigistration/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/model.dart';
import '../dish_discription/description_screen.dart';

class MenuData extends StatelessWidget {
  const MenuData({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffBBD4CE),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Login(),
                ));
          },
          icon: const Icon(
            Icons.logout_sharp,
            size: 25,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Menu',
          style: GoogleFonts.labrada(
            color: Colors.black,
            fontSize: 25,
            letterSpacing: 1,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DescriptionScreen(index: index),
                ),
              );
            },
            child: Column(
              children: [
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: 175,
                  height: 145,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Image(
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    image: AssetImage(
                      dishDisc[index]['dishImage'],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 14, right: 14),
                  child: Text(
                    dishDisc[index]['dishName'],
                    style: GoogleFonts.labrada(
                      color: Colors.black,
                      fontSize: 14,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
          itemCount: dishDisc.length,
        ),
      ),
    );
  }
}
