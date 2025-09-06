import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sub_notifier_app/bloc/subscriptions/subscription_bloc.dart';
import 'package:sub_notifier_app/extensions/extensions.dart';
import 'package:sub_notifier_app/i18n/strings.g.dart';
import 'package:sub_notifier_app/locator/di.dart';
import 'package:sub_notifier_app/routes/router.dart';
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

  bool isEditingMode = false;
  bool readOnly = true;

  final nameController = TextEditingController();
  final notesController = TextEditingController();

  @override
  void initState() {
    _subscriptionBloc.add(LoadSubscription(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: BlocBuilder<SubscriptionBloc, SubscriptionState>(
        bloc: _subscriptionBloc,
        builder: (context, state) {
          if (state is SubscriptionLoaded) {
            if (isEditingMode) {
              readOnly = false;
            } else {
              readOnly = true;
            }
            final sub = state.subscription;

            nameController.text = sub.name;
            notesController.text = sub.notes ?? '';

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
                                  width: 40,
                                  height: 40,
                                )
                              : SizedBox(),
                      AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        transitionBuilder: (child, animation) =>
                            SlideTransition(
                          position: Tween<Offset>(
                            begin: Offset(1.0, 0.0),
                            end: Offset.zero,
                          ).animate(animation),
                          child: child,
                        ),
                        child: Text(
                          key: ValueKey<bool>(isEditingMode),
                          isEditingMode ? t.editing_mode : sub.name,
                        ),
                      )
                    ],
                  ),
                  leading: IconButton(
                    onPressed: () {
                      if (isEditingMode &&
                          (nameController.text != sub.name ||
                              notesController.text != sub.notes)) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(t.changes_alert),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    router.pop();
                                  },
                                  child: Text(t.cancel)),
                              TextButton(
                                  onPressed: () {
                                    _subscriptionBloc.add(EditSubscription(
                                      id: sub.id,
                                      name: nameController.text,
                                      imageUrl: sub.imageUrl,
                                      whenNotify: sub.whenNotify,
                                      whenPay: sub.whenPay,
                                      notes: notesController.text,
                                    ));
                                    router.pop();
                                    router.pop();
                                    _subscriptionBloc.add(LoadSubscriptions());
                                  },
                                  child: Text(t.kContinue)),
                            ],
                          ),
                        );
                      } else {
                        router.pop();
                        _subscriptionBloc.add(LoadSubscriptions());
                      }
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
                                controller: nameController,
                                labelText: t.name,
                                readOnly: readOnly,
                              ),
                              SnTextField(
                                labelText: t.pay_date,
                                hintText: sub.whenPay.toLocalDate().toString(),
                                readOnly: true,
                              ),
                              SnTextField(
                                labelText: t.when_remind,
                                hintText:
                                    sub.whenNotify.toLocalDate().toString(),
                                readOnly: true,
                              ),
                              SnTextField(
                                controller: notesController,
                                labelText: t.notes,
                                maxLines: 6,
                                readOnly: readOnly,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SnActionButton(
                        onTap: () {
                          isEditingMode = !isEditingMode;
                          if (!isEditingMode) {
                            _subscriptionBloc.add(EditSubscription(
                              id: sub.id,
                              name: nameController.text,
                              imageUrl: sub.imageUrl,
                              whenNotify: sub.whenNotify,
                              whenPay: sub.whenPay,
                              notes: notesController.text,
                            ));
                          }
                          setState(() {});
                        },
                        text: isEditingMode ? t.save : t.edit,
                        color: (Theme.of(context).brightness == Brightness.dark)
                            ? Colors.black
                            : Colors.white,
                        textColor:
                            (Theme.of(context).brightness == Brightness.dark)
                                ? Colors.white
                                : Colors.black,
                      ),
                      10.ph,
                      SnActionButton(
                        onTap: () {
                          _subscriptionBloc.add(RemoveSubscription(id: sub.id));
                          router.pop();
                          _subscriptionBloc.add(LoadSubscriptions());
                        },
                        text: t.delete,
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
      ),
    );
  }
}
