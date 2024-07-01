// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled4/controllers/signup_controller/signup_cubit.dart';
import 'package:untitled4/controllers/signup_controller/signup_state.dart';
import 'package:untitled4/get_started.dart';
import 'package:untitled4/home.dart';
import 'package:untitled4/login_screen.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
  listener: (context, state) {
   if(state is SignupSuccess || state is SignupFailure){
     Navigator.push(
         context,
         MaterialPageRoute(
             builder: (context) => Login(),),);
   }
  },
  child: Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/22.jpg"),
              fit: BoxFit.fill,
              opacity: 0.8,
            ),
          ),
          child: Padding(
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
                Text(
                  'Welcome !',
                  style: TextStyle(fontSize: 29, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                    controller:  BlocProvider.of<SignupCubit>(context).firstNameController,
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.start,
                    onChanged: (value) {},
                    decoration: const InputDecoration(
                      hintText: 'First Name',
                      labelText: 'First Name',
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 20,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10),),),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xff6F6460), width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10),),),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xff6F6460), width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10),),),
                    ),),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                    controller:  BlocProvider.of<SignupCubit>(context).lastNameController,
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.start,
                    onChanged: (value) {},
                    decoration: const InputDecoration(
                      hintText: 'Last Name',
                      labelText: 'Last Name ',
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 20,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xff6F6460), width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xff6F6460), width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    )),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                    controller: BlocProvider.of<SignupCubit>(context).emailController,
        
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.start,
                    onChanged: (value) {},
                    decoration: const InputDecoration(
                      hintText: 'Email Address ',
                      labelText: 'Email Address ',
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 20,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xff6F6460), width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xff6F6460), width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    )),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                    controller:  BlocProvider.of<SignupCubit>(context).passwordController,
        
                    keyboardType: TextInputType.visiblePassword,
                    textAlign: TextAlign.start,
                    onChanged: (value) {},
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password',
                      suffixIconColor: Color(0xff999999),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 20,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xff6F6460), width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xff6F6460), width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    )),
                SizedBox(height: 20,),
                TextButton(
                  onPressed: () async{
        
                    await  BlocProvider.of<SignupCubit>(context).signup();
        
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.orangeAccent,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
        
              ],
            ),
          ),
        ),
      ),
    ),
);
  }
}
