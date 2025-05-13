import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';
// import '../widgets/nav_bar.dart';

class ClientsScreen extends StatelessWidget {
  const ClientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // const NavBar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  // Stats Cards Row
                  Row(
                    children: [
                      _buildStatsCard(
                        'All Client',
                        '50,745',
                        '+2.5%',
                        Colors.deepPurple,
                        [0.2, 0.5, 0.3, 0.8, 0.6],
                      ),
                      const SizedBox(width: 16),
                      _buildStatsCard(
                        'New Client',
                        '30,856',
                        '+1.2%',
                        Colors.blue,
                        [0.3, 0.7, 0.5, 0.2, 0.6],
                      ),
                      const SizedBox(width: 16),
                      _buildStatsCard(
                        'Old Client',
                        '17,346',
                        '-0.8%',
                        Colors.red,
                        [0.8, 0.5, 0.3, 0.2, 0.1],
                      ),
                      const Spacer(),
                      // Ratings and Membership
                      _buildCircularStats(
                        '4.8',
                        'Ratings',
                        Colors.deepPurple,
                        0.8,
                      ),
                      const SizedBox(width: 16),
                      _buildCircularStats(
                        '7.5K',
                        'Membership',
                        Colors.deepPurple,
                        0.75,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Clients List Header
                  Row(
                    children: [
                      Text(
                        'Clients List',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      // Search Box
                      Container(
                        width: 200,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[100],
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search, size: 20),
                            hintText: 'Search',
                            hintStyle: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Filter Button
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.filter_list,
                              size: 18, color: Colors.black),
                          label: Text(
                            'Filter',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Clients Table
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          _buildClientListHeader(),
                          Expanded(
                            child: ListView(
                              children: [
                                _buildClientListItem(
                                  'Berlin Sanjana',
                                  '+1237896347',
                                  'berlin@gmail.com',
                                  '05 Nov 2024',
                                ),
                                _buildClientListItem(
                                  'Prakash',
                                  '+1234789247',
                                  'prakash@gmail.com',
                                  '05 Feb 2024',
                                ),
                                _buildClientListItem(
                                  'Jenifer',
                                  '+1237896247',
                                  'jen23@gmail.com',
                                  '02 Oct 2023',
                                ),
                                _buildClientListItem(
                                  'Maya',
                                  '+1237896407',
                                  'Maya@gmail.com',
                                  '25 Aug 2023',
                                ),
                                _buildClientListItem(
                                  'Tonya',
                                  '+1237896047',
                                  'Tonya@gmail.com',
                                  '05 May 2023',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsCard(
    String title,
    String value,
    String percentage,
    Color color,
    List<double> chartData,
  ) {
    // Determine colors based on title
    Color cardColor;
    Color progressColor;
    double progressValue = 0.7;

    if (title == 'All Client') {
      cardColor = Colors.deepPurple;
      progressColor = Colors.pink;
      percentage = '52.2%';
    } else if (title == 'New Client') {
      cardColor = Colors.deepPurple;
      progressColor = Colors.green;
      percentage = '12.2%';
    } else if (title == 'Old Client' || title == 'Off Client') {
      cardColor = Colors.deepPurple;
      progressColor = Colors.red;
      percentage = '8.2%';
      title = 'Off Client';
      value = '17,346';
    }

    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.05),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    color: Colors.deepPurple,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Icon(Icons.more_horiz, color: Colors.grey),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              value,
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.w300,
                color: Colors.grey[400],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.arrow_upward,
                        color: Colors.white,
                        size: 14,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        percentage,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: title == 'All Client'
                    ? 0.7
                    : title == 'New Client'
                        ? 0.5
                        : 0.3,
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation<Color>(title == 'All Client'
                    ? Colors.pink
                    : title == 'New Client'
                        ? Colors.green
                        : Colors.red),
                minHeight: 6,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircularStats(
    String value,
    String label,
    Color color,
    double progress,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 70,
                height: 70,
                child: CircularProgressIndicator(
                  value: progress,
                  backgroundColor: color.withOpacity(0.1),
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                  strokeWidth: 10,
                ),
              ),
              Text(
                value,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: GoogleFonts.poppins(
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClientListHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      decoration: const BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Row(
        children: [
          SizedBox(width: 32),
          Expanded(
            flex: 2,
            child: Text(
              'Name',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Phone No',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Email',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Walk-in',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            child: Text(
              'Status',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClientListItem(
    String name,
    String phone,
    String email,
    String date,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
      ),
      child: Row(
        children: [
          Checkbox(
            value: false,
            onChanged: (value) {},
            activeColor: Colors.deepPurple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundImage: const AssetImage('assets/logo.png'),
                  backgroundColor: Colors.grey[300],
                ),
                const SizedBox(width: 8),
                Text(
                  name,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              phone,
              style: GoogleFonts.poppins(
                color: Colors.grey[700],
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              email,
              style: GoogleFonts.poppins(
                color: Colors.grey[700],
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              date,
              style: GoogleFonts.poppins(
                color: Colors.grey[700],
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            child: IconButton(
              icon: const Icon(Icons.more_horiz),
              onPressed: () {},
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
