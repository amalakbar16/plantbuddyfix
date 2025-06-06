import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:plantbuddy/screens/homepage.dart';
import 'package:plantbuddy/screens/article_page.dart';
import 'package:plantbuddy/screens/profile.dart';

class Kebunku extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Konten utama di dalam Stack
          Positioned(
            top: 80, // Atur posisi vertikal lebih ke atas jika perlu
            left: 0,
            right: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 852,  // Menyesuaikan tinggi konten
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(color: const Color(0xFFF8F8F8)),
              child: Stack(
                children: [
                  // Text "Tanamanmu Kosong"
                  Positioned(
                    left: 59,
                    top: 464,
                    child: SizedBox(
                      width: 276,
                      child: Text(
                        'Tanamanmu Kosong',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          height: 0.74,
                          letterSpacing: -0.50,
                        ),
                      ),
                    ),
                  ),
                  // Deskripsi tambahan
                  Positioned(
                    left: 25,
                    top: 497,
                    child: SizedBox(
                      width: 343,
                      child: Text(
                        'Kelola tanaman dengan mudah, dan \npantau pertumbuhannya.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 17,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          height: 1,
                          letterSpacing: -0.50,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 25,
                    top: 65,
                    child: SizedBox(
                      width: 98,
                      child: Text(
                        'KebunKu',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          height: 1,
                          letterSpacing: -0.50,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 148,
                    top: 65,
                    child: SizedBox(
                      width: 98,
                      child: Text(
                        'Jadwal',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 17,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          height: 1,
                          letterSpacing: -0.50,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 270,
                    top: 65,
                    child: SizedBox(
                      width: 98,
                      child: Text(
                        'Tambah',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 17,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          height: 1,
                          letterSpacing: -0.50,
                        ),
                      ),
                    ),
                  ),
                  // Button "Tambah Tanaman"
                  Positioned(
                    left: 109,
                    top: 568,
                    child: Container(
                      width: 175,
                      height: 60,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 121,
                    top: 589,
                    child: Text(
                      'Tambah Tanaman',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 17,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        height: 1,
                        letterSpacing: -0.50,
                      ),
                    ),
                  ),
                  // Ikon dengan rotasi
                  _buildRotatedBox(Icons.water_drop, Colors.blue, 0.23, 29.55, 4.08, 235.90, 323.81),
                  _buildRotatedBox(Icons.cut, Colors.green, 0.23, 29.55, 4.08, 232.84, 334),
                  _buildRotatedBox(Icons.wb_sunny, Colors.yellow, 0.23, 29.55, 4.08, 229.78, 344.19),
                  // Ganti Icons.leaf dengan Icons.local_florist
                  _buildRotatedBox(Icons.local_florist, Colors.green, -0.23, 44.81, 20.91, 97.24, 345.12),
                  _buildRotatedBox(Icons.local_florist, Colors.green, -0.23, 16.22, 16.22, 111.95, 344.35),
                  // Kotak lingkaran dengan ikon lainnya
                  _buildCircleIcon(29.55, Colors.white, 158.57, 300.38),
                  _buildCircleIcon(29.55, Colors.white, 201.36, 300.38),
                  _buildCircleIcon(16.30, Colors.white, 208.49, 307.51),
                  _buildCircleIcon(29.55, Colors.white, 178.94, 338.07),
                  _buildCircleIcon(16.30, Colors.white, 186.07, 345.21),
                  _buildCircleIcon(35.81, Colors.white, 271.61, 325.85),
                  _buildCircleIcon(24.45, Colors.white, 276.14, 335.02),
                ],
              ),
            ),
          ),

          // Bottom Navigation Bar
          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 84,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 2,
                    offset: Offset(0, 0),
                    spreadRadius: 0.50,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) =>
                              HomePage(userName: ''),
                          transitionsBuilder: (
                            context,
                            animation,
                            secondaryAnimation,
                            child,
                          ) {
                            var curve = CurvedAnimation(
                              parent: animation,
                              curve: Curves.easeInOut,
                            );
                            var fadeAnim = Tween(
                              begin: 0.0,
                              end: 1.0,
                            ).animate(curve);
                            var slideAnim = Tween(
                              begin: const Offset(0.0, 0.1),
                              end: const Offset(0.0, 0.0),
                            ).animate(curve);
                            return FadeTransition(
                              opacity: fadeAnim,
                              child: SlideTransition(
                                position: slideAnim,
                                child: child,
                              ),
                            );
                          },
                          transitionDuration: const Duration(milliseconds: 400),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          CupertinoIcons.house_fill,
                          color: Color(0xFFD1D1D1),
                          size: 24,
                        ),
                        Text(
                          'Beranda',
                          style: TextStyle(
                            color: Color(0xFFD1D1D1),
                            fontSize: 12,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            height: 2.17,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        CupertinoIcons.leaf_arrow_circlepath,
                        color: Color(0xFF01B14E),
                        size: 24,
                      ),
                      Text(
                        'Kebunku',
                        style: TextStyle(
                          color: Color(0xFF01B14E),
                          fontSize: 12,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          height: 2.17,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) =>
                              const ArticlePage(),
                          transitionsBuilder: (
                            context,
                            animation,
                            secondaryAnimation,
                            child,
                          ) {
                            var curve = CurvedAnimation(
                              parent: animation,
                              curve: Curves.easeInOut,
                            );
                            var fadeAnim = Tween(
                              begin: 0.0,
                              end: 1.0,
                            ).animate(curve);
                            var slideAnim = Tween(
                              begin: const Offset(0.0, 0.1),
                              end: const Offset(0.0, 0.0),
                            ).animate(curve);
                            return FadeTransition(
                              opacity: fadeAnim,
                              child: SlideTransition(
                                position: slideAnim,
                                child: child,
                              ),
                            );
                          },
                          transitionDuration: const Duration(milliseconds: 400),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          CupertinoIcons.doc_text_fill,
                          color: Color(0xFFD1D1D1),
                          size: 24,
                        ),
                        Text(
                          'Artikel',
                          style: TextStyle(
                            color: Color(0xFFD1D1D1),
                            fontSize: 12,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            height: 2.17,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) =>
                              const ProfilePage(),
                          transitionsBuilder: (
                            context,
                            animation,
                            secondaryAnimation,
                            child,
                          ) {
                            var curve = CurvedAnimation(
                              parent: animation,
                              curve: Curves.easeInOut,
                            );
                            var fadeAnim = Tween(
                              begin: 0.0,
                              end: 1.0,
                            ).animate(curve);
                            var slideAnim = Tween(
                              begin: const Offset(0.0, 0.1),
                              end: const Offset(0.0, 0.0),
                            ).animate(curve);
                            return FadeTransition(
                              opacity: fadeAnim,
                              child: SlideTransition(
                                position: slideAnim,
                                child: child,
                              ),
                            );
                          },
                          transitionDuration: const Duration(milliseconds: 400),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          CupertinoIcons.person_fill,
                          color: Color(0xFFD1D1D1),
                          size: 24,
                        ),
                        Text(
                          'Profil',
                          style: TextStyle(
                            color: Color(0xFFD1D1D1),
                            fontSize: 12,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            height: 2.17,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi untuk membuat kotak yang diputar
  Widget _buildRotatedBox(IconData icon, Color color, double angle, double width, double height, double left, double top) {
    return Positioned(
      left: left,
      top: top,
      child: Transform.rotate(
        angle: angle, // Kemiringan kotak
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: 40,
            color: color,
          ),
        ),
      ),
    );
  }

  // Fungsi untuk membuat lingkaran dengan ikon lainnya
  Widget _buildCircleIcon(double size, Color color, double left, double top) {
    return Positioned(
      left: left,
      top: top,
      child: Container(
        width: size,
        height: size,
        decoration: ShapeDecoration(
          color: color,
          shape: OvalBorder(
            side: BorderSide(
              width: 1,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: Colors.black.withOpacity(0.13),
            ),
          ),
        ),
      ),
    );
  }
}
