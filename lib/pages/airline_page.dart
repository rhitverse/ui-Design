import 'dart:async';
import 'package:flutter/material.dart';

import '../widget/ui_helper.dart';

class AirlinePage extends StatelessWidget {
  const AirlinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const FlightScreen();
  }
}

class FlightScreen extends StatefulWidget {
  const FlightScreen({super.key});

  @override
  State<FlightScreen> createState() => _FlightScreenState();
}

class _FlightScreenState extends State<FlightScreen> {
  double _progress = 0.43;
  Timer? _animationTimer;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 800), _startAnimation);
  }

  void _startAnimation() {
    _animationTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      setState(() {
        _progress += 0.08;
        if (_progress >= 1.0) {
          _progress = 1.0;
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _animationTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomSheetHeight = MediaQuery.of(context).size.height * 0.55;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Map Background
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: bottomSheetHeight,
            child: Image.asset("assets/image/map.png", fit: BoxFit.cover),
          ),

          // Overlay UI Elements
          SafeArea(
            child: Stack(
              children: [
                // Top Header Bar
                Positioned(
                  left: 16,
                  right: 16,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1C1C1E),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(Icons.arrow_back, size: 22),
                          color: Colors.white,
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text(
                              'FR421',
                              style: TextStyle(
                                color: Color(0xFFFFA500),
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Ryanair',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.more_vert, size: 22),
                          color: Colors.white70,
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                      ],
                    ),
                  ),
                ),

                // Zoom Controls
                Positioned(
                  right: 16,
                  top: MediaQuery.of(context).size.height * 0.35,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF1C1C1E),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add, size: 22),
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF1C1C1E),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.remove, size: 22),
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                // Bottom Sheet
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1C1C1E),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Airport codes section
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'CPH',
                                      style: TextStyle(
                                        fontSize: 36,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'Copenhagen',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.white60,
                                      ),
                                    ),
                                    Text(
                                      'UTC+2',
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.white38,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFA500),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.flight,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: const [
                                    Text(
                                      'LCA',
                                      style: TextStyle(
                                        fontSize: 36,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'Larnaca',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.white60,
                                      ),
                                    ),
                                    Text(
                                      'UTC+3',
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.white38,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Progress section
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    '1 236 km • 1h 25m',
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.white54,
                                    ),
                                  ),
                                  Text(
                                    '1 615 km • 1h 52m',
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.white54,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Stack(
                                alignment: Alignment.centerLeft,
                                children: [
                                  Container(
                                    height: 4,
                                    decoration: BoxDecoration(
                                      color: Colors.white12,
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                  ),
                                  FractionallySizedBox(
                                    widthFactor: 0.43,
                                    child: Stack(
                                      alignment: Alignment.centerRight,
                                      children: [
                                        Container(
                                          height: 4,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFFF6B35),
                                            borderRadius: BorderRadius.circular(
                                              2,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 12,
                                          height: 12,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: Icon(
                                              Icons.flight,
                                              size: 8,
                                              color: Color(0xFF1C1C1E),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Times section
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: const [
                                        Text(
                                          'Scheduled',
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.white38,
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          '12:30',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    Row(
                                      children: const [
                                        Text(
                                          'Actual',
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.white38,
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          '12:48',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 1,
                                height: 50,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                ),
                                color: Colors.white12,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: const [
                                        Text(
                                          'Scheduled',
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.white38,
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          '17:10',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    Row(
                                      children: const [
                                        Text(
                                          'Estimated',
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.white38,
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          '17:32',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 16),
                        Container(height: 1, color: Colors.white12),

                        // Flight information section
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Flight information',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white38,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Row(
                                      children: const [
                                        Text(
                                          'Boeing 737-800',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(width: 12),
                                        Text(
                                          '🇩🇰',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          'Denmark',
                                          style: TextStyle(
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: const [
                                        Text(
                                          'Speed',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white38,
                                          ),
                                        ),
                                        SizedBox(width: 24),
                                        Text(
                                          '870 km/h',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(width: 24),
                                        Text(
                                          'Altitude',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white38,
                                          ),
                                        ),
                                        SizedBox(width: 24),
                                        Text(
                                          '11 300 m',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Icon(
                                Icons.chevron_right,
                                color: Colors.white24,
                                size: 24,
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
          ),
        ],
      ),
    );
  }
}
