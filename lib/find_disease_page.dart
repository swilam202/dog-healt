import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled4/controllers/find_disease_controller/find_disease_state.dart';

import 'controllers/find_disease_controller/find_disease_cubit.dart';

class FindDiseasePage extends StatefulWidget {
  const FindDiseasePage(this.age, this.causesList, {super.key});

  final String age;
  final List<String> causesList;

  @override
  State<FindDiseasePage> createState() => _FindDiseasePageState();
}

class _FindDiseasePageState extends State<FindDiseasePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FindDiseaseCubit>(context)
        .findDisease(widget.age, widget.causesList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Information'),
      // centerTitle: true,
      // ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/6.jpg'),
              opacity: 0.8,
              fit: BoxFit.cover,
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<FindDiseaseCubit, FindDiseaseState>(
            builder: (context, state) {
              if (state is FindDiseaseSuccessState) {
                return Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        'Diseases',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 25,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ListView.separated(
                        shrinkWrap: true,
                        itemCount: (state.findDisease.diseases ?? []).length,
                        itemBuilder: (context, index) {
                          final disease =
                              (state.findDisease.diseases ?? [])[index];
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.grey.withOpacity(0.6),
                            ),
                            child: ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              title: Text(
                                disease.name ?? '',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: (disease.causes ?? [])
                                    .map((e) => Text(e.description ?? ''))
                                    .toList(),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'vaccinations',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 25,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ListView.separated(
                        shrinkWrap: true,
                        itemCount:
                            (state.findDisease.vaccinations ?? []).length,
                        itemBuilder: (context, index) {
                          final vaccination =
                              (state.findDisease.vaccinations ?? [])[index];
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.grey.withOpacity(0.6),
                            ),
                            child: ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              title: Text(
                                vaccination.vac ?? '',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              subtitle: Text(vaccination.age ?? ''),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                      ),
                    ],
                  ),
                );
              } else if (state is FindDiseaseFailureState) {
                return const Center(
                  child: Text('Something went wrong'),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
