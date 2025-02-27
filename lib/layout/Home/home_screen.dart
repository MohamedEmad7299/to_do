import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:one_step/shared/cubit/cubit.dart';
import 'package:one_step/shared/cubit/states.dart';

import '../../shared/const.dart';
import '../ui_components/defaultFormField.dart';

class HomeScreen extends StatelessWidget {


  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return BlocProvider(

      create: (context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {

          if (state is AppInsertBottomNavBarState){
            Navigator.pop(context);
          }
        },
        builder: (context, state){

          var cubit = AppCubit.get(context);

          return Scaffold(

            key: scaffoldKey,
            body: newTasks.isEmpty ? SafeArea(child: Center(child: CircularProgressIndicator())) : SafeArea(
                child: cubit.screens[cubit.currentIndex]
            ),
            floatingActionButton: FloatingActionButton(
                backgroundColor:Colors.deepPurple,
                onPressed: () {

                  if (cubit.isBottomSheetShown) {

                    if (formKey.currentState!.validate()){

                      cubit.insertRaw(

                          title: titleController.text,
                          time: timeController.text,
                          date: dateController.text).then((value){

                        cubit.changeBottomSheetState(false);

                      });
                    }
                  } else {
                    scaffoldKey.currentState
                        ?.showBottomSheet(
                          (context) => SizedBox(
                        height: 300,
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.grey[150],
                                ),
                                padding: EdgeInsetsDirectional.only(
                                    start: 16, end: 16, bottom: 16, top: 16),
                                child: defaultFormField(
                                    controller: titleController,
                                    type: TextInputType.text,
                                    prefixIcon: Icons.title,
                                    validate: (value) {
                                      if (value.toString().isEmpty) {
                                        return 'Task Title can not be empty';
                                      }
                                      return null;
                                    },
                                    label: "Task Title"),
                              ),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.grey[150],
                                ),
                                padding: EdgeInsetsDirectional.only(
                                    start: 16, end: 16, bottom: 16),
                                child: defaultFormField(
                                    controller: timeController,
                                    type: TextInputType.text,
                                    readOnly: true,
                                    onTap: () {
                                      showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                      ).then(
                                            (value) {
                                          timeController.text = value!.format(context).toString();
                                        },
                                      );
                                    },
                                    prefixIcon: Icons.watch_later_outlined,
                                    validate: (value) {
                                      if (value.toString().isEmpty) {
                                        return 'Task Time can not be empty';
                                      }
                                      return null;
                                    },
                                    label: "Task Time"),
                              ),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.grey[150],
                                ),
                                padding: EdgeInsetsDirectional.only(
                                    start: 16, end: 16, bottom: 16),
                                child: defaultFormField(
                                    readOnly: true,
                                    controller: dateController,
                                    type: TextInputType.text,
                                    onTap: () {
                                      showDatePicker(context: context,
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime(DateTime.now().year, 12, 31)
                                      ).then((value) {
                                        dateController.text = DateFormat.yMMMd().format(value!);
                                      },
                                      );
                                    },
                                    prefixIcon: Icons.date_range,
                                    validate: (value) {
                                      if (value.toString().isEmpty) {
                                        return 'Task Date can not be empty';
                                      }
                                      return null;
                                    },
                                    label: "Task Date"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ).closed.then((value) {
                      cubit.changeBottomSheetState(false);
                    });
                    cubit.changeBottomSheetState(true);
                  }
                },
                child: Icon(
                  cubit.fabIcon,
                  color: Colors.white,
                )),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                AppCubit.get(context).changeIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.menu,
                    ),
                    label: 'Tasks'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.check_circle_outline_rounded,
                    ),
                    label: 'Done'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.archive_outlined,
                    ),
                    label: 'Archived'),
              ],
              backgroundColor: Colors.white,
            ),
          );
        },
      ),
    );
  }
}
