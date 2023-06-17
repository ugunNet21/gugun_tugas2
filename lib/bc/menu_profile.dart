import 'package:flutter/material.dart';

class MenuProfile extends StatelessWidget {
  final String profileImageUrl =
      'https://scontent.fcgk37-2.fna.fbcdn.net/v/t1.6435-9/57345632_1550678418396894_3048312914751520768_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeFJjGhWsyaw6G7TcoklgSUClEpJPvWVvUaUSkk-9ZW9Rg5h6CVr2lXSVjqn6oNPqyD04qMPl0aLvt8Ohl96bhw6&_nc_ohc=4pSdmF8QngYAX-pY4ch&_nc_ht=scontent.fcgk37-2.fna&oh=00_AfAgCdBHF9Wa7Bn9fOyp_Hfk2OzsXuSsvnFCtmpSz8YKMg&oe=64B37ADC';

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    String name = args?['name'] ?? '';
    
    String email = args?['email'] ?? '';
    String phone = args?['phone'] ?? '';
    String address = args?['address'] ?? '';
    String age = args?['age'] ?? '';
    String country= args?['country'] ?? '';
    String city = args?['city'] ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Profile'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 64,
                backgroundImage: NetworkImage(profileImageUrl),
              ),
              SizedBox(height: 16),
              Container(
                width: double.infinity,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Name: $name',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: double.infinity,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Email: $email',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: double.infinity,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Phone: $phone',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: double.infinity,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Address: $address',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: double.infinity,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Age: $age',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              
              SizedBox(height: 8),
              Container(
                width: double.infinity,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Country: $country',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: double.infinity,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'City: $city',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Go Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
