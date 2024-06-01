import 'package:flutter/material.dart';

class EchoUserSearchScreen extends StatefulWidget {
  @override
  _EchoUserSearchScreenState createState() => _EchoUserSearchScreenState();
}

class _EchoUserSearchScreenState extends State<EchoUserSearchScreen> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Use WidgetsBinding.instance.addPostFrameCallback to ensure the focus request
    // is made after the widget tree is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Auto Focus TextField'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          focusNode: _focusNode,
          decoration: InputDecoration(
            labelText: 'Enter text here',
          ),
        ),
      ),
    );
  }
}
