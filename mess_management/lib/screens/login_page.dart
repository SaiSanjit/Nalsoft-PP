import 'package:flutter/material.dart';
import 'package:mess_management/providers/login_provider.dart';
import 'package:mess_management/screens/route_management.dart';
import 'package:provider/provider.dart';

class UserLoginPage extends StatelessWidget {
  final GlobalKey _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final lowerupper = RegExp(
      r'^(?=.+[A-Z])(?=.+[a-z])(?=.+[0-9])(?=.+[!@#$%^&*()_+}{":;\' '?/<>,.])');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.white, // background color of Container
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        // adjusts width and height according to device dimensions
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 3,
              child: Image.asset('assets/images/login_page_img.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 60.0, left: 70),
              child: Image.asset('assets/images/nalsoft_logo.png'),
            ),
            Expanded(
                flex: 5,
                child: Consumer<LoginModel>(
                  builder: (context, provider, child) {
                    return Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              child: TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 8),
                                  hintText: 'username or email',
                                  hintStyle: TextStyle(color: Colors.black38),
                                  prefixIcon: Icon(Icons.person),
                                ),
                                onChanged: (value) {
                                  if (emailController.text.isEmpty) {
                                    provider.setErrTxt(1);
                                  } else {
                                    provider.setErrTxt(0);
                                  }
                                },
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(0, 5),
                                        blurRadius: 5),
                                    BoxShadow(
                                      color: Colors.white,
                                    ),
                                  ]),
                            ),
                            if (provider.getErrTxt == 1)
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Text(
                                  'username or email cannot be empty',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            if (provider.getErrTxt == 2)
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Text(
                                  'username must be atleast 5 characters',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              child: TextFormField(
                                controller: passwordController,
                                obscuringCharacter: '*',
                                obscureText: Provider.of<LoginModel>(context,
                                        listen: false)
                                    .obscurePassword,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 8),
                                    hintText: 'password',
                                    hintStyle: TextStyle(color: Colors.black38),
                                    prefixIcon: Icon(Icons.lock),
                                    suffixIcon: Consumer<LoginModel>(
                                        builder: (context, provider, _) {
                                      return IconButton(
                                        iconSize: 20,
                                        onPressed: () => {
                                          provider.obscureToggle(),
                                        },
                                        icon: provider.obscurePassword
                                            ? Icon(Icons.visibility_off)
                                            : Icon(Icons.visibility),
                                      );
                                    })),
                                onChanged: (value) {
                                  if (passwordController.text.isEmpty) {
                                    provider.setPassErrTxt(1);
                                  } else if (value.length < 10) {
                                    provider.setPassErrTxt(2);
                                  } else if (!lowerupper.hasMatch(value)) {
                                    provider.setPassErrTxt(3);
                                  } else {
                                    provider.setPassErrTxt(0);
                                  }
                                },
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(0, 5),
                                        blurRadius: 5),
                                    BoxShadow(
                                      color: Colors.white,
                                    ),
                                  ]),
                            ),
                            if (provider.getPassErrTxt == 1)
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Text(
                                  'Password Field cannot be Empty',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            if (provider.getPassErrTxt == 2)
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Text(
                                  'Password must contain alteast 10 characters',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            if (provider.getPassErrTxt == 3)
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Text(
                                  'include one capital and lowercase letter, one number, and one special character',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: null,
                                  child: Text(
                                    'forgot password?',
                                    style: TextStyle(color: Colors.black87),
                                  ),
                                ),
                                TextButton(
                                  onPressed: (){ Navigator.pushNamed(context, RouteManagement.userRegistration);},
                                  child: Text(
                                    'Register',
                                    style: TextStyle(color: Colors.black87),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  child: Text(
                                    'Login',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              side: BorderSide(
                                                color: Colors.black,
                                              ))),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.grey.shade300)),
                                  onPressed: () {
                                    if (emailController.text.isEmpty) {
                                      provider.setErrTxt(1);
                                    } else if (emailController.text.length <
                                            5 &&
                                        !emailController.text.contains('@')) {
                                      provider.setErrTxt(2);
                                    } else if (passwordController
                                        .text.isEmpty) {
                                      provider.setPassErrTxt(1);
                                    } else if (emailController
                                            .text.isNotEmpty &&
                                        provider.getPassErrTxt == 0) {
                                      if (emailController.text == 'admin') {
                                        Navigator.pushNamed(context,
                                            RouteManagement.adminHomePage);
                                      } else {
                                        Navigator.pushNamed(
                                            context, '/homepage');
                                      }
                                    }
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )),
            Expanded(
              flex: 2,
              child: Image.asset(
                'assets/images/food.png',
                fit: BoxFit.fill, // Fill the width of the screen
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
