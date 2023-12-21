import "package:flutter/material.dart";

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _CreateLoginFormState();
}

class _CreateLoginFormState extends State<LoginForm> {
  final _loginFormKey = GlobalKey<FormState>();
  
  //controllers
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _hidePassword = true;

  @override
  void initState(){
    super.initState();
    _usernameController.addListener(() {
      print(_usernameController.text);
      });
  }

  void _submit() {
    if (!_loginFormKey.currentState!.validate()) {
      return;
    }
    _loginFormKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Form copy2',
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
                  // decoration: BoxDecoration(border: Border.all(color: Colors.blue )),
                  width: constraints.maxWidth * 0.5,
                  height: constraints.maxHeight * 0.5,
                  child: Column(
                    children: [
                      Form(
                          key: _loginFormKey,
                          autovalidateMode: AutovalidateMode.always,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //USERNAME
                              TextFormField(
                                
                                controller: _usernameController,
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.person),
                                  // hintText: 'enter username',
                                  labelText: 'UserName',
                                ),
                                onFieldSubmitted: (value) {},
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'enter username';
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
                                // initialValue: '',
                                controller: _passwordController,
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

                              //SUBMIT BUTTON
                        
                              Container(
                                padding:const EdgeInsets.only(top: 20),
                                child: TextButton(
                                  
                                    onPressed: () {
                                      _submit();
                                    },
                                    child: Text('SUBMIT')),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}

void main() {
  runApp(const LoginForm());
}
