import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommunityListPage extends StatefulWidget {
  const CommunityListPage({super.key});

  @override
  State<CommunityListPage> createState() => _CommunityListPageState();
}

class _CommunityListPageState extends State<CommunityListPage> {
  int _selectedNavIndex = 1;
  List<CommunityModel> _communities = [];

  @override
  void initState() {
    super.initState();
    _communities = _getCommunities();
  }

  List<CommunityModel> _getCommunities() {
    return [
      CommunityModel(
        id: '1',
        name: 'Pejuang Jantung Sehat',
        type: 'Aktif',
        memberCount: 1200,
        description: 'Komunitas untuk berbagi tips nutrisi dan olahraga ringan khusus untuk menjaga kesehatan jantung di usia produktif.',
        imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCNuKBD9kNyDEO9hmuxs5EoRzmTT2zqGccD1UCKgXsKGA_2CFVix5HyP1KQgkjC-XTJBq4fVt0uinkXu9C_5j3ScMqZWnnaoRSdPoYGEAlSz6vKmuywG2Z6i55GL-2LwpAj7AZYMv5jUlfMpVfh6HcSChfSIzk-8zOWioDCPrXJDaW4x2xpGN472qiOL1vBkfWJ0KqgB20ITztreXEOsk2HdUh_B9ge8MUEeKVosZPUB-vozeseeaFwAZ09hQuvnxOTNKrSOfSyD_U',
      ),
      CommunityModel(
        id: '2',
        name: 'Yoga Pagi Jakarta',
        type: 'Publik',
        memberCount: 850,
        description: 'Bergabunglah dengan sesi yoga bersama setiap akhir pekan di taman kota Jakarta. Semua level diperbolehkan!',
        imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuC8KbOFJhgO6bDgqvAx0x6TGNjjKeSXXPr-qP3onQFT4XflnMy1ez8lez4BjzlRPNXFakHj8hAjs4NvtyCk8NVPI5AfojbZiMpx3u_PAWDY3mUD8nSq4OjU50su4SKFOa6b5T6SPISAZfx6YI88sIif8lv4rK4qOUfOMdO3MazYT_EgLH1hfkCTlFOVJ_ceyeVhrAQ48eQvs5b1fQYgNXrrQ7oKs9JLZRsqZjmSvc1h-MQmxcNm54GxFUQvKvrffdj7MBUlU7jlT38',
      ),
      CommunityModel(
        id: '3',
        name: 'Diet Sehat & Lezat',
        type: 'Edukasi',
        memberCount: 2400,
        description: 'Berbagi resep makanan sehat yang tetap lezat untuk menemani program diet dan gaya hidup sehat harian Anda.',
        imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBkuVTx9AXd-22ylXjHz242l-cKrJwAgLW8dmNlPliK9xPd4dkewlHJqwnMivmvht1o0KPum5KESQOwI6tg2ddUmpGBizTUugDWxIahx8tguAindz_BuPMl9vNnjtdSnmCzfxjVm3BdYptg31Fg30fS8lXO28qN4m4FiUsRSi9X6_v-u-rnQf2BYL6hIUdRcScRU423gcKA4z3pwIpojXQYM2A8NnoJrX9qS-uh1Lxxq_M-YE9-c_PNRCcIdvVqLoklne1lrtyEPVw',
      ),
    ];
  }

  void _onSearchCommunities() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Fitur pencarian komunitas sedang dalam pengembangan')),
    );
  }

  void _onCreateCommunity() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Fitur buat komunitas sedang dalam pengembangan')),
    );
  }

  void _onViewCommunity(CommunityModel community) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Membuka komunitas: ${community.name}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Custom App Bar
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF7FBF0).withOpacity(0.8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            Icons.menu,
                            size: 24,
                            color: Color(0xFF181D17),
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'GOTOH',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -0.5,
                            color: Color(0xFF181D17),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFFC9E7CA),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white,
                            blurRadius: 2,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.network(
                          'https://lh3.googleusercontent.com/aida-public/AB6AXuBF7N7MzbpPePOlp_CxZCqs_vIthJYJ15BZsjriTJ9F2HFPG9f7t09aPaXPaHHbkpa7p9ZToVZ9sQ8oKANqq38I_jehbC_TUB3zZw_2IozkXBRU2pIcJd-cdq1zCXBhPwm_wCkB4uZ-ysgMSFM4ydsEVfaJG-nvTI1RW29HZHr3GWX7BhLJ8Zv7NWnCQ81pFMEocBGMRRq_HFZq5Vpnl1I9XC4pVoNhQpLAoYvsMEQwk7weTCEXJME4ohBvIdUFJbSX90edWMLUeUw',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.person, size: 16, color: Color(0xFF0D631B));
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Main Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Section Header
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Komunitas Saya',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.24,
                            color: Color(0xFF181D17),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Temukan dan kelola komunitas kesehatan Anda untuk hidup yang lebih baik.',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF40493D),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    // Hero Actions
                    Column(
                      children: [
                        // Search Button
                        GestureDetector(
                          onTap: _onSearchCommunities,
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                            decoration: BoxDecoration(
                              color: const Color(0xFF0D631B),
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.12),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.search, size: 20, color: Color(0xFFFFFFFF)),
                                SizedBox(width: 8),
                                Text(
                                  'Cari Komunitas',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Create Button
                        GestureDetector(
                          onTap: _onCreateCommunity,
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: const Color(0xFF0D631B), width: 2),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.add_circle_outline, size: 20, color: Color(0xFF0D631B)),
                                SizedBox(width: 8),
                                Text(
                                  'Buat Komunitas',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF0D631B),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    // Community List
                    ..._communities.map((community) => _buildCommunityCard(community)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildCommunityCard(CommunityModel community) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE0E4DA)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Community Image
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  community.imageUrl,
                  width: 64,
                  height: 64,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 64,
                      height: 64,
                      color: const Color(0xFFC9E7CA),
                      child: const Icon(Icons.group, size: 32, color: Color(0xFF0D631B)),
                    );
                  },
                ),
              ),
              const SizedBox(width: 16),
              // Community Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            community.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF181D17),
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: const Color(0xFFC9E7CA),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            community.type,
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF4E6952),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.group, size: 14, color: Color(0xFF4E6952)),
                        const SizedBox(width: 4),
                        Text(
                          '${_formatNumber(community.memberCount)} Anggota',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF4E6952),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Description
          Text(
            community.description,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFF40493D),
              height: 1.4,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 16),
          // View Button
          GestureDetector(
            onTap: () => _onViewCommunity(community),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFEBEFE5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  'Lihat Komunitas',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF0D631B),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar() {
    final items = [
      {'icon': Icons.home_outlined, 'label': 'Home', 'activeIcon': Icons.home},
      {'icon': Icons.group_outlined, 'label': 'Community', 'activeIcon': Icons.group},
      {'icon': Icons.recommend_outlined, 'label': 'Health', 'activeIcon': Icons.recommend},
      {'icon': Icons.person_outline, 'label': 'Profile', 'activeIcon': Icons.person},
    ];

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
        border: Border(top: BorderSide(color: const Color(0xFFE0E4DA))),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 72,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(items.length, (index) {
              final item = items[index];
              final isSelected = _selectedNavIndex == index;
              final icon = isSelected ? item['activeIcon'] as IconData : item['icon'] as IconData;
              final color = isSelected ? const Color(0xFF0D631B) : const Color(0xFF94A3B8);
              final backgroundColor = isSelected ? const Color(0xFFE8F5E9) : Colors.transparent;

              return GestureDetector(
                onTap: () => setState(() => _selectedNavIndex = index),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(icon, color: color, size: 24),
                      const SizedBox(height: 4),
                      Text(
                        item['label'] as String,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
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

  String _formatNumber(int number) {
    if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}k';
    }
    return number.toString();
  }
}

class CommunityModel {
  final String id;
  final String name;
  final String type;
  final int memberCount;
  final String description;
  final String imageUrl;

  CommunityModel({
    required this.id,
    required this.name,
    required this.type,
    required this.memberCount,
    required this.description,
    required this.imageUrl,
  });
}