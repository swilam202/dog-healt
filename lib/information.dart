// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled4/controllers/causes_controller/causes_cubit.dart';
import 'package:untitled4/controllers/causes_controller/causes_state.dart';
import 'package:untitled4/get_started.dart';

import 'find_disease_page.dart';

class Information extends StatefulWidget {
  const Information({super.key});

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CausesCubit>(context).getCauses();
  }

  bool age1 = false;
  bool age2 = false;
  bool age3 = false;

  List<String> chosenCausesList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/4.webp"),
            fit: BoxFit.fill,
            opacity: 0.8,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
             
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context
                          );
                    },
                    icon: Icon(Icons.arrow_back)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        'Enter information about your dog',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Choose Your Dog's Age",
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CheckboxListTile(
                          title: Text(
                            '1 day to 45 days',
                            style: TextStyle(color: Colors.white),
                          ),
                          value: age1,
                          onChanged: (val) {
                            setState(() {
                              age1 = val!;
                            });
                          }),
                      CheckboxListTile(
                          title: Text(
                            '45 days to 6 months',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          value: age2,
                          onChanged: (val) {
                            setState(() {
                              age2 = val!;
                            });
                          }),
                      CheckboxListTile(
                          title: Text(
                            '6 months to 1 year',
                            style: TextStyle(color: Colors.white),
                          ),
                          value: age3,
                          onChanged: (val) {
                            setState(() {
                              age3 = val!;
                            });
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Choose your dog's symptoms",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.yellow),
                      ),
                      BlocBuilder<CausesCubit, CausesState>(
                          builder: (context, state) {
                        if (state is CausesSuccess) {
                          return ListView.builder(
                              itemCount: BlocProvider.of<CausesCubit>(context).causes.length,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final item = BlocProvider.of<CausesCubit>(context)
                                    .causes[index];
                                return CheckboxListTile(
                                    title: Text(
                                      item.description,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    value:
                                        chosenCausesList.contains(item.description),
                                    onChanged: (val) {
                                      if (val!) {
                                        chosenCausesList.add(
                                          item.description,
                                        );
                                      } else {
                                        chosenCausesList.remove(item.description);
                                      }
                                      setState(() {});
                                    });
                              });
                        } else if (state is CausesFailure) {
                          return Text('Something went wrong');
                        } else {
                          return SizedBox(
                              height: 200,
                              child: Center(child: CircularProgressIndicator(),),);
                        }
                      }),
          
                      TextButton(
                        onPressed: () async{
          
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  FindDiseasePage('45th Day', chosenCausesList),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ),
                      ),
          
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
