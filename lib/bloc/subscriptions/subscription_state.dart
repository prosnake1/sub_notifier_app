part of 'subscription_bloc.dart';

sealed class SubscriptionState extends Equatable {
  const SubscriptionState();

  @override
  List<Object> get props => [];
}

class SubscriptionInitial extends SubscriptionState {}

class SubscriptionsLoaded extends SubscriptionState {
  const SubscriptionsLoaded({required this.subscriptions});

  final List<SubscriptionModel> subscriptions;

  @override
  List<Object> get props => [subscriptions];
}

class SubscriptionLoaded extends SubscriptionState {
  const SubscriptionLoaded({required this.subscription});

  final SubscriptionModel subscription;

  @override
  List<Object> get props => [subscription];
}

class SubscriptionError extends SubscriptionState {
  const SubscriptionError({required this.error});

  final Object error;

  @override
  List<Object> get props => [error];
}
