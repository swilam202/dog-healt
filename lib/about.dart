// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:untitled4/home.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[
          Container(
            height: double.infinity,
            width: double.infinity,
          ),
          IconButton(onPressed: (){
            Navigator.push(
                context, MaterialPageRoute(builder: (context) =>
                Home()));
          }, icon: Icon(Icons.arrow_back)),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 200, top: 10),
                  child: Text(
                    "welcome!",
                    style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "-This application helps you identify what diseases your dog suffers from by selecting the symptoms that the dog suffers from.",
                    style: TextStyle(color: Colors.blue,fontSize: 15,fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(right: 100),
                  child: Text("-How does the application work?",style: TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "-Our application works by registering your own account for the first time only, then logging in to the account that you registered, and inside you will have the symptoms that your dog may be suffering from, and you will choose from them what your dog is suffering from, and it will show you the disease that your dog is suffering from, and you will also choose the age of your dog and it will appear. The vaccinations your dog is supposed to receive.",
                    style: TextStyle(color: Colors.blue,fontSize: 15,fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(right: 230,),
                  child: Text(
                    "-Contact us:",
                    style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Icon(Icons.email,color: Colors.blue,),
                    SizedBox(width: 2,),
                    Text(
                      "tadel7690@gmail.com",
                      style: TextStyle(color: Colors.black, fontSize: 11,fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(right: 230,),
                  child: Row(
                    children: [
                      Icon(Icons.call,color: Colors.green,),
                      Text(
                        "01009869736",
                        style: TextStyle(color: Colors.black, fontSize: 12,fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
