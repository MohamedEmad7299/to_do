

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_step/layout/ui_components/task_item.dart';
import 'package:one_step/shared/cubit/cubit.dart';
import 'package:one_step/shared/cubit/states.dart';

import '../../shared/const.dart';


class NewTasks extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit,AppStates>(
      builder: (context, state) {

        return ListView.separated(
          itemBuilder: (context, index) => taskItem(
              newTasks[index]['time'],
              newTasks[index]['title'],
              newTasks[index]['date'],
              newTasks[index]['id'],
              context
          ),
          separatorBuilder: (context, index) => Container(
            width: double.infinity,
            color: Colors.grey[300],
            height: 1,
          ),
          itemCount: newTasks.length,
        );
      },
      listener: (BuildContext context, state) {

      },
    );
  }
}