import 'package:sqflite/sqflite.dart';

//ALL LOCAL DATABASE OPERATIONS WILL BE DONE HERE(QUERIES, READS, WRITES, UPDATES, DELETES, ETC.)
//However, we will not have logic for UI, API, or any other business logic here.
//Please refer to the respective folders for those(models, controllers & views).

class Database {
  Future<void> initialise() async {
    final db = await openDatabase(
      'cpims_dcs_mobile.db',
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE users(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT,
            password TEXT,
            email TEXT,
            phone_number TEXT,
            created_at TEXT,
            updated_at TEXT
          )
        ''');
      },
      onUpgrade: (db, oldVersion, newVersion) {
        if (oldVersion < newVersion) {
          db.execute('''
            ALTER TABLE users ADD COLUMN role TEXT
          ''');
        }
      },
    );
  }
}

final database = Database();
