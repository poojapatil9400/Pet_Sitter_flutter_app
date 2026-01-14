import 'package:flutter/material.dart';

class CustomersTabUI extends StatelessWidget {
  CustomersTabUI({super.key});

  final List<Map<String, dynamic>> customers = [
    {'pet': 'Guinea Pig', 'color': const Color(0xFFFF6FB5)},
    {'pet': 'Dog', 'color': const Color(0xFF9C6B3E)},
    {'pet': 'Hamster', 'color': const Color(0xFFFF9800)},
    {'pet': 'Cat', 'color': const Color(0xFF7A7A7A)},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// -------- SEARCH BAR + ICONS --------
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 44,
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: 8),
                      Text('Search..', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),

              /// Filter Icon
              CircleAvatar(
                radius: 22,
                backgroundColor: const Color(0xFFFFE36E),
                child: const Icon(Icons.tune, color: Colors.black),
              ),
              const SizedBox(width: 10),

              /// Favorite Icon
              CircleAvatar(
                radius: 22,
                backgroundColor: Colors.white,
                child: const Icon(Icons.favorite_border),
              ),
            ],
          ),
        ),

        /// -------- CUSTOMER LIST CONTAINER --------
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(top: 10),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
            ),
            child: ListView.builder(
              itemCount: customers.length,
              itemBuilder: (context, index) {
                final item = customers[index];

                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      child: Row(
                        children: [
                          /// Profile Image
                          const CircleAvatar(
                            radius: 28,
                            backgroundImage: AssetImage(
                              'assest/profilephoto.png', // placeholder
                            ),
                          ),
                          const SizedBox(width: 14),

                          /// Text Info
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Carlitta Pusso',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Lara  |  Sheltie',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  'Female',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          /// Pet Chip
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: item['color']),
                            ),
                            child: Text(
                              item['pet'],
                              style: TextStyle(
                                color: item['color'],
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// Divider
                    Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.grey.shade200,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
