import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  

  bool isDataComplete = false;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    nameController.addListener(updateDataCompleteState);
    emailController.addListener(updateDataCompleteState);
    phoneController.addListener(updateDataCompleteState);
    addressController.addListener(updateDataCompleteState);
    ageController.addListener(updateDataCompleteState);
    countryController.addListener(updateDataCompleteState);
    cityController.addListener(updateDataCompleteState);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    ageController.dispose();
    countryController.dispose();
    cityController.dispose();
    super.dispose();
  }

  void updateDataCompleteState() {
    setState(() {
      isDataComplete = nameController.text.isNotEmpty &&
          emailController.text.isNotEmpty &&
          phoneController.text.isNotEmpty &&
          addressController.text.isNotEmpty &&
          ageController.text.isNotEmpty &&
          countryController.text.isNotEmpty &&
          cityController.text.isNotEmpty;
    });
  }

  void clearTextFields() {
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    addressController.clear();
    ageController.clear();
    countryController.clear();
    cityController.clear();
    setState(() {
      isDataComplete = false;
    });
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<Widget> _screens = [
    HomeScreen(),
    NotificationsScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'The save button will appear after you fill in all the data',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 16),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone',
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: addressController,
                decoration: InputDecoration(
                  labelText: 'Address',
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: ageController,
                decoration: InputDecoration(
                  labelText: 'Age',
                ),
              ),
             
              SizedBox(height: 16),
              TextField(
                controller: countryController,
                decoration: InputDecoration(
                  labelText: 'Country',
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: cityController,
                decoration: InputDecoration(
                  labelText: 'City',
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: isDataComplete ? clearTextFields : null,
                    child: Text('Clear'),
                  ),
                  SizedBox(width: 16),
                  Visibility(
                    visible: isDataComplete,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/menu_profile',
                            arguments: {
                              'name': nameController.text,
                              'email': emailController.text,
                              'phone': phoneController.text,
                              'address': addressController.text,
                              'age': ageController.text,
                              'country': countryController.text,
                              'city': cityController.text,
                            });
                      },
                      child: Text('Save'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Home Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Notifications Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Settings Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
