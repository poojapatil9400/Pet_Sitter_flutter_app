import 'package:flutter/material.dart';
import 'package:flutter_app/appcolors.dart';
import 'package:flutter_app/widgets/service_card.dart';


class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(child: ServicesListSection()),
    );
  }
}
