import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

import 'Constants/user.dart';

class PhoneNumber extends StatelessWidget {
  List<User> users = allUsers;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Calls'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return buildUserListTile(user);
          }),
    );
  }

  Widget buildButton() {
    final number = '+918910902078';
    return ListTile(
      title: Text('Anirban'),
      subtitle: Text(number),
      leading: CircleAvatar(
        backgroundImage: NetworkImage('https://unsplash.com/human'),
      ),
      trailing: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          shape: RoundedRectangleBorder(side: BorderSide(color: Colors.blue)),
        ),
        child: Text('Call'),
        onPressed: () async {
          launch('tel://$number');

          await FlutterPhoneDirectCaller.callNumber(number);
        },
      ),
    );
  }

  Widget buildUserListTile(User user) {
    return TextButton(
      onPressed: () async {
        launch('tel://$user.number');

        await FlutterPhoneDirectCaller.callNumber(user.number);
      },
      child: ListTile(
          contentPadding: const EdgeInsets.all(16),
          title: Text(user.name),
          subtitle: Text(user.number),
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
              'https://unsplash.com/profile',
            ),
          )),
    );
  }
}