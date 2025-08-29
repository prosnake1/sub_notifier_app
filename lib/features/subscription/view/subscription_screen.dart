import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sub_notifier_app/bloc/subscriptions/subscription_bloc.dart';
import 'package:sub_notifier_app/extensions/extensions.dart';
import 'package:sub_notifier_app/i18n/strings.g.dart';
import 'package:sub_notifier_app/locator/di.dart';
import 'package:sub_notifier_app/routes/router.dart';
import 'package:sub_notifier_app/theme/theme.dart';
import 'package:sub_notifier_app/widgets/sn_action_button.dart';
import 'package:sub_notifier_app/widgets/sn_appbar.dart';
import 'package:sub_notifier_app/widgets/sn_textfield.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key, required this.id});
  final String id;

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  final _subscriptionBloc = getIt<SubscriptionBloc>();
  @override
  void initState() {
    _subscriptionBloc.add(LoadSubscription(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubscriptionBloc, SubscriptionState>(
      bloc: _subscriptionBloc,
      builder: (context, state) {
        if (state is SubscriptionLoaded) {
          final sub = state.subscription;
          return PopScope(
            onPopInvokedWithResult: (didPop, result) =>
                _subscriptionBloc.add(LoadSubscriptions()),
            child: Scaffold(
              appBar: SnAppBar(
                title: Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    (sub.imageUrl != null &&
                            sub.imageUrl!.contains(
                              '.svg',
                            ))
                        ? SvgPicture.asset(
                            sub.imageUrl!,
                            width: 40,
                          )
                        : (sub.imageUrl != null)
                            ? Image.file(
                                File(sub.imageUrl!),
                              )
                            : SizedBox(),
                    Text(sub.name),
                  ],
                ),
                leading: IconButton(
                  onPressed: () {
                    router.pop();
                    _subscriptionBloc.add(LoadSubscriptions());
                  },
                  icon: Icon(Icons.arrow_back),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          spacing: 10,
                          children: [
                            SnTextField(
                              labelText: t.name,
                              hintText: sub.name,
                              readOnly: true,
                            ),
                            SnTextField(
                              labelText: t.pay_date,
                              hintText: sub.whenPay.toLocalDate().toString(),
                              readOnly: true,
                            ),
                            SnTextField(
                              labelText: t.when_remind,
                              hintText: sub.whenNotify.toLocalDate().toString(),
                              readOnly: true,
                            ),
                            SnTextField(
                              labelText: t.notes,
                              hintText: sub.notes,
                              maxLines: 6,
                              readOnly: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SnActionButton(
                      text: 'Edit',
                      color: ThemeColors.textIconExtraLow,
                      onTap: () {},
                    ),
                    5.ph,
                    SnActionButton(
                      text: t.delete,
                      onTap: () {
                        _subscriptionBloc.add(RemoveSubscription(id: sub.id));
                        router.pop();
                        _subscriptionBloc.add(LoadSubscriptions());
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
