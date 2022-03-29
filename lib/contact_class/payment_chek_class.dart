class PaymentChek{
  final String id;
  final String phone;
  final String summ;
  final String commission;
  final String data;
  final String time;
  final String status;
  final String name;
  final bool isIncome;
  final bool canTap;

  PaymentChek({
    required this.id,
    required this.phone,
    required this.summ,
    required this.commission,
    required this.data,
    required this.time,
    required this.status,
    this.isIncome = false,
    this.canTap = false,
    this.name = ''
});
}