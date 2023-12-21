import "dart:ui";

import "package:flutter/material.dart";
import "package:flutter_app_1/route.dart";

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _createLoginFormState();
}

class _createLoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  //  bool _hidePassword = true;
  void _submit() {
    bool isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    loginFormKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    double mediaConsraint = MediaQuery.of(context).size.width;
    return MaterialApp(
      title: 'Login',
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/bubbles.jpg'), fit: BoxFit.cover),
            ),
            child: Center(
              child:
                  //circular conatiner
                  ClipOval(
                //  borderRadius: BorderRadius.circular(30),

                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
                  child: Container(
                    width: mediaConsraint * 0.4,
                    height: mediaConsraint * 0.4,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // gradient: LinearGradient(
                        //   begin: Alignment.topLeft,
                        //   end: Alignment.bottomRight,
                        //   colors: [
                        //     const Color.fromARGB(255, 236, 172, 77)
                        //         .withOpacity(0.5),
                        //     Color.fromARGB(255, 255, 227, 167).withOpacity(0.7),
                        //   ],
                        // ),
                        // boxShadow: [
                        //   BoxShadow(
                        //       color: Color.fromARGB(255, 228, 212, 161)
                        //           .withOpacity(1))
                        // ],
                        border: Border.all(
                            color: Colors.white.withOpacity(0.5), width: 0.5)),
                    child: Center(
                      child: Form(
                          key: loginFormKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                'Login',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 40,
                                    color: Colors.white),
                              ),

                              //email
                              Container(
                                padding: const EdgeInsets.only(bottom: 10),
                                width: mediaConsraint * 0.3,
                                // decoration: BoxDecoration(boxShadow: [
                                //   BoxShadow(
                                //       color: Color.fromARGB(255, 248, 214, 121)
                                //           .withOpacity(0.5),
                                //       offset: Offset(0, 1),
                                //       blurRadius: 1)
                                // ]),
                                // height:mediaConsraint*0.1,

                                child: TextFormField(
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor:
                                        Color.fromARGB(255, 255, 216, 166),
                                    hintText: 'Email',

                                    border: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        borderSide: BorderSide(
                                            color: Colors.orange
                                                .withOpacity(0.5))),

                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        borderSide: BorderSide(
                                            color: Colors.orange
                                                .withOpacity(0.5))),
                                    // isDense: true,
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10.0,
                                      horizontal: 4.0,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'email cannot be empty';
                                    }
                                    if (!value.contains('@')) {
                                      return 'enter a valid email';
                                    }
                                  },
                                ),
                              ),
                              Container(
                                width: mediaConsraint * 0.3,
                                padding: const EdgeInsets.only(bottom: 10),
                                child: TextFormField(
                                  obscuringCharacter: '*',
                                  obscureText: true,
                                  validator: (value) {
                                    RegExp expr = RegExp(
                                        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$');
                                    if (value!.isEmpty ||
                                        !expr.hasMatch(value)) {
                                      return 'Enter a valid password containing  uppercase letters, lowercase letters, digits, and special characters. ';
                                    }
                                  },
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor:
                                          Color.fromARGB(255, 212, 133, 29),
                                      hintText: 'Password',
                                      border: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          borderSide: BorderSide(
                                              color: Colors.orange
                                                  .withOpacity(0.5))),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          borderSide: BorderSide(
                                              color: Colors.orange
                                                  .withOpacity(0.5))),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        vertical: 4.0,
                                        horizontal: 8.0,
                                      )),
                                ),
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Register',
                                    style: TextStyle(),
                                  ),
                                  Text(
                                    'Forgot Password?',
                                    style: TextStyle(),
                                  ),
                                ],
                              ),

                              Container(
                                padding: const EdgeInsets.only(top: 32),
                                // decoration: BoxDecoration(
                                //   border: Border.fromBorderSide(BorderSide())
                                // ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    _submit();
                                    Navigator.pushNamed(
                                        context, RouteGenerator.secondPage);
                                    // ScaffoldMessenger.of(context).showSnackBar(
                                    //     SnackBar(
                                    //         content: Text('Form submitted')));
                                  },
                                  child: const Text(
                                    'Submit',
                                    style: TextStyle(),
                                  ),
                                ),
                              )
                            ],
                          )),
                    ),
                  ),
                ),
              ),
            ) //center
            ),
      ),
    );
  }
}

void main() {
  runApp(const LoginForm());
}
