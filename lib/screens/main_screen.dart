import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final formKey = GlobalKey<FormState>();
  String name = '';
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFffffff),
      body: Container(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Form(
          key: formKey, //key for form
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.04,
              ),
              const Text(
                "Here to Get",
                style: TextStyle(
                  fontSize: 30,
                  color: Color(0xFF363f93),
                ),
              ),
              const Text(
                "Welcomed !",
                style: TextStyle(
                  fontSize: 30,
                  color: Color(0xFF363f93),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Enter Your Name",
                ),
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                    return "Enter correct name";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: height * 0.05,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Enter Your number",
                ),
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$')
                          .hasMatch(value)) {
                    return "Enter correct phone number";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: height * 0.05,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Enter Your Email",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter correct email";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 22,
                      color: Color(0xFF363f93),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Submitting Form'),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(20),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.arrow_right_alt,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
