// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled4/controllers/login_controller/login_cubit.dart';
import 'package:untitled4/controllers/login_controller/login_state.dart';
import 'package:untitled4/get_started.dart';
import 'package:untitled4/home.dart';
import 'package:untitled4/sign_up_screen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => GetStart(),),);
        }

      },
      child:  Scaffold(
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
                    'Welcome Back !',
                    style: TextStyle(fontSize: 29, fontWeight: FontWeight.w600,color: Colors.white),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                      controller: BlocProvider.of<LoginCubit>(context).emailController,
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.start,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: 'talat@gmail.com',
                        labelText: 'email',
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xff6F6460), width: 1),
                            borderRadius:
                            BorderRadius.all(Radius.circular(10))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xff6F6460), width: 1),
                            borderRadius:
                            BorderRadius.all(Radius.circular(10))),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                      controller: BlocProvider.of<LoginCubit>(context).passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      textAlign: TextAlign.start,
                      onChanged: (value) {},
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: '**********',
                        labelText: 'Password',
                        suffixIconColor: Color(0xff999999),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 20,
                        ),
                        border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xff6F6460), width: 1),
                            borderRadius:
                            BorderRadius.all(Radius.circular(10))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xff6F6460), width: 1),
                            borderRadius:
                            BorderRadius.all(Radius.circular(10))),
                      )),
                  SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  TextButton(
                    onPressed: () async{

                      await BlocProvider.of<LoginCubit>(context).login();
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
                          'Sign In',
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
                    width: 100,
                  ),
                  // TextButton(
                  //   onPressed: () {},
                  //   child: Text(
                  //     'Forget Password?',
                  //     style: TextStyle(
                  //         color: Colors.purple,
                  //         fontSize: 12.0,
                  //         fontWeight: FontWeight.w600),
                  //     textAlign: TextAlign.end,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Text(
                          'Don’t have an account ?',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Create()));
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                                color: Colors.purple),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            
            ),
          ),
          )


    );
  }
}
