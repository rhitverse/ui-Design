import 'package:flutter/material.dart';
import 'package:ui_design/pages/search_page.dart';
import 'package:ui_design/widget/ui_helper.dart';

import 'home_page.dart';

class BimanAirlinePage extends StatelessWidget {
  const BimanAirlinePage({super.key});

  @override
  Widget build(BuildContext context) {
    final details = const [
      {'label': 'Type', 'value': 'Boeing 787-8 Dreamliner'},
      {'label': 'Serial Number', 'value': '40126'},
      {'label': 'Registration', 'value': 'S2-AJS'},
      {'label': 'First Flight', 'value': 'August 6, 2018'},
      {'label': 'Capacity', 'value': '271 passengers'},
      {'label': 'Length', 'value': '56.7 m'},
      {'label': 'Wingspan', 'value': '60.1 m'},
      {'label': 'Max Speed', 'value': '954 km/h'},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF6BA3D8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );

          },
        ),
        title: const Text(
          'Aircraft',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
            fontFamily: "JetBrains",
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Image.asset(
                  'assets/image/biman.png',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 200,
                      color: Colors.white24,
                      child: const Icon(
                        Icons.flight,
                        size: 100,
                        color: Colors.white54,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF000000),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        UiHelper.customSvg(
                          svgPath: "assets/svg/biman.svg",
                          height: 35,
                          width: 35,
                        ),
                        const SizedBox(width: 19),
                        const Text(
                          'Biman Airlines',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            fontFamily: "JetBrains",
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: List.generate(details.length, (index) {
                          final item = details[index];
                          final isFirst = index == 0;
                          final isLast = index == details.length - 1;

                          return DetailBox(
                            label: item['label']!,
                            value: item['value']!,
                            borderRadius: BorderRadius.only(
                              topLeft: isFirst ? const Radius.circular(10) : Radius.zero,
                              topRight: isFirst ? const Radius.circular(10) : Radius.zero,
                              bottomLeft: isLast ? const Radius.circular(10) : Radius.zero,
                              bottomRight: isLast ? const Radius.circular(10) : Radius.zero,
                            ),
                          );
                        }),
                      ),
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
}

class DetailBox extends StatelessWidget {
  final String label;
  final String value;
  final BorderRadius borderRadius;

  const DetailBox({
    Key? key,
    required this.label,
    required this.value,
    this.borderRadius = BorderRadius.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
      decoration: BoxDecoration(
        color: const Color(0xff1C1C1C),
        borderRadius: borderRadius,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFFAAAAAA),
              fontSize: 15,
              fontWeight: FontWeight.w400,
              fontFamily: "JetBrains",
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500,
              fontFamily: "JetBrains",
            ),
          ),
        ],
      ),
    );
  }
}
