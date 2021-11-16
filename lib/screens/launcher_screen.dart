import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/* Routes Menú */
import 'package:animations_app/routes/routes.dart';

class LauncherScreen extends StatelessWidget {
  const LauncherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Hola Mundo'),
        backgroundColor: Colors.blue,
      ),
      drawer: _MenuPrincipal(),
      body: _ListaOpciones(),
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  const _ListaOpciones({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, index) => Divider(color: Colors.white),
      itemCount: pageRoutes.length,
      itemBuilder: (context, index) => ListTile(
        leading: FaIcon(pageRoutes[index].icon, color: Colors.blue),
        title: Text(pageRoutes[index].titulo),
        trailing: Icon(Icons.chevron_right, color: Colors.blue),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => pageRoutes[index].screen));
        },
      ),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  const _MenuPrincipal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                height: 200,
                width: double.infinity,
                // padding: EdgeInsets.all(20),
                child: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text(
                    'DF',
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ),
              ),
            ),
            Expanded(
              child: _ListaOpciones(),
            ),
            ListTile(
              leading: Icon(Icons.lightbulb_outline, color: Colors.lightGreen),
              title: Text('Dark Mode'),
              trailing: Switch.adaptive(
                value: true,
                activeColor: Colors.blue,
                onChanged: (value) {},
              ),
            ),
            ListTile(
              leading: Icon(Icons.add_to_home_screen, color: Colors.lightGreen),
              title: Text('Custome Theme'),
              trailing: Switch.adaptive(
                value: true,
                activeColor: Colors.blue,
                onChanged: (value) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
