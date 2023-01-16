import 'dart:async';

import 'package:agendamientos/data/datasources/local_data_sources.dart';
import 'package:agendamientos/data/models/booking_model.dart';
import 'package:agendamientos/data/models/court_model.dart';
import 'package:agendamientos/data/models/hour_model.dart';

import 'package:agendamientos/data/constans.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

List<String> queryCreateTables = [
  DataBase.createTableCourt,
  DataBase.createTablehour,
  DataBase.createTableBooking
];

class LocalDataSourceImplement implements LocalDatabase {
  static Database? _database;

  Future<Database> get database async {
    if (_database == null) {
      await _initDatabase();
      await insertHours(schedule);
      await insertCourts(courts);
      print(schedule);
    }
    return _database!;
  }


 
  Future<Database> _initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'booking.db'),
      onCreate: (db, version) {
        for (var query in queryCreateTables) {
          db.execute(query);
        }
        return;
      },
      version: 1,
    );
  }
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
    final db = await database;

    for (var element in listCourts) {
      await db.insert(
        'court',
        element.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<List<Hour>> hours() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('hour');

    return List.generate(maps.length, (i) {
      return Hour(
        id: maps[i]['id'],
        details: maps[i]['details'],
      );
    });
  }

  Future<List<Court>> viewCourts() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('court');

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

  @override
  Future deleteBooking(Booking booking) {
    // TODO: implement deleteBooking
    throw UnimplementedError();
  }

  @override
  Future insertBooking(Booking booking) {
    // TODO: implement insertBooking
    throw UnimplementedError();
  }

  @override
  Future updateBooking(Booking booking) {
    // TODO: implement updateBooking
    throw UnimplementedError();
  }

  @override
  Future<List<Booking>> viewAvailableDate(DateTime dateSelected, Court court) {
    // TODO: implement viewAvailableDate
    throw UnimplementedError();
  }

  @override
  Future<List<Booking>> viewBooking() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('booking');

    return List.generate(maps.length, (i) {
      return Booking(
        id: maps[i]['id'],
        date: maps[i]['date'],
        grade: maps[i]['grade'],
        idCourt: maps[i]['idCourt'],
        idHour: maps[i]['idHour'],
        precipitation: maps[i]['precipitation'],
        weather: maps[i]['weather'],
      );
    });
  }

}