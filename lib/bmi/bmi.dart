import 'dart:math';

import 'package:flutter/material.dart';
import 'package:one_step/styles/colors/app_colors.dart';

import 'BmiResult.dart';

class BMI extends StatefulWidget {
  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  bool isMale = true;
  double height = 185;
  int age = 25;
  int weight = 85;

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
                Text(
                  'BMI CALCULATOR',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(top: 24),
                  child: Row(
                    children: [
                      Expanded(child: SizedBox()),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isMale = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: isMale
                                ? AppColors.mirage02
                                : AppColors.mirage01,
                          ),
                          width: 150,
                          height: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.male,
                                color: Colors.white,
                                size: 100,
                              ),
                              Text(
                                'MALE',
                                style: TextStyle(color: AppColors.regentGray),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isMale = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: isMale
                                ? AppColors.mirage01
                                : AppColors.mirage02,
                          ),
                          width: 150,
                          height: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.female,
                                color: Colors.white,
                                size: 100,
                              ),
                              Text(
                                'FEMALE',
                                style: TextStyle(color: AppColors.regentGray),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(child: SizedBox()),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.only(start: 24, end: 24, top: 24),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.mirage01,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      const SizedBox(height: 32),
                      const Text(
                        "HEIGHT",
                        style: TextStyle(
                            color: AppColors.regentGray, fontSize: 18),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "${height.round()} cm",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Colors.grey,
                          thumbColor: AppColors.cabaret,
                          overlayColor: Colors.red.withValues(alpha: 0.2),
                          trackHeight: 3,
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 10),
                        ),
                        child: Slider(
                          value: height,
                          min: 100,
                          max: 250,
                          onChanged: (value) {
                            setState(() {
                              height = value;
                            });
                          },
                        ),
                      ),
                    ]),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(top: 24),
                  child: Row(
                    children: [
                      Expanded(child: SizedBox()),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.mirage01,
                        ),
                        width: 150,
                        height: 175,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'WEIGHT',
                              style: TextStyle(color: AppColors.regentGray),
                            ),
                            Text(
                              "$weight",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.only(
                                  top: 16, start: 16, end: 16),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: AppColors.mirage02,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50))),
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          weight--;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Expanded(child: SizedBox()),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: AppColors.mirage02,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50))),
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          weight++;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.mirage01,
                        ),
                        width: 150,
                        height: 175,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'AGE',
                              style: TextStyle(color: AppColors.regentGray),
                            ),
                            Text(
                              "$age",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.only(
                                  top: 16, start: 16, end: 16),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: AppColors.mirage02,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50))),
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          age--;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Expanded(child: SizedBox()),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: AppColors.mirage02,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50))),
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          age++;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(child: SizedBox()),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(top: 48),
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    color: AppColors.cabaret,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BmiResult(
                                result: weight / pow(height / 100, 2),
                              ),
                            ));
                      },
                      child: Text(
                        "CALCULATE",
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
