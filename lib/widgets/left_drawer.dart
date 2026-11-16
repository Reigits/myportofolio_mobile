import 'package:material_ui/material_ui.dart';

class LeftDrawer extends StatelessWidget
{
    const LeftDrawer({super.key})

    @override
    Widget build(BuildContext context)
    {
        return Drawer
        (
            child: ListView
            (
                children: 
                [
                    const DrawerHeader(child: Text("MyPortofolio Options"))
                ],
            )
        );
    }
}
