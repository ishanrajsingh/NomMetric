import 'package:flutter/material.dart';

class ProfileScreenKrishna extends StatelessWidget {
  const ProfileScreenKrishna({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7), // Light grey background
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- Header Section (Avatar & Name) ---
            Container(
              padding: const EdgeInsets.only(top: 80, bottom: 40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 5,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Center(
                child: Column(
                  children: [
                    // Avatar with a border
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.blue.shade100,
                          width: 3,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.blue.shade50,
                        child: Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.blue.shade400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Name
                    const Text(
                      "Krishna Sikheirya",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2D3142),
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Email
                    Text(
                      "krishna.s@example.com",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // --- Options List ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildProfileOption(
                    icon: Icons.person_outline_rounded,
                    title: "Edit Profile",
                    subtitle: "Update your personal details",
                  ),
                  _buildProfileOption(
                    icon: Icons.settings_outlined,
                    title: "Settings",
                    subtitle: "Notifications, privacy, and more",
                  ),
                  _buildProfileOption(
                    icon: Icons.help_outline_rounded,
                    title: "Help & Support",
                    subtitle: "FAQs and contact support",
                  ),
                  const SizedBox(height: 20),
                  _buildProfileOption(
                    icon: Icons.logout_rounded,
                    title: "Logout",
                    isDestructive: true, // Special styling for logout
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget to build the list tiles neatly
  Widget _buildProfileOption({
    required IconData icon,
    required String title,
    String? subtitle,
    bool isDestructive = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isDestructive
                ? Colors.red.withOpacity(0.1)
                : Colors.blue.withOpacity(0.05),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: isDestructive ? Colors.red : Colors.blue,
            size: 22,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: isDestructive ? Colors.red : const Color(0xFF2D3142),
          ),
        ),
        subtitle: subtitle != null
            ? Text(
                subtitle,
                style: TextStyle(fontSize: 13, color: Colors.grey[500]),
              )
            : null,
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          size: 16,
          color: Colors.grey[300],
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        onTap: () {
          // Placeholder for future logic
        },
      ),
    );
  }
}
