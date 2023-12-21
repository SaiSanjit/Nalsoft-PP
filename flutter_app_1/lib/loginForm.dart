import "package:flutter/material.dart";
import "package:flutter_app_1/route.dart";

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
    _formKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Form',
      home: Scaffold(
          backgroundColor: Color.fromARGB(224, 225, 235, 221),
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Login form'),
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              return Center(
                  child: Container(
                width: constraints.maxWidth * 0.5,
                height: constraints.maxHeight * 0.8,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 206, 255, 178),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.always,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //USERNAME
                        TextFormField(
                          initialValue: '',
                          decoration: const InputDecoration(
                            icon: Icon(Icons.person),
                            labelText: 'UserName',
                          ),
                          onFieldSubmitted: (value) {},
                          validator: (value) {
                            if (value!.isEmpty || !value!.contains('@')) {
                              return 'enter a valid username';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            print(value);
                          },
                        ),

                        //PASSWORD
                        TextFormField(
                          obscuringCharacter: '*',
                          obscureText: _hidePassword,

                          validator: (value) {
                            RegExp expr = RegExp(
                                r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$');
                            if (value!.isEmpty || !expr.hasMatch(value)) {
                              return 'Enter a valid password containing  uppercase letters, lowercase letters, digits, and special characters. ';
                            }
                          },
                          decoration: InputDecoration(
                            icon: Icon(Icons.lock),
                            labelText: 'Password',
                            suffixIcon: IconButton(
                              icon: _hidePassword
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _hidePassword = !_hidePassword;
                                });
                              },
                            ),
                          ),
                        ),

                        //SUBMIT BUTTON
                        TextButton(
                            onPressed: () {
                              
                              _submit();
                              
                              Navigator.pushNamed(
                                        context, RouteGenerator.secondPage);
                            },
                            child: Text('SUBMIT')),
                      ],
                    )),
              ));
            },
          )),
    );
  }
}

void main() {
  runApp(const LoginForm());
}
