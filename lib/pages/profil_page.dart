import 'package:flutter/material.dart';
import 'package:to_do_list_flutter/pages/widgets/navigation_bar.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Text('Page de profil'),
      bottomNavigationBar: NavigationBarApp(context: context, page: 'profil'),
    );
  }
}
