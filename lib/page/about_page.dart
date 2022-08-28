import 'package:flutter/material.dart';
import 'package:hi_flutter/hi_flutter.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => AboutPageState();
}

class AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    // // var settings = ModalRoute.of(context)?.settings;
    // var settings = context.settings;
    // var name = settings?.name;
    // var arguments = settings?.arguments;
    // log('settings = $settings, name = $name, arguments = $arguments');
    // return Scaffold(
    //   appBar: AppBar(title: Text(S.of(context).about)),
    //   body: Center(child: Text(S.of(context).about)),
    // );
    return Container(
      color: '#DA70D6'.color,
    );
  }
}
