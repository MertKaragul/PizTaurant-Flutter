
abstract class IDatabase<T>{
  Future open();
  Future close();
  void insert(T t);
  void delete(T t);
  void update(T t);
  Stream<List<T>> getAllStream();
  Future<List<T>?> getAll();
}