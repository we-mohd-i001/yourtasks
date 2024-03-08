import 'package:flutter/material.dart';
import 'package:yourtasks/application/pages/my_task_home_page/my_tasks_home_pade.dart';

import '../views/pages/home.dart';
import '../views/pages/not_found.dart';
import '../views/pages/permission_denied.dart';
import '../views/pages/ui/index.dart';

final Map<String, Route<dynamic> Function()> routes = {
  '/': MyTaskHomePage.route,
  MyTaskHomePage.routePath: MyTaskHomePage.route,
  NotFoundPage.routePath: NotFoundPage.route,
  PermissionDeniedPage.routePath: PermissionDeniedPage.route,
  UIPage.routePath: UIPage.route,
};
