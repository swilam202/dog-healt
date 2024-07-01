import 'package:flutter/material.dart';
import 'package:untitled4/information.dart';

import 'get_clinic_screen.dart';

class ChooseCityScreen extends StatelessWidget {
  const ChooseCityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const List<String> cities = [
      'Cairo',
      'Giza',
      'Minya',
      'EL Wadi El Jadid',
      'Menoufia',
      'Matrouh',
      'Kafr Al sheikh',
      'Qena',
      'Al-Qalubeiah',
      'Fayoum',
      'Gharbia',
      'North Sinai',
      'South Sinai',
      'Alexandria',
      'Sharkia',
      'Suez',
      'Sohag',
      'Damietta',
      'Dakahlia',
      'Beni Suef',
      'Beheira',
      'Red Sea',
      'Luxor',
      'Assiut',
      'Aswan',
      'Ismailia',
    ];

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/123456.webp'),
              fit: BoxFit.cover,
              opacity: 0.8,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Choose your city',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 50),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: cities.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        tileColor: Colors.black.withOpacity(0.9),
                        leading: const Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                        title: Text(
                          cities[index],
                          style: const TextStyle(
                              fontSize: 18, color: Colors.white),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      GetClinicScreen(cities[index])));
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
