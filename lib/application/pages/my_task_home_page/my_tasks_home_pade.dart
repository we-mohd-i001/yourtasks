import 'package:flutter/material.dart';
import 'package:yourtasks/application/pages/my_task_home_page/widgets/app_name.dart';

class MyTaskHomePage extends StatelessWidget {
  static const String routePath = '/home';
  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routePath),
      builder: (_) => const MyTaskHomePage(),
    );
  }
  const MyTaskHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            AppName()
          ],),
        ),
      ),
    );
  }
}
