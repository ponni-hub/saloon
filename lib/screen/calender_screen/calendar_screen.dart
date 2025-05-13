import 'package:flutter/material.dart';
// import '../widgets/nav_bar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime selectedDate = DateTime.now();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _serviceController = TextEditingController();
  final TextEditingController _timingController = TextEditingController();
  bool showAppointmentForm = false;

  @override
  void dispose() {
    _nameController.dispose();
    _serviceController.dispose();
    _timingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top Navigation Bar
          // const NavBar(),
          // Calendar Content
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Calendar Section (70%)
                Expanded(
                  flex: 7,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Month Navigation
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'January 2025',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.chevron_left),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: const Icon(Icons.chevron_right),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        // Calendar Header
                        Row(
                          children: List.generate(
                            7,
                            (index) => Expanded(
                              child: Container(
                                height: 50,
                                color: Colors.deepPurple,
                                alignment: Alignment.center,
                                child: Text(
                                  ['S', 'M', 'T', 'W', 'T', 'F', 'S'][index],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Calendar Grid
                        Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 7,
                                  childAspectRatio: 1.5,
                                ),
                            itemCount: 35, // 5 weeks
                            itemBuilder: (context, index) {
                              // Sample data for demonstration
                              Color? cellColor;
                              String? label;
                              bool isToday = false;

                              // Row 1
                              if (index >= 0 && index <= 6) {
                                if (index >= 3) {
                                  label = (index - 2).toString();
                                  if (index == 3) {
                                    isToday = true;
                                    label = "4";
                                  }
                                }
                              }
                              // Row 2
                              else if (index >= 7 && index <= 13) {
                                label = (index - 1).toString();
                                if (index == 7)
                                  cellColor = Colors.deepPurple.withOpacity(
                                    0.5,
                                  );
                                if (index == 10)
                                  cellColor = Colors.green.withOpacity(0.3);
                              }
                              // Row 3
                              else if (index >= 14 && index <= 20) {
                                label = (index - 1).toString();
                                if (index >= 14 && index <= 16)
                                  cellColor = Colors.red;
                              }
                              // Row 4
                              else if (index >= 21 && index <= 27) {
                                label = (index - 1).toString();
                                if (index == 21) cellColor = Colors.yellow;
                                if (index == 25) cellColor = Colors.red;
                              }
                              // Row 5
                              else {
                                label = (index - 1).toString();
                              }

                              return Container(
                                decoration: BoxDecoration(
                                  color: cellColor,
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                alignment: Alignment.center,
                                child:
                                    label == null
                                        ? null
                                        : Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              label,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            if (isToday)
                                              Text(
                                                'Today',
                                                style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 12,
                                                ),
                                              ),
                                          ],
                                        ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Legend
                        Row(
                          children: [
                            _buildLegendItem(
                              Colors.deepPurple.withOpacity(0.5),
                              'Selected',
                            ),
                            const SizedBox(width: 24),
                            _buildLegendItem(
                              Colors.green.withOpacity(0.3),
                              'Light',
                            ),
                            const SizedBox(width: 24),
                            _buildLegendItem(Colors.yellow, 'Medium'),
                            const SizedBox(width: 24),
                            _buildLegendItem(Colors.red, 'Heavy'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // Appointments Section (30%)
                Expanded(
                  flex: 3,
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Appointments',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Date and Total Appointments
                        Row(
                          children: [
                            // Date with Icon
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                children: [
                                  const Text(
                                    'MON',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  const SizedBox(height: 4),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: const BoxDecoration(
                                      color: Colors.deepPurple,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Text(
                                      '7',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                            // Total Appointments
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Total Appointment',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    const SizedBox(height: 4),
                                    const Text(
                                      '30',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        // Appointment List
                        Expanded(
                          child:
                              showAppointmentForm
                                  ? _buildAppointmentForm()
                                  : ListView(
                                    children: [
                                      _buildAppointmentItem(
                                        'John',
                                        'Hair Coloring',
                                        '09:30 pm',
                                      ),
                                      _buildAppointmentItem(
                                        'Shobindiran',
                                        'Hair Cut',
                                        '10:30 pm',
                                      ),
                                      _buildAppointmentItem(
                                        'Dass',
                                        'Facial',
                                        '11:30 am',
                                      ),
                                    ],
                                  ),
                        ),
                        // New Appointment Button
                        if (!showAppointmentForm)
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      showAppointmentForm = true;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.deepPurple,
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 12,
                                    ),
                                  ),
                                  child: const Text('New Appointment'),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.more_horiz),
                                onPressed: () {},
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppointmentForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Name'),
        const SizedBox(height: 8),
        TextField(
          controller: _nameController,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text('Service'),
        const SizedBox(height: 8),
        TextField(
          controller: _serviceController,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text('Timing'),
        const SizedBox(height: 8),
        TextField(
          controller: _timingController,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            suffixIcon: const Icon(Icons.access_time),
          ),
          onTap: () async {
            final TimeOfDay? time = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );
            if (time != null) {
              _timingController.text = time.format(context);
            }
          },
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showAppointmentForm = false;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300],
                foregroundColor: Colors.black,
              ),
              child: const Text('Cancel'),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {
                // Add appointment logic here
                setState(() {
                  showAppointmentForm = false;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Appointment booked successfully!'),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
              ),
              child: const Text('BOOK'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLegendItem(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8),
        Text(label),
      ],
    );
  }

  Widget _buildAppointmentItem(String name, String service, String time) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Timing: $time',
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
              ],
            ),
          ),
          Text(
            service,
            style: const TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
