import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled4/models/clinic_model.dart';

import 'controllers/clinic_controller/clinic_cubit.dart';
import 'controllers/clinic_controller/clinic_state.dart';

class GetClinicScreen extends StatefulWidget {
  const GetClinicScreen(this.city, {super.key});

  final String city;

  @override
  State<GetClinicScreen> createState() => _GetClinicScreenState();
}

class _GetClinicScreenState extends State<GetClinicScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ClinicCubit>(context).getClinic(widget.city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/123456.webp'),
              fit: BoxFit.cover,
              opacity: 0.8,
            ),
          ),
          child: BlocBuilder<ClinicCubit, ClinicState>(
            builder: (context, state) {
              if (state is ClinicSuccess) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      const SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          state.clinic.name,
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        title: Text(
                          state.clinic.city,
                          style: const TextStyle(fontSize: 16),
                        ),
                        leading: const Icon(Icons.location_city),
                      ),
                      ListTile(
                        title: Text(
                          state.clinic.phone,
                          style: const TextStyle(fontSize: 16),
                        ),
                        leading: const Icon(Icons.phone),
                      ),

                      ListTile(
                        title: Text(
                          state.clinic.address,
                          style: const TextStyle(fontSize: 16),
                        ),
                        leading: const Icon(Icons.location_on),
                      ),
                      ListTile(
                        title: Text(
                          state.clinic.hours,
                          style: const TextStyle(fontSize: 16),
                        ),
                        leading: const Icon(Icons.access_time_outlined),
                      ),
                    ],
                  ),
                );
              } else if (state is ClinicLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return const Center(
                  child: Text('Something went wrong!'),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
