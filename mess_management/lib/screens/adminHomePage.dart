import "package:flutter/material.dart";

void main() {
  runApp(MaterialApp(
    home: AdminHomePage(),
  ));
}

class AdminHomePage extends StatelessWidget {
  var size, height, width;
  List departments = ["dept1", "dept2", "dept3", "dept4", "dept5", "dept4", "dept5", "dept4", "dept5"];
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color.fromRGBO(236, 230, 240, 100),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () {},
                    ),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search employee"),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Text("Select Department"),
            Expanded(
              child: ListView(
                children: departments
                    .map((item) => Container(
                      width: width*0.95,
                      height: height*0.1,
                      child: Card(
                            child: Padding(
                              padding: const EdgeInsets.only(left:16.0,top:24.0),
                              child: Text(item),
                            ),
                          ),
                    ))
                    .toList(),
              ),
            ),
            Image.asset("assets/images/food.png")
          ],
        ),
      ),
    );
  }
}
