import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sub_notifier_app/bloc/subscriptions/subscription_bloc.dart';
import 'package:sub_notifier_app/extensions/extensions.dart';
import 'package:sub_notifier_app/locator/di.dart';
import 'package:sub_notifier_app/routes/router.dart';
import 'package:sub_notifier_app/theme/theme.dart';
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
                itemBuilder: (context, i) {
                  final sub = state.subscriptions[i];
                  return InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return SizedBox(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  title: Text('Изменить'),
                                  trailing: Icon(
                                    Icons.edit,
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
                    child: Container(
                      height: 110,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xFF353535),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              sub.name,
                              style: ThemeTypography.headlineSmall.copyWith(
                                color: Colors.white,
                                fontFamily: 'Archivo Black',
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
