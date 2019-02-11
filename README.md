# Server Simulator

This is a starting template for a server simulator inside a flutter app.  
It allows developers to fake server responses inside their app without having to implement the backend.  
By using the server simulator, developers can write their code as if their were actually communicating 
with the server early in the developing stages.

## How to use
What you'll need from this project is three files located under the `lib` directory :
```
api.dart
fake_http.dart
response.dart
```

* Copy these files to your project.
* Implement the methods you need inside the API class.
* And that's all! Now you can call FakeHttp() instead of http and get back your response!

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.io/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.io/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
