import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

//765EFC
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Title'),
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
          'Hi, Home Page',
          style: TextStyle(
            color: Colors.red,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
