abstract class TodoRepository {
  Future<List<Todo>> getAllTodo();
  Future<Todo> getTodo();
  Future<Todo> createTodo(Todo todo);
  Future<Todo> updateTodo(Todo todo);
  Future<Todo> deleteTodo(Todo todo);
}

class Todo {}
