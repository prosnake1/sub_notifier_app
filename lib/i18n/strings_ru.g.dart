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
class TranslationsRu implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsRu({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsRu _root = this; // ignore: unused_field

	@override 
	TranslationsRu $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsRu(meta: meta ?? this.$meta);

	// Translations
	@override String get lang => 'ru';
	@override String get cc => 'RU';
	@override String get welcome => 'Добро пожаловать';
	@override String get keep_track => 'Следить за подписками теперь куда проще';
	@override String get go => 'Вперед';
	@override String get my_subs => 'Мои подписки';
	@override String get settings => 'Настройки';
	@override String get add => 'Добавить';
	@override String get kNull => 'Здесь ничего нет';
	@override String get theme => 'Тема';
	@override String get icons => 'Иконки';
	@override String get upload => 'Загрузить';
	@override String get language => 'Язык';
	@override String get icon_title => 'Иконка подписки';
	@override String get icon_descreption => 'Вы можете выбрать любую из предложенных подписок, либо загрузить свою';
	@override String get new_sub => 'Новая подписка';
	@override String get name => 'Название';
	@override String get pay_date => 'Дата оплаты';
	@override String get reminder => 'Напоминание';
	@override String get when_remind => 'Напомним';
	@override String get notes => 'Заметки';
	@override String get save => 'Сохранить';
	@override String get about => 'Подробнее';
	@override String charge_off({required Object whenPay}) => 'Списание: ${whenPay}';
	@override String get delete => 'Удалить';
	@override String get edit => 'Редактировать';
	@override String get editing_mode => 'Редактор';
	@override String get changes_alert => 'Вы хотите применить изменения?';
	@override String get cancel => 'Отмена';
	@override String get kContinue => 'Продолжить';
	@override late final _TranslationsRemindBeforeRu remind_before = _TranslationsRemindBeforeRu._(_root);
	@override late final _TranslationsSubRu sub = _TranslationsSubRu._(_root);
	@override late final _TranslationsWarningsRu warnings = _TranslationsWarningsRu._(_root);
	@override late final _TranslationsNotificationRu notification = _TranslationsNotificationRu._(_root);
}

// Path: remind_before
class _TranslationsRemindBeforeRu implements TranslationsRemindBeforeEn {
	_TranslationsRemindBeforeRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get day => 'Напомнить за 1 день';
	@override String get three_days => 'Напомнить за 3 дня';
	@override String get week => 'Напомнить за неделю';
	@override String get month => 'Напомнить за месяц';
}

// Path: sub
class _TranslationsSubRu implements TranslationsSubEn {
	_TranslationsSubRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSubRemainingRu remaining = _TranslationsSubRemainingRu._(_root);
}

// Path: warnings
class _TranslationsWarningsRu implements TranslationsWarningsEn {
	_TranslationsWarningsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get edit_restricted => 'Редактирование пока недоступно';
}

// Path: notification
class _TranslationsNotificationRu implements TranslationsNotificationEn {
	_TranslationsNotificationRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Скорее отключи подписку ❗';
	@override String body({required Object sub}) => 'Напоминаем тебе отключить ${sub} пока не поздно😏';
}

// Path: sub.remaining
class _TranslationsSubRemainingRu implements TranslationsSubRemainingEn {
	_TranslationsSubRemainingRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get today => 'Напомнили сегодня';
	@override String get tomorrow => 'Напомним завтра';
	@override String get two_days => 'Напомним послезавтра';
	@override String three_four_days({required Object remainingDays}) => 'Напомним через ${remainingDays} дня';
	@override String more_days({required Object remainingDays}) => 'Напомним через ${remainingDays} дней';
	@override String get expired => 'Напоминание просрочено';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsRu {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'lang': return 'ru';
			case 'cc': return 'RU';
			case 'welcome': return 'Добро пожаловать';
			case 'keep_track': return 'Следить за подписками теперь куда проще';
			case 'go': return 'Вперед';
			case 'my_subs': return 'Мои подписки';
			case 'settings': return 'Настройки';
			case 'add': return 'Добавить';
			case 'kNull': return 'Здесь ничего нет';
			case 'theme': return 'Тема';
			case 'icons': return 'Иконки';
			case 'upload': return 'Загрузить';
			case 'language': return 'Язык';
			case 'icon_title': return 'Иконка подписки';
			case 'icon_descreption': return 'Вы можете выбрать любую из предложенных подписок, либо загрузить свою';
			case 'new_sub': return 'Новая подписка';
			case 'name': return 'Название';
			case 'pay_date': return 'Дата оплаты';
			case 'reminder': return 'Напоминание';
			case 'when_remind': return 'Напомним';
			case 'notes': return 'Заметки';
			case 'save': return 'Сохранить';
			case 'about': return 'Подробнее';
			case 'charge_off': return ({required Object whenPay}) => 'Списание: ${whenPay}';
			case 'delete': return 'Удалить';
			case 'edit': return 'Редактировать';
			case 'editing_mode': return 'Редактор';
			case 'changes_alert': return 'Вы хотите применить изменения?';
			case 'cancel': return 'Отмена';
			case 'kContinue': return 'Продолжить';
			case 'remind_before.day': return 'Напомнить за 1 день';
			case 'remind_before.three_days': return 'Напомнить за 3 дня';
			case 'remind_before.week': return 'Напомнить за неделю';
			case 'remind_before.month': return 'Напомнить за месяц';
			case 'sub.remaining.today': return 'Напомнили сегодня';
			case 'sub.remaining.tomorrow': return 'Напомним завтра';
			case 'sub.remaining.two_days': return 'Напомним послезавтра';
			case 'sub.remaining.three_four_days': return ({required Object remainingDays}) => 'Напомним через ${remainingDays} дня';
			case 'sub.remaining.more_days': return ({required Object remainingDays}) => 'Напомним через ${remainingDays} дней';
			case 'sub.remaining.expired': return 'Напоминание просрочено';
			case 'warnings.edit_restricted': return 'Редактирование пока недоступно';
			case 'notification.title': return 'Скорее отключи подписку ❗';
			case 'notification.body': return ({required Object sub}) => 'Напоминаем тебе отключить ${sub} пока не поздно😏';
			default: return null;
		}
	}
}

