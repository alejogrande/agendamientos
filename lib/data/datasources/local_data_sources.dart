import 'dart:async';

import 'package:agendamientos/data/models/court_model.dart';
import 'package:agendamientos/data/models/hour_model.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

String createTablehour =
    "CREATE TABLE hour(id INTEGER PRIMARY KEY, details TEXT)";
String createTableCourt =
    "CREATE TABLE court(id INTEGER PRIMARY KEY, name TEXT,size TEXT,details TEXT,image TEXT)";

String createTableBooking = 
    "CREATE TABLE booking(id INTEGER PRIMARY KEY, date TEXT,idCourt INTEGER,weather TEXT,precipitation INTEGER,grade INTEGER)";
List<String> requestDB = [createTablehour, createTableCourt];

void create() async {

  final database = openDatabase(

    join(await getDatabasesPath(), 'booking.db'),

    onCreate: (db, version) {
      for (var sql in requestDB) {
        db.execute(sql);
      }
      return;

    },
    version: 1,
  );

  Future<void> insertHours(List<Hour> listHours) async {
    final db = await database;
     for (var element in listHours) {
      await db.insert(
        'hour',
        element.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<void> insertCourts(List<Court> listCourts) async {
    // Get a reference to the database.
    final db = await database;

    for (var element in listCourts) {
      await db.insert(
        'court',
        element.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  // A method that retrieves all the dogs from the dogs table.
  Future<List<Hour>> hours() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('hour');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Hour(
        id: maps[i]['id'],
        details: maps[i]['details'],
      );
    });
  }
    Future<List<Court>> viewCourts() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('court');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Court(
        id: maps[i]['id'],
        name: maps[i]['name'],
        details: maps[i]['details'],
        size: maps[i]['size'],
        image: maps[i]['image'],
      );
    });
  }

  // Future<void> updatehour(Hour hour) async {
  //   // Get a reference to the database.
  //   final db = await database;

  //   // Update the given Dog.
  //   await db.update(
  //     'hour',
  //     hour.toMap(),
  //     // Ensure that the Dog has a matching id.
  //     where: 'id = ?',
  //     // Pass the Dog's id as a whereArg to prevent SQL injection.
  //     whereArgs: [hour.id],
  //   );
  // }

  // Future<void> deletehour(int id) async {
  //   // Get a reference to the database.
  //   final db = await database;

  //   // Remove the Dog from the database.
  //   await db.delete(
  //     'hour',
  //     // Use a `where` clause to delete a specific dog.
  //     where: 'id = ?',
  //     // Pass the Dog's id as a whereArg to prevent SQL injection.
  //     whereArgs: [id],
  //   );
  // }

  await insertHours(schedule);
  await insertCourts(courts);

  // Now, use the method above to retrieve all the dogs.
  // print(await hours()); // Prints a list that include Fido.

  // Update Fido's age and save it to the database.

  // await updatehour(fido);

  // Print the updated results.
  // print(await hours()); // Prints Fido with age 42.

  // Delete Fido from the database.
  // await deletehour(fido.id);

  // Print the list of dogs (empty).
  print(await hours());
 print(await viewCourts());
}
