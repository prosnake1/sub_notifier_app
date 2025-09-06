import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sub_notifier_app/bloc/subscriptions/subscription_bloc.dart';
import 'package:sub_notifier_app/extensions/extensions.dart';
import 'package:sub_notifier_app/i18n/strings.g.dart';
import 'package:sub_notifier_app/locator/di.dart';
import 'package:sub_notifier_app/routes/router.dart';
import 'package:sub_notifier_app/theme/theme_colors.dart';
import 'package:sub_notifier_app/theme/theme_text.dart';
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
      appBar: SnAppBar(
        title: Text(t.my_subs),
      ),
      body: BlocBuilder<SubscriptionBloc, SubscriptionState>(
        bloc: _subscriptionBloc,
        builder: (context, state) {
          if (state is SubscriptionsLoaded) {
            if (state.subscriptions.isEmpty) {
              return Center(
                child: Text(
                  t.kNull,
                  style: ThemeText.titleLarge,
                ),
              );
            }
            state.subscriptions.sort(
              (a, b) => a.whenNotify.compareTo(b.whenNotify),
            );
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
                  if (remainingDays >= 0) {
                    switch (remainingDays) {
                      case 0:
                        remainingText = t.sub.remaining.today;
                      case 1:
                        remainingText = t.sub.remaining.tomorrow;
                      case 2:
                        remainingText = t.sub.remaining.two_days;
                      case 3 && 4:
                        remainingText = t.sub.remaining
                            .three_four_days(remainingDays: remainingDays);
                      default:
                        remainingText = t.sub.remaining
                            .more_days(remainingDays: remainingDays);
                    }
                  } else {
                    remainingText = t.sub.remaining.expired;
                  }
                  return InkWell(
                    onTap: () {
                      router.pushNamed(
                        'sub',
                        pathParameters: {'id': sub.id},
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: SizedBox(
                        height: 110,
                        child: Stack(
                          alignment: Alignment.centerLeft,
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
                            Positioned(
                              right: -25,
                              child: (sub.imageUrl != null &&
                                      sub.imageUrl!.contains(
                                        '.svg',
                                      ))
                                  ? SvgPicture.asset(
                                      sub.imageUrl!,
                                      width: 150,
                                    )
                                  : (sub.imageUrl != null)
                                      ? Image.file(
                                          File(sub.imageUrl!),
                                          width: 150,
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
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    t.charge_off(
                                        whenPay: sub.whenPay.toLocalDate()),
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
