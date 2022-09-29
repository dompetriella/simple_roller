import 'package:flutter_riverpod/flutter_riverpod.dart';

final version = StateProvider<String>((ref) {
  return 'v1.0.0';
});
