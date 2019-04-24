class FCollectionUtils {
  FCollectionUtils._();

  static List<T> joinItem<T>(Iterable<T> iterable, T item) {
    return join(iterable, (a1, a2) {
      return item;
    });
  }

  static List<T> join<T>(
      Iterable<T> iterable, T joinProvider(T item, int index)) {
    assert(iterable != null);
    assert(joinProvider != null);

    if (iterable.length <= 1) {
      return iterable;
    }

    final List<T> listJoin = [];
    final Iterator<T> it = iterable.iterator;

    int index = 0;
    while (it.moveNext()) {
      final T current = it.current;
      listJoin.add(current);
      if (index < iterable.length - 1) {
        listJoin.add(joinProvider(current, index));
      }
      index++;
    }
    return listJoin;
  }
}
