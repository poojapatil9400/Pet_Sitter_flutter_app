// import 'package:flutter/material.dart';

// class ServiceCard extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final bool active;

//   const ServiceCard({
//     super.key,
//     required this.title,
//     required this.subtitle,
//     required this.active,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Row(
//         children: [
//           const CircleAvatar(
//             backgroundColor: Color(0xFFFFE36E),
//             child: Icon(Icons.pets, color: Colors.black),
//           ),
//           const SizedBox(width: 16),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(title,
//                     style: const TextStyle(fontWeight: FontWeight.bold)),
//                 Text(subtitle, style: const TextStyle(color: Colors.grey)),
//               ],
//             ),
//           ),
//           Chip(
//             label: Text(active ? 'Active' : 'Inactive'),
//             backgroundColor: active ? Colors.green : Colors.red,
//             labelStyle: const TextStyle(color: Colors.white),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class ServicesListSection extends StatelessWidget {
  ServicesListSection({super.key});

  final List<Map<String, dynamic>> services = [
    {
      'title': 'Day Care',
      'subtitle1': 'Pet day care facility',
      'subtitle2': 'Short stays up to 12 hrs.',
      'active': true,
    },
    {
      'title': 'Night Stay',
      'subtitle1': 'Pet night stay facility',
      'subtitle2': 'Longer overnight stays',
      'active': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: ListView.builder(
        itemCount: services.length,
        itemBuilder: (context, index) {
          final item = services[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 14),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              children: [
                /// ---- LEFT ICON ----
             Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: const Color(0xFFFFE36E),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  'assets/stethoscope.png',
                  width: 30,
                  height: 30,
                  fit: BoxFit.contain,
                ),

              ),
            ),


                const SizedBox(width: 14),

                /// ---- TEXT CONTENT ----
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['title'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item['subtitle1'],
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        item['subtitle2'],
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),

                /// ---- STATUS BADGE ----
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: item['active']
                        ? const Color(0xFF1FAF73)
                        : const Color(0xFFE53935),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    item['active'] ? 'Active' : 'Inactive',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
