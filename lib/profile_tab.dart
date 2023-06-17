import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_screen.dart';

class ProfileTab extends StatefulWidget {
  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  String fullName = '';
  String email = '';
  String gender = '';
  String selectedGender = '';
  String kelas = '';
  String school = '';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void saveData() {
    if (_formKey.currentState!.validate()) {
      // Save data to storage or other data source
      // You can modify this logic as needed
      setState(() {
        fullName = fullNameController.text;
        email = emailController.text;
        gender = selectedGender;
        kelas = kelasController.text;
        school = schoolController.text;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Data berhasil disimpan')),
      );
    }
  }

  void updateData() {
    if (_formKey.currentState!.validate()) {
      // Update data in storage or other data source
      // You can modify this logic as needed
      setState(() {
        fullName = fullNameController.text;
        email = emailController.text;
        gender = selectedGender;
        kelas = kelasController.text;
        school = schoolController.text;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Data berhasil diperbarui')),
      );
    }
  }

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController kelasController = TextEditingController();
  TextEditingController schoolController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Fill the controllers with previously saved data
    fullNameController.text = fullName;
    emailController.text = email;
    kelasController.text = kelas;
    schoolController.text = school;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://png.pngtree.com/png-clipart/20221025/ourmid/pngtree-anak-smp-berdiri-memasukkan-2-tangan-ke-saku-png-image_6386843.png',
                  ),
                  radius: 50,
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: fullNameController,
                  decoration: InputDecoration(
                    labelText: 'Nama Lengkap',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama Lengkap harus diisi';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email harus diisi';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                Text('Jenis Kelamin'),
                Row(
                  children: [
                    Radio<String>(
                      value: 'Laki-laki',
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value!;
                        });
                      },
                    ),
                    Text('Laki-laki'),
                    SizedBox(width: 16),
                    Radio<String>(
                      value: 'Perempuan',
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value!;
                        });
                      },
                    ),
                    Text('Perempuan'),
                  ],
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: kelasController,
                  decoration: InputDecoration(
                    labelText: 'Kelas',
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: schoolController,
                  decoration: InputDecoration(
                    labelText: 'Sekolah',
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (fullName.isEmpty && email.isEmpty) {
                        saveData();
                      } else {
                        updateData();
                      }
                    }
                  },
                  child: Text(fullName.isEmpty && email.isEmpty ? 'Simpan Data' : 'Perbarui Data'),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.offAll(() => LoginScreen());
        },
        child: Icon(Icons.logout),
      ),
    );
  }
}
