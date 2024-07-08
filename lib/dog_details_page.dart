import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DogDetailsPage extends StatelessWidget {
  const DogDetailsPage(this.dog,{super.key});

  final Map dog;
  @override
  Widget build(BuildContext context) {
    final List<String> images = dog['images'];
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/6.jpg"),
              fit: BoxFit.fill,
              opacity: 0.8,
            ),
          ),
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 300),
                  child: IconButton(onPressed: (){
                    Navigator.of(context).pop();
                  }, icon: Icon(Icons.arrow_back)),
                ),
                SizedBox(
                  height: 25,
                ),
        
                Text(
                  dog['name'],
                  style: TextStyle(fontSize: 29, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20,
                ),
                CarouselSlider(
                  items: images
                      .map(
                        (e) => Container(
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage(
                                e,
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                  )
                      .toList(),
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    autoPlay: true,
                    autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                    autoPlayAnimationDuration: const Duration(seconds: 4),
                  ),
                ),
                SizedBox(height: 20,),
                Text(
                  dog['description'],
                  style: TextStyle(fontSize: 16),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
