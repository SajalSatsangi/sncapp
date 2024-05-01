import 'package:flutter/material.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your Groups',
      home: GroupsScreen(),
    );
  }
}

class GroupsScreen extends StatefulWidget {
  @override
  _GroupsScreenState createState() => _GroupsScreenState();
}

class _GroupsScreenState extends State<GroupsScreen> {
  final List<String> groups = [
    'MPG Activities',
    'Sant (Su)perman Activities',
    'Sant(Su)perman Activities (MPG)',
    'Satsang',
    'Youth Association Activities',
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Groups',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                "John Doe",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(""),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "JD",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home,
                  color: _selectedIndex == 0 ? Colors.green : null),
              title: Text(
                'Home',
                style: TextStyle(
                    color: _selectedIndex == 0 ? Colors.green : null,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(() {
                  _selectedIndex = 0;
                });
                // Navigate to Home page
                Navigator.pop(context);
              },
            ),
            // Other list tiles here
            //...
            ListTile(
              leading: Icon(Icons.list_alt,
                  color: _selectedIndex == 3 ? Colors.green : null),
              title: Text(
                "Today's Attendance Split",
                style: TextStyle(
                    color: _selectedIndex == 3 ? Colors.green : null,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(() {
                  _selectedIndex = 3;
                });
                // Navigate to Satsang page
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SatsangPage()),
                );
              },
            ),
            // Other list tiles here
            //...
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: groups.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(groups[index]),
            trailing: Icon(Icons.download),
            onTap: () {
              // Handle navigation for each group
              switch (index) {
                case 0:
                  // Navigation logic for MPG Activities
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MPGActivitiesPage()),
                  );
                  break;
                case 1:
                  // Navigation logic for Sant (Su)perman Activities
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SantSupermanActivitiesPage()),
                  );
                  break;
                case 2:
                  // Navigation logic for Sant(Su)perman Activities (MPG)
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SantSupermanMPGActivitiesPage()),
                  );
                  break;
                case 3:
                  // Navigation logic for Satsang
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SatsangPage()),
                  );
                  break;
                case 4:
                  // Navigation logic for Youth Association Activities
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => YouthAssociationActivitiesPage()),
                  );
                  break;
                default:
              }
            },
          );
        },
      ),
    );
  }
}

// Define separate pages for each option
class SatsangPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Satsang'),
      ),
      body: Center(
        child: Text('This is the Satsang Page'),
      ),
    );
  }
}

// Define other pages here
class MPGActivitiesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MPG Activities'),
      ),
      body: Center(
        child: Text('This is the MPG Activities Page'),
      ),
    );
  }
}

class SantSupermanActivitiesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sant (Su)perman Activities'),
      ),
      body: Center(
        child: Text('This is the Sant (Su)perman Activities Page'),
      ),
    );
  }
}

class SantSupermanMPGActivitiesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sant(Su)perman Activities (MPG)'),
      ),
      body: Center(
        child: Text('This is the Sant(Su)perman Activities (MPG) Page'),
      ),
    );
  }
}

class YouthAssociationActivitiesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Youth Association Activities'),
      ),
      body: Center(
        child: Text('This is the Youth Association Activities Page'),
      ),
    );
  }
}
