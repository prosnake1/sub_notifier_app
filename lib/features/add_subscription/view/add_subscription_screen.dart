import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sub_notifier_app/bloc/subscriptions/subscription_bloc.dart';
import 'package:sub_notifier_app/constants/constants.dart';
import 'package:sub_notifier_app/extensions/widget_extension.dart';
import 'package:sub_notifier_app/locator/di.dart';
import 'package:sub_notifier_app/routes/router.dart';
import 'package:sub_notifier_app/theme/theme.dart';
import 'package:sub_notifier_app/widgets/widgets.dart';
import 'package:uuid/uuid.dart';

class AddSubscriptionScreen extends StatefulWidget {
  const AddSubscriptionScreen({super.key});

  @override
  State<AddSubscriptionScreen> createState() => _AddSubscriptionScreenState();
}

class _AddSubscriptionScreenState extends State<AddSubscriptionScreen> {
  final _subscriptionBloc = getIt<SubscriptionBloc>();
  final _nameController = TextEditingController();
  final _notificationController = TextEditingController();
  final _dateController = TextEditingController();
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
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container();
                          },
                        );
                      },
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
                            'вы можете выбрать любую из предложенных подписок, либо создать свою',
                            style: Theme.of(context).textTheme.labelSmall,
                            maxLines: 4,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SnTextField(
                  controller: _nameController,
                  labelText: 'название',
                ),
                SnTextField(
                  controller: _dateController,
                  labelText: 'дата оплаты',
                  readOnly: true,
                  onTap: () async {
                    DateTime? dateTime = await showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2099),
                    );
                    if (dateTime != null) {
                      final formatted =
                          DateFormat('d MMMM yyyy').format(dateTime);
                      _dateController.text = formatted.toString();
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: SnTextField(
                        controller: _notificationController,
                        labelText: 'напоминание',
                        readOnly: true,
                        onTap: () {
                          showNotificationChoices(context);
                        },
                      ),
                    ),
                  ],
                ),
                SnTextField(
                  labelText: 'заметки',
                  maxLines: 7,
                ),
                20.ph,
                ElevatedButton(
                  onPressed: () {
                    _subscriptionBloc.add(
                      CreateSubscription(
                        id: Uuid().v4(),
                        name: _nameController.text,
                      ),
                    );
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

  Future<dynamic> showNotificationChoices(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              20.ph,
              Text(
                'Напоминание',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: DataConstants.notificationChoices.length,
                shrinkWrap: true,
                itemBuilder: (context, i) {
                  final choice = DataConstants.notificationChoices[i];
                  return ListTile(
                    onTap: () {
                      _notificationController.text = choice['text'];
                      router.pop();
                    },
                    title: Text(
                      DataConstants.notificationChoices[i]['text'],
                    ),
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }
}
