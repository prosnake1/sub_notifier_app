import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sub_notifier_app/bloc/subscriptions/subscription_bloc.dart';
import 'package:sub_notifier_app/extensions/extensions.dart';
import 'package:sub_notifier_app/locator/di.dart';
import 'package:sub_notifier_app/routes/router.dart';
import 'package:sub_notifier_app/theme/theme_colors.dart';
import 'package:sub_notifier_app/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _subscriptionBloc = getIt<SubscriptionBloc>();
  @override
  void initState() {
    _subscriptionBloc.add(LoadSubscriptions());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SnAppBar(title: 'Мои подписки'),
      body: BlocBuilder<SubscriptionBloc, SubscriptionState>(
        bloc: _subscriptionBloc,
        builder: (context, state) {
          if (state is SubscriptionLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.separated(
                itemCount: state.subscriptions.length,
                separatorBuilder: (context, index) => 30.ph,
                itemBuilder: (_, i) {
                  final sub = state.subscriptions[i];
                  final remainingDays =
                      sub.whenPay.difference(DateTime.now()).inDays;
                  String remainingText = '';
                  switch (remainingDays) {
                    case 1:
                      remainingText = 'напомним завтра';
                    case 2:
                      remainingText = 'напомним послезавтра';
                    case 3:
                      remainingText = 'напомним через $remainingDays дня';
                    case 4:
                      remainingText = 'напомним через $remainingDays дня';
                    default:
                      remainingText = 'напомним через $remainingDays дней';
                  }
                  return InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            color: (Theme.of(context).brightness ==
                                    Brightness.light)
                                ? Colors.white
                                : Colors.black,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  title: Text('Подробнее'),
                                  trailing: Icon(
                                    Icons.info_outline,
                                  ),
                                  onTap: () {},
                                ),
                                ListTile(
                                  onTap: () {
                                    _subscriptionBloc.add(
                                      RemoveSubscription(id: sub.id),
                                    );
                                    _subscriptionBloc.add(
                                      LoadSubscriptions(),
                                    );
                                    router.pop();
                                  },
                                  title: Text(
                                    'Удалить',
                                  ),
                                  trailing: Icon(
                                    Icons.delete,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: SizedBox(
                        height: 110,
                        child: Stack(
                          clipBehavior: Clip.antiAlias,
                          children: [
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: (Theme.of(context).brightness ==
                                          Brightness.dark)
                                      ? ThemeColors.textIconPrimaryLow
                                      : ThemeColors.textIconExtraLow,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: (sub.imageUrl != null &&
                                      sub.imageUrl!.contains(
                                        '.svg',
                                      ))
                                  ? SvgPicture.asset(
                                      sub.imageUrl!,
                                      width: 150,
                                      height: 150,
                                      fit: BoxFit.cover,
                                    )
                                  : (sub.imageUrl != null)
                                      ? Image.file(
                                          File(sub.imageUrl!),
                                          width: 150,
                                          height: 150,
                                          fit: BoxFit.cover,
                                        )
                                      : SizedBox(),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    sub.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                          fontFamily: 'Archivo Black',
                                        ),
                                  ),
                                  Text(
                                    'Списание: ${sub.whenPay.toLocalDate()}',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  Expanded(child: 1.ph),
                                  Text(
                                    remainingText,
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}

// (sub.imageUrl != null &&
//                                     sub.imageUrl!.contains(
//                                       '.svg',
//                                     ))
//                                 ? SvgPicture.asset(
//                                     sub.imageUrl!,
//                                     width: 150,
//                                   )
//                                 : (sub.imageUrl != null)
//                                     ? Image.file(
//                                         File(
//                                           sub.imageUrl!,
//                                         ),
//                                       )
//                                     : SizedBox(),
