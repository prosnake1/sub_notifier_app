import 'package:hive/hive.dart';

part 'subscription_model.g.dart';

@HiveType(typeId: 1)
class SubscriptionModel {
  SubscriptionModel({
    required this.id,
    required this.name,
  });

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;
}
