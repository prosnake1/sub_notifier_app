import 'package:sub_notifier_app/i18n/strings.g.dart';

class DataConstants {
  static List<Map<String, dynamic>> get reminderChoices => [
        {
          'text': t.remind_before.day,
          'days': 1,
        },
        {
          'text': t.remind_before.three_days,
          'days': 3,
        },
        {
          'text': t.remind_before.week,
          'days': 7,
        },
        {
          'text': t.remind_before.month,
          'days': 30,
        },
      ];

  static const List<String> subIcons = [
    'amazon-music.svg',
    'amazon-prime.svg',
    'discord.svg',
    'disney.svg',
    'kinopoisk.svg',
    'netflix.svg',
    'spotify.svg',
    'telegram.svg',
    'xbox.svg',
    'youtube.svg',
    'ivi.svg',
    'yandex-music.svg',
    'okko.svg',
  ];

  static const List<String> subIconLabels = [
    'Amazon Music',
    'Amazon Prime',
    'Discord Nitro',
    'Disney+',
    'Kinopoisk',
    'Netflix',
    'Spotify',
    'Telegram',
    'Xbox',
    'YouTube',
    'Ivi',
    'Yandex Music',
    'Okko',
  ];
}
