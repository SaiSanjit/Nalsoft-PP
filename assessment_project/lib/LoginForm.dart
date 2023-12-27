import "dart:ui";

import "package:assessment_project/routes.dart";
import "package:flutter/material.dart";

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _CreateLoginFormState();
}

class _CreateLoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  bool _hidePassword = true;
  
  void _submit() {
    bool isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    Navigator.pushNamed(context,RouteGenerator.chits);
    _formKey.currentState!.save();
  }

 

  @override
  Widget build(BuildContext context) {
    
    double mediaWidthConstraint = MediaQuery.of(context).size.width;
    
    return Scaffold(
      body: Center(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 0.5,sigmaY:0.5),
                    child: Container(
                      child: Form(
                          key: _formKey,
                          autovalidateMode: AutovalidateMode.always,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Image(image: AssetImage('assets/images/login_image.png'),height: 100,width:100),
                              // const Text(
                              //   'Login',
                              //   style: TextStyle(fontFamily: 'Comfortaa',fontStyle: FontStyle.italic,fontSize: 40),
                              // ),
                              //USERNAME
                              Container(
                                padding: EdgeInsets.only(top:40,right:10,bottom: 24),
                                
                                child: TextFormField(
                                  
                                  initialValue: '',
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(16)
                                      )
                                    ),
                                    icon: Icon(Icons.person),
                                    labelText: 'email',
                                  ),
                                  onFieldSubmitted: (value) {},
                                  validator: (value) {
                                    if (value!.isEmpty || !value.contains('@')) {
                                      return 'enter a valid email';
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (value) {
                                    print(value);
                                  },
                                ),
                              ),
                      
                              //PASSWORD
                              Container(
                                padding: const EdgeInsets.only(right:10),
                                child: TextFormField(
                                  obscuringCharacter: '*',
                                  obscureText: _hidePassword,
                                  validator: (value) {
                                    RegExp expr = RegExp(
                                        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$');
                                    if (value!.isEmpty || !expr.hasMatch(value)) {
                                      return 'Enter a valid password containing  uppercase letters, lowercase letters, digits, and special characters. ';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    border:const  OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(16)
                                      )
                                    ),
                                    icon: const Icon(Icons.lock),
                                    labelText: 'Password',
                                    suffixIcon: IconButton(
                                      icon: _hidePassword
                                          ? const Icon(Icons.visibility_off)
                                          : const Icon(Icons.visibility),
                                      onPressed: () {
                                        setState(() {
                                          _hidePassword = !_hidePassword;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                      
                              //SUBMIT BUTTON
                              TextButton(
                                  onPressed: () {
                                    _submit();
                      
                                    // Navigator.pushNamed(
                                    //           context, RouteGenerator.secondPage);
                                  },
                                  child: const Text('SUBMIT')),
                            ],
                          )),
                    ),
                  ),
                )),
    );
       
  }
}

void main() {
  runApp(const LoginForm());
}
