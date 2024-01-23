import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:luzergia_solar_app/styles/app_styles.dart';
import 'package:luzergia_solar_app/widgets/custom_navigation_bar.dart';

import '../widgets/custom_appbar.dart';
import '../widgets/custom_header.dart';
import 'data_graphs.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final int _selectedIndex = 3;
  final NavigationService _navigationService = NavigationService();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  bool _isEditing = false;
  String? _avatarUrl;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _addressController = TextEditingController();
    _loadUserData();
    _loadAvatarUrl();
  }

  void _loadUserData() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      final data = doc.data();
      if (data != null) {
        _nameController.text = data['name'] ?? '';
        _phoneController.text = data['phone'] ?? '';
        _addressController.text = data['address'] ?? '';
        _avatarUrl = data['avatarUrl'] ?? '';
      }
    }
  }

  void _saveUserData() async {
    final String name = _nameController.text;
    final String phone = _phoneController.text;
    final String address = _addressController.text;

    if (name.isEmpty || phone.isEmpty || address.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Todos los campos son necesarios')),
      );
      return;
    }

    try {
      final userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId != null) {
        await FirebaseFirestore.instance.collection('users').doc(userId).set({
          'name': name,
          'phone': phone,
          'address': address,
        }, SetOptions(merge: true));

        if (!mounted) return;
        setState(() => _isEditing = false);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Datos guardados con éxito')),
        );
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al guardar los datos: $e')),
      );
    }
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _uploadImage(File(pickedFile.path));
    }
  }

  Future<void> _uploadImage(File image) async {
    try {
      final userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId == null) return;

      final storageRef =
          FirebaseStorage.instance.ref().child('user_avatars/$userId');
      await storageRef.putFile(image);

      final imageUrl = await storageRef.getDownloadURL();
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .update({'avatarUrl': imageUrl});

      // Оновлення UI
      setState(() {
        _avatarUrl = imageUrl;
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No hemos podido cargar la imagen')),
        );
      }
    }
  }

  void _loadAvatarUrl() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      final data = doc.data();
      if (data != null) {
        setState(() {
          _avatarUrl = data['avatarUrl'] as String?;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: AppStyles.ashGrey,
                  backgroundImage:
                      _avatarUrl != null ? NetworkImage(_avatarUrl!) : null,
                  child: _avatarUrl == null
                      ? Icon(Icons.person,
                          size: 50, color: Colors.grey.shade600)
                      : null,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Nombre y Apellido',
                    labelStyle: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge?.color)),
                controller: _nameController,
                enabled: _isEditing,
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Número de teléfono',
                    labelStyle: TextStyle(
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    )),
                controller: _phoneController,
                enabled: _isEditing,
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Domicilio',
                    labelStyle: TextStyle(
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    )),
                controller: _addressController,
                enabled: _isEditing,
              ),
              const SizedBox(height: 50),
              SwitchListTile(
                title: Text(
                  'Dark Mode',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ),
                value: AdaptiveTheme.of(context).mode.isDark,
                onChanged: (bool value) {
                  if (value) {
                    AdaptiveTheme.of(context).setDark();
                  } else {
                    AdaptiveTheme.of(context).setLight();
                  }
                },
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (_isEditing) {
                            _loadUserData();
                          }
                          _isEditing = !_isEditing;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppStyles.pantone2,
                          foregroundColor: AppStyles.pantone1),
                      child: Text(_isEditing ? 'Cancelar' : 'Editar',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith()),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _isEditing ? _saveUserData : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppStyles.pantone2,
                        foregroundColor: AppStyles.pantone1,
                        disabledBackgroundColor: AppStyles.ashGrey,
                        disabledForegroundColor: AppStyles.ashGrey,
                      ),
                      child: Text('Guardar',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith()),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () async {
                  final contextCopy = context;
                  await FirebaseAuth.instance.signOut();

                  if (mounted) {
                    Navigator.of(contextCopy).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => SignInScreen(
                          headerBuilder: (context, constraints, _) {
                            return const CustomHeader();
                          },
                          providers: [EmailAuthProvider()],
                          actions: [
                            AuthStateChangeAction<SignedIn>((context, state) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DataGraphsScreen()));
                            }),
                            AuthStateChangeAction<UserCreated>(
                                (context, state) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DataGraphsScreen()));
                            }),
                          ],
                        ),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppStyles.pantone2,
                    foregroundColor: AppStyles.pantone1),
                child: Text('Cerrar sesión',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith()),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => _navigationService.navigateToScreen(index, context),
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update),
            label: 'Update',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            label: 'Help desk',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
