import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

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
  double _zoomLevel = 1.0;
  Offset _mapOffset = Offset.zero;

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
    final mapHeight = MediaQuery.of(context).size.height - bottomSheetHeight;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Custom Map Background with Zoom
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: bottomSheetHeight,
            child: GestureDetector(
              onScaleUpdate: (details) {
                setState(() {
                  _zoomLevel = (_zoomLevel * details.scale).clamp(0.5, 3.0);
                });
              },
              child: InteractiveViewer(
                minScale: 0.5,
                maxScale: 3.0,
                onInteractionUpdate: (ScaleUpdateDetails details) {
                  setState(() {
                    _mapOffset += details.focalPointDelta;
                  });
                },
                child: Container(
                  color: const Color(0xFF333333),
                  child: Stack(
                    children: [
                      // Custom Map Drawing
                      CustomPaint(painter: MapPainter(), size: Size.infinite),
                      // Flight route line
                      Positioned(
                        left: 60,
                        top: 40,
                        right: 60,
                        bottom: 40,
                        child: CustomPaint(
                          painter: RoutePainter(),
                          size: Size.infinite,
                        ),
                      ),
                      // Departure marker
                      Positioned(
                        left: 80,
                        top: 60,
                        child: Column(
                          children: [
                            Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.red.withOpacity(0.5),
                                    blurRadius: 8,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'CPH',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Arrival marker
                      Positioned(
                        right: 80,
                        bottom: 60,
                        child: Column(
                          children: [
                            Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.green.withOpacity(0.5),
                                    blurRadius: 8,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'LCA',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
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
          SafeArea(
            child: Stack(
              children: [
                Positioned(
                  left: 16,
                  right: 16,
                  top: 2,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 14,
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
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Ryanair',
                              style: TextStyle(
                                fontSize: 15,
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
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF101010),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: const Color(0xFF1C1C1E),
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        Text(
                                          'CPH',
                                          style: TextStyle(
                                            fontSize: 40,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                            fontFamily: "JetBrains",
                                          ),
                                        ),
                                        SizedBox(height: 1),
                                        Text(
                                          'Copenhagen',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white70,
                                            fontFamily: "JetBrains",
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          'UTC+2',
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.white38,
                                            fontFamily: "JetBrains",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                    ),
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black,
                                      ),
                                      child: Transform.rotate(
                                        angle: pi / 3,
                                        child: const Icon(
                                          Icons.flight,
                                          color: Color(0xFFFFA500),
                                          size: 28,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        Text(
                                          'LCA',
                                          style: TextStyle(
                                            fontSize: 40,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                            fontFamily: "JetBrains",
                                          ),
                                        ),
                                        SizedBox(height: 1),
                                        Text(
                                          'Larnaca',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white70,
                                            fontFamily: "JetBrains",
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          'UTC+3',
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.white38,
                                            fontFamily: "JetBrains",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 3),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Container(
                              height: 77,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: const Color(0xFF1C1C1E),
                                borderRadius: BorderRadius.circular(0),
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(height: 1),
                                  Stack(
                                    alignment: Alignment.centerLeft,
                                    children: [
                                      Container(
                                        height: 2,
                                        decoration: BoxDecoration(
                                          color: Colors.white12,
                                          borderRadius: BorderRadius.circular(
                                            2,
                                          ),
                                        ),
                                      ),
                                      FractionallySizedBox(
                                        widthFactor: _progress,
                                        child: Stack(
                                          alignment: Alignment.centerRight,
                                          children: [
                                            Container(
                                              height: 2,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFFF6B35),
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                              ),
                                            ),
                                            Transform.rotate(
                                              angle: 1.5708,
                                              child: const Icon(
                                                Icons.flight,
                                                size: 20,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text(
                                        '1 235 km • 1h 25m',
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.white54,
                                          fontFamily: "JetBrains"
                                        ),
                                      ),
                                      Text(
                                        '1 615 km • 1h 52m',
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.white54,
                                          fontFamily: "JetBrains"
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 3),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF1C1C1E),
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Scheduled',
                                              style: TextStyle(
                                                fontSize: 11,
                                                color: Colors.white38,
                                              ),
                                            ),
                                            Text(
                                              '12:30',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white70,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 2),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF1C1C1E),
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Actual',
                                              style: TextStyle(
                                                fontSize: 11,
                                                color: Colors.white38,
                                              ),
                                            ),
                                            Text(
                                              '12:48',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white70,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 3),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF1C1C1E),
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(12),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Scheduled',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white38,
                                              ),
                                            ),
                                            Text(
                                              '17:10',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white70,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 2),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF1C1C1E),
                                      borderRadius: const BorderRadius.only(
                                        bottomRight: Radius.circular(12),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Estimated',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white38,
                                              ),
                                            ),
                                            Text(
                                              '17:32',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white70,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: const Color(0xFF2C2C2C),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                              ),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Flight information',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontFamily: "JetBrains",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 3),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 22),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF1C1C1E),
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        SizedBox(height: 6),
                                        Text(
                                          'Boeing  737-800',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 2),
                                SizedBox(
                                  width: 185,
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF1C1C1E),
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: const [
                                        Text(
                                          '🇩🇰',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          'Denmark',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 3),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 22),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF1C1C1E),
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: const [
                                        SizedBox(height: 6),
                                        Text(
                                          'Speed',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            color: Color(0xff858585),
                                            fontFamily: "JetBrains",
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 60),
                                          child: Text(
                                            '870km/h',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: Colors.white70,
                                              fontFamily: "JetBrains",
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 2),
                                SizedBox(
                                  width: 185,
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF1C1C1E),
                                      borderRadius: const BorderRadius.only(
                                        bottomRight: Radius.circular(20),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: const [
                                        SizedBox(height: 6),
                                        Text(
                                          'Altitude',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            color: Color(0xff858585),
                                            fontFamily: "JetBrains",
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 30),
                                          child: Text(
                                            '11 300 m',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              color: Colors.white70,
                                              fontFamily: "JetBrains",
                                            ),
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

class MapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.08)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    const gridSpacing = 80.0;
    for (double i = 0; i < size.width; i += gridSpacing) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }
    for (double i = 0; i < size.height; i += gridSpacing) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
    final random = Random(42);
    for (int idx = 0; idx < 12; idx++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final rotation = random.nextDouble() * 360;
      _drawAirplaneIcon(
        canvas,
        Offset(x, y),
        Colors.white.withOpacity(0.15),
        rotation,
      );
    }

    // Draw some location labels
    _drawLocationLabel(
      canvas,
      Offset(100, size.height - 150),
      'Delta Nestos\nNational Park',
    );
  }

  void _drawAirplaneIcon(
    Canvas canvas,
    Offset position,
    Color color,
    double rotation,
  ) {
    canvas.save();
    canvas.translate(position.dx, position.dy);
    canvas.rotate(rotation * pi / 180);

    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    const sz = 32.0;

    // Nose
    canvas.drawLine(const Offset(0, -sz / 2), const Offset(0, -sz / 3), paint);

    // Main fuselage
    canvas.drawLine(const Offset(0, -sz / 3), const Offset(0, sz / 3), paint);

    // Wings
    canvas.drawLine(
      const Offset(-sz / 2, -sz / 8),
      const Offset(sz / 2, -sz / 8),
      paint,
    );

    // Tail
    canvas.drawLine(
      const Offset(-sz / 5, sz / 3),
      const Offset(sz / 5, sz / 3),
      paint,
    );

    canvas.restore();
  }

  void _drawLocationLabel(Canvas canvas, Offset position, String text) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(color: Colors.white.withOpacity(0.3), fontSize: 12),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, position);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class RoutePainter extends CustomPainter {
  final double progress; // 0.0 to 1.0
  RoutePainter({this.progress = 0.45});

  @override
  void paint(Canvas canvas, Size size) {
    final solidPaint = Paint()
      ..color = const Color(0xFFFFA500)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;

    final dashedPaint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();
    path.moveTo(6, size.height * 0.12);
    path.cubicTo(
      size.width * 0.55,
      size.height * 0.55,
      size.width * 0.55,
      size.height * 0.55,
      size.width,
      size.height * 0.9,
    );

    final metric = path.computeMetrics().first;
    final totalLength = metric.length;
    final coveredLength = totalLength * progress;

    final solidPart = metric.extractPath(0, coveredLength);
    final dashedPart = metric.extractPath(coveredLength, totalLength);
    canvas.drawPath(solidPart, solidPaint);

    final dashLength = 12.0;
    final dashSpace = 8.0;
    double distance = 0.0;

    while (distance < dashedPart.computeMetrics().first.length) {
      final dashMetric = dashedPart.computeMetrics().first;
      final start = distance;
      final end = distance + dashLength;
      if (start >= dashMetric.length) break;
      final segment = dashMetric.extractPath(
        start,
        end.clamp(0, dashMetric.length),
      );
      canvas.drawPath(segment, dashedPaint);
      distance += dashLength + dashSpace;
    }
    final tangent = metric.getTangentForOffset(coveredLength);
    if (tangent != null) {
      final position = tangent.position;
      final angle = tangent.angle;

      canvas.save();
      canvas.translate(position.dx, position.dy);
      canvas.rotate(angle);

      final iconPaint = Paint()
        ..color = Colors.white
        ..strokeWidth = 3
        ..style = PaintingStyle.stroke;

      const sz = 45.0;
      canvas.drawLine(Offset(0, -sz / 2), Offset(0, sz / 2), iconPaint);
      canvas.drawLine(Offset(-sz / 2, 0), Offset(sz / 2, 0), iconPaint);
      canvas.drawLine(Offset(2, -sz / 4), Offset(sz / 5, -sz / 4), iconPaint);
      canvas.drawLine(Offset(0, -sz / 5), Offset(-sz / 4, -sz / 4), iconPaint);

      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant RoutePainter oldDelegate) => true;
}
