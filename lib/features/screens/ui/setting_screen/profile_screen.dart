import 'package:flutter/material.dart';
import 'package:food_app/features/screens/ui/setting_screen/setting_screen_widget/build_state_item.dart';
import 'package:food_app/features/screens/ui/setting_screen/setting_screen_widget/menu_item_column.dart';
import 'package:food_app/features/screens/ui/setting_screen/setting_screen_widget/profile_image_stack.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/font_weight.dart';

/// The main profile / settings screen.
///
/// Displays the user's avatar, name, email, quick stats
/// (recipes · saved · followers), and a list of menu actions
/// including log-out.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAE7E7),
      appBar: _buildAppBar(),
      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            _ProfileHeader(),
            _StatsRow(),
            _MenuSection(),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
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
    );
  }
}

// ---------------------------------------------------------------------------
// Private sub-widgets – kept in the same file because they are small,
// tightly-coupled to [ProfileScreen], and not reused elsewhere.
// ---------------------------------------------------------------------------

/// Avatar + name + email block.
class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(20),
        const ProfileImageStack(),
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
      ],
    );
  }
}

/// Recipes · Saved · Followers row.
class _StatsRow extends StatelessWidget {
  const _StatsRow();

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            const ProfileStatItem(value: '12', label: 'Recipes'),
            Container(width: 1, height: 40, color: Colors.grey[300]),
            const ProfileStatItem(value: '45', label: 'Saved'),
            Container(width: 1, height: 40, color: Colors.grey[300]),
            const ProfileStatItem(value: '128', label: 'Followers'),
          ],
        ),
      ),
    );
  }
}

/// Settings / action menu list.
class _MenuSection extends StatelessWidget {
  const _MenuSection();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 30, left: 20, right: 20),
      child: MenuItemColumn(),
    );
  }
}
