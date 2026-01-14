// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_app/appcolors.dart';
import 'package:flutter_app/screens/customers_screen.dart';
import 'package:flutter_app/screens/services_screen.dart';
import 'package:flutter_app/widgets/stat_card.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int bottomIndex = 1;
  int topTabIndex = 0;

  final pages = [
    const SizedBox(),
    const HomeDashboard(),
    const ServicesScreen(),
    const CustomersScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomIndex,
        onTap: (i) => setState(() => bottomIndex = i),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assest/homeicon.png',
              width: 24,
              height: 24,
              color: Colors.grey, // unselected color
            ),
            activeIcon: Image.asset(
              'assest/homeicon.png',
              width: 24,
              height: 24,
              color: Colors.black, // selected color
            ),
            label: 'Sitter',
          ),

          BottomNavigationBarItem(
            icon: Image.asset(
              'assest/sittericon.png',
              width: 24,
              height: 24,
              // color: Colors.grey, // unselected color
            ),
            activeIcon: Image.asset(
              'assest/sittericon.png',
              width: 24,
              height: 24,
              // color: AppColors.primary, // selected color
            ),
            label: 'Sitter',
          ),

          BottomNavigationBarItem(
            icon: Image.asset(
              'assest/Calendar.png',
              width: 24,
              height: 24,
              color: Colors.grey, // unselected color
            ),
            activeIcon: Image.asset(
              'assest/Calendar.png',
              width: 24,
              height: 24,
              color: Colors.black, // selected color
            ),
            label: 'Agenda',
          ),

          BottomNavigationBarItem(
            icon: Image.asset(
              'assest/Card.png',
              width: 24,
              height: 24,
              color: Colors.grey, // unselected color
            ),
            activeIcon: Image.asset(
              'assest/Card.png',
              width: 24,
              height: 24,
              color: Colors.black, // selected color
            ),
            label: 'Earning',
          ),

          BottomNavigationBarItem(
            icon: Image.asset(
              'assest/Chat.png',
              width: 24,
              height: 24,
              color: Colors.grey, // unselected color
            ),
            activeIcon: Image.asset(
              'assest/Chat.png',
              width: 40,
              height: 40,
              color: Colors.black, // selected color
            ),
            label: 'chats',
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            _topHeader(),
            Expanded(child: pages[topTabIndex + 1]),
          ],
        ),
      ),
    );
  }

  Widget _topHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 157),
              Text(
                'Pet Sitter',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Spacer(),
              CircleAvatar(
                backgroundColor: AppColors.yellow,
                child: Icon(Icons.add, color: Colors.black),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _segmentedTabs(),
        ],
      ),
    );
  }

  Widget _segmentedTabs() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            children: [
              _tab('PawPrints', 0),
              _tab('Services', 1),
              _tab('Customers', 2),
            ],
          ),
        ),
      ],
    );
  }

  Widget _tab(String text, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => topTabIndex = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: topTabIndex == index ? AppColors.yellow : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(text, textAlign: TextAlign.center),
        ),
      ),
    );
  }
}

class HomeDashboard extends StatelessWidget {
  const HomeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.all(30),
        children: [
          const Text(
            '                      Your Pet Sitting Performance',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              StatCard(
                title: 'Views',
                value: '999,000',
                assets: 'assest/Eyeicons.png',
                color: Colors.blue,
              ),
              StatCard(
                title: 'Likes',
                value: '999,000',
                assets: 'assest/heartIcon.png',
                color: Colors.red,
              ),
              StatCard(
                title: 'Bookings',
                value: '999,000',
                assets: 'assest/caleIcon.png',
                color: AppColors.primary,
              ),
              StatCard(
                title: 'Earnings',
                value: '999,000',
                assets: 'assest/earningicon.png',
                color: Colors.green,
              ),
            ],
          ),
          // const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.all(16),
            child: RatingsAndReviewsSection(),
          ),
          // const Text('4.8 ⭐⭐⭐⭐⭐'),
        ],
      ),
    );
  }
}

class RatingsAndReviewsSection extends StatelessWidget {
  const RatingsAndReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// -------- OVERALL RATINGS TITLE --------
        const Text(
          'Overall Ratings',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 12),

        /// -------- OVERALL RATINGS CONTAINER --------
        Container(
          width: 700,
          // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          decoration: BoxDecoration(
            // color: Colors.grey[100],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(30),
                    child: const Text(
                      '4.8',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      children: List.generate(
                        5,
                        (index) => const Icon(
                          Icons.star,
                          color: Color(0xFF4C8DFF),
                          size: 22,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                  color: Colors.grey[100],
                ),
                width: 900,

                child: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.grey,
                  size: 28,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 28),

        /// -------- RECENT REVIEWS TITLE --------
        const Text(
          'Recent Reviews',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 12),

        /// -------- RECENT REVIEWS CONTAINER --------
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// -------- USER ROW --------
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 24,
                    backgroundColor: Color(0xFFD9D9D9),
                  ),
                  const SizedBox(width: 12),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Expanded(
                              child: Text(
                                'Avantika Agarwal',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Text(
                              '2 days ago',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 6),

                        Row(
                          children: List.generate(
                            5,
                            (index) => const Icon(
                              Icons.star,
                              size: 18,
                              color: Color(0xFFFFC107),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              /// -------- REVIEW TEXT --------
              const Text(
                'Michael is amazing with pets! He took exceptional '
                'care of my two cats while I was away. He took '
                'exceptional care of my two cats while I was away.',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF5F6B7A),
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
