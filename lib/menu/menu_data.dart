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
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
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
            child: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
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
          ),
          itemCount: dishDisc.length,
        ),
      ),
    );
  }
}
