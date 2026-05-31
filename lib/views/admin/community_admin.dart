import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const CommunityAdmin());
}

class CommunityAdmin extends StatelessWidget {
  const CommunityAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GOTOH - Kelola Komunitas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF00450D),
          onPrimary: Color(0xFFFFFFFF),
          primaryContainer: Color(0xFF1B5E20),
          onPrimaryContainer: Color(0xFF90D689),
          secondary: Color(0xFF1B6D24),
          onSecondary: Color(0xFFFFFFFF),
          secondaryContainer: Color(0xFFA0F399),
          onSecondaryContainer: Color(0xFF217128),
          tertiary: Color(0xFF004516),
          onTertiary: Color(0xFFFFFFFF),
          tertiaryContainer: Color(0xFF185E27),
          onTertiaryContainer: Color(0xFF8FD691),
          error: Color(0xFFBA1A1A),
          onError: Color(0xFFFFFFFF),
          errorContainer: Color(0xFFFFDAD6),
          onErrorContainer: Color(0xFF93000A),
          background: Color(0xFFFBF9F9),
          onBackground: Color(0xFF1B1C1C),
          surface: Color(0xFFFBF9F9),
          onSurface: Color(0xFF1B1C1C),
          surfaceVariant: Color(0xFFE3E2E2),
          onSurfaceVariant: Color(0xFF41493E),
          outline: Color(0xFF717A6D),
          outlineVariant: Color(0xFFC0C9BB),
          inverseSurface: Color(0xFF303031),
          onInverseSurface: Color(0xFFF2F0F0),
          inversePrimary: Color(0xFF91D78A),
          surfaceTint: Color(0xFF2A6B2C),
        ),
        scaffoldBackgroundColor: const Color(0xFFFBF9F9),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF00450D),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        cardTheme: CardThemeData(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          clipBehavior: Clip.antiAlias,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFC0C9BB)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFC0C9BB)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF00450D), width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.w700, letterSpacing: -0.6, height: 1.27, color: Color(0xFF00450D)),
          displayMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, letterSpacing: -0.24, height: 1.33, color: Color(0xFF00450D)),
          displaySmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, letterSpacing: -0.2, height: 1.4, color: Color(0xFF00450D)),
          bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, height: 1.5, color: Color(0xFF1B1C1C)),
          bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, height: 1.43, color: Color(0xFF1B1C1C)),
          bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, height: 1.33, color: Color(0xFF717A6D)),
          labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, height: 1.43, color: Color(0xFF00450D)),
          labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, height: 1.33, letterSpacing: 0.6, color: Color(0xFF41493E)),
        ),
      ),
      home: const CommunityManagementPage(),
    );
  }
}

// ==================== DATA MODEL ====================

enum CommunityStatus { active, inactive, pending }

enum CommunityCategory {
  nutrition('Nutrisi', Icons.health_and_safety_sharp),
  sports('Olahraga', Icons.directions_run),
  mentalHealth('Mental Health', Icons.psychology),
  general('Umum', Icons.group),
  parenting('Parenting', Icons.family_restroom),
  chronicDisease('Penyakit Kronis', Icons.medical_services);

  final String displayName;
  final IconData icon;
  
  const CommunityCategory(this.displayName, this.icon);
}

class ModeratorModel {
  final String id;
  final String name;
  final String? avatarUrl;
  final String initials;

  ModeratorModel({
    required this.id,
    required this.name,
    this.avatarUrl,
    required this.initials,
  });
}

class CommunityModel {
  final String id;
  final String name;
  final String communityId;
  final CommunityCategory category;
  final int memberCount;
  final double growthRate;
  final ModeratorModel moderator;
  final CommunityStatus status;
  final IconData icon;

  CommunityModel({
    required this.id,
    required this.name,
    required this.communityId,
    required this.category,
    required this.memberCount,
    required this.growthRate,
    required this.moderator,
    required this.status,
    required this.icon,
  });

  String get statusDisplay {
    switch (status) {
      case CommunityStatus.active:
        return 'Aktif';
      case CommunityStatus.inactive:
        return 'Nonaktif';
      case CommunityStatus.pending:
        return 'Pending';
    }
  }

  Color get statusColor {
    switch (status) {
      case CommunityStatus.active:
        return const Color(0xFF1B5E20);
      case CommunityStatus.inactive:
        return const Color(0xFFBA1A1A);
      case CommunityStatus.pending:
        return const Color(0xFFF57C00);
    }
  }

  Color get statusBgColor {
    switch (status) {
      case CommunityStatus.active:
        return const Color(0xFFE8F5E9);
      case CommunityStatus.inactive:
        return const Color(0xFFFFDAD6);
      case CommunityStatus.pending:
        return const Color(0xFFFFF3E0);
    }
  }

  String get growthDisplay {
    final isPositive = growthRate >= 0;
    return '${isPositive ? '+' : ''}${growthRate.toStringAsFixed(0)}% bln ini';
  }

  Color get growthColor {
    return growthRate >= 0 ? const Color(0xFF2E7D32) : const Color(0xFFBA1A1A);
  }
}

// ==================== STATIC DATA ====================

class CommunityData {
  static List<CommunityModel> getCommunities() {
    return [
      CommunityModel(
        id: '1',
        name: 'Pejuang Diet Keto',
        communityId: 'COMM-001',
        category: CommunityCategory.nutrition,
        memberCount: 1200,
        growthRate: 5,
        moderator: ModeratorModel(
          id: 'm1',
          name: 'Siti',
          avatarUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDyEqXoZUPrkfNLKNe7f1mG7nPbvw9T52Axb6HK32rs9fkBs8cRaPD-B8XANdhIH7VhaDhgwdEWTGbK1M5FRUUReGENeQIrp1NUP4fTe746WuImGDzr6nwg3f59vC9S1AofY7j7OvNM7CLfhsU97HC1oaIZ9Bf5lIVrWwkMozzix5hkwKM8QZzxr8rDG4JP0iCl5kUJ9BqJEXj5LLY4Rth_Y8BOhoy-M2HlpVAvkYhAzS-DWx52gANY1Z_aAcZHZHK-WhC_VTZxnzM',
          initials: 'ST',
        ),
        status: CommunityStatus.active,
        icon: Icons.health_and_safety_sharp,
      ),
      CommunityModel(
        id: '2',
        name: 'Klub Lari Pagi',
        communityId: 'COMM-002',
        category: CommunityCategory.sports,
        memberCount: 850,
        growthRate: 12,
        moderator: ModeratorModel(
          id: 'm2',
          name: 'Raka',
          avatarUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBJIuojh6Mc2nQAY_6dzfmogBMQuKTwioABT0hCzqxwjKW0paXIyBdbj8C3geRGZ1yh2BJlkwwe-9tMFMxEKMcWrMe4yvPfLGhN3sOTC6N3wyGYjvtAeniaDgIcxzGtk9pUb2g9yXbzpYKD0pBE1lh0sUx_sJ6Q-igS-TVhpt_yP0E-kkpqtUDB2UBrxOXMA-L5JIo9NcrtiIL0MfTfzrcY5CHCokB5o25XM78M7MME6lvZ4eMV7CXn0_m7nYbjMdcHM-496wegO-8',
          initials: 'RK',
        ),
        status: CommunityStatus.active,
        icon: Icons.directions_run,
      ),
      CommunityModel(
        id: '3',
        name: 'Mindfulness Indo',
        communityId: 'COMM-003',
        category: CommunityCategory.mentalHealth,
        memberCount: 2400,
        growthRate: 2,
        moderator: ModeratorModel(
          id: 'm3',
          name: 'dr. Andi',
          avatarUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBCRuYp443tNg99rB-qQ0_WEWDXMWZjo2geAdApwZyKIxQ3fhKNFh_Iv7pBembJYwcXkM-hjGw8KqO-QhHeY9R5nyf1OKAtP2J1zJ3NCWXUoeVqhma6BoqwGvs73i56GP5U7Yv9nBW164TqEGOKkpBULWKhoJ0pRgPZpnQEYiGbMtyi-DapYl-BNiZgEDc5VzVptqqYYvX7nKgMKS1OGhfPpNfVz6iKHU-JgbNq9VXpaKPhykYCza8D9loneN9GO_U3rwFlK8o35mw',
          initials: 'AD',
        ),
        status: CommunityStatus.active,
        icon: Icons.psychology,
      ),
      CommunityModel(
        id: '4',
        name: 'Parenting Sehat',
        communityId: 'COMM-004',
        category: CommunityCategory.parenting,
        memberCount: 3200,
        growthRate: 8,
        moderator: ModeratorModel(
          id: 'm4',
          name: 'Maya',
          avatarUrl: null,
          initials: 'MY',
        ),
        status: CommunityStatus.active,
        icon: Icons.family_restroom,
      ),
      CommunityModel(
        id: '5',
        name: 'Diabetes Care',
        communityId: 'COMM-005',
        category: CommunityCategory.chronicDisease,
        memberCount: 560,
        growthRate: -2,
        moderator: ModeratorModel(
          id: 'm5',
          name: 'dr. Budi',
          avatarUrl: null,
          initials: 'BD',
        ),
        status: CommunityStatus.pending,
        icon: Icons.medical_services,
      ),
    ];
  }

  static int getTotalCommunities() {
    return getCommunities().length;
  }
}

// ==================== MAIN PAGE ====================

class CommunityManagementPage extends StatefulWidget {
  const CommunityManagementPage({super.key});

  @override
  State<CommunityManagementPage> createState() => _CommunityManagementPageState();
}

class _CommunityManagementPageState extends State<CommunityManagementPage> {
  int _selectedNavIndex = 3; // Oversight is selected
  String _searchQuery = '';
  List<CommunityModel> _communities = [];
  int _currentPage = 1;
  final int _itemsPerPage = 5;

  @override
  void initState() {
    super.initState();
    _communities = CommunityData.getCommunities();
  }

  List<CommunityModel> get _filteredCommunities {
    if (_searchQuery.isEmpty) return _communities;
    return _communities.where((community) {
      return community.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          community.communityId.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          community.moderator.name.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();
  }

  List<CommunityModel> get _paginatedCommunities {
    final start = (_currentPage - 1) * _itemsPerPage;
    final end = start + _itemsPerPage;
    if (start >= _filteredCommunities.length) return [];
    return _filteredCommunities.sublist(start, end > _filteredCommunities.length ? _filteredCommunities.length : end);
  }

  int get _totalPages => (_filteredCommunities.length / _itemsPerPage).ceil();
  int get _totalItems => _filteredCommunities.length;
  int get _startItem => (_currentPage - 1) * _itemsPerPage + 1;
  int get _endItem => (_startItem + _paginatedCommunities.length - 1).clamp(0, _totalItems);

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
      _currentPage = 1;
    });
  }

  void _onViewDetail(CommunityModel community) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Detail komunitas: ${community.name}')),
    );
  }

  void _onEditCommunity(CommunityModel community) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Edit komunitas: ${community.name}')),
    );
  }

  void _onDeleteCommunity(CommunityModel community) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus Komunitas'),
        content: Text('Apakah Anda yakin ingin menghapus komunitas "${community.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _communities.removeWhere((c) => c.id == community.id);
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${community.name} telah dihapus')),
              );
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );
  }

  void _onAddCommunity() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Fitur tambah komunitas sedang dalam pengembangan')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

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
                      // Desktop Navigation
                      Row(
                        children: [
                          _buildNavLink('Dashboard', false),
                          const SizedBox(width: 32),
                          _buildNavLink('Pengguna', false),
                          const SizedBox(width: 32),
                          _buildNavLink('Oversight', true),
                        ],
                      ),
                      const SizedBox(width: 24),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: const Color(0xFF1B5E20), width: 2),
                          image: const DecorationImage(
                            image: NetworkImage(
                              'https://lh3.googleusercontent.com/aida-public/AB6AXuB76NvDhSMXAqcCPVgN_v9fV5gev64O-0G-OxinuIbWq_3u1q_qOcnyrYMUuJJHRjZX9xdXpWVRtWRqJoWYFIrlrtrm3D2HaSHPrPyNldx2B5FZtAhNamzZq19wg9qsyGfbokZkPAxWCbQ4aVsiTEgE44Vw53QDdbbrg3EYrbRwmSVGpG2fpR5BhzC2pKlJ-X54-bCk_9Lsl_hLnoVfXKqOpkJUVLXM6Yo01WiJHYWJK6SNgecYFkqqU2LSv9lM5shQ_8AdXFtmqzI',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
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
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kelola Komunitas',
                      style: theme.textTheme.displayLarge,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Pantau dan kelola interaksi sosial antar pengguna GOTOH.',
                      style: theme.textTheme.bodyMedium?.copyWith(color: const Color(0xFF717A6D)),
                    ),
                  ],
                ),
                SizedBox(
                  width: 320,
                  child: TextField(
                    onChanged: _onSearchChanged,
                    decoration: InputDecoration(
                      hintText: 'Cari komunitas...',
                      prefixIcon: const Icon(Icons.search, color: Color(0xFF717A6D), size: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFFC0C9BB)),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Community Table
            Container(
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
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isDesktop = constraints.maxWidth > 800;
                  if (isDesktop) {
                    return _buildDesktopTable();
                  } else {
                    return _buildMobileList();
                  }
                },
              ),
            ),
            const SizedBox(height: 16),
            // Pagination
            _buildPagination(),
          ],
        ),
      ),
      floatingActionButton: _buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildNavLink(String title, bool isActive) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 12,
        fontWeight: isActive ? FontWeight.bold : FontWeight.w600,
        color: isActive ? const Color(0xFF00450D) : const Color(0xFF717A6D),
        letterSpacing: 0.6,
      ),
    );
  }

  Widget _buildDesktopTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 24,
        horizontalMargin: 24,
        headingRowColor: WidgetStateProperty.all(const Color(0xFFF5F3F3)),
        headingTextStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.6,
          color: Color(0xFF41493E),
        ),
        columns: const [
          DataColumn(label: Text('KOMUNITAS')),
          DataColumn(label: Text('KATEGORI')),
          DataColumn(label: Text('STATISTIK')),
          DataColumn(label: Text('MODERATOR')),
          DataColumn(label: Text('STATUS')),
          DataColumn(label: Text('AKSI', textAlign: TextAlign.center)),
        ],
        rows: _paginatedCommunities.map((community) => _buildDataRow(community)).toList(),
      ),
    );
  }

  DataRow _buildDataRow(CommunityModel community) {
    return DataRow(
      cells: [
        // Komunitas
        DataCell(
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFFA0F399),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(community.icon, size: 24, color: const Color(0xFF217128)),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    community.name,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF00450D)),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    community.communityId,
                    style: const TextStyle(fontSize: 12, color: Color(0xFF717A6D)),
                  ),
                ],
              ),
            ],
          ),
        ),
        // Kategori
        DataCell(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFE9E8E7),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              community.category.displayName,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF41493E)),
            ),
          ),
        ),
        // Statistik
        DataCell(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${_formatNumber(community.memberCount)} Anggota',
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 2),
              Text(
                community.growthDisplay,
                style: TextStyle(fontSize: 12, color: community.growthColor),
              ),
            ],
          ),
        ),
        // Moderator
        DataCell(
          Row(
            children: [
              CircleAvatar(
                radius: 12,
                backgroundImage: community.moderator.avatarUrl != null
                    ? NetworkImage(community.moderator.avatarUrl!)
                    : null,
                backgroundColor: const Color(0xFFC0C9BB),
                child: community.moderator.avatarUrl == null
                    ? Text(
                        community.moderator.initials,
                        style: const TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
                      )
                    : null,
              ),
              const SizedBox(width: 8),
              Text(
                community.moderator.name,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
        // Status
        DataCell(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: community.statusBgColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: community.statusColor,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  community.statusDisplay,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: community.statusColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        // Aksi
        DataCell(
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _onViewDetail(community),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1B5E20),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  elevation: 0,
                ),
                child: const Text(
                  'Detail',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: () => _onEditCommunity(community),
                icon: const Icon(Icons.edit, size: 20),
                color: const Color(0xFF717A6D),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  padding: const EdgeInsets.all(8),
                ),
              ),
              IconButton(
                onPressed: () => _onDeleteCommunity(community),
                icon: const Icon(Icons.delete, size: 20),
                color: const Color(0xFF717A6D),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  padding: const EdgeInsets.all(8),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileList() {
    return Column(
      children: _paginatedCommunities.map((community) => _buildMobileCard(community)).toList(),
    );
  }

  Widget _buildMobileCard(CommunityModel community) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFC0C9BB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFFA0F399),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(community.icon, size: 24, color: const Color(0xFF217128)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      community.name,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF00450D)),
                    ),
                    Text(
                      community.communityId,
                      style: const TextStyle(fontSize: 12, color: Color(0xFF717A6D)),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: community.statusBgColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  community.statusDisplay,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: community.statusColor),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFE9E8E7),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(community.category.displayName),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.group, size: 14, color: Color(0xFF717A6D)),
              const SizedBox(width: 4),
              Text('${_formatNumber(community.memberCount)} anggota'),
              const SizedBox(width: 8),
              Text(
                community.growthDisplay,
                style: TextStyle(fontSize: 12, color: community.growthColor),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 14,
                    backgroundImage: community.moderator.avatarUrl != null
                        ? NetworkImage(community.moderator.avatarUrl!)
                        : null,
                    backgroundColor: const Color(0xFFC0C9BB),
                    child: community.moderator.avatarUrl == null
                        ? Text(community.moderator.initials, style: const TextStyle(fontSize: 10))
                        : null,
                  ),
                  const SizedBox(width: 8),
                  Text(community.moderator.name),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () => _onViewDetail(community),
                    icon: const Icon(Icons.info_outline, size: 20),
                    color: const Color(0xFF00450D),
                  ),
                  IconButton(
                    onPressed: () => _onEditCommunity(community),
                    icon: const Icon(Icons.edit, size: 20),
                    color: const Color(0xFF717A6D),
                  ),
                  IconButton(
                    onPressed: () => _onDeleteCommunity(community),
                    icon: const Icon(Icons.delete, size: 20),
                    color: const Color(0xFFBA1A1A),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPagination() {
    if (_totalPages <= 1) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Menampilkan $_startItem-$_endItem dari $_totalItems komunitas',
            style: const TextStyle(fontSize: 12, color: Color(0xFF717A6D)),
          ),
          Row(
            children: [
              IconButton(
                onPressed: _currentPage > 1 ? () => setState(() => _currentPage--) : null,
                icon: const Icon(Icons.chevron_left, size: 20),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Color(0xFFC0C9BB)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
              const SizedBox(width: 8),
              ...List.generate(_totalPages.clamp(0, 5), (index) {
                final page = index + 1;
                final isSelected = _currentPage == page;
                if (page > 3 && _totalPages > 5 && index == 3) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: Text('...'),
                  );
                }
                if (page > 4 && _totalPages > 5) return const SizedBox.shrink();
                return GestureDetector(
                  onTap: () => setState(() => _currentPage = page),
                  child: Container(
                    width: 32,
                    height: 32,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected ? const Color(0xFF00450D) : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFFC0C9BB)),
                    ),
                    child: Text(
                      '$page',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: isSelected ? Colors.white : const Color(0xFF1B1C1C),
                      ),
                    ),
                  ),
                );
              }),
              if (_totalPages > 5) ...[
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: () => setState(() => _currentPage = _totalPages),
                  child: Container(
                    width: 32,
                    height: 32,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: _currentPage == _totalPages ? const Color(0xFF00450D) : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFFC0C9BB)),
                    ),
                    child: Text(
                      '$_totalPages',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: _currentPage == _totalPages ? Colors.white : const Color(0xFF1B1C1C),
                      ),
                    ),
                  ),
                ),
              ],
              const SizedBox(width: 8),
              IconButton(
                onPressed: _currentPage < _totalPages ? () => setState(() => _currentPage++) : null,
                icon: const Icon(Icons.chevron_right, size: 20),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Color(0xFFC0C9BB)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: _onAddCommunity,
      backgroundColor: const Color(0xFF00450D),
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: const Icon(Icons.add, size: 28),
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
              final color = isSelected ? const Color(0xFF00450D) : Colors.grey.shade500;
              final backgroundColor = isSelected ? const Color(0xFFE8F5E9) : Colors.transparent;

              return GestureDetector(
                onTap: () => setState(() => _selectedNavIndex = index),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(items[index]['icon'] as IconData, color: color, size: 24),
                      const SizedBox(height: 4),
                      Text(
                        items[index]['label'] as String,
                        style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: color),
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

  String _formatNumber(int number) {
    if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}k';
    }
    return number.toString();
  }
}