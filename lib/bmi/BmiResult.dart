import 'package:flutter/material.dart';
import '../styles/colors/app_colors.dart';

class BmiResult extends StatelessWidget {

  late var result;

  BmiResult({this.result});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.mirage,
          body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                padding: EdgeInsetsDirectional.only(top: 16),
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            )),
                        Expanded(child: SizedBox()),
                        Padding(
                          padding: EdgeInsetsDirectional.only(end: 32),
                          child: Text(
                            'BMI CALCULATOR',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(child: SizedBox()),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(top: 48),
                      child: Text(
                        'Your Result',
                        style: TextStyle(
                            fontSize: 48,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding:
                      EdgeInsetsDirectional.only(top: 24, start: 16, end: 16),
                      child: Container(
                        height: 516,
                        width: double.infinity,
                        decoration: BoxDecoration(color: AppColors.mirage01),
                        child: Column(
                          children: [
                            Expanded(child: SizedBox()),
                            Text(
                              ((result * 10).floorToDouble() / 10).toString(),
                              style: TextStyle(
                                  fontSize: 100,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Normal BMI Range:',
                              style: TextStyle(
                                  fontSize: 16, color: AppColors.regentGray),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.only(top: 16),
                              child: Text(
                                '18.5 - 25 kg/m2',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                            Expanded(child: SizedBox()),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(top: 16),
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        color: AppColors.cabaret,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "RE-CALCULATE",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ));
  }
}
