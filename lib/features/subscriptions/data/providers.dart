import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/app_database.dart';
import '../domain/subscription.dart';
import 'subscription_repository.dart';

final databaseProvider = Provider<AppDatabase>((ref) { // Uygulamanın her yerinden erişilebilecek tek bir AppDatabase (veritabanı) örneği (instance) oluşturur.
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});

final subscriptionRepositoryProvider = Provider<SubscriptionRepository>((ref) {
  return SubscriptionRepository(ref.watch(databaseProvider));
});

// Kullanıcının arayüzde (ekranda) abone listesini anlık olarak görebilmesini sağlayan en kritik köprüdür.
final subscriptionsProvider = StreamProvider<List<Subscription>>((ref) {
  return ref.watch(subscriptionRepositoryProvider).watchAll();
});

/* Veritabanı tek bir merkezden güvenle başlatıldı (databaseProvider).
Bu veritabanını kullanan Repository hazırlandı (subscriptionRepositoryProvider).
En alttaki veritabanından en üstteki ekranlara kadar uzanan canlı veri akışı (Stream) Riverpod ile sarmalandı (subscriptionsProvider).
 */