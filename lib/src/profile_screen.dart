import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.grey[100],
    appBar: AppBar(
      backgroundColor: Colors.white,
      title: Text("Профиль", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
      elevation: 0,
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Hе указонно что рисовать'),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage("https://img.freepik.com/free-photo/abstract-background-with-low-poly-design_1048-8478.jpg?t=st=1739280296~exp=1739283896~hmac=4f300f77f8957b40194606e7cc42e9d6c3cd59e32b011f19cdf9b592e52cd34e&w=2000"),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Kevin Lanceplaine",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "+998 99 123 45 57",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.edit, color: Colors.grey),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),

            Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            margin: EdgeInsets.only(bottom: 8),
            child: _buildMenuItem(
              icon: Icons.account_balance_wallet,
              text: "Кошелек",
              trailingText: "247 700 000 сум",
              iconColor: Colors.purple,
            ),
            ),
            SizedBox(height: 12),

            Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            margin: EdgeInsets.only(bottom: 8),
            child: Column(
              children: [
                _buildMenuItem(
              icon: Icons.settings,
              text: "Настройки",
              iconColor: Colors.purple,
            ),
            Divider(
              indent: 55,
              thickness: .4,
            ),
            _buildMenuItem(
              icon: Icons.support_agent,
              text: "Служба поддержки",
              iconColor: Colors.purple,
            ),
             Divider(
               indent: 55,
               thickness: .4,
             ),
                _buildMenuItem(
              icon: Icons.description,
              text: "Условия использования",
              iconColor: Colors.purple,
            ),
             Divider(
               indent: 55,
               thickness: .4,
             ),
                _buildMenuItem(
              icon: Icons.info,
              text: "О нас",
              iconColor: Colors.purple,
            ),

              ],
            )),

            SizedBox(height: 12),

      Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.only(bottom: 8),
        child: _buildMenuItem(
              icon: Icons.logout,
              text: "Выйти из аккаунта",
              iconColor: Colors.red,
              textColor: Colors.red,
            ),
      )
          ],
        ),
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
    onTap: (){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Hе указонно что рисовать'),
        ),
      );
    },
    child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: iconColor),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 16, color: textColor),
            ),
          ),
          if (trailingText != null)
            Text(trailingText, style: TextStyle(color: Colors.grey)),
          if (trailingText == null) Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
    ),
  );
}
}