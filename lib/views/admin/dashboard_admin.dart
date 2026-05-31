import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatCardData {
  final String title;
  final String value;
  final IconData icon;
  final Color iconBgColor;
  final Color iconColor;

  StatCardData({
    required this.title,
    required this.value,
    required this.icon,
    required this.iconBgColor,
    required this.iconColor,
  });
}

class ActivityItem {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color bgColor;
  final Color iconColor;

  ActivityItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.bgColor,
    required this.iconColor,
  });
}

class ChartData {
  final String day;
  final int value;
  final bool isHighest;

  ChartData({required this.day, required this.value, this.isHighest = false});
}

// ==================== STATIC DATA ====================

class DashboardData {
  static List<StatCardData> getStatCards() {
    return [
      StatCardData(
        title: 'Total Users',
        value: '1,234',
        icon: Icons.group,
        iconBgColor: Color(0xFFE8F5E9),
        iconColor: Color(0xFF00450D),
      ),
      StatCardData(
        title: 'Total Komunitas',
        value: '56',
        icon: Icons.diversity_3,
        iconBgColor: Color(0xFFE8F5E9),
        iconColor: Color(0xFF00450D),
      ),
      StatCardData(
        title: 'Total Posts',
        value: '3,421',
        icon: Icons.dynamic_feed,
        iconBgColor: Color(0xFFE8F5E9),
        iconColor: Color(0xFF00450D),
      ),
      StatCardData(
        title: 'Total Konsultasi',
        value: '89',
        icon: Icons.medical_services,
        iconBgColor: Color(0xFFE8F5E9),
        iconColor: Color(0xFF00450D),
      ),
    ];
  }

  static List<ActivityItem> getActivities() {
    return [
      ActivityItem(
        title: 'User Budi melaporkan postingan',
        subtitle: '2 menit yang lalu • Konten tidak pantas',
        icon: Icons.report,
        bgColor: Color(0xFFFFCDD2),
        iconColor: Color(0xFFC62828),
      ),
      ActivityItem(
        title: 'Ahli baru mendaftar: dr. Siti',
        subtitle: '15 menit yang lalu • Menunggu verifikasi',
        icon: Icons.person_add,
        bgColor: Color(0xFFBBDEFB),
        iconColor: Color(0xFF1565C0),
      ),
      ActivityItem(
        title: 'Komunitas \'Gaya Hidup Sehat\' dibuat',
        subtitle: '1 jam yang lalu • Oleh Moderator Eli',
        icon: Icons.hub,
        bgColor: Color(0xFFC8E6C9),
        iconColor: Color(0xFF2E7D32),
      ),
      ActivityItem(
        title: 'Postingan baru diverifikasi',
        subtitle: '2 jam yang lalu • Artikel Nutrisi Harian',
        icon: Icons.verified,
        bgColor: Color(0xFF90D792),
        iconColor: Color(0xFF00450D),
      ),
      ActivityItem(
        title: 'User baru bergabung: Raka',
        subtitle: '5 jam yang lalu • Via Google Auth',
        icon: Icons.face,
        bgColor: Color(0xFFE0E0E0),
        iconColor: Color(0xFF616161),
      ),
    ];
  }

  static List<ChartData> getChartData() {
    return [
      ChartData(day: 'Sen', value: 120),
      ChartData(day: 'Sel', value: 195),
      ChartData(day: 'Rab', value: 165),
      ChartData(day: 'Kam', value: 255, isHighest: true),
      ChartData(day: 'Jum', value: 135),
      ChartData(day: 'Sab', value: 210),
      ChartData(day: 'Min', value: 90),
    ];
  }

  static int getMaxChartValue() {
    return 255;
  }
}

// ==================== MAIN PAGE ====================

class DashboardAdminPage extends StatefulWidget {
  const DashboardAdminPage({super.key});

  @override
  State<DashboardAdminPage> createState() => _DashboardAdminPageState();
}

class _DashboardAdminPageState extends State<DashboardAdminPage> {
  int _selectedNavIndex = 0;
  String _selectedPeriod = '7 Hari Terakhir';
  final List<String> _periodOptions = [
    '7 Hari Terakhir',
    '30 Hari Terakhir',
    'Tahun Ini',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final statCards = DashboardData.getStatCards();
    final activities = DashboardData.getActivities();
    final chartData = DashboardData.getChartData();
    final maxValue = DashboardData.getMaxChartValue();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.menu, size: 24),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: colorScheme.primary,
                        ),
                      ),
                      const Text(
                        'GOTOH',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -0.5,
                          color: Color(0xFF00450D),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F3F3),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: const Color(0xFFC0C9BB)),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.calendar_today,
                              size: 18,
                              color: Color(0xFF41493E),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Okt 24, 2023',
                              style: theme.textTheme.labelMedium,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text(
                                'Profil Admin',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  height: 1.2,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'Superuser',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade500,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 8),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xFF1B5E20),
                                width: 2,
                              ),
                              image: const DecorationImage(
                                image: NetworkImage(
                                  'https://lh3.googleusercontent.com/aida-public/AB6AXuABIgOwuxfKZroNcv2BSYbFVGOPFvXdjbYsh4HIMY0-MkmSNbaWTUidAxoLYUni6WxZh3Ew21iNtGs0zW5pSs_mBSR0afD5v0mxm7LcIZqMQ_8rzSWQv31HeUw0g0mx_tbfb72fAk6ICQF22IlpGV7q6a4hvqnhKv4Pg03YvTIHsB3i2OZ5g2nREBuzTKoqUmSswNtUnyW7AMo3m5dzf3pqLKEbaBIAFf5Hr48R4jg0ivwMlaR8JyztKFYnIKHEx8ulP6Qicg0Pnv4',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dashboard Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Admin Dashboard GOTOH',
                      style: theme.textTheme.displayLarge,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Selamat datang kembali. Berikut adalah ringkasan performa hari ini.',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
                // Period Selector
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFC0C9BB)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.date_range,
                        size: 20,
                        color: Color(0xFF00450D),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: EdgeInsets.zero,
                        decoration: const BoxDecoration(),
                        child: DropdownButton<String>(
                          value: _selectedPeriod,
                          underline: const SizedBox(),
                          style: theme.textTheme.labelMedium,
                          icon: const Icon(Icons.arrow_drop_down, size: 20),
                          items: _periodOptions
                              .map(
                                (e) =>
                                    DropdownMenuItem(value: e, child: Text(e)),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedPeriod = value!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Statistics Grid
            LayoutBuilder(
              builder: (context, constraints) {
                final crossAxisCount = constraints.maxWidth < 640
                    ? 1
                    : (constraints.maxWidth < 1024 ? 2 : 4);
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 3.5,
                  ),
                  itemCount: statCards.length,
                  itemBuilder: (context, index) {
                    final card = statCards[index];
                    return _buildStatCard(card);
                  },
                );
              },
            ),
            const SizedBox(height: 24),
            // Main Content Layout
            LayoutBuilder(
              builder: (context, constraints) {
                final isLarge = constraints.maxWidth > 800;
                if (isLarge) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 5, child: _buildActivityList(activities)),
                      const SizedBox(width: 16),
                      Expanded(
                        flex: 7,
                        child: _buildRightPanel(chartData, maxValue),
                      ),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      _buildActivityList(activities),
                      const SizedBox(height: 16),
                      _buildRightPanel(chartData, maxValue),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildStatCard(StatCardData card) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: card.iconBgColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(card.icon, size: 32, color: card.iconColor),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(card.title, style: Theme.of(context).textTheme.labelMedium),
              const SizedBox(height: 4),
              Text(
                card.value,
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActivityList(List<ActivityItem> activities) {
    final theme = Theme.of(context);

    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Aktivitas Terbaru', style: theme.textTheme.displaySmall),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Lihat Semua',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1B5E20),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 0, thickness: 1, color: Color(0xFFF5F3F3)),
          ...activities.map((item) => _buildActivityItem(item)),
        ],
      ),
    );
  }

  Widget _buildActivityItem(ActivityItem item) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: item.bgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(item.icon, size: 18, color: item.iconColor),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1B1C1C),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  item.subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF717A6D),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRightPanel(List<ChartData> chartData, int maxValue) {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Statistik Postingan Harian',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8F5E9),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.circle, size: 8, color: Color(0xFF4CAF50)),
                          SizedBox(width: 4),
                          Text(
                            '+12% vs minggu lalu',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF1B5E20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 200,
                  child: _buildBarChart(chartData, maxValue),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: chartData
                      .map((data) => _buildDayLabel(data.day))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        _buildPromoCard(),
      ],
    );
  }

  Widget _buildBarChart(List<ChartData> chartData, int maxValue) {
    final maxHeight = 160.0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(chartData.length, (index) {
        final data = chartData[index];
        final height = (data.value / maxValue) * maxHeight;
        final color = data.isHighest
            ? const Color(0xFF1B5E20)
            : const Color(0xFF00450D).withOpacity(0.1);

        return Expanded(
          child: Column(
            children: [
              const Spacer(),
              Container(
                height: height,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildDayLabel(String day) {
    return Text(
      day,
      style: const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: Color(0xFF717A6D),
      ),
    );
  }

  Widget _buildPromoCard() {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1B5E20), Color(0xFF00450D)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Opacity(
              opacity: 0.6,
              child: Image.network(
                'https://lh3.googleusercontent.com/aida-public/AB6AXuD26X9WV39v0T0Dc-bjrwTpHKBuBTBOXAl_lfOvnvqWEYCyY-PBK_YARDQQAPVqxRNY2X_VORwLOVGzAif4Mg8WmSSrD5hedFIzPFjgjC8tV0KkRkasHopS32OHBZf9nWxw90Y0A95CG0zXQ5TGR42JNpgiBFVqUcJ1UkEWoItTbkAKXhKt_vSeJ6ZQwTQRA4_mMdZ1YIVeuqnTUhXsSbBm1Ro0kikHLtjMR5gEAZUg9_kT0aN4lAaAqfl3lOEn0KuFjJ8QbjWWCRQ',
                fit: BoxFit.cover,
                width: 200,
                errorBuilder: (context, error, stackTrace) {
                  return Container(width: 200, color: Colors.transparent);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Pantau Kesehatan Ekosistem GOTOH',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Laporan bulanan integritas data sudah siap diunduh.',
                  style: TextStyle(fontSize: 14, color: Color(0xFFACF4A4)),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Fitur unduh PDF sedang dalam pengembangan',
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF00450D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Unduh PDF',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar() {
    final items = [
      {'icon': Icons.dashboard, 'label': 'Dashboard'},
      {'icon': Icons.group, 'label': 'Pengguna'},
      {'icon': Icons.fact_check, 'label': 'Verifikasi'},
      {'icon': Icons.security, 'label': 'Oversight'},
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade200)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 72,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(items.length, (index) {
              final isSelected = _selectedNavIndex == index;
              final color = isSelected
                  ? const Color(0xFF00450D)
                  : Colors.grey.shade500;
              final backgroundColor = isSelected
                  ? const Color(0xFFE8F5E9)
                  : Colors.transparent;

              return GestureDetector(
                onTap: () => setState(() => _selectedNavIndex = index),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        items[index]['icon'] as IconData,
                        color: color,
                        size: 24,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        items[index]['label'] as String,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: color,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
