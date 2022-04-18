import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('goldens', () async {
    final result = await Process.run(
      'flutter',
      ['pub', 'run', 'custom_lint'],
      stdoutEncoding: utf8,
    );

    expect(result.stdout, '''
  test/goldens/avoid_dynamic_provider.dart:10:9 • Providers should be either top level variables or static properties • riverpod_avoid_dynamic_provider
  test/goldens/avoid_dynamic_provider.dart:14:9 • Providers should be either top level variables or static properties • riverpod_avoid_dynamic_provider
  test/goldens/avoid_dynamic_provider.dart:15:9 • Providers should be either top level variables or static properties • riverpod_avoid_dynamic_provider
  test/goldens/avoid_dynamic_provider.dart:16:9 • Providers should be either top level variables or static properties • riverpod_avoid_dynamic_provider
  test/goldens/final_provider.dart:5:14 • Providers should always be declared as final • riverpod_final_provider
  test/goldens/final_provider.dart:6:51 • Providers should always be declared as final • riverpod_final_provider
  test/goldens/final_provider.dart:11:5 • Providers should always be declared as final • riverpod_final_provider
  test/goldens/final_provider.dart:13:5 • Providers should always be declared as final • riverpod_final_provider
  test/goldens/final_provider.dart:15:42 • Providers should always be declared as final • riverpod_final_provider
  test/goldens/read_vs_watch.dart:10:3 • Avoid using ref.read inside the build method of widgets/providers. • riverpod_avoid_read_inside_build
  test/goldens/read_vs_watch.dart:13:5 • Avoid using ref.watch outside the build method of widgets/providers. • riverpod_avoid_watch_outside_build
  test/goldens/read_vs_watch.dart:18:5 • Avoid using ref.watch outside the build method of widgets/providers. • riverpod_avoid_watch_outside_build
  test/goldens/read_vs_watch.dart:26:5 • Avoid using ref.read inside the build method of widgets/providers. • riverpod_avoid_read_inside_build
  test/goldens/read_vs_watch.dart:29:7 • Avoid using ref.watch outside the build method of widgets/providers. • riverpod_avoid_watch_outside_build
  test/goldens/read_vs_watch.dart:34:7 • Avoid using ref.watch outside the build method of widgets/providers. • riverpod_avoid_watch_outside_build
  test/goldens/read_vs_watch.dart:45:5 • Avoid using ref.read inside the build method of widgets/providers. • riverpod_avoid_read_inside_build
  test/goldens/read_vs_watch.dart:48:7 • Avoid using ref.watch outside the build method of widgets/providers. • riverpod_avoid_watch_outside_build
  test/goldens/read_vs_watch.dart:53:7 • Avoid using ref.watch outside the build method of widgets/providers. • riverpod_avoid_watch_outside_build
  test/goldens/read_vs_watch.dart:65:5 • Avoid using ref.read inside the build method of widgets/providers. • riverpod_avoid_read_inside_build
  test/goldens/read_vs_watch.dart:69:7 • Avoid using ref.read inside the build method of widgets/providers. • riverpod_avoid_read_inside_build
  test/goldens/read_vs_watch.dart:75:9 • Avoid using ref.watch outside the build method of widgets/providers. • riverpod_avoid_watch_outside_build
  test/goldens/read_vs_watch.dart:85:5 • Avoid using ref.watch outside the build method of widgets/providers. • riverpod_avoid_watch_outside_build
  test/goldens/read_vs_watch.dart:94:5 • Avoid using ref.read inside the build method of widgets/providers. • riverpod_avoid_read_inside_build
  test/goldens/read_vs_watch.dart:98:7 • Avoid using ref.read inside the build method of widgets/providers. • riverpod_avoid_read_inside_build
  test/goldens/read_vs_watch.dart:104:9 • Avoid using ref.watch outside the build method of widgets/providers. • riverpod_avoid_watch_outside_build
  test/goldens/read_vs_watch.dart:114:5 • Avoid using ref.watch outside the build method of widgets/providers. • riverpod_avoid_watch_outside_build
  test/goldens/read_vs_watch.dart:121:5 • Avoid using ref.watch outside the build method of widgets/providers. • riverpod_avoid_watch_outside_build
  test/goldens/read_vs_watch.dart:128:5 • Avoid using ref.watch outside the build method of widgets/providers. • riverpod_avoid_watch_outside_build
''');
  });
}
