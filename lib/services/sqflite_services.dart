import 'package:habit_tracker/model/habit_model.dart';
import 'package:sqflite/sqflite.dart';

class Sqflite_service {
 static final String tableHabit = 'habit';
 static final String columnId = 'id';
 static final String columnTitle = 'title';
 static final String columnDescription = 'description';
 static final String columnDone = 'isCompleted';
 static final String columnInterval = 'interval';
static final String columnColor = 'color';
static final String columnIcon = 'icon';

 static Database? db;

  static Future open(String path) async {
    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
create table $tableHabit ( 
  $columnId integer primary key autoincrement, 
  $columnDescription text not null,
  $columnInterval text not null,
  $columnTitle text not null,
  $columnDone integer not null,
  $columnColor integer not null,
  $columnIcon integer not null)
''');
      },
    );
  }

 static Future<void> insert(Habit habit) async {
    habit.id = await db?.insert(tableHabit, habit.toMap());
  }

  Future<List<Habit>?> getHabits() async {
    List<Map<String, dynamic>> maps = await db!.query(
      tableHabit,
      columns: [columnId, columnDone, columnTitle,columnDescription,columnInterval,columnColor,columnIcon],
    );
   List<Habit> habitList = maps.map((e) => Habit.fromMap(e)).toList();
   if(habitList != null) {
     return habitList;
   }

   return null;
  }

  static Future<int> delete(int id) async {
    return await db!.delete(tableHabit, where: '$columnId = ?', whereArgs: [id]);
  }

static  Future<int> update(Habit habit) async {
    return await db!.update(
      tableHabit,
      habit.toMap(),
      where: '$columnId = ?',
      whereArgs: [habit.id],
    );
  }

  Future close() async => db!.close();
}
