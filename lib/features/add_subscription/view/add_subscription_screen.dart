import 'package:flutter/material.dart';
import 'package:sub_notifier_app/extensions/extensions.dart';
import 'package:sub_notifier_app/theme/theme.dart';
import 'package:sub_notifier_app/widgets/widgets.dart';

class AddSubscriptionScreen extends StatefulWidget {
  const AddSubscriptionScreen({super.key});

  @override
  State<AddSubscriptionScreen> createState() => _AddSubscriptionScreenState();
}

class _AddSubscriptionScreenState extends State<AddSubscriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SnAppBar(
        title: 'Новая подписка',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                    color: ThemeColors.textIconExtraLow,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(
                    Icons.add,
                    size: 50,
                  ),
                ),
                10.pw,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Иконка подписки',
                        style: ThemeTypography.headlineSmall,
                      ),
                      Text(
                        'вы можете выбрать любую из предложенных, либо загрузить свою в формате PNG, JPEG, SVG',
                        style: ThemeTypography.labelSmall,
                        maxLines: 4,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
