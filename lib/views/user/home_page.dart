import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GOTOH - Feed',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
        scaffoldBackgroundColor: const Color(0xFFF7FBF0),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
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
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF0D631B), width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.64,
            height: 1.25,
            color: Color(0xFF181D17),
          ),
          headlineMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.24,
            height: 1.33,
            color: Color(0xFF181D17),
          ),
          titleLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.2,
            height: 1.4,
            color: Color(0xFF181D17),
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 1.5,
            color: Color(0xFF181D17),
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 1.43,
            color: Color(0xFF40493D),
          ),
          bodySmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            height: 1.33,
            color: Color(0xFF707A6C),
          ),
          labelLarge: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            height: 1.33,
            letterSpacing: 0.6,
            color: Color(0xFF40493D),
          ),
        ),
      ),
      home: const FeedPage(),
    );
  }
}

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  int _selectedNavIndex = 0;
  String _selectedFilter = 'Komunitas Saya';
  String _searchQuery = '';

  final List<String> _filterOptions = [
    'Komunitas Saya',
    'Random',
    'Populer',
    'Nutrisi',
    'Olahraga',
    'Mental Health',
  ];

  final List<PostModel> _posts = [
    PostModel(
      id: '1',
      userName: 'Siti Aminah',
      userAvatar:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuDed8iw3WDUZSU6F_uHkn_0tZZkZklnOfJvp8dwoJiD0whZn4Fy0it6C7EtlyYY4JZjXLhWNBS95hiH5zgyQnqXSc4QlQb2uCJcaZorzCw3IGDB_N_jjmC-kDsy67CWxQwvfOkXpCzE8EJsCerc2ciLKx4NsBFb3oc22hu91nKoBOTmCxLZfoINdhEKjQh3bHvExnx8JG8Vllv3y7qc6vS5QNWkPXhz1LH5ph2pzd9F-uHwDJXla0aqttWkxAR5Nxie5DT_Gc0v42A',
      category: 'Diet Sehat',
      content:
          'Hari ini mencoba resep salad buah dengan dressing yogurt madu. Rasanya sangat menyegarkan dan rendah kalori! Ada yang mau resepnya? 🥗✨',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuC7SlN8LoFenfEz0Yqq15UvqFOWYtC-0RltbpIGTlIMd1wDTievyX-05v_o4g_-QWqgmb8FYRm1mtoZokIR_u95E71BhPxOs9vwWPCOcKWOCox4JMw5VlLYUjtltFhLkjQPVOPBY8j3fpcK5I4X6nrHgnOeLocJcj3Cv3qPDrnoYMT3IJXoBY8oJfr_Nl0xCKv1xsT1mOnLVs-swpsTnQRm5vRs12LyJDYXumUGhrECR7lI7A-Kk8N5nN97Dw2s99kobvCgT4q6lRE',
      likeCount: 128,
      commentCount: 24,
      upvoteCount: 45,
      isLiked: false,
      isUpvoted: false,
    ),
    PostModel(
      id: '2',
      userName: 'Budi Pratama',
      userAvatar:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuBd_V_wPDvjGfDLGtmOkXuEHMgaQmhW9O9srDq4bJ3QvcNPDNQuUNVD3_5H_n3i7fm1k7x9S9BtaiBTOQRbbp56-SQYmA0BVrS06sKwu0Sv8D_ELyuqRfECq3st36-24kONy02XEHGbMQHVdeplMHMF5W1oRukdOF0iHsch0Ie2k8fMiNsKOUQfS4pWenwcn7q61cZniUoWOwLg8wi-oT2dPntaAdrQ4sazdAidetus0AK4mV-QzJJPeXwdSwA9Nsr4JWVmpP9Yltc',
      category: 'Mental Wellness',
      content:
          'Meditasi 10 menit setiap pagi benar-benar mengubah cara saya menghadapi stres di kantor. Siapa yang sudah mulai rutin meditasi juga? 🧘‍♂️ #Mindfulness',
      imageUrl: null,
      likeCount: 85,
      commentCount: 12,
      upvoteCount: 32,
      isLiked: false,
      isUpvoted: false,
    ),
    PostModel(
      id: '3',
      userName: 'dr. Andi Wijaya',
      userAvatar: null,
      initials: 'AW',
      category: 'Kesehatan Umum',
      content:
          'Tips menjaga imun tubuh di musim hujan: perbanyak vitamin C, istirahat cukup, dan jangan lupa olahraga ringan. Stay healthy everyone! 💪🛡️',
      imageUrl: null,
      likeCount: 256,
      commentCount: 45,
      upvoteCount: 120,
      isLiked: true,
      isUpvoted: false,
    ),
    PostModel(
      id: '4',
      userName: 'Maya Sari',
      userAvatar:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuBzX5AUHuxbNwIyjhvMpXePJtZrDXnPPVa18_7-_zIbGXMylYB_9XocIJVfmz-QIIvw-VRzODl2mnJ1Y9SZT1Ria8qCyYKIQvWxpJQA33WVpKKVpwm_euvsWXUxeQQXP7zHxUp_QKLHCfMwF6StWGp8NnJNKc_ycvlCHmpVF-bCoPxD1-6WkDHnUkz9SryQ3luqapwbG7Wibhrq0C3I3cSER0eibptx5cpP7daMpsvEfH1HAMwdeDpnlzga1GJ4uHrSF6EmXHQ9pDA',
      category: 'Parenting',
      content:
          'Anak saya mulai suka sayur setelah saya buatkan jus wortel dan apel. Senangnya melihat mereka makan sehat! 🥕🍎 Ada yang punya tips lain?',
      imageUrl: null,
      likeCount: 67,
      commentCount: 28,
      upvoteCount: 15,
      isLiked: false,
      isUpvoted: true,
    ),
  ];

  List<PostModel> get _filteredPosts {
    return _posts.where((post) {
      if (_selectedFilter != 'Komunitas Saya' && _selectedFilter != 'Semua') {
        if (!post.category.contains(_selectedFilter)) return false;
      }
      if (_searchQuery.isNotEmpty) {
        return post.userName.toLowerCase().contains(
              _searchQuery.toLowerCase(),
            ) ||
            post.content.toLowerCase().contains(_searchQuery.toLowerCase());
      }
      return true;
    }).toList();
  }

  void _onLikePost(String postId) {
    setState(() {
      final index = _posts.indexWhere((p) => p.id == postId);
      if (index != -1) {
        final post = _posts[index];
        if (post.isLiked) {
          _posts[index] = post.copyWith(
            isLiked: false,
            likeCount: post.likeCount - 1,
          );
        } else {
          _posts[index] = post.copyWith(
            isLiked: true,
            likeCount: post.likeCount + 1,
          );
        }
      }
    });
  }

  void _onUpvotePost(String postId) {
    setState(() {
      final index = _posts.indexWhere((p) => p.id == postId);
      if (index != -1) {
        final post = _posts[index];
        if (post.isUpvoted) {
          _posts[index] = post.copyWith(
            isUpvoted: false,
            upvoteCount: post.upvoteCount - 1,
          );
        } else {
          _posts[index] = post.copyWith(
            isUpvoted: true,
            upvoteCount: post.upvoteCount + 1,
          );
        }
      }
    });
  }

  void _onCommentTap(String postId) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Buka komentar untuk post ID: $postId')),
    );
  }

  void _onNewPost() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Fitur buat post baru sedang dalam pengembangan'),
      ),
    );
  }

  void _onFilterTap(String filter) {
    setState(() {
      _selectedFilter = filter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Top App Bar
            SliverAppBar(
              pinned: true,
              floating: true,
              backgroundColor: const Color(0xFFF7FBF0),
              elevation: 0,
              titleSpacing: 0,
              toolbarHeight: 64,
              flexibleSpace: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.menu, size: 24),
                            color: const Color(0xFF181D17),
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              padding: const EdgeInsets.all(8),
                            ),
                          ),
                        ),
                        const Text(
                          'GOTOH',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -0.5,
                            color: Color(0xFF181D17),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFFA3F69C),
                          width: 2,
                        ),
                        image: const DecorationImage(
                          image: NetworkImage(
                            'https://lh3.googleusercontent.com/aida-public/AB6AXuBzX5AUHuxbNwIyjhvMpXePJtZrDXnPPVa18_7-_zIbGXMylYB_9XocIJVfmz-QIIvw-VRzODl2mnJ1Y9SZT1Ria8qCyYKIQvWxpJQA33WVpKKVpwm_euvsWXUxeQQXP7zHxUp_QKLHCfMwF6StWGp8NnJNKc_ycvlCHmpVF-bCoPxD1-6WkDHnUkz9SryQ3luqapwbG7Wibhrq0C3I3cSER0eibptx5cpP7daMpsvEfH1HAMwdeDpnlzga1GJ4uHrSF6EmXHQ9pDA',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Search and Filter Section
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // Search Bar
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            onChanged: (value) =>
                                setState(() => _searchQuery = value),
                            decoration: InputDecoration(
                              hintText: 'Cari info kesehatan...',
                              hintStyle: const TextStyle(
                                color: Color(0xFF707A6C),
                              ),
                              prefixIcon: const Icon(
                                Icons.search,
                                size: 20,
                                color: Color(0xFF707A6C),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: Color(0xFF0D631B),
                                  width: 2,
                                ),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF0D631B),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.tune,
                              size: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Filter Chips
                    SizedBox(
                      height: 40,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: _filterOptions.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 8),
                        itemBuilder: (context, index) {
                          final filter = _filterOptions[index];
                          final isSelected = _selectedFilter == filter;
                          return GestureDetector(
                            onTap: () => _onFilterTap(filter),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? const Color(0xFF0D631B)
                                    : const Color(0xFFC9E7CA),
                                borderRadius: BorderRadius.circular(32),
                              ),
                              child: Text(
                                filter,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: isSelected
                                      ? Colors.white
                                      : const Color(0xFF4E6952),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Feed Posts
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  child: _buildPostCard(_filteredPosts[index]),
                );
              }, childCount: _filteredPosts.length),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 100)),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
      floatingActionButton: _buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildPostCard(PostModel post) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0E4DA)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: post.userAvatar != null
                          ? NetworkImage(post.userAvatar!)
                          : null,
                      backgroundColor: const Color(0xFFC9E7CA),
                      child: post.userAvatar == null && post.initials != null
                          ? Text(
                              post.initials!,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF4E6952),
                              ),
                            )
                          : null,
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.userName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF181D17),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFC9E7CA),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            post.category,
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF4E6952),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    size: 20,
                    color: Color(0xFF707A6C),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Content
            Text(
              post.content,
              style: const TextStyle(
                fontSize: 14,
                height: 1.5,
                color: Color(0xFF40493D),
              ),
            ),
            if (post.imageUrl != null) ...[
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  post.imageUrl!,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 200,
                      color: const Color(0xFFE0E4DA),
                      child: const Icon(
                        Icons.image_not_supported,
                        size: 48,
                        color: Color(0xFF707A6C),
                      ),
                    );
                  },
                ),
              ),
            ],
            const SizedBox(height: 12),
            // Action Buttons
            Divider(color: const Color(0xFFE0E4DA), thickness: 1),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // Like Button
                    GestureDetector(
                      onTap: () => _onLikePost(post.id),
                      child: Row(
                        children: [
                          Icon(
                            post.isLiked
                                ? Icons.favorite
                                : Icons.favorite_border,
                            size: 20,
                            color: post.isLiked
                                ? const Color(0xFFBA1A1A)
                                : const Color(0xFF707A6C),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '${post.likeCount}',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF707A6C),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 24),
                    // Comment Button
                    GestureDetector(
                      onTap: () => _onCommentTap(post.id),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.chat_bubble_outline,
                            size: 20,
                            color: Color(0xFF707A6C),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '${post.commentCount}',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF707A6C),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // Upvote Button
                GestureDetector(
                  onTap: () => _onUpvotePost(post.id),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F5EB),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          post.isUpvoted
                              ? Icons.arrow_upward
                              : Icons.arrow_upward_outlined,
                          size: 18,
                          color: post.isUpvoted
                              ? const Color(0xFF0D631B)
                              : const Color(0xFF707A6C),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '${post.upvoteCount}',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: post.isUpvoted
                                ? const Color(0xFF0D631B)
                                : const Color(0xFF707A6C),
                          ),
                        ),
                        const Text(
                          ' Upvote',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF707A6C),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    final items = [
      {'icon': Icons.home, 'label': 'Home', 'active': true},
      {'icon': Icons.group, 'label': 'Community', 'active': false},
      {'icon': Icons.recommend, 'label': 'Health', 'active': false},
      {'icon': Icons.person, 'label': 'Profile', 'active': false},
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
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
              final isSelected = index == _selectedNavIndex;
              return GestureDetector(
                onTap: () => setState(() => _selectedNavIndex = index),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFFE8F5E9)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        item['icon'] as IconData,
                        color: isSelected
                            ? const Color(0xFF0D631B)
                            : const Color(0xFF94A3B8),
                        size: 24,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item['label'] as String,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                          color: isSelected
                              ? const Color(0xFF0D631B)
                              : const Color(0xFF94A3B8),
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

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: _onNewPost,
      backgroundColor: const Color(0xFF0D631B),
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 8,
      child: const Icon(Icons.add, size: 28),
    );
  }
}

// Post Model
class PostModel {
  final String id;
  final String userName;
  final String? userAvatar;
  final String? initials;
  final String category;
  final String content;
  final String? imageUrl;
  final int likeCount;
  final int commentCount;
  final int upvoteCount;
  final bool isLiked;
  final bool isUpvoted;

  PostModel({
    required this.id,
    required this.userName,
    this.userAvatar,
    this.initials,
    required this.category,
    required this.content,
    this.imageUrl,
    required this.likeCount,
    required this.commentCount,
    required this.upvoteCount,
    required this.isLiked,
    required this.isUpvoted,
  });

  PostModel copyWith({
    String? id,
    String? userName,
    String? userAvatar,
    String? initials,
    String? category,
    String? content,
    String? imageUrl,
    int? likeCount,
    int? commentCount,
    int? upvoteCount,
    bool? isLiked,
    bool? isUpvoted,
  }) {
    return PostModel(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      userAvatar: userAvatar ?? this.userAvatar,
      initials: initials ?? this.initials,
      category: category ?? this.category,
      content: content ?? this.content,
      imageUrl: imageUrl ?? this.imageUrl,
      likeCount: likeCount ?? this.likeCount,
      commentCount: commentCount ?? this.commentCount,
      upvoteCount: upvoteCount ?? this.upvoteCount,
      isLiked: isLiked ?? this.isLiked,
      isUpvoted: isUpvoted ?? this.isUpvoted,
    );
  }
}
