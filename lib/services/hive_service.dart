import 'package:hive_flutter/hive_flutter.dart';
import 'package:sub_notifier_app/domain/repositories/subscription/subscription.dart';

class HiveService {
  static Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(SubscriptionModelAdapter());
  }
}
