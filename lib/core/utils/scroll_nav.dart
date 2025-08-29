import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'web_hash.dart';

class SectionNavController {
  final scrollController = ScrollController();
  final sections = <String, GlobalKey>{};

  void register(String id, GlobalKey key) => sections[id] = key;

  Future<void> scrollTo(BuildContext context, String id) async {
    final key = sections[id];
    if (key == null) return;
    final ctx = key.currentContext;
    if (ctx == null) return;

    await Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 550),
      curve: Curves.easeInOutCubic,
      alignment: 0.08, // deja el título un poco más abajo del appbar
    );

    // Actualiza la URL con el hash (#id) sin recargar
    if (kIsWeb) replaceHash(id);
  }

  void dispose() => scrollController.dispose();
}
