import 'package:hive/hive.dart';

part 'subscription_model.g.dart';

@HiveType(typeId: 1)
class SubscriptionModel {
  SubscriptionModel({
    required this.id,
    required this.name,
    required this.whenPay,
    required this.whenNotify,
    this.imageUrl,
    this.notes,
  });

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String? imageUrl;
  @HiveField(3)
  final DateTime whenPay;
  @HiveField(4)
  final DateTime whenNotify;
  @HiveField(5)
  final String? notes;
}
