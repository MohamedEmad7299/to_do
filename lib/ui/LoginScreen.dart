import 'package:flutter/material.dart';


class LoginScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  "Login",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsetsDirectional.only(
                  top: 32,
                  end: 16,
                  start: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Enter Username",
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsetsDirectional.only(
                  top: 16,
                  end: 16,
                  start: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Enter Password",
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.visibility),
                          onPressed: () {},
                        ),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsetsDirectional.only(
                  top: 24,
                  start: 16,
                  end: 16,
                ),
                height: 80,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(Colors.indigo),
                    foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5), // Set the corner radius here
                      ),
                    ),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

