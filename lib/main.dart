import 'package:flutter/material.dart';
import 'package:undostres_playground/view2.dart' deferred as view2;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Click here to go second view',
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to View2
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ViewPage2()),
                );
              },
              child: Text('Go to View 2'),
            ),
          ],
        ),
      ),
    );
  }
}

class ViewPage2 extends StatefulWidget {
  const ViewPage2({super.key});

  @override
  _ViewPage2State createState() => _ViewPage2State();
}

class _ViewPage2State extends State<ViewPage2> {
  late Future<void> _libraryFuture;

  @override
  void initState() {
    super.initState();
    try {
      _libraryFuture = view2.loadLibrary();
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _libraryFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          try {
            return view2.View2();
          } catch (e) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Error'),
              ),
              body: Center(
                child: Text('Error: $e'), // Display image from assets
              ),
            );

          }
        }
        return Scaffold(
          appBar: AppBar(
            title: Text('View 2 Loading'),
          ),
          body: Center(
            child: CircularProgressIndicator(), // Display image from assets
          ),
        );
      },
    );
  }
}
