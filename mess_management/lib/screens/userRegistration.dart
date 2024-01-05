import "package:flutter/material.dart";
import 'package:mess_management/providers/userRegistrationModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => UserRegistrationModel(),
    child: MaterialApp(
      home: UserRegistrationView()),
  ));
}

class UserRegistrationView extends StatelessWidget {
  var size, height, width;
  final _formKey = GlobalKey<FormState>();
  
  final _emailController = TextEditingController();
  final _empIdController =TextEditingController();
  final _deptController =TextEditingController();
  final _floorController =TextEditingController();
  // final _nameController =TextEditingController();
  final _createPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      backgroundColor: Colors.white,        
        body: ListView(
          // mainAxisAlignment: ,
    
          children: [
            //food.png
            RotatedBox(
                          quarterTurns: 2,
                          child: Container(
            height:height*0.1,
            decoration: const BoxDecoration(
              
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      "assets/images/food.png",
                    ))),
            // child: Image.asset("assets/images/food.png")
                          ),
                        ),
            
            
            Expanded(flex:6,
                child: Column(
                  
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(child: Image(image: AssetImage("assets/images/nalsoft_logo.png"),width: width*0.75,)),
                     SizedBox(height: 15,),
                    const Row(mainAxisAlignment:MainAxisAlignment.start ,
                      children: [
                        SizedBox(width: 32,),
                        Text("User Registration",style: TextStyle(fontSize:24 ),),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Container(margin: EdgeInsets.only(bottom: height*0.02),
                              width: width * 0.85,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    blurRadius: 5.0,
                                    offset: Offset(0, 2.0),
                                  ),
                                  const BoxShadow(  
                                    color: Colors.white,
                                    offset: Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ), //BoxShadow
                                ],
                              ),
                              child: TextFormField(controller: _emailController,decoration: InputDecoration( border:InputBorder.none,hintText: "email",hintStyle: TextStyle(color: Colors.black38), contentPadding: EdgeInsets.only(left:16.0)),),
                            )
                            ,Container(margin: EdgeInsets.only(bottom: height*0.02),
                              width: width * 0.85,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2.0,
                                    blurRadius: 5.0,
                                    // blurStyle: BlurStyle.values[3],
                                    offset: Offset(0, 5.0),
                                  ),
                                  const BoxShadow(
                                    color: Colors.white,
                                    offset: Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                  ), //BoxShadow
                                ],
                              ),
                              child: TextFormField(controller: _empIdController, decoration: InputDecoration(border:InputBorder.none,hintText: "employee id", contentPadding: EdgeInsets.only(left:16.0)),),
                            ),
                              Container(margin: EdgeInsets.only(bottom: height*0.02),
                              width: width * 0.85,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2.0,
                                    blurRadius: 5.0,
                                    // blurStyle: BlurStyle.values[3],
                                    offset: Offset(0, 5.0),
                                  ),
                                  const BoxShadow(
                                    color: Colors.white,
                                    offset: Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                  ), //BoxShadow
                                ],
                              ),
                              child: TextFormField(controller: _deptController,  decoration: InputDecoration(border:InputBorder.none,hintText: "department", contentPadding: EdgeInsets.only(left:16.0)),),
                            )
                           ,Container(margin: EdgeInsets.only(bottom: height*0.02),
                              width: width * 0.85,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    blurRadius: 5.0,
                                    offset: Offset(0, 2.0),
                                  ),
                                  const BoxShadow(
                                    color: Colors.white,
                                    offset: Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ), //BoxShadow
                                ],
                              ),
                              child: TextFormField(controller: _floorController,  decoration: InputDecoration(border:InputBorder.none,hintText: "floor", contentPadding: EdgeInsets.only(left:16.0)),),
                            )
                           , 
                           Container(margin: EdgeInsets.only(bottom: height*0.02),
                              width: width * 0.85,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    blurRadius: 5.0,
                                    offset: Offset(0, 2.0),
                                  ),
                                  const BoxShadow(
                                    color: Colors.white,
                                    offset: Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ), //BoxShadow
                                ],
                              ),
                              child: TextFormField(controller: _createPasswordController,  decoration: InputDecoration(border:InputBorder.none,hintText: "create password", contentPadding: EdgeInsets.only(left:16.0)),obscureText: true,),
                            )
                            , Container(margin: EdgeInsets.only(bottom: height*0.02),
                              width: width * 0.85,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    blurRadius: 5.0,
                                    offset: Offset(0, 2.0),
                                  ),
                                  const BoxShadow(
                                    color: Colors.white,
                                    offset: Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ), //BoxShadow
                                ],
                              ),
                              child: TextFormField(controller: _confirmPasswordController, decoration: InputDecoration(border:InputBorder.none,hintText: "confirm password", contentPadding: EdgeInsets.only(left:16.0)),obscureText: true,),
                            )
                            ,
                          ElevatedButton(onPressed: (){
                             Navigator.pop(context);
                          }, child: Text("Sign up"))
                          ],
                        )),
                  ],
                )),
            Image.asset("assets/images/food.png")
                        
          ],
        ));
  }
}
