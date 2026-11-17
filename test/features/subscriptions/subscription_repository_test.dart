import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:when_app/core/database/app_database.dart';
import 'package:when_app/features/subscriptions/data/subscription_repository.dart';
import 'package:when_app/features/subscriptions/domain/billing_period.dart';
import 'package:when_app/features/subscriptions/domain/subscription.dart';

/* Unit test for SubscriptionRepository BURADA UNIT TEST MANTIGI KURULDU RAM UZERINDE TEST EDERECEK COP BIRAKMIYOIR */

void main() {
  late AppDatabase db;
  late SubscriptionRepository repo;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    repo = SubscriptionRepository(db);
  });

  tearDown(() => db.close());

  Subscription sample({String name = 'Netflix'}) => Subscription(
    name: name,
    amount: 229.99,
    period: BillingPeriod.monthly,
    startDate: DateTime(2026, 1, 31),
  );

  test('ekleme sonrası liste güncellenir', () async {
    await repo.add(sample());

    final list = await repo.watchAll().first;

    expect(list, hasLength(1));
    expect(list.first.name, 'Netflix');
    expect(list.first.id, isNotNull);
    expect(list.first.period, BillingPeriod.monthly);
  });

  test('güncelleme alanı değiştirir', () async {
    final id = await repo.add(sample());
    await repo.update(sample(name: 'Spotify').copyWith(id: id));

    final list = await repo.watchAll().first;

    expect(list.single.name, 'Spotify');
  });

  test('silme kaydı kaldırır', () async {
    final id = await repo.add(sample());
    await repo.delete(id);

    final list = await repo.watchAll().first;

    expect(list, isEmpty);
  });
}