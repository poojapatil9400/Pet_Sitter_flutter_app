import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String assets;
  final Color color;

  StatCard({
    super.key,
    required this.title,
    required this.color,
    required this.value,
    required this.assets,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 119,
      width: 167,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 217, 216, 216),
            spreadRadius: 1,
            blurRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 8),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
          const Spacer(),
          Align(alignment: Alignment.bottomRight, child: Image.asset(assets)),
        ],
      ),
    );
  }
}
