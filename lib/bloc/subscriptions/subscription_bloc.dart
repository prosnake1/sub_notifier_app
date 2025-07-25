import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sub_notifier_app/domain/repositories/subscription/subscription.dart';
import 'package:sub_notifier_app/i18n/strings.g.dart';
import 'package:sub_notifier_app/locator/di.dart';
import 'package:sub_notifier_app/services/services.dart';

part 'subscription_event.dart';
part 'subscription_state.dart';

class SubscriptionBloc extends Bloc<SubscriptionEvent, SubscriptionState> {
  final Box _subscriptionBox;
  SubscriptionBloc(this._subscriptionBox) : super(SubscriptionInitial()) {
    on<CreateSubscription>(_createSubscription);
    on<LoadSubscriptions>(_loadSubscriptions);
    on<RemoveSubscription>(_removeSubscription);
  }

  Future<void> _createSubscription(event, emit) async {
    try {
      final subscription = SubscriptionModel(
        id: event.id,
        name: event.name,
        imageUrl: event.imageUrl,
        whenPay: event.whenPay,
        whenNotify: event.whenNotify,
        notes: event.notes,
      );
      talker.info(subscription);
      _subscriptionBox.put(event.id, subscription);
      NotiService().scheduleNotification(
        id: subscription.id.hashCode,
        title: t.notification.title,
        body: t.notification.body(sub: subscription.name),
        dateTime: event.whenNotify,
      );

      talker.info('Подписка добавлена ${subscription.name}');
      final subscriptions =
          _subscriptionBox.values.toList().cast<SubscriptionModel>();

      emit(SubscriptionLoaded(
        subscriptions: subscriptions,
      ));
    } catch (e) {
      emit(
        SubscriptionError(error: e),
      );
    }
  }

  Future<void> _loadSubscriptions(event, emit) async {
    try {
      final subscriptions =
          _subscriptionBox.values.toList().cast<SubscriptionModel>();
      emit(SubscriptionLoaded(
        subscriptions: subscriptions,
      ));
    } catch (e) {
      emit(SubscriptionError(
        error: e,
      ));
    }
  }

  Future<void> _removeSubscription(event, emit) async {
    try {
      NotiService().cancelNotification(id: event.id.hashCode);
      _subscriptionBox.delete(event.id);
      talker.info('Подписка удалена');
    } catch (e) {
      emit(SubscriptionError(
        error: e,
      ));
    }
  }
}
