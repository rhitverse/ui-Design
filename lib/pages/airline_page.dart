import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:latlong2/latlong.dart' hide LatLng;

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
  final Completer<GoogleMapController> _controller = Completer();

  final List<LatLng> _route = [
    LatLng(55.6181, 12.6561), // Copenhagen
    LatLng(54.0, 12.0),
    LatLng(52.0, 14.0),
    LatLng(50.0, 16.0),
    LatLng(47.0, 18.0),
    LatLng(44.0, 19.0),
    LatLng(40.0, 24.0),
    LatLng(35.0, 33.6), // Larnaca
  ];

  static final CameraPosition _initialCamera = CameraPosition(
    target: LatLng(50.0, 18.0),
    zoom: 4.2,
  );

  late Marker _planeMarker;
  int _planeIndex = 3;

  @override
  void initState() {
    super.initState();
    _planeMarker = Marker(
      markerId: const MarkerId('plane'),
      position: _route[_planeIndex],
      anchor: const Offset(0.5, 0.5),
      rotation: 40.0,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
    );

    Future.delayed(const Duration(milliseconds: 800), _startPlaneDemo);
  }

  void _startPlaneDemo() {
    Timer.periodic(const Duration(seconds: 2), (timer) async {
      if (!mounted) {
        timer.cancel();
        return;
      }
      setState(() {
        _planeIndex = (_planeIndex + 1) % _route.length;
        _planeMarker = _planeMarker.copyWith(positionParam: _route[_planeIndex]);
      });
      final controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newLatLng(_route[_planeIndex]));
      if (_planeIndex == _route.length - 1) timer.cancel();
    });
  }

  Set<Polyline> _buildPolylines() {
    return {
      Polyline(
        polylineId: const PolylineId('route'),
        points: _route,
        color: const Color(0xFFFF6B35),
        width: 3,
      ),
    };
  }

  Set<Marker> _buildMarkers() {
    return {_planeMarker};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            // Google Map (Commented out - add API key to enable)
            Positioned.fill(
              child: Container(
                color: const Color(0xFF242f3e),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.map, size: 64, color: Colors.white24),
                      SizedBox(height: 16),
                      Text(
                        'Google Maps API Key Required',
                        style: TextStyle(color: Colors.white54),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Add your API key to AndroidManifest.xml',
                        style: TextStyle(color: Colors.white38, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Uncomment this once you add your API key:
            /*
            Positioned.fill(
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _initialCamera,
                myLocationEnabled: false,
                markers: _buildMarkers(),
                polylines: _buildPolylines(),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                  controller.setMapStyle(_darkMapStyle);
                },
                zoomControlsEnabled: false,
                tiltGesturesEnabled: false,
                mapToolbarEnabled: false,
              ),
            ),
            */

            // Top app bar
            Positioned(
              left: 16,
              right: 16,
              top: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFF1C1C1E),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.arrow_back, size: 24),
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
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'Ryanair',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert, size: 24),
                      color: Colors.white70,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
              ),
            ),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        borderRadius: BorderRadius.circular(2),
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
                            margin: const EdgeInsets.symmetric(horizontal: 24),
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
                    Container(
                      height: 1,
                      color: Colors.white12,
                    ),

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
                                    Text('🇩🇰', style: TextStyle(fontSize: 16)),
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

            // Zoom controls
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
                      onPressed: () async {
                        final controller = await _controller.future;
                        controller.animateCamera(CameraUpdate.zoomIn());
                      },
                      icon: const Icon(Icons.add, size: 24),
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
                      onPressed: () async {
                        final controller = await _controller.future;
                        controller.animateCamera(CameraUpdate.zoomOut());
                      },
                      icon: const Icon(Icons.remove, size: 24),
                      color: Colors.white,
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

  final String _darkMapStyle = '''
[
  {
    "elementType": "geometry",
    "stylers": [{"color": "#242f3e"}]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [{"color": "#746855"}]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [{"color": "#242f3e"}]
  },
  {
    "featureType": "administrative.locality",
    "elementType": "labels.text.fill",
    "stylers": [{"color": "#d59563"}]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [{"color": "#d59563"}]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [{"color": "#263c3f"}]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [{"color": "#38414e"}]
  },
  {
    "featureType": "road",
    "elementType": "geometry.stroke",
    "stylers": [{"color": "#212a37"}]
  },
  {
    "featureType": "road",
    "elementType": "labels.text.fill",
    "stylers": [{"color": "#9ca5b3"}]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [{"color": "#746855"}]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry.stroke",
    "stylers": [{"color": "#1f2835"}]
  },
  {
    "featureType": "road.highway",
    "elementType": "labels.text.fill",
    "stylers": [{"color": "#f3d19c"}]
  },
  {
    "featureType": "transit",
    "elementType": "geometry",
    "stylers": [{"color": "#2f3948"}]
  },
  {
    "featureType": "transit.station",
    "elementType": "labels.text.fill",
    "stylers": [{"color": "#d59563"}]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [{"color": "#17263c"}]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [{"color": "#515c6d"}]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.stroke",
    "stylers": [{"color": "#17263c"}]
  }
]
''';
}