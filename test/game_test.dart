import 'package:flutter_test/flutter_test.dart';
import 'package:kart_motoru/kart_motoru.dart';
import 'package:oyun_kart_yolu/oyun_kart_yolu.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(kartYoluConfig.title.length, 33);
    expect(kartYoluConfig.tagline.length, 33);
    for (final s in kartYoluConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler çözülebilir', () {
    final planner = LevelPlanner(gameId: kartYoluId, optionalMechanics: const []);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      final gl = kartYoluRules.build(planner.spec(lv));
      expect(gl.validation.ok, isTrue, reason: 'bölüm $lv');
      final g = TrailGame(gl.puzzle);
      while (!g.won) {
        expect(g.tap(g.hint()!), isTrue);
      }
    }
  });
}
