import 'package:infra/data/models/recommendation_letter.dart';

const List<RecommendationLetter> recommendationLetters = [
  RecommendationLetter(
    id: 'letter_shveya',
    partner: 'Shveya Manufacturing Network',
    role: 'COO · Distributed production mesh',
    summary: {
      'en':
          'COO documents how the duo rebuilt the multi-factory scheduler, payroll cockpit, and warehouse telemetry in six weeks, shipping desktop + Go stack without downtime.',
      'ru':
          'Операционный директор описывает, как дуэт собрал мультизаводской планировщик, зарплатный кабинет и складскую телеметрию за 6 недель без простоев.',
    },
    url: 'https://docs.google.com/document/d/SHVEYA_LETTER_ID',
  ),
  RecommendationLetter(
    id: 'letter_soulwi',
    partner: 'SoulWi Corporate Wellness',
    role: 'Founder · AI rituals & retention',
    summary: {
      'en':
          'Founder notes that AI rituals, paywall flows, and retention analytics went live in under two months, with the duo embedding directly into product ops.',
      'ru':
          'Фаундер фиксирует, что AI-ритуалы, paywall и аналитика удержания вышли менее чем за 2 месяца, а дуэт встроился в продуктовую операционку.',
    },
    url: 'https://docs.google.com/document/d/SOULWI_LETTER_ID',
  ),
  RecommendationLetter(
    id: 'letter_philologists',
    partner: 'Philologists Paradise',
    role: 'Product lead · STT & annotation lab',
    summary: {
      'en':
          'Product lead confirms the Serverpod + Flutter transcription lab moved from prototype to classroom pilots with duo-owned infra and eval loops.',
      'ru':
          'Продукт-лид подтверждает, что лаборатория транскрибации на Serverpod + Flutter вышла из прототипа в пилоты с инфраструктурой и eval-петлями дуэта.',
    },
    note: {
      'en':
          'Signed Google Doc lands tonight; PDF export will be dropped in the pack.',
      'ru': 'Подписанный Google Doc прилетит вечером; PDF добавим в пакет.',
    },
    status: RecommendationLetterStatus.incoming,
  ),
];
