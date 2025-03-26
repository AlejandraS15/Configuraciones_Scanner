import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Configuraciones',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const SettingsScreen(),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuraciones'),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 10),

          const _SectionTitle(title: "Cuenta"),
          ListTile(
            leading: const Icon(Icons.person, color: Color(0xFF0FEB58)),
            title: const Text('Mi Perfil'),
            subtitle: const Text('Editar información personal'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EditProfileScreen()),
            );
            },
          ),

          const Divider(),

          const _SectionTitle(title: "General"),
          ListTile(
            leading: const Icon(Icons.settings, color: Color(0xFF0FEB58)),
            title: const Text('Ajustes generales'),
            subtitle: const Text('Idioma, notificaciones'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Crear una clase para general y direccionar general desde aqui (Alejo o Sara)
            },
          ),

          ListTile(
            leading: const Icon(Icons.lock, color: Color(0xFF0FEB58)),
            title: const Text('Privacidad'),
            subtitle: const Text('Contraseña'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Crear una clase y direccionar privacidad desde aca (Alejo o Sara)
            },
          ),

          const Divider(),

          const _SectionTitle(title: "Más"),
          ListTile(
            leading: const Icon(Icons.info, color: Color(0xFF0FEB58)),
            title: const Text('Acerca de'),
            subtitle: const Text('Modo de uso (o nose, aqui ponemos lo que nos falte)'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Aqui quiero poner como un instructivo de como utilizar la app
            },
          ),

          ListTile(
            leading: const Icon(Icons.exit_to_app, color: Colors.red),
            title: const Text('Cerrar sesión', style: TextStyle(color: Colors.red)),
            onTap: () {
              // Preguntar a Alejo que hizo inicio de seccion
            },
          ),
        ],
      ),
    );
  }
}

// Títulos de las secciones
class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    );
  }
}

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

//Editar perfil
class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Al iniciar sesion que aqui se guarden los datos del usuario
    nameController.text = "Aleja";
    lastNameController.text = "Suarez";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Editar Perfil")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Editar imagen de perfil
            GestureDetector(
              onTap: () {
                // Buscar logica para cambiar foto de perfil y que se guarde
              },
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage("https://via.placeholder.com/150"),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(Icons.camera_alt, color: Color.fromARGB(178, 46, 5, 151)),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Campo para Nombre
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Nombre"),
            ),
            SizedBox(height: 10),

            // Campo para Apellido
            TextField(
              controller: lastNameController,
              decoration: InputDecoration(labelText: "Apellido"),
            ),
            SizedBox(height: 20),

            // Botón para guardar cambios
            ElevatedButton(
              onPressed: () {
                // Que al darle guardar cambios los datos se actualicen en supabase
                print("Nombre: ${nameController.text}, Apellido: ${lastNameController.text}");
                Navigator.pop(context); // Al guardar cambios se vuelve a la pantalla anterior
              },
              child: Text("Guardar Cambios"),
            ),
          ],
        ),
      ),
    );
  }
}






