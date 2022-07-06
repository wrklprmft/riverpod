import 'package:flutter/widgets.dart';

import 'internals.dart';

class ProviderContext extends InheritedWidget {
  const ProviderContext({super.key, required super.child});

  @override
  ProviderContextElement createElement() => ProviderContextElement(this);

  @override
  bool updateShouldNotify(covariant ProviderContext oldWidget) {
    return false;
  }
}

class ProviderContextElement extends InheritedElement {
  ProviderContextElement(super.widget);

  @override
  bool get clearDependencyOnRebuild => true;

  final _container = ProviderContainer();

  @override
  Map<ProviderListenable, ProviderSubscription<Object?>>? getDependencies(
      Element dependent) {
    return super.getDependencies(dependent)
        as Map<ProviderListenable, ProviderSubscription<Object?>>?;
  }

  T _watch<T>(ProviderListenable<T> provider, Element dependent) {
    dependent.dependOnInheritedElement(this, aspect: provider);

    return getDependencies(dependent)![provider]!.read() as T;
  }

  @override
  @protected
  void updateDependencies(
    Element dependent,
    covariant ProviderListenable<Object?> key,
  ) {
    var deps = getDependencies(dependent);

    if (deps == null) {
      deps = {};
      setDependencies(dependent, deps);
    }

    deps.putIfAbsent(key, () {
      void listener(Object? prev, Object? next) => dependent.markNeedsBuild();

      final sub = _container.listen<Object?>(key, listener);
      return sub;
    });
  }

  @override
  @protected
  void removeDependencies(Element dependent) {
    final subs = getDependencies(dependent);
    if (subs != null) {
      super.removeDependencies(dependent);
      for (final sub in subs.values) {
        sub.close();
      }
    }
  }

  @override
  void unmount() {
    _container.dispose();
    super.unmount();
  }
}

///
extension RiverpodContext on BuildContext {
  T watch<T>(ProviderListenable<T> provider) {
    final element = getElementForInheritedWidgetOfExactType<ProviderContext>()!
        as ProviderContextElement;

    return element._watch(provider, this as Element);
  }

  T read<T>(ProviderBase<T> provider) {
    final element = getElementForInheritedWidgetOfExactType<ProviderContext>()!
        as ProviderContextElement;

    return element._container.read(provider);
  }
}
