import 'package:flutter/material.dart';
import 'package:sub_notifier_app/extensions/widget_extension.dart';
import 'package:sub_notifier_app/icons/sn_icons.dart';
import 'package:sub_notifier_app/routes/router.dart';
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: SnAppBar(
          title: 'Новая подписка',
          notificationsEnabled: false,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              spacing: 10,
              children: [
                Row(
                  spacing: 10,
                  children: [
                    InkWell(
                      onTap: () {},
                      radius: 15,
                      child: Container(
                        height: 130,
                        width: 130,
                        decoration: BoxDecoration(
                          color:
                              (Theme.of(context).brightness == Brightness.dark)
                                  ? ThemeColors.textIconPrimaryExtraLow
                                  : ThemeColors.textIconExtraLow,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          Icons.add,
                          size: 50,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Иконка подписки',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            'вы можете выбрать любую из предложенных, либо загрузить свою в формате PNG, JPEG, SVG',
                            style: Theme.of(context).textTheme.labelSmall,
                            maxLines: 4,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SnTextField(
                  labelText: 'название',
                ),
                SnTextField(
                  labelText: 'дата окончания',
                ),
                SnTextField(
                  labelText: 'напоминание',
                ),
                SnTextField(
                  labelText: 'метод оплаты (необязательно)',
                ),
                SnTextField(
                  labelText: 'цвет фона',
                  icon: SnIcons.circle_add,
                  readOnly: true,
                  borderEnabled: true,
                  iconEnabled: true,
                ),
                100.ph,
                ElevatedButton(
                  onPressed: () {
                    router.go('/home');
                  },
                  child: Text(
                    'Сохранить',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
