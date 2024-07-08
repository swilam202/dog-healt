// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:untitled4/about_dogs.dart';
import 'package:untitled4/guidelines_page.dart';
import 'package:untitled4/home.dart';
import 'package:untitled4/information.dart';
import 'package:untitled4/legal.dart';
import 'package:untitled4/reminder_page.dart';
import 'package:untitled4/team_page.dart';

import 'choose_city_screen.dart';

class GetStart extends StatefulWidget {
  const GetStart({super.key});

  @override
  State<GetStart> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<GetStart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/1'.jpg"),
            fit: BoxFit.fill,
            opacity: 0.8,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Welcome To',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Dog health",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 200,
                ),
                GetStartedCustomButton(
                  title: 'Check your dog health',
                  page: Information(),
                ),
                SizedBox(
                  height: 30,
                ),
                GetStartedCustomButton(
                  title: 'Find clinic near you',
                  page: ChooseCityScreen(),
                ),
                SizedBox(
                  height: 30,
                ),
                GetStartedCustomButton(
                  title: 'Vaccine reminder',
                  page: ReminderPage(),
                ),
                SizedBox(
                  height: 30,
                ),
                GetStartedCustomButton(
                  title: 'About dogs',
                  page: AboutDogs(),
                ),
                SizedBox(
                  height: 30,
                ),

                GetStartedCustomButton(
                  title: 'Legality of Dog Ownership in Egypt',
                  page: LegalPage(),
                ),
                SizedBox(
                  height: 30,
                ),
                GetStartedCustomButton(
                  title: 'Our Team',
                  page: TeamPage(),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GetStartedCustomButton extends StatelessWidget {
  const GetStartedCustomButton({
    super.key,
    required this.title,
    required this.page,
  });

  final String title;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => page)),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.purple, borderRadius: BorderRadius.circular(10)),
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
            textAlign: TextAlign.end,
          ),
        ),
      ),
    );
  }
}
