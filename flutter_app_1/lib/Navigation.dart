import "package:flutter/material.dart";
import "package:flutter_app_1/route.dart";

class Navigation extends StatelessWidget {
  const Navigation({super.key});

@override
Widget build(BuildContext context){
  return  const MaterialApp(
    initialRoute: RouteGenerator.homePage,
    onGenerateRoute: RouteGenerator.generateRoute,
  );
}
}


void main() {
  runApp(const Navigation());
}
