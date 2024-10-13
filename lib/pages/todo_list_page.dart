import 'package:flutter/material.dart';
import 'package:tudo_list/models/todo.dart';

import '../widgets/todo_list_item.dart';

class TodoListPage extends StatefulWidget {
      TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
    final TextEditingController todoController = TextEditingController();

     List<Todo> todos= [];

    onDelete(Todo todo) {
      setState(() {
        todos.remove(todo);
      });
    }



      @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: todoController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Aicione uma tarefa',
                            hintText: 'Ex: Estudar Flutter',
                          ),
                        ),
                        ),
                        SizedBox(width: 8),
                      ElevatedButton(
                          onPressed: () {
                          String text = todoController.text;
                          setState(() {
                           Todo newTodo = Todo(
                               title: text,
                               dateTime : DateTime.now(),
                           );
                           todos.add(newTodo);
                          });
                          },
                          style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(14),
                          backgroundColor: Colors.cyanAccent
                           ),
                          child: Icon(
                          Icons.add,
                          size: 30,
                          ),
      
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Flexible(
                    child: ListView(
                    shrinkWrap: true ,
                    children: [
                       for(Todo todo in todos)
                        TodoListItem(
                          todo: todo,
                          onDelete: onDelete,
                        ),
                    ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Você possui ${todos.length} tarefas pendentes',
                        ),
                      ),
                      SizedBox(width:8),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(14),
                        backgroundColor: Colors.cyanAccent
                        ),
                        child: Text('Limpar tudo'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
              ),
        ),
    );


   }
}
