import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Title of Apps'),
        debugShowCheckedModeBanner: false);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//765EFC
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 10,
        backgroundColor: const Color(0xFF765EFC),
        leading: Container(
          padding: const EdgeInsets.all(5),
          child: Image.asset('assets/images/logo.png'),
        ),
        actions: [
          PopupMenuButton(
              icon: const Icon(Icons.more_horiz),
              offset: const Offset(0, 40),
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Row(
                        children: [
                          const Icon(Icons.help_outline, color: Colors.black87),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: const Text("Help"),
                          ),
                        ],
                      ),
                      onTap: () async {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Help'),
                        ));
                      },
                    ),
                    PopupMenuItem(
                      child: Row(
                        children: [
                          const Icon(Icons.language, color: Colors.black87),
                          Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: Text("Language")),
                        ],
                      ),
                      onTap: () async {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Language'),
                        ));
                      },
                    ),
                    PopupMenuItem(
                      child: Row(
                        children: [
                          const Icon(Icons.settings, color: Colors.black87),
                          Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: Text("Setting")),
                        ],
                      ),
                      onTap: () async {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Setting'),
                        ));
                      },
                    ),
                  ])
        ],
      ),
      body: const Center(
        child: Text(
          'Hi, We are Flutter Dev',
          style: TextStyle(
            color: Colors.red,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
