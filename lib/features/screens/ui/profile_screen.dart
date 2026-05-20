import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/theme/font_weight.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeae7e7),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Profile',
          style: GoogleFonts.montserrat(
            color: Colors.black87,
            fontWeight: FontWeightManger.fontWeightSemiBold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            verticalSpace(20),
            // Profile Header
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: .1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                      image: const DecorationImage(
                        image: NetworkImage(
                          'https://images.unsplash.com/photo-1577219491135-ce391730fb2c?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=60',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xffFF5722),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3),
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(16),
            Text(
              'Dev: Ahmed Elbadri',
              style: GoogleFonts.montserrat(
                fontSize: 24,
                fontWeight: FontWeightManger.fontWeightBold,
                color: Colors.black87,
              ),
            ),
            verticalSpace(4),
            Text(
              'aelbadri23@gmail.com',
              style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeightManger.fontWeightMedium,
                color: Colors.grey[600],
              ),
            ),
            verticalSpace(30),

            // Stats Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: .05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStatItem('12', 'Recipes'),
                    Container(width: 1, height: 40, color: Colors.grey[300]),
                    _buildStatItem('45', 'Saved'),
                    Container(width: 1, height: 40, color: Colors.grey[300]),
                    _buildStatItem('128', 'Followers'),
                  ],
                ),
              ),
            ),
            verticalSpace(30),

            // Menu List
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildMenuItem(
                    icon: Icons.person_outline,
                    title: 'Personal Details',
                    color: const Color(0xff4CAF50),
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    icon: Icons.notifications_none,
                    title: 'Notifications',
                    color: const Color(0xffFFC107),
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    icon: Icons.settings_outlined,
                    title: 'Settings',
                    color: Colors.blue,
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    icon: Icons.help_outline,
                    title: 'Help & Support',
                    color: Colors.purple,
                    onTap: () {},
                  ),
                  verticalSpace(20),
                  _buildMenuItem(
                    icon: Icons.logout,
                    title: 'Log Out',
                    color: Colors.red,
                    isLogout: true,
                    onTap: () {},
                  ),
                  verticalSpace(40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeightManger.fontWeightBold,
            color: const Color(0xffFF5722),
          ),
        ),
        verticalSpace(4),
        Text(
          label,
          style: GoogleFonts.montserrat(
            fontSize: 13,
            fontWeight: FontWeightManger.fontWeightMedium,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
    bool isLogout = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withValues(alpha: .1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        title: Text(
          title,
          style: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeightManger.fontWeightSemiBold,
            color: isLogout ? Colors.red : Colors.black87,
          ),
        ),
        trailing: isLogout
            ? null
            : const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18),
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
