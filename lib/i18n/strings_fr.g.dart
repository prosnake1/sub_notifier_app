///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsFr implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsFr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.fr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <fr>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsFr _root = this; // ignore: unused_field

	@override 
	TranslationsFr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsFr(meta: meta ?? this.$meta);

	// Translations
	@override String get lang => 'fr';
	@override String get cc => 'FR';
	@override String get welcome => 'Bienvenue';
	@override String get keep_track => 'Suivre vos abonnements est maintenant beaucoup plus facile';
	@override String get go => 'Aller';
	@override String get my_subs => 'Mes abonnements';
	@override String get settings => 'Paramètres';
	@override String get add => 'Ajouter';
	@override String get theme => 'Thème';
	@override String get icons => 'Icônes';
	@override String get upload => 'Téléverser';
	@override String get language => 'Langue';
	@override String get icon_title => 'Icône d’abonnement';
	@override String get icon_descreption => 'Vous pouvez choisir l’une des icônes d’abonnement proposées ou téléverser la vôtre';
	@override String get new_sub => 'Nouvel abonnement';
	@override String get name => 'Nom';
	@override String get pay_date => 'Date de paiement';
	@override String get reminder => 'Rappel';
	@override String get notes => 'Notes';
	@override String get save => 'Enregistrer';
	@override String get about => 'Plus de détails';
	@override String charge_off({required Object whenPay}) => 'Débit : ${whenPay}';
	@override String get delete => 'Supprimer';
	@override late final _TranslationsRemindBeforeFr remind_before = _TranslationsRemindBeforeFr._(_root);
	@override late final _TranslationsSubFr sub = _TranslationsSubFr._(_root);
	@override late final _TranslationsNotificationFr notification = _TranslationsNotificationFr._(_root);
}

// Path: remind_before
class _TranslationsRemindBeforeFr implements TranslationsRemindBeforeEn {
	_TranslationsRemindBeforeFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get day => 'Rappeler 1 jour avant';
	@override String get three_days => 'Rappeler 3 jours avant';
	@override String get week => 'Rappeler 1 semaine avant';
	@override String get month => 'Rappeler 1 mois avant';
}

// Path: sub
class _TranslationsSubFr implements TranslationsSubEn {
	_TranslationsSubFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSubRemainingFr remaining = _TranslationsSubRemainingFr._(_root);
}

// Path: notification
class _TranslationsNotificationFr implements TranslationsNotificationEn {
	_TranslationsNotificationFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Dépêchez-vous de désactiver l’abonnement ❗';
	@override String body({required Object sub}) => 'Nous vous rappelons de désactiver ${sub} avant qu’il ne soit trop tard 😏';
}

// Path: sub.remaining
class _TranslationsSubRemainingFr implements TranslationsSubRemainingEn {
	_TranslationsSubRemainingFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get today => 'Nous vous avons rappelé aujourd’hui';
	@override String get tomorrow => 'Nous vous rappellerons demain';
	@override String get two_days => 'Nous vous rappellerons après-demain';
	@override String three_four_days({required Object remainingDays}) => 'Nous vous rappellerons dans ${remainingDays} jours';
	@override String more_days({required Object remainingDays}) => 'Nous vous rappellerons dans ${remainingDays} jours';
	@override String get expired => 'Rappel expiré';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsFr {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'lang': return 'fr';
			case 'cc': return 'FR';
			case 'welcome': return 'Bienvenue';
			case 'keep_track': return 'Suivre vos abonnements est maintenant beaucoup plus facile';
			case 'go': return 'Aller';
			case 'my_subs': return 'Mes abonnements';
			case 'settings': return 'Paramètres';
			case 'add': return 'Ajouter';
			case 'theme': return 'Thème';
			case 'icons': return 'Icônes';
			case 'upload': return 'Téléverser';
			case 'language': return 'Langue';
			case 'icon_title': return 'Icône d’abonnement';
			case 'icon_descreption': return 'Vous pouvez choisir l’une des icônes d’abonnement proposées ou téléverser la vôtre';
			case 'new_sub': return 'Nouvel abonnement';
			case 'name': return 'Nom';
			case 'pay_date': return 'Date de paiement';
			case 'reminder': return 'Rappel';
			case 'notes': return 'Notes';
			case 'save': return 'Enregistrer';
			case 'about': return 'Plus de détails';
			case 'charge_off': return ({required Object whenPay}) => 'Débit : ${whenPay}';
			case 'delete': return 'Supprimer';
			case 'remind_before.day': return 'Rappeler 1 jour avant';
			case 'remind_before.three_days': return 'Rappeler 3 jours avant';
			case 'remind_before.week': return 'Rappeler 1 semaine avant';
			case 'remind_before.month': return 'Rappeler 1 mois avant';
			case 'sub.remaining.today': return 'Nous vous avons rappelé aujourd’hui';
			case 'sub.remaining.tomorrow': return 'Nous vous rappellerons demain';
			case 'sub.remaining.two_days': return 'Nous vous rappellerons après-demain';
			case 'sub.remaining.three_four_days': return ({required Object remainingDays}) => 'Nous vous rappellerons dans ${remainingDays} jours';
			case 'sub.remaining.more_days': return ({required Object remainingDays}) => 'Nous vous rappellerons dans ${remainingDays} jours';
			case 'sub.remaining.expired': return 'Rappel expiré';
			case 'notification.title': return 'Dépêchez-vous de désactiver l’abonnement ❗';
			case 'notification.body': return ({required Object sub}) => 'Nous vous rappelons de désactiver ${sub} avant qu’il ne soit trop tard 😏';
			default: return null;
		}
	}
}

