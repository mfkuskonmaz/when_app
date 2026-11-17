import 'billing_period.dart';

class Subscription {
  const Subscription({
    this.id,
    required this.name,
    required this.amount,
    this.currency = 'TRY',
    required this.period,
    required this.startDate,
    this.category = 'Diğer',
    this.isActive = true,
  });

  final int? id;
  final String name;
  final double amount;
  final String currency;
  final BillingPeriod period;
  final DateTime startDate;
  final String category;
  final bool isActive;

  Subscription copyWith({
    int? id,
    String? name,
    double? amount,
    String? currency,
    BillingPeriod? period,
    DateTime? startDate,
    String? category,
    bool? isActive,
  }) {
    return Subscription(
      id: id ?? this.id,
      name: name ?? this.name,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      period: period ?? this.period,
      startDate: startDate ?? this.startDate,
      category: category ?? this.category,
      isActive: isActive ?? this.isActive,
    );
  }

  factory Subscription.fromMap(Map<String, Object?> map) {
    return Subscription(
      id: map['id'] as int?,
      name: map['name'] as String,
      amount: (map['amount'] as num).toDouble(),
      currency: map['currency'] as String,
      period: BillingPeriod.values.byName(map['period'] as String),
      startDate: DateTime.parse(map['startDate'] as String),
      category: map['category'] as String,
      isActive: (map['isActive'] as int) == 1,
    );
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'amount': amount,
      'currency': currency,
      'period': period.name,
      'startDate': startDate.toIso8601String(),
      'category': category,
      'isActive': isActive ? 1 : 0,
    };
  }
}