import 'package:drift/drift.dart';      /* SubscriptionRow: Drift’in ürettiği, veritabanına ait sınıf
                                         Subscription: bizim domain modelimiz, UI ve iş mantığı bunu kullanır
                                         Repository ikisi arasında dönüşüm yapar, böylece veritabanını değiştirsen UI etkilenmez */

import '../../../core/database/app_database.dart';
import '../domain/subscription.dart';

class SubscriptionRepository {
  SubscriptionRepository(this._db);

  final AppDatabase _db;

  Stream<List<Subscription>> watchAll() {
    final query = _db.select(_db.subscriptions)
      ..orderBy([(t) => OrderingTerm.asc(t.name)]);
    return query.watch().map((rows) => rows.map(_toDomain).toList());
  }

  Future<int> add(Subscription s) {
    return _db.into(_db.subscriptions).insert(_toCompanion(s));
  }

  Future<void> update(Subscription s) {
    return (_db.update(_db.subscriptions)..where((t) => t.id.equals(s.id!)))
        .write(_toCompanion(s));
  }

  Future<void> delete(int id) {
    return (_db.delete(_db.subscriptions)..where((t) => t.id.equals(id))).go();
  }

  Subscription _toDomain(SubscriptionRow r) {
    return Subscription(
      id: r.id,
      name: r.name,
      amount: r.amount,
      currency: r.currency,
      period: r.period,
      startDate: r.startDate,
      category: r.category,
      isActive: r.isActive,
    );
  }

  SubscriptionsCompanion _toCompanion(Subscription s) {
    return SubscriptionsCompanion(
      name: Value(s.name),
      amount: Value(s.amount),
      currency: Value(s.currency),
      period: Value(s.period),
      startDate: Value(s.startDate),
      category: Value(s.category),
      isActive: Value(s.isActive),
    );
  }
}