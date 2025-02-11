import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pittsburgh_task_ui/src/profile_screen.dart';

import 'map_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;


  final List<Widget> _screens = [
    MapScreen(),
    HistoryScreen(),
    ContactScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {


          showModalBottomSheet(
            backgroundColor: Colors.white,
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            builder: (context) {
              return SizedBox(
                height: 400,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    const Text("Станция 2", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const Text("Улица Мирзо Улугбекаб Ташкент", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300)),
                    const SizedBox(height: 15),

                      Container(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                          decoration: BoxDecoration(
                            color: Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          margin: EdgeInsets.only(bottom: 8),
                          child: Column(
                            children: [
                              _buildMenuItem(
                                icon: Icons.settings,
                                text: "А порт",
                                iconColor: Colors.purple,
                              ),
                              Divider(
                                thickness: .4,
                              ),
                              _buildMenuItem(
                                icon: Icons.support_agent,
                                text: "В порт",
                                iconColor: Colors.purple,
                              ),
                            ],
                          )),

                      Spacer(),

                      Center(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[200],
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 0,
                              minimumSize: const Size(double.infinity, 40),
                          ),
                          child: const Text(
                            'Выберите порт из списка',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 25),

                    ],
                  ),
                ),
              );
            },
          );


        },
        shape: CircleBorder(),
        backgroundColor: Colors.purpleAccent,
        child: Icon(Icons.directions_car, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          height: 75,
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.map, "Карта", 0),
            _buildNavItem(Icons.history, "История", 1),
             SizedBox(width: 8),
            _buildNavItem(Icons.chat, "Связь", 2),
            _buildNavItem(Icons.person, "Профиль", 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    bool isSelected = _selectedIndex == index;
    return InkWell(
      onTap: () => _onItemTapped(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: isSelected ? Colors.purple : Colors.grey),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.purple : Colors.grey,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildMenuItem({
    required IconData icon,
    required String text,
    Color iconColor = Colors.black,
    Color textColor = Colors.black,
    String? trailingText,
  }) {
    return GestureDetector(
      onTap: (){},
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 16, color: textColor, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(width: 16),
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Color(0xFFc0e0ff),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text("Свободен", style: TextStyle(color: Color(0xFF0880ff))),
          ),

        ],
      ),
    );
  }

}



class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Hе указонно что рисовать ", style: TextStyle(fontSize: 20))),
    );
  }
}

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Hе указонно что рисовать ", style: TextStyle(fontSize: 20))),
    );
  }
}
