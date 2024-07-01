import 'package:flutter/material.dart';

class GuideLinesPage extends StatelessWidget {
  const GuideLinesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/5.jpg"),
              fit: BoxFit.fill,
              opacity: 0.8,
            ),
          ),
          padding: const EdgeInsets.only(left: 30.0, right: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back),),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'How to keep your dog healthy ?',
                  style: TextStyle(fontSize: 29, fontWeight: FontWeight.w600,color: Colors.black),
                ),
                SizedBox(
                  height: 20,
                ),
                GuideLinesListTile('1. 30 days old', "When dogs are one month old, guidelines regarding food, disease protection, and training are crucial for establishing a strong foundation for their health. It's recommended to provide a balanced diet that meets their specific nutritional needs, such as specially formulated puppy food to support healthy growth, muscle development, and bone formation. Regular visits to the veterinarian are essential to ensure the puppy's health and administer vaccinations against common infectious diseases at this age. Additionally, basic training can begin with commands like \"come here\" and \"sit,\" using rewards to reinforce positive behavior and enhance communication and trust between the puppy and its owner. The first month of a puppy's life is critical for preparing them for a healthy and happy home life, and providing proper care and training sets the stage for a long and comfortable life ahead."),
                SizedBox(height: 10),
                GuideLinesListTile('2. 45 days old', "When dogs are just a month and a half old, basic guidelines focus on maintaining their health and safety during this crucial developmental stage. Here are some essential \ntips:1. *Proper Nutrition*: Provide a balanced diet that meets the puppy's nutritional needs. Consulting a veterinarian to determine the appropriate food type and feeding amounts is advisable.2. \n*House Training*: This period is crucial for teaching the puppy to use a designated bathroom area. Using rewards and positive reinforcement can help reinforce correct behavior. \n3. *Vaccinations and Health Care*: Schedule essential vaccinations with a veterinarian and ensure general care such as grooming and brushing. \n4. *Socialization and Basic Commands*: Puppyhood is important for learning positive interaction with people and other animals, as well as basic commands like sit and wait. \n5. *Protection and Safety*: Secure the home and surroundings to prevent accidents and injuries, such as removing harmful substances and small objects that could be swallowed.By adhering to these guidelines, the young puppy's early stage can be a enjoyable and beneficial period for laying the foundation for a healthy and happy future life."),
                SizedBox(height: 10),
                GuideLinesListTile('3. 3 to 6 months old', "During the period from 3 to 6 months of age, guidelines focus on meeting the puppies' nutritional needs and ensuring proper growth, as well as teaching them basic obedience and social interaction skills. Here are some essential tips for this stage: \n1. *Proper Nutrition*: Provide a balanced diet that meets the rapid growth needs of the puppy, consulting a veterinarian to determine suitable types and quantities. \n2. *Basic Command Training*: Teach the puppy simple commands like sit, stay, and walk using rewards and positive reinforcement. \n3. *Health Care and Vaccinations*: Complete essential vaccinations and maintain routine care such as grooming, brushing, and regular veterinary check-ups. \n4. *Physical and Social Activity*: Puppies at this age require regular physical exercise and opportunities for interaction with other dogs and people to enhance socialization. \n5. *Protection and Safety*: Secure the puppy's environment to prevent accidents, including removing harmful substances and small objects that could be swallowed. \nBy following these guidelines, puppies at this age can develop healthily and happily, benefiting from the growth period to build strong foundations for their future."),
                SizedBox(height: 10),
                GuideLinesListTile('4. 8 to 12 months old', "Between 8 to 12 months old, dogs undergo significant development, gaining strength and size. Here are essential care and training tips for this stage: \n1. *Nutritional Needs*: Continue providing nutritious food that meets their growing energy requirements. Adjust portions based on their activity levels and body size. \n2. *Obedience Training*: Focus on reinforcing basic commands like sit, stay, and recall, emphasizing discipline and positive interaction. \n3. *Physical Activity*: Regular and varied physical exercises are crucial at this age to maintain fitness and enhance overall health. \n4. *Health Care*: Maintain routine health care including grooming, ear checks, and regular veterinary visits to detect any potential health issues. \n5. *Safety and Protection*: Ensure a safe environment by removing hazards and harmful substances to keep the dog secure. \nBy following these guidelines, dogs at this stage can enjoy healthy growth and effective learning, helping them develop a happy and healthy lifestyle."),
                SizedBox(height: 10),
              
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GuideLinesListTile extends StatelessWidget {
  const GuideLinesListTile(this.title,this.description,{super.key});

  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
      subtitle: Text(description,style: TextStyle(fontSize: 15),),
    );
  }
}

