<template>
  <div class="max-w-2xl mx-auto py-2 px-2 sm:px-4 lg:px-2">
    <div class="relative">
      <blockquote class="mt-10">
        <div class="max-w-3xl mx-auto text-center text-2xl leading-9 font-medium text-gray-900">
          <p>
            VueJS gRPC Client
          </p>
        </div>
      </blockquote>
    </div>
    <Form
      :task-name="nameTask"
      v-model:name-task.sync="nameTask"
      :add-todo="addTodo"
    />
    <List
      :todo-list="todoList"
      :deleteTodo="deleteTodo"
    />
  </div>
</template>

<script>
import Form from './components/Form.vue'
import List from './components/List.vue'

import { addTodoParams, getTodoParams, deleteTodoParams } from "main_pb";
import { todoServiceClient } from "main_grpc_web_pb";

export default {
  name: 'App',
  components: {
    Form,
    List
  },
  data: function() {
    return {
      nameTask: "",
      todoList: []
    };
  },
  created: function() {
    this.client = new todoServiceClient("http://localhost:8080", null, null);
    this.getTodoList();
  },
  methods: {
    getTodoList: function() {
      let getRequest = new getTodoParams();
      this.client.getTodos(getRequest, {}, (err, response) => {
        this.todoList = response.toObject().todosList;
      });
    },
    addTodo: function() {
      let request = new addTodoParams();
      request.setTask(this.nameTask);
      this.client.addTodo(request, {}, () => {
        this.nameTask = "";
        this.getTodoList();
      });
    },
    deleteTodo: function(todo) {
      let deleteRequest = new deleteTodoParams();
      deleteRequest.setId(todo.id);
      this.client.deleteTodo(deleteRequest, {}, (err, response) => {
        if (response.getMessage() === "success") {
          this.getTodoList();
        }
      });
    }
  }
}
</script>

