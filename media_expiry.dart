import 'package:flutter/material.dart';

class MediaExpiry {
  static const Duration lifetime = Duration(hours: 24);

  static DateTime expiresAt([DateTime? from]) =>
      (from ?? DateTime.now()).add(lifetime);

  static bool isExpired(DateTime createdAt) =>
      DateTime.now().isAfter(createdAt.add(lifetime));

  static String remaining(DateTime createdAt) {
    final left = createdAt.add(lifetime).difference(DateTime.now());
    if (left.isNegative) return 'منتهية';
    final h = left.inHours;
    final m = left.inMinutes.remainder(60);
    return '${h}س ${m}د';
  }
}
