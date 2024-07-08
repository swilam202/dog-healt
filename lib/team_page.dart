import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled4/services/data.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back)),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Team',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 25),
              ),
              SizedBox(
                height: 25,
              ),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: team.length,
                itemBuilder: (context, index) {
                  return TeamContainer(
                      team[index]['name'], team[index]['image']);
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class TeamContainer extends StatelessWidget {
  const TeamContainer(this.name, this.image, {super.key});

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          width: 100,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue, width: 3),
            shape: BoxShape.circle,
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage(image),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          name,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
