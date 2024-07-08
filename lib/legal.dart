import 'package:flutter/material.dart';

class LegalPage extends StatelessWidget {
  const LegalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/777777.jpg"),
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
                Text('Legality of Dog Ownership in Egypt',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                SizedBox(height: 30,),
                Text(legalText,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String legalText = '''
The Egyptian House of Representatives has preliminarily approved a draft law regarding the possession of dangerous animals and ownership of dogs. This comes in response to the widespread phenomenon of breeding predatory animals, resulting in numerous incidents, including using them to intimidate citizens.

Hisham El-Hosary, Chairman of the Agriculture, Irrigation, and Food Security Committee in the House of Representatives, affirmed that the law prohibits the possession of dangerous animals. It outlines procedures for licensing domestic dogs and regulating their presence in public places. Owners of dogs will be given a one-year grace period after the law's enactment to obtain licenses, failing which financial penalties will be imposed.

Annual cases of stray dog attacks on Egyptian streets have reached 400,000, leading to fatalities and placing a heavy financial burden on the state budget due to the importation of rabies serum, as stated in the explanatory memorandum of the law.

El-Hosary stated that the General Assembly of the House has preliminarily agreed to the principle of the law, with a final vote scheduled for Tuesday's session. The project aims to achieve three objectives: criminalizing the possession of dangerous animals and aggressive dogs, regulating the ownership of non-dangerous dogs through issuing licenses to maintain public health, and specifying measures to deal with stray dogs in line with international standards.

The law on the possession of dangerous animals and ownership of dogs consists of five chapters comprising 24 articles, excluding publishing provisions. It includes banning the possession, trading, or breeding of dangerous animals or taking them to public places. Owners are required to take precautions to prevent their escape, provide healthcare, and vaccinate them against diseases. The law also mandates reporting to authorities immediately if an animal contracts an infectious disease. It establishes procedures for dog registration and licensing, conditions for walking dogs in public places, and penalties for non-compliance.

El-Hosary emphasized the importance of the law in combating the rising incidence of accidents caused by dangerous animal possession and the acquisition of aggressive dog breeds responsible for fatalities and disfigurements. Additionally, it addresses the issue of stray dogs, which tarnish the civilized appearance of Egyptian streets.

The legislation was proposed by the Chairman of the Local Development Committee and 60 other deputies of the House of Representatives. A committee was formed comprising members from the Agriculture and Constitutional Affairs Committees of the House, alongside representatives from various governmental bodies and civil society organizations concerned with animal welfare, underscoring parliament's commitment to tackling this issue.

According to Article 122 of the Egyptian Constitution, the President, the Cabinet, and each member of the House of Representatives have the right to propose laws. Every bill submitted by the government or by a tenth of the members of the House is referred to specialized committees for examination and a report to the House. The committee may also consult experts on the subject.

El-Hosary also disclosed that the law prohibits the possession, trading, or breeding of any dangerous animals except for ministries, public authorities, research institutions, scientific institutions, zoos, circuses, and centers specialized in animal care and housing. These entities are required to provide healthcare and vaccinate against diseases, in addition to establishing medical records.

El-Hosary announced a one-year grace period for owners of non-dangerous dogs to apply for registration and obtain an identification tag. The tag, which must be affixed to the dog's collar, will include information such as the owner's name, residence, dog's description, distinctive marks, periodic vaccinations, and epidemiological vaccinations to ensure public health. Dangerous dogs and animals will be handed over to relevant authorities for use in scientific research and guarding.

The law includes graduated penalties corresponding to violations in each case, starting with fines ranging from 10,000 to 1 million Egyptian pounds for failure to comply with licensing procedures or unauthorized dog ownership without causing harm or damage. Imprisonment will be added to fines for offenses involving the use of dangerous animals or dogs to harm others, with stricter penalties for premeditated or premeditated actions. In cases resulting in death, the owner of the dangerous animal or dog faces imprisonment for at least 10 years.

Dr. Khaled Salim, President of the Veterinary Syndicate in Egypt, affirmed that Islamic law permits the possession of pets in homes. However, he stressed the need for awareness about proper animal care, regular vaccinations to avoid harm, and preventing them from causing harm to others. Some irresponsible citizens, he added, illegally breed dogs, resulting in tragic incidents, whether intentional or not, necessitating penalties to address this issue.

On April 9th of the previous year, the manager of an Egyptian bank passed away after being attacked by a neighbor's pit bull a month earlier, sustaining severe injuries that led to hospitalization and subsequent coma before his heart stopped, according to local media reports.

The president of the veterinarians' union praised the licensing procedures for owning non-dangerous dogs and walking them in public places stipulated in the draft law on the possession of dangerous animals and ownership of dogs. He emphasized, however, the necessity of stricter financial fines and imprisonment for cases involving dangerous dogs and their illegal use to intimidate citizens. He also emphasized the importance of granting veterinarians specialized in medical and therapeutic animal handling the authority to handle animals and immunize them, with animal welfare associations obtaining licenses from the union or Ministry of Agriculture to ensure adequate care.

The draft law on the possession of dangerous animals and ownership of dogs mandates dog owners in public places to wear masks while walking or taking them outside shelters and to restrict dogs with appropriate collars for control.

''';