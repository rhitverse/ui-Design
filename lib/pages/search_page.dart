import 'package:flutter/material.dart';

import 'biman_aIrline.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  final List<String> _history = const [
    'Biman Airline',
    'choco',
    'Mia Khalifa',
    'Jonny Sins',
    'Elon Musk Controversy',
  ];
  final List<String> _airlines = const [
    'Air India',
    'IndiGo',
    'Vistara',
    'SpiceJet',
    'Go First',
    'AirAsia India',
    'Akasa Air',
    'Alliance Air',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101010),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1B1B1B),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Colors.white70),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        style: const TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          hintStyle: TextStyle(
                            color: Colors.white70.withValues(alpha: 0.7),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 64,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                scrollDirection: Axis.horizontal,
                itemCount: _airlines.length,
                separatorBuilder: (_, _) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  return ActionChip(
                    label: Text(_airlines[index]),
                    labelStyle: const TextStyle(color: Colors.white),
                    backgroundColor: const Color(0xFF242424),
                    onPressed: () {},
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: Row(
                children: [
                  Text(
                    'Recent searches',
                    style: TextStyle(color: Colors.white70),
                  ),
                  const Spacer(),
                  Text('Clear', style: TextStyle(color: Colors.white38)),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                itemCount: _history.length,
                separatorBuilder: (_, _) =>
                    const Divider(color: Color(0xFF222222), height: 1),
                itemBuilder: (context, index) {
                  final item = _history[index];
                  return ListTile(
                    dense: true,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    leading: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2A2A2A),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.history,
                        color: Colors.white54,
                        size: 18,
                      ),
                    ),
                    title: Text(
                      item,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.more_vert, color: Colors.white38),
                      onPressed: () {},
                    ),
                    onTap: () {
                      if (item == 'Biman Airline') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BimanAirlinePage(),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text('Tapped $item')));
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
