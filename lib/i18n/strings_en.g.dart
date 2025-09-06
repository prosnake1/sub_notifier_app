///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	String get lang => 'en';
	String get cc => 'US';
	String get welcome => 'Welcome';
	String get keep_track => 'Keeping track of your subscriptions is now much easier';
	String get go => 'Go';
	String get my_subs => 'My subscriptions';
	String get settings => 'Settings';
	String get add => 'Add';
	String get kNull => 'There\'s nothing here';
	String get theme => 'Theme';
	String get icons => 'Icons';
	String get upload => 'Upload';
	String get language => 'Language';
	String get icon_title => 'Subscription icon';
	String get icon_descreption => 'You can choose one of the suggested subscription icons or upload your own';
	String get new_sub => 'New subscription';
	String get name => 'Name';
	String get pay_date => 'Payment date';
	String get reminder => 'Reminder';
	String get when_remind => 'We will Remind you in';
	String get notes => 'Notes';
	String get save => 'Save';
	String get about => 'More details';
	String charge_off({required Object whenPay}) => 'Pay on ${whenPay}';
	String get delete => 'Delete';
	String get edit => 'Edit';
	String get editing_mode => 'Editing Mode';
	String get changes_alert => 'Do you want to save changes?';
	String get cancel => 'Cancel';
	String get kContinue => 'Save';
	late final TranslationsRemindBeforeEn remind_before = TranslationsRemindBeforeEn._(_root);
	late final TranslationsSubEn sub = TranslationsSubEn._(_root);
	late final TranslationsWarningsEn warnings = TranslationsWarningsEn._(_root);
	late final TranslationsNotificationEn notification = TranslationsNotificationEn._(_root);
}

// Path: remind_before
class TranslationsRemindBeforeEn {
	TranslationsRemindBeforeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get day => 'Remind 1 day before';
	String get three_days => 'Remind 3 days before';
	String get week => 'Remind 1 week before';
	String get month => 'Remind 1 month before';
}

// Path: sub
class TranslationsSubEn {
	TranslationsSubEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsSubRemainingEn remaining = TranslationsSubRemainingEn._(_root);
}

// Path: warnings
class TranslationsWarningsEn {
	TranslationsWarningsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get edit_restricted => 'Editing is not available yet';
}

// Path: notification
class TranslationsNotificationEn {
	TranslationsNotificationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Hurry up and disable Subscription ❗';
	String body({required Object sub}) => 'We remind you to disable ${sub} before it\'s too late😏';
}

// Path: sub.remaining
class TranslationsSubRemainingEn {
	TranslationsSubRemainingEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get today => 'We Reminded you today';
	String get tomorrow => 'We\'ll remind you tomorrow';
	String get two_days => 'We\'ll remind you the day after tomorrow';
	String three_four_days({required Object remainingDays}) => 'We\'ll remind you in ${remainingDays} days';
	String more_days({required Object remainingDays}) => 'We\'ll remind you in ${remainingDays} days';
	String get expired => 'Reminder expired';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'lang': return 'en';
			case 'cc': return 'US';
			case 'welcome': return 'Welcome';
			case 'keep_track': return 'Keeping track of your subscriptions is now much easier';
			case 'go': return 'Go';
			case 'my_subs': return 'My subscriptions';
			case 'settings': return 'Settings';
			case 'add': return 'Add';
			case 'kNull': return 'There\'s nothing here';
			case 'theme': return 'Theme';
			case 'icons': return 'Icons';
			case 'upload': return 'Upload';
			case 'language': return 'Language';
			case 'icon_title': return 'Subscription icon';
			case 'icon_descreption': return 'You can choose one of the suggested subscription icons or upload your own';
			case 'new_sub': return 'New subscription';
			case 'name': return 'Name';
			case 'pay_date': return 'Payment date';
			case 'reminder': return 'Reminder';
			case 'when_remind': return 'We will Remind you in';
			case 'notes': return 'Notes';
			case 'save': return 'Save';
			case 'about': return 'More details';
			case 'charge_off': return ({required Object whenPay}) => 'Pay on ${whenPay}';
			case 'delete': return 'Delete';
			case 'edit': return 'Edit';
			case 'editing_mode': return 'Editing Mode';
			case 'changes_alert': return 'Do you want to save changes?';
			case 'cancel': return 'Cancel';
			case 'kContinue': return 'Save';
			case 'remind_before.day': return 'Remind 1 day before';
			case 'remind_before.three_days': return 'Remind 3 days before';
			case 'remind_before.week': return 'Remind 1 week before';
			case 'remind_before.month': return 'Remind 1 month before';
			case 'sub.remaining.today': return 'We Reminded you today';
			case 'sub.remaining.tomorrow': return 'We\'ll remind you tomorrow';
			case 'sub.remaining.two_days': return 'We\'ll remind you the day after tomorrow';
			case 'sub.remaining.three_four_days': return ({required Object remainingDays}) => 'We\'ll remind you in ${remainingDays} days';
			case 'sub.remaining.more_days': return ({required Object remainingDays}) => 'We\'ll remind you in ${remainingDays} days';
			case 'sub.remaining.expired': return 'Reminder expired';
			case 'warnings.edit_restricted': return 'Editing is not available yet';
			case 'notification.title': return 'Hurry up and disable Subscription ❗';
			case 'notification.body': return ({required Object sub}) => 'We remind you to disable ${sub} before it\'s too late😏';
			default: return null;
		}
	}
}

