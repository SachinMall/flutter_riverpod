import 'package:flutter/material.dart';
import 'package:flutter_riverpod_weather_app/res/app_colors.dart';
import 'package:flutter_riverpod_weather_app/res/icon_assets/images.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.kprimaryColor1,
                AppColors.kprimaryColor2,
                AppColors.kprimaryColor3
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Gap(20),
                Row(
                  children: [
                    const Gap(15),
                    SvgPicture.asset(IconsAssets.locationIcon),
                    const Gap(10),
                    const Text(
                      "Thane",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.kwhite),
                    ),
                    const Gap(10),
                    const Icon(Icons.arrow_drop_down_sharp,
                        color: AppColors.kwhite, size: 20),
                    const Spacer(),
                    SvgPicture.asset(IconsAssets.notificationIcon),
                    const Gap(10),
                  ],
                ),
                const Gap(15),
                // SvgPicture.asset(IconsAssets.rainyCloudIcon),
                Image.asset(IconsAssets.homeCloudIcon,fit: BoxFit.contain,),
                const Gap(15),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "28º",
                      style: TextStyle(
                          fontSize: 64,
                          fontWeight: FontWeight.w600,
                          color: AppColors.kwhite),
                    ),
                    const Gap(5),
                    const Text(
                      "Precipitations\nMax.: 31º   Min.: 25º",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: AppColors.kwhite),
                    ),
                    const Gap(30),
                    Container(
                      height: 47,
                      width: screenWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.containerColor.withOpacity(0.5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          weatherDetails(IconsAssets.whiteRainDropIcon, "6%"),
                          weatherDetails(IconsAssets.airIcon, "90%"),
                          weatherDetails(
                              IconsAssets.whiteRainDropIcon, "19 km/h"),
                        ],
                      ),
                    ),
                    const Gap(20),
                    Container(
                        width: screenWidth,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.containerColor.withOpacity(0.5),
                        ),
                        child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Today',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Mar, 9',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildHourlyForecast('15.00', '29°C', Icons.wb_sunny),
                _buildHourlyForecast('16.00', '26°C', Icons.wb_cloudy),
                _buildHourlyForecast('17.00', '24°C', Icons.cloud, isSelected: true),
                _buildHourlyForecast('18.00', '23°C', Icons.nights_stay),
              ],
            ),
                    ],
                  ),),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

    String formattedDate = DateFormat('MMM d').format(DateTime.now()); 


  Widget weatherDetails(String iconName, String textName) {
    return Row(
      children: [
        SvgPicture.asset(iconName),
        const Gap(4),
        Text(
          textName,
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppColors.kwhite),
        ),
      ],
    );
  }

Widget _buildHourlyForecast(String time, String temperature, IconData icon, {bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: isSelected
          ? BoxDecoration(
              color: Colors.blue[600],
              borderRadius: BorderRadius.circular(20),
            )
          : null,
      child: Column(
        children: [
          Text(
            temperature,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          const SizedBox(height: 5),
          Text(
            time,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

}
