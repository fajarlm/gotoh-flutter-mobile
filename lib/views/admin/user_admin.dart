import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const UserAdmin());
}

class UserAdmin extends StatelessWidget {
  const UserAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GOTOH - Kelola User',
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
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
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
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFFC0C9BB)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFFC0C9BB)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFF00450D), width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
      home: const UserManagementPage(),
    );
  }
}

// ==================== DATA MODEL ====================

enum UserRole { user, admin, expert }

enum UserStatus { active, suspended }

class UserModel {
  final String id;
  final String name;
  final String email;
  final String? avatarUrl;
  final String initials;
  final UserRole role;
  final UserStatus status;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.avatarUrl,
    required this.initials,
    required this.role,
    required this.status,
  });

  // Helper method to get role display text
  String get roleDisplay {
    switch (role) {
      case UserRole.user:
        return 'User';
      case UserRole.admin:
        return 'Admin';
      case UserRole.expert:
        return 'Expert';
    }
  }

  // Helper method to get status display text
  String get statusDisplay {
    switch (status) {
      case UserStatus.active:
        return 'Aktif';
      case UserStatus.suspended:
        return 'Suspended';
    }
  }

  // Helper method to get status color
  Color get statusColor {
    switch (status) {
      case UserStatus.active:
        return const Color(0xFF2E7D32);
      case UserStatus.suspended:
        return const Color(0xFFBA1A1A);
    }
  }

  // Helper method to get status background color
  Color get statusBgColor {
    switch (status) {
      case UserStatus.active:
        return const Color(0xFFE8F5E9);
      case UserStatus.suspended:
        return const Color(0xFFFFDAD6);
    }
  }

  // Helper method to get role background color
  Color get roleBgColor {
    switch (role) {
      case UserRole.user:
        return const Color(0xFFEFEDED);
      case UserRole.admin:
        return const Color(0xFFE3E2E2);
      case UserRole.expert:
        return const Color(0xFF1B5E20);
    }
  }

  // Helper method to get role text color
  Color get roleTextColor {
    switch (role) {
      case UserRole.user:
        return const Color(0xFF1B1C1C);
      case UserRole.admin:
        return const Color(0xFF1B1C1C);
      case UserRole.expert:
        return const Color(0xFFFFFFFF);
    }
  }
}

// ==================== STATIC DATA ====================

class UserData {
  static List<UserModel> getUsers() {
    return [
      UserModel(
        id: '1',
        name: 'Budi Santoso',
        email: 'budi@email.com',
        initials: 'BS',
        role: UserRole.user,
        status: UserStatus.active,
      ),
      UserModel(
        id: '2',
        name: 'dr. Anita',
        email: 'anita@email.com',
        avatarUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAPtWis5bvaAhWQzVKR8GhWrIxSxPgFvr-e2tdD1Zs-7mGCUPuDpyOcSDFah2WpMduXf1A0fnG6pwylIOEUztQzaDwXnUY-vnHNg3IG7iVkA6kYXmru75u9WKm0IjjaXHJ1r5MC1Ecbp-FrMeMusBqyQO7D3RATrNjKyeUFMbMmk8N-VPmPVHj03FtX5uuisgM-T4vF1pcPawsO5_4KOPHox-6CiezEzh9uBGHwSmJWlH6I03J9Ab6DZes9t5HS-YRLz9ayGM-VEXo',
        initials: 'AN',
        role: UserRole.expert,
        status: UserStatus.active,
      ),
      UserModel(
        id: '3',
        name: 'Raka Pratama',
        email: 'raka@email.com',
        initials: 'RP',
        role: UserRole.user,
        status: UserStatus.suspended,
      ),
    ];
  }

  static List<String> getFilterOptions() {
    return ['All', 'User', 'Admin', 'Expert'];
  }
}

// ==================== MAIN PAGE ====================

class UserManagementPage extends StatefulWidget {
  const UserManagementPage({super.key});

  @override
  State<UserManagementPage> createState() => _UserManagementPageState();
}

class _UserManagementPageState extends State<UserManagementPage> {
  int _selectedNavIndex = 1; // Pengguna is selected
  String _searchQuery = '';
  String _selectedFilter = 'All';
  List<UserModel> _users = [];
  int _currentPage = 1;
  final int _itemsPerPage = 5;

  @override
  void initState() {
    super.initState();
    _users = UserData.getUsers();
  }

  List<UserModel> get _filteredUsers {
    return _users.where((user) {
      // Filter by role
      if (_selectedFilter != 'All') {
        final roleMap = {'User': UserRole.user, 'Admin': UserRole.admin, 'Expert': UserRole.expert};
        if (roleMap[_selectedFilter] != user.role) return false;
      }
      // Filter by search query
      if (_searchQuery.isNotEmpty) {
        return user.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            user.email.toLowerCase().contains(_searchQuery.toLowerCase());
      }
      return true;
    }).toList();
  }

  List<UserModel> get _paginatedUsers {
    final start = (_currentPage - 1) * _itemsPerPage;
    final end = start + _itemsPerPage;
    if (start >= _filteredUsers.length) return [];
    return _filteredUsers.sublist(start, end > _filteredUsers.length ? _filteredUsers.length : end);
  }

  int get _totalPages => (_filteredUsers.length / _itemsPerPage).ceil();

  void _onFilterChanged(String filter) {
    setState(() {
      _selectedFilter = filter;
      _currentPage = 1;
    });
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
      _currentPage = 1;
    });
  }

  void _onEditUser(UserModel user) {
    // TODO: Implement edit user functionality
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Edit user: ${user.name}')),
    );
  }

  void _onSuspendUser(UserModel user) {
    setState(() {
      final index = _users.indexWhere((u) => u.id == user.id);
      if (index != -1) {
        _users[index] = UserModel(
          id: user.id,
          name: user.name,
          email: user.email,
          avatarUrl: user.avatarUrl,
          initials: user.initials,
          role: user.role,
          status: user.status == UserStatus.active ? UserStatus.suspended : UserStatus.active,
        );
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          user.status == UserStatus.active 
            ? '${user.name} telah dinonaktifkan' 
            : '${user.name} telah diaktifkan kembali',
        ),
      ),
    );
  }

  void _onDeleteUser(UserModel user) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus User'),
        content: Text('Apakah Anda yakin ingin menghapus ${user.name}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _users.removeWhere((u) => u.id == user.id);
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${user.name} telah dihapus')),
              );
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );
  }

  void _onAddUser() {
    // TODO: Implement add user functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Fitur tambah user sedang dalam pengembangan')),
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
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFFC0C9BB)),
                      image: const DecorationImage(
                        image: NetworkImage(
                          'https://lh3.googleusercontent.com/aida-public/AB6AXuBldrZoG2gpiJ9WBNrBvzt6CgY6IoJ3P3CWtaG0U5I-AbQYdNZ5mIXqyKvmyaWX6JRdH9zfwP_YIqo9-cfKj6nOs5io5xiGc6FLvCrML0M_mwLKGwALFFK1LkBvat9h3mj749Db8UqyhPjdthA47iTwkj6XgTgq3mN4jfGud6Z6M3XqS0ShUZANy7LYoQbMGyzfEAv_Ac5syVrNYXfGd7QYbZbcXlzC5FODxHA412u-RpGAS2sS1K8RGtQ1rZru7WGdw0fRYHkl_R0',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kelola User',
                  style: theme.textTheme.displayMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  'Manajemen akses dan status pengguna portal kesehatan.',
                  style: theme.textTheme.bodyMedium?.copyWith(color: const Color(0xFF41493E)),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Search and Filter
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: _onSearchChanged,
                    decoration: InputDecoration(
                      hintText: 'Cari user...',
                      prefixIcon: const Icon(Icons.search, color: Color(0xFF717A6D), size: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Color(0xFFC0C9BB)),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ..._buildFilterButtons(),
              ],
            ),
            const SizedBox(height: 24),
            // User List
            LayoutBuilder(
              builder: (context, constraints) {
                final isDesktop = constraints.maxWidth > 768;
                if (isDesktop) {
                  return _buildDesktopTable();
                } else {
                  return _buildMobileList();
                }
              },
            ),
            const SizedBox(height: 32),
            // Pagination
            if (_totalPages > 1) _buildPagination(),
          ],
        ),
      ),
      floatingActionButton: _buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  List<Widget> _buildFilterButtons() {
    final filters = UserData.getFilterOptions();
    return filters.map((filter) {
      final isSelected = _selectedFilter == filter;
      return GestureDetector(
        onTap: () => _onFilterChanged(filter),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF00450D) : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFC0C9BB)),
          ),
          child: Text(
            filter,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.white : const Color(0xFF1B1C1C),
            ),
          ),
        ),
      );
    }).toList();
  }

  Widget _buildDesktopTable() {
    return Container(
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
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columnSpacing: 24,
          horizontalMargin: 16,
          headingRowColor: WidgetStateProperty.all(const Color(0xFFFFFFFF)),
          headingTextStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.6,
            color: Color(0xFF41493E),
          ),
          columns: const [
            DataColumn(label: Text('PENGGUNA')),
            DataColumn(label: Text('ROLE')),
            DataColumn(label: Text('STATUS')),
            DataColumn(label: Text('AKSI', textAlign: TextAlign.right)),
          ],
          rows: _paginatedUsers.map((user) => _buildDataRow(user)).toList(),
        ),
      ),
    );
  }

  DataRow _buildDataRow(UserModel user) {
    return DataRow(
      cells: [
        DataCell(
          Row(
            children: [
              user.avatarUrl != null
                  ? CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(user.avatarUrl!),
                    )
                  : CircleAvatar(
                      radius: 20,
                      backgroundColor: const Color(0xFFA0F399),
                      child: Text(
                        user.initials,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF217128),
                        ),
                      ),
                    ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    user.email,
                    style: const TextStyle(fontSize: 12, color: Color(0xFF41493E)),
                  ),
                ],
              ),
            ],
          ),
        ),
        DataCell(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: user.roleBgColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              user.roleDisplay,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: user.roleTextColor,
              ),
            ),
          ),
        ),
        DataCell(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: user.statusBgColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              user.statusDisplay,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: user.statusColor,
              ),
            ),
          ),
        ),
        DataCell(
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () => _onEditUser(user),
                icon: const Icon(Icons.edit, size: 20),
                color: const Color(0xFF717A6D),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  padding: const EdgeInsets.all(8),
                ),
              ),
              IconButton(
                onPressed: () => _onSuspendUser(user),
                icon: Icon(
                  user.status == UserStatus.active ? Icons.block : Icons.check_circle,
                  size: 20,
                ),
                color: const Color(0xFF717A6D),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  padding: const EdgeInsets.all(8),
                ),
              ),
              IconButton(
                onPressed: () => _onDeleteUser(user),
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
      children: _paginatedUsers.map((user) => _buildMobileCard(user)).toList(),
    );
  }

  Widget _buildMobileCard(UserModel user) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              user.avatarUrl != null
                  ? CircleAvatar(
                      radius: 24,
                      backgroundImage: NetworkImage(user.avatarUrl!),
                    )
                  : CircleAvatar(
                      radius: 24,
                      backgroundColor: const Color(0xFFA0F399),
                      child: Text(
                        user.initials,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color(0xFF217128),
                        ),
                      ),
                    ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${user.roleDisplay} • ',
                    style: const TextStyle(fontSize: 12, color: Color(0xFF41493E)),
                  ),
                  Text(
                    user.statusDisplay,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: user.statusColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Color(0xFF717A6D)),
            onSelected: (value) {
              switch (value) {
                case 'edit':
                  _onEditUser(user);
                  break;
                case 'suspend':
                  _onSuspendUser(user);
                  break;
                case 'delete':
                  _onDeleteUser(user);
                  break;
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'edit', child: Text('Edit')),
              PopupMenuItem(
                value: 'suspend',
                child: Text(user.status == UserStatus.active ? 'Nonaktifkan' : 'Aktifkan'),
              ),
              const PopupMenuItem(value: 'delete', child: Text('Hapus')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPagination() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: _currentPage > 1 ? () => setState(() => _currentPage--) : null,
            icon: const Icon(Icons.chevron_left, size: 18),
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              side: const BorderSide(color: Color(0xFFC0C9BB)),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
          const SizedBox(width: 8),
          ...List.generate(_totalPages, (index) {
            final page = index + 1;
            final isSelected = _currentPage == page;
            return GestureDetector(
              onTap: () => setState(() => _currentPage = page),
              child: Container(
                width: 40,
                height: 40,
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
                    color: isSelected ? Colors.white : const Color(0xFF1B1C1C),
                  ),
                ),
              ),
            );
          }),
          const SizedBox(width: 8),
          IconButton(
            onPressed: _currentPage < _totalPages ? () => setState(() => _currentPage++) : null,
            icon: const Icon(Icons.chevron_right, size: 18),
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              side: const BorderSide(color: Color(0xFFC0C9BB)),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16, right: 16),
      child: FloatingActionButton.extended(
        onPressed: _onAddUser,
        backgroundColor: const Color(0xFF1B5E20),
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text(
          'Tambah User',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
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
}