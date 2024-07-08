import 'package:flutter/material.dart';
import 'package:untitled4/services/data.dart';

import 'dog_details_page.dart';

class AboutDogs extends StatelessWidget {
  const AboutDogs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/22.jpg"),
              fit: BoxFit.fill,
              opacity: 0.8,
            ),
          ),
          padding: const EdgeInsets.all(20.0),
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
              ListView.builder(
                itemCount: dogs.length,
                shrinkWrap: true,

                itemBuilder: (context, index) {
                  return AboutDogListTile(dogs[index]);
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AboutDogListTile extends StatelessWidget {
  const AboutDogListTile(this.dog,{super.key});

  final Map dog;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(10),
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DogDetailsPage( dog),),);
      },
      title: Text(dog['name'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
      leading: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: AssetImage(dog['images'][0]),
                fit: BoxFit.fill,
            )
          ),
          height: 100, width: 80,),
      subtitle: Text(dog['description'],maxLines: 1,style: TextStyle(fontSize: 12),),
    );
  }
}

