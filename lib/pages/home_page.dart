import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_design/pages/search_page.dart';
import 'package:ui_design/styles/app_icons.dart';
import 'package:ui_design/widget/ui_helper.dart';
import 'package:ui_design/pages/airline_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double progress = 40;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xff111111),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.arrow_back, color: Colors.white),
                      const Text(
                        'Flights',
                        style: TextStyle(
                          fontFamily: 'JetBrains',
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SearchPage(),
                            ),
                          );
                        },
                        icon: SvgPicture.asset(
                          AppIcon.icSearch,
                          width: 28,
                          height: 28,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xff1D1D1D),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 48,
                          width: MediaQuery.of(context).size.width * 0.5 - 25,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              'List',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'JetBrains',
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Map',
                              style: TextStyle(
                                color: Color(0xffFDFDFD).withValues(alpha: 0.8),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'JetBrains',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 165,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xff1D1D1D),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 18,
                        left: 16,
                        right: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                AppIcon.icAir,
                                height: 40,
                                width: 40,
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                'LH1782',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'JetBrains',
                                ),
                              ),
                              const Spacer(),
                              Container(
                                height: 24,
                                width: 45,
                                decoration: BoxDecoration(
                                  color: const Color(0xff282828),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Center(
                                  child: Text(
                                    '7842',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                height: 24,
                                width: 62,
                                decoration: BoxDecoration(
                                  color: const Color(0xff282828),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Center(
                                  child: Text(
                                    "D-AISP",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                      fontFamily: 'JetBrains',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 32),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Munich',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'JetBrains',
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 14),
                                child: Text(
                                  'Athens',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'JetBrains',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 45,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  left: 75,
                                  right: 75,
                                  child: Container(
                                    height: 3,
                                    color: const Color(0xFF444444),
                                  ),
                                ),
                                Positioned(
                                  left: 75,
                                  child: Container(
                                    height: 2,
                                    width:
                                        ((screenWidth - 170) * (progress / 70)),
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFFFF6B35),
                                          Color(0xFFF7931E),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left:
                                      65 +
                                      ((screenWidth - 40) * (progress / 100)) -
                                      14,
                                  child: UiHelper.customSvg(
                                    svgPath: "assets/svg/Mode.svg",
                                    height: 25,
                                    width: 25,
                                    color: Colors.white,
                                  ),
                                ),
                                const Positioned(
                                  left: 0,
                                  child: Text(
                                    'MUC',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 35,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'JetBrains',
                                    ),
                                  ),
                                ),
                                const Positioned(
                                  right: 0,
                                  child: Text(
                                    'ATH',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 35,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'JetBrains',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AirlinePage(),
                        ),
                      );
                    },
                    child: Container(
                      height: 165,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xff1D1D1D),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 18,
                          left: 16,
                          right: 16,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  AppIcon.icAir5,
                                  height: 40,
                                  width: 40,
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  'FR421',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'JetBrains',
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  height: 24,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff282828),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      '33548',
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  height: 24,
                                  width: 62,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff282828),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'EI-DCL',
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 12,
                                        fontFamily: 'JetBrains',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 32),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Oslo',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'JetBrains',
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 14),
                                  child: Text(
                                    'Larnace',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'JetBrains',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 45,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Positioned(
                                    left: 75,
                                    right: 75,
                                    child: Container(
                                      height: 3,
                                      color: const Color(0xFF444444),
                                    ),
                                  ),
                                  Positioned(
                                    left: 75,
                                    child: Container(
                                      height: 2,
                                      width:
                                          ((screenWidth - 40) *
                                          (progress / 150)),
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xFFFF6B35),
                                            Color(0xFFF7931E),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left:
                                        65 +
                                        ((screenWidth - 100) *
                                            (progress / 110)) -
                                        14,
                                    child: UiHelper.customSvg(
                                      svgPath: "assets/svg/Mode.svg",
                                      height: 25,
                                      width: 25,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Positioned(
                                    left: 0,
                                    child: Text(
                                      'OSL',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 35,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'JetBrains',
                                      ),
                                    ),
                                  ),
                                  const Positioned(
                                    right: 0,
                                    child: Text(
                                      'LCA',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 35,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'JetBrains',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 165,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xff1D1D1D),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 18,
                        left: 16,
                        right: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                AppIcon.icAir3,
                                height: 40,
                                width: 40,
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                'LX2254',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'JetBrains',
                                ),
                              ),
                              const Spacer(),
                              Container(
                                height: 24,
                                width: 45,
                                decoration: BoxDecoration(
                                  color: const Color(0xff282828),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Center(
                                  child: Text(
                                    '4739',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                height: 24,
                                width: 62,
                                decoration: BoxDecoration(
                                  color: const Color(0xff282828),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Center(
                                  child: Text(
                                    'HB-JCB',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                      fontFamily: 'JetBrains',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 32),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Zurich',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'JetBrains',
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 14),
                                child: Text(
                                  'Athens',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'JetBrains',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 45,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  left: 75,
                                  right: 75,
                                  child: Container(
                                    height: 3,
                                    color: const Color(0xFF444444),
                                  ),
                                ),
                                Positioned(
                                  left: 75,
                                  child: Container(
                                    height: 2,
                                    width:
                                        ((screenWidth - 30) * (progress / 90)),
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFFFF6B35),
                                          Color(0xFFF7931E),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left:
                                      65 +
                                      ((screenWidth - 40) * (progress / 86)) -
                                      14,
                                  child: UiHelper.customSvg(
                                    svgPath: "assets/svg/Mode.svg",
                                    height: 25,
                                    width: 25,
                                    color: Colors.white,
                                  ),
                                ),
                                const Positioned(
                                  left: 0,
                                  child: Text(
                                    'ZRH',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 35,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'JetBrains',
                                    ),
                                  ),
                                ),
                                const Positioned(
                                  right: 0,
                                  child: Text(
                                    'ATH',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 35,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'JetBrains',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 165,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xff1D1D1D),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 18,
                        left: 16,
                        right: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                AppIcon.icAir1,
                                height: 30,
                                width: 30,
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                'TK1885',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'JetBrains',
                                ),
                              ),
                              const Spacer(),
                              Container(
                                height: 24,
                                width: 45,
                                decoration: BoxDecoration(
                                  color: const Color(0xff282828),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Center(
                                  child: Text(
                                    '40751',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                height: 24,
                                width: 62,
                                decoration: BoxDecoration(
                                  color: const Color(0xff282828),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Center(
                                  child: Text(
                                    'TC-JVS',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                      fontFamily: 'JetBrains',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 38),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'izmir',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'JetBrains',
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 14),
                                child: Text(
                                  'Vienna',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'JetBrains',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 45,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  left: 75,
                                  right: 75,
                                  child: Container(
                                    height: 3,
                                    color: const Color(0xFF444444),
                                  ),
                                ),
                                Positioned(
                                  left: 75,
                                  child: Container(
                                    height: 2,
                                    width:
                                        ((screenWidth - 30) * (progress / 105)),
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFFFF6B35),
                                          Color(0xFFF7931E),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left:
                                      65 +
                                      ((screenWidth - 8) * (progress / 108)) -
                                      14,
                                  child: UiHelper.customSvg(
                                    svgPath: "assets/svg/Mode.svg",
                                    height: 25,
                                    width: 25,
                                    color: Colors.white,
                                  ),
                                ),
                                const Positioned(
                                  left: 0,
                                  child: Text(
                                    'ABD',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 35,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'JetBrains',
                                    ),
                                  ),
                                ),
                                const Positioned(
                                  right: 0,
                                  child: Text(
                                    'VIE',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 35,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'JetBrains',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
