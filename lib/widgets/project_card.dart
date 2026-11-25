import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/screens/menu.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:myportofolio_mobile/widgets/auth_guard.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ItemCard extends StatelessWidget 
{
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) 
  {
    return Material
    (
      // Menggunakan warna sekunder dari skema tema aplikasi.
      color: item.color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell
      (
        // Aksi ketika kartu ditekan oleh pengguna.
        onTap: () async 
        {
          // Menampilkan SnackBar dengan pesan interaktif.
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar
            (
              SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
            );
          if (item.name == "Tambah Proyek")
          {
            final allowed = await ensureLoggedIn(context);
            if (!context.mounted || !allowed) return;
            context.go("/add-project");
          }
          if (item.name == "Tambah Pengalaman")
          {
            context.go("/add-experience");
          }
          if (item.name == "Logout")
          {
            final authState = context.read<AuthState>();
            if (!authState.isLoggedIn)
            {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar
                (
                  const SnackBar(content: Text("Kamu belum login."))
                );
              return;
            }
            await authState.logout();
            if (!context.mounted) return;
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar
              (
                const SnackBar(content: Text("Berhasil logout!"))
              );
          }
        },
        child: Container
        (
          padding: const EdgeInsets.all(8),
          child: Center
          (
            child: Column
            (
              mainAxisAlignment: MainAxisAlignment.center,
              children: 
              [
                Icon
                (
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text
                (
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
