import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:myportofolio_mobile/screens/experience_form.dart';
import 'package:myportofolio_mobile/screens/menu.dart';
import 'package:myportofolio_mobile/screens/project_form.dart';

final GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return MyHomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'add-project',
          builder: (BuildContext context, GoRouterState state) {
            return ProjectFormPage();
          },
        ),
        GoRoute
        (
            path: 'add-experience',
            builder: (BuildContext context, GoRouterState state) {return ExperienceFormPage();}
        )
      ],
    ),
  ],
);
