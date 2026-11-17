import 'package:material_ui/material_ui.dart';

class LeftDrawer extends StatelessWidget
{
    const LeftDrawer({super.key});

    @override
    Widget build(BuildContext context)
    {
        return Drawer
        (
            child: ListView
            (
                children: 
                [
                    const DrawerHeader(child: Text("MyPortofolio Options")),
                    ListTile
                    (
                      leading: const Icon(Icons.home_outlined),
                      title: const Text('Home'),
                      onTap: () 
                      {
                        Navigator.pushReplacement
                        (
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyHomePage(),
                          ),
                        );
                      },
                    ),
                    ListTile
                    (
                      leading: const Icon(Icons.add_circle_outline),
                      title: const Text('Add Project'),
                      onTap: () 
                      {
                        Navigator.pushReplacement
                        (
                          context,
                          MaterialPageRoute
                          (
                            builder: (context) => const ProjectFormPage(),
                            ),
                        );
                      },
                    ),
                ],
            )
        );
    }
}
