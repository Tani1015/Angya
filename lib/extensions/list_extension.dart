//Listのモデル<E>を反復で中を見ていきEmptyならcache Error
extension EmptyOnErroe<E> on Future<List<Iterable<E>>> {
  Future<List<Iterable<E>>> emptyOnError() => catchError(
    List<Iterable<E>>.empty,
  );
}
