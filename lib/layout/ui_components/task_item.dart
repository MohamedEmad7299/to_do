

import 'package:flutter/material.dart';
import 'package:one_step/shared/cubit/cubit.dart';

Widget taskItem(
    String time,
    String title,
    String date,
    int id,
    context
){

  return Dismissible(
    key: Key(id.toString()),
    onDismissed: (direction) {
      AppCubit.get(context).deleteTask(id);
    },
    child: Padding(
        padding: EdgeInsetsDirectional.all(20),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 40,
                child: Text(time),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                    ),
                    Text(
                      date,
                      style: TextStyle(
                          color: Colors.grey
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(width: 20),
              IconButton(
                  onPressed: () {
                    AppCubit.get(context).updateData(id, 'done');
                  },
                  icon: Icon(
                    Icons.check_box,
                    color: Colors.deepPurple,
                  )),
              IconButton(
                  onPressed: () {
                    AppCubit.get(context).updateData(id, 'archived');
                  },
                  icon: Icon(
                    Icons.archive,
                    color: Colors.black45,
                  ))
            ],
          ),
        ),
    ),
  );
}