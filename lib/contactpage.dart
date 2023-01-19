import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nom',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return ' enter  nom';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'enter email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _messageController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Message',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return ' enter message';
                  }
                  return null;
                },
                maxLines: 4,
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final url =
                        'mailto:example@email.com?subject=Contact&body=Name:%20${_nameController.text}%0AEmail:%20${_emailController.text}%0AMessage:%20${_messageController.text}';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw ' $url';
                    }
                  }
                },
                child: Text('Envoyer '),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
