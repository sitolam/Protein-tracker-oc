import 'package:flutter_confetti/flutter_confetti.dart';

void confetti(context) {
  Confetti.launch(
    context,
    options: const ConfettiOptions(particleCount: 100, spread: 70, y: 0.6),
  );
}
