import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_step/shared/cubit/states.dart';
import 'package:sqflite/sqflite.dart';

import '../../moules/archive/archive.dart';
import '../../moules/done/done.dart';
import '../../moules/tasks/new_tasks.dart';
import '../const.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialStates());

  static AppCubit get(context) => BlocProvider.of(context);

  var currentIndex = 0;

  List screens = [
    NewTasks(),
    Done(),
    Archive(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  late Database database;

  void createDatabase() {
    openDatabase('todo.db', version: 1, onCreate: (database, version) {
      database
          .execute(
              'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)')
          .catchError((error) {});
    }, onOpen: (database) {
      getData(database);
    }).then(
      (value) {
        database = value;
        emit(AppCreateDatabaseState());
      },
    );
  }

  insertRaw({
    required String title,
    required String date,
    required String time,
  }) async {
    database.transaction((txn) async {
      await txn
          .rawInsert(
              'INSERT INTO tasks (title, date, time, status) VALUES ("$title", "$date", "$time", "uncompleted")')
          .then((value) {
        getData(database);
        emit(AppInsertBottomNavBarState());
      }).catchError((error) {
        print("Error inserting data: $error");
      });
    });
  }

  void getData(database) async {

    await database.rawQuery('SELECT * FROM tasks').then((value) {

      value.forEach((element) {

        doneTasks = value.where((element) => element['status'] == 'done').toList();
        archivedTasks = value.where((element) => element['status'] == 'archived').toList();
        newTasks = value.where((element) => element['status'] != 'done' && element['status'] != 'archived').toList();

      });
      tasks = [newTasks,doneTasks,archivedTasks];
      emit(AppGetDatabaseState());
    });
  }

  void updateData(int id, String status) async {
    await database.rawUpdate(
        'UPDATE tasks SET status = ? WHERE id = ?', [status, id]).then(
      (value) {
        emit(AppUpdateDatabaseState());
      },
    ).then((value) {
      getData(database);
    },);
  }

  bool isBottomSheetShown = false;
  var fabIcon = Icons.edit;

  void changeBottomSheetState(bool isShown) {
    isBottomSheetShown = isShown;

    if (isShown) {
      fabIcon = Icons.add;
    } else {
      fabIcon = Icons.edit;
    }

    emit(AppChangeBottomSheetState());
  }

  void deleteTask(int id){
    database.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) {
      getData(database);
      emit(AppDeleteFromDatabaseState());
    },);
  }
}
