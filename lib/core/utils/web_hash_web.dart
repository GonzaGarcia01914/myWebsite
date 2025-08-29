import 'package:flutter/foundation.dart';
import 'package:web/web.dart' as web;

void replaceHash(String id) {
  if (!kIsWeb) return;
  try {
    final hash = '#$id';
    if (web.window.location.hash == hash) return;
    final base = web.window.location.pathname;
    web.window.history.replaceState(null, '', '$base$hash');
  } catch (_) {
    // Silently ignore if history API isn't available.
  }
}

