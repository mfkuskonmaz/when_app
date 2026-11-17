import 'package:drift/drift.dart';

import '../domain/billing_period.dart';

@DataClassName('SubscriptionRow')
class Subscriptions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  RealColumn get amount => real()();
  TextColumn get currency => text().withDefault(const Constant('TRY'))();
  TextColumn get period => textEnum<BillingPeriod>()();
  DateTimeColumn get startDate => dateTime()();
  TextColumn get category => text().withDefault(const Constant('Diğer'))();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
}