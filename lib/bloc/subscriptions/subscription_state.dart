part of 'subscription_bloc.dart';

sealed class SubscriptionState extends Equatable {
  const SubscriptionState();

  @override
  List<Object> get props => [];
}

class SubscriptionInitial extends SubscriptionState {}

class SubscriptionLoading extends SubscriptionState {}

class SubscriptionLoaded extends SubscriptionState {
  const SubscriptionLoaded({required this.subscriptions});

  final List<SubscriptionModel> subscriptions;

  @override
  List<Object> get props => [subscriptions];
}

class SubscriptionError extends SubscriptionState {
  const SubscriptionError({required this.error});

  final Object error;

  @override
  List<Object> get props => [error];
}
