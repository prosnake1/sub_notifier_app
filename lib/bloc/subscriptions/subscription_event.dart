part of 'subscription_bloc.dart';

sealed class SubscriptionEvent extends Equatable {}

class LoadSubscriptions extends SubscriptionEvent {
  @override
  List<Object?> get props => [];
}

class CreateSubscription extends SubscriptionEvent {
  CreateSubscription({required this.id, required this.name});

  final String id;
  final String name;

  @override
  List<Object?> get props => [id, name];
}

class RemoveSubscription extends SubscriptionEvent {
  RemoveSubscription({required this.id});

  final String id;

  @override
  List<Object?> get props => [id];
}
