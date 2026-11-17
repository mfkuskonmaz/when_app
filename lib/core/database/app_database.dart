import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import '../../features/subscriptions/data/subscriptions_table.dart';
import '../../features/subscriptions/domain/billing_period.dart';

/* Uygulamanızda kullanıcıların aboneliklerini kaydetmek, güncellemek, silmek veya listelemek için gereken yerel SQLite veritabanı altyapısını kurar.
Subscriptions tablosunu sisteme tanıtarak, Dart programlama dili üzerinden güvenli ve hatasız SQL sorguları yazmanıza olanak tanır. */

part 'app_database.g.dart';

@DriftDatabase(tables: [Subscriptions])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor])
      : super(executor ?? driftDatabase(name: 'whenapp'));

  @override
  int get schemaVersion => 1;
}