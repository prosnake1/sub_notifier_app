import 'package:flutter/material.dart';
import 'package:sub_notifier_app/widgets/widgets.dart';

class AddSubscriptionScreen extends StatefulWidget {
  const AddSubscriptionScreen({super.key});

  @override
  State<AddSubscriptionScreen> createState() => _AddSubscriptionScreenState();
}

class _AddSubscriptionScreenState extends State<AddSubscriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SnAppBar(
        title: 'Новая подписка',
      ),
    );
  }
}
