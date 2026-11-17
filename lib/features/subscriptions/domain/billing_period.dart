enum BillingPeriod {
  weekly('Haftalık'),
  monthly('Aylık'),
  yearly('Yıllık');

  const BillingPeriod(this.label);

  final String label;
}