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
    _formKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Form copy',
      home: Scaffold(
          backgroundColor: Color.fromARGB(224, 225, 235, 221),
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Login form'),
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(200),
                  child: Column(
                    children: [
                      Form(
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
                                    if (value!.isEmpty ) {
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
                              TextButton(
                                  onPressed: () {
                                    _submit();
                                  },
                                  child: Text('SUBMIT')),
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
