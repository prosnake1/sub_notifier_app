part of 'subscription_bloc.dart';

sealed class SubscriptionEvent extends Equatable {}

class LoadSubscriptions extends SubscriptionEvent {
  @override
  List<Object?> get props => [];
}

class LoadSubscription extends SubscriptionEvent {
  LoadSubscription({required this.id});

  final String id;

  @override
  List<Object?> get props => [id];
}

class CreateSubscription extends SubscriptionEvent {
  CreateSubscription({
    required this.id,
    required this.name,
    required this.whenNotify,
    required this.whenPay,
    this.imageUrl,
    this.notes,
  });

  final String id;
  final String name;
  final String? imageUrl;
  final DateTime whenPay;
  final DateTime whenNotify;
  final String? notes;

  @override
  List<Object?> get props => [
        id,
        name,
        imageUrl,
        whenPay,
        whenNotify,
        notes,
      ];
}

class EditSubscription extends SubscriptionEvent {
  EditSubscription({
    required this.id,
    required this.name,
    required this.whenNotify,
    required this.whenPay,
    this.imageUrl,
    this.notes,
  });

  final String id;
  final String name;
  final String? imageUrl;
  final DateTime whenPay;
  final DateTime whenNotify;
  final String? notes;

  @override
  List<Object?> get props => [id, name, notes];
}

class RemoveSubscription extends SubscriptionEvent {
  RemoveSubscription({required this.id});

  final String id;

  @override
  List<Object?> get props => [id];
}
