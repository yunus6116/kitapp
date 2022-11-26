import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

///Type of the boxes we have in the app
enum BoxType { generalBox }

///All the keys we have in  the app to store in cache
enum BoxKey { seenOnboardingPages }

class _CacheManager {
  late Box box;

  _CacheManager() {
    box = Hive.box(BoxType.generalBox.name);
  }

  T? readFromBox<T>(BoxKey boxKey) {
    return box.get(boxKey.name);
  }

  Future<void> writeToBox<T>(BoxKey boxKey, T model) async {
    await box.put(boxKey.name, model);
  }

  Future<void> deleteFromBox(BoxKey boxKey) async {
    await box.delete(boxKey.name);
  }

  Future<void> clearBox() async {
    await box.clear();
  }
}

final cacheManagerProvider = Provider((_) => _CacheManager());
