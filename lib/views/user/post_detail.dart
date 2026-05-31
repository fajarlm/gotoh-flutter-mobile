import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PostDetailPage extends StatefulWidget {
  const PostDetailPage({super.key});

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  final TextEditingController _commentController = TextEditingController();
  final FocusNode _commentFocusNode = FocusNode();
  bool _isLiked = true;
  int _likeCount = 124;

  final List<CommentModel> _comments = [
    CommentModel(
      id: '1',
      userName: 'Siti Aminah',
      userAvatar:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuAq6i3t9PgSDGocK0cCacGRLNL-VGepCXogVN5Czo3VJH2ba-aK0ByDHS8eL9bgtV2xJzVZEmVzbYKTW6pBza93eRR6V1AvonxOjN6QR_JpLu0ZV72zJ2WO1nA34M1AX3rRtU0p_06Ig7aiWGc1nEZAc8tx4OSIoEuQChelG8g3SHp7zZmWA6r7WhKFK8DmO9Z1Ga72qdJEpGqKiXNOgRHdzgSXg3xV9was-OTv-bOoYGaORbcJvTw1vBnUbMGqNvoc2kkv2L98vi4',
      content:
          'Terima kasih infonya Dok! Sangat membantu di musim panas seperti sekarang ini.',
      timestamp: '45m',
      likeCount: 8,
      isLiked: false,
      replyCount: 0,
    ),
    CommentModel(
      id: '2',
      userName: 'Budi Santoso',
      userAvatar:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuAcpstv-k7BxtwUburHL9OfQ9g3RU-3EOEsXuGuKdKTI0MnwbNn6E8WKWiIbE6iWuodVOsvcPFdXdJrW0ID1WdZZddQ1pS_fM_JK6KcRcB_LTxnElZNWU2jMCnrgC2oGAqn1mJR6ZJ2l3aRepe4dCEpEnfbyQ7RBCNop8fpJ604InJ7Cz7j0ai_3BY0WtGMoCAnZmWWkNX3GZ_Do3iDd8s294gOzv-2ylJ0oVltrdNula4jqZltRE9FXwWcNvZhsajISPibGfDliUo',
      content:
          'Baru saja minum segelas air setelah baca ini. Ayo hidup sehat semuanya!',
      timestamp: '10m',
      likeCount: 3,
      isLiked: false,
      replyCount: 0,
    ),
  ];

  final PostModel _post = PostModel(
    id: '1',
    userName: 'Dr. Andi Wijaya',
    userAvatar:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuAbPGBmWDNfUXN1AwNFTRBPIZKlDnUz3rih__5xaZEwmhM4-a0KWh8NWQsGD3S1VwTHw2Vt5RqPPTCDOQnwxOufhvFyDvaoOq6Ep9sNTDnQRx7lzJZk8ZoGXHSjegCl6CS9Cz9ncmPt9TVS5_pbsXNRaf7x9E_QtaWKg0UyajQfs47qrSBlalBnJNQl1HFjyhtP8wfSAEde-WzfgMlu3ViRFH1MOARTDPD9aLdHiNYLd7fErcp4BlOkg_5YymSVLJcLTwo4GQJMgTY',
    category: 'Edukasi',
    content:
        'Menjaga hidrasi di cuaca terik saat ini sangat krusial bagi metabolisme tubuh. Jangan lupa untuk meminum setidaknya 2 liter air putih setiap hari untuk menjaga konsentrasi dan stamina Anda tetap prima. Mari kita mulai kebiasaan sehat hari ini! 🌿💧',
    imageUrl:
        'https://lh3.googleusercontent.com/aida-public/AB6AXuA-UI7ZF43dzrYEELGODvlf-whvn8kzeKkaKVmphKbZ5mQ_rUIP0Kc5ia4tPgXlQ-ir3rQz6Y0PZlDhvCjbzJsp7kJWynUG5S1cRzrQwHjGNUyHV8YA4Nccd_PP_dFoYtvzQpOlDaLV0KxzEG9AhvgQO79moNA43tirhUN1EHZOoP8qdhgiQ7o2gJtBln3NZ6NAc7WDtEQwConoCU2f6TOj4oUMEgAvZ05UpCBDmCLxxL5Fn8d3wUDQUwVxd1fwbVYqZtqJAjzneJ0',
    timestamp: '2 jam yang lalu',
    likeCount: 124,
    commentCount: 2,
    isLiked: true,
  );

  void _onLikePost() {
    setState(() {
      if (_isLiked) {
        _isLiked = false;
        _likeCount--;
      } else {
        _isLiked = true;
        _likeCount++;
      }
    });
  }

  void _onLikeComment(String commentId) {
    setState(() {
      final index = _comments.indexWhere((c) => c.id == commentId);
      if (index != -1) {
        final comment = _comments[index];
        if (comment.isLiked) {
          _comments[index] = comment.copyWith(
            isLiked: false,
            likeCount: comment.likeCount - 1,
          );
        } else {
          _comments[index] = comment.copyWith(
            isLiked: true,
            likeCount: comment.likeCount + 1,
          );
        }
      }
    });
  }

  void _onReplyToComment(String commentId, String userName) {
    _commentController.text = '@$userName ';
    _commentFocusNode.requestFocus();
  }

  void _onSendComment() {
    if (_commentController.text.trim().isEmpty) return;

    setState(() {
      _comments.insert(
        0,
        CommentModel(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          userName: 'Anda',
          userAvatar: null,
          initials: 'AN',
          content: _commentController.text,
          timestamp: 'Baru saja',
          likeCount: 0,
          isLiked: false,
          replyCount: 0,
        ),
      );
      _commentController.clear();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Komentar berhasil dikirim'),
        backgroundColor: Color(0xFF0D631B),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _onShare() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Fitur share sedang dalam pengembangan')),
    );
  }

  void _onBack() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FBF0),
      body: Column(
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
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: _onBack,
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.transparent,
                            ),
                            child: const Icon(
                              Icons.arrow_back,
                              size: 24,
                              color: Color(0xFF181D17),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Postingan',
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
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_vert,
                          size: 24,
                          color: Color(0xFF181D17),
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Main Content (Scrollable)
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
              child: Column(
                children: [
                  // Post Card
                  _buildPostCard(),
                  const SizedBox(height: 16),
                  // Comments Section Header
                  Row(
                    children: [
                      Text(
                        'Komentar',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF181D17),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFC9E7CA),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          '${_comments.length}',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF4E6952),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Comments List
                  ..._comments.map((comment) => _buildCommentCard(comment)),
                ],
              ),
            ),
          ),
          // Bottom Input Field
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: const Color(0xFFE0E4DA))),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 12,
                  offset: const Offset(0, -4),
                ),
              ],
            ),
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
                child: Row(
                  children: [
                    // User Avatar
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFFF1F5EB),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.person_outline,
                          size: 20,
                          color: Color(0xFF707A6C),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Comment Input
                    Expanded(
                      child: TextField(
                        controller: _commentController,
                        focusNode: _commentFocusNode,
                        decoration: InputDecoration(
                          hintText: 'Tulis komentar...',
                          hintStyle: const TextStyle(color: Color(0xFF707A6C)),
                          filled: true,
                          fillColor: const Color(0xFFF1F5EB),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Send Button
                    GestureDetector(
                      onTap: _onSendComment,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0D631B),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Text(
                          'Kirim',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPostCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage(_post.userAvatar),
                backgroundColor: const Color(0xFFE0E4DA),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _post.userName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF181D17),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${_post.timestamp} • ${_post.category}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF707A6C),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Content
          Text(
            _post.content,
            style: const TextStyle(
              fontSize: 16,
              height: 1.5,
              color: Color(0xFF181D17),
            ),
          ),
          const SizedBox(height: 16),
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              _post.imageUrl,
              height: 256,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 256,
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
          const SizedBox(height: 16),
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
                    onTap: _onLikePost,
                    child: Row(
                      children: [
                        Icon(
                          _isLiked ? Icons.favorite : Icons.favorite_border,
                          size: 20,
                          color: _isLiked
                              ? const Color(0xFFBA1A1A)
                              : const Color(0xFF0D631B),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '$_likeCount',
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
                  Row(
                    children: [
                      const Icon(
                        Icons.chat_bubble_outline,
                        size: 20,
                        color: Color(0xFF707A6C),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '${_comments.length}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF707A6C),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // Share Button
              GestureDetector(
                onTap: _onShare,
                child: const Icon(
                  Icons.share,
                  size: 20,
                  color: Color(0xFF707A6C),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCommentCard(CommentModel comment) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar
          CircleAvatar(
            radius: 20,
            backgroundImage: comment.userAvatar != null
                ? NetworkImage(comment.userAvatar!)
                : null,
            backgroundColor: const Color(0xFFC9E7CA),
            child: comment.userAvatar == null && comment.initials != null
                ? Text(
                    comment.initials!,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4E6952),
                    ),
                  )
                : null,
          ),
          const SizedBox(width: 12),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      comment.userName,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF181D17),
                      ),
                    ),
                    Text(
                      comment.timestamp,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF707A6C),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  comment.content,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF40493D),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () =>
                          _onReplyToComment(comment.id, comment.userName),
                      child: const Text(
                        'Balas',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0D631B),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    GestureDetector(
                      onTap: () => _onLikeComment(comment.id),
                      child: Row(
                        children: [
                          Icon(
                            comment.isLiked
                                ? Icons.thumb_up
                                : Icons.thumb_up_outlined,
                            size: 14,
                            color: comment.isLiked
                                ? const Color(0xFF0D631B)
                                : const Color(0xFF707A6C),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${comment.likeCount}',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: comment.isLiked
                                  ? const Color(0xFF0D631B)
                                  : const Color(0xFF707A6C),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Post Model
class PostModel {
  final String id;
  final String userName;
  final String userAvatar;
  final String category;
  final String content;
  final String imageUrl;
  final String timestamp;
  final int likeCount;
  final int commentCount;
  final bool isLiked;

  PostModel({
    required this.id,
    required this.userName,
    required this.userAvatar,
    required this.category,
    required this.content,
    required this.imageUrl,
    required this.timestamp,
    required this.likeCount,
    required this.commentCount,
    required this.isLiked,
  });
}

// Comment Model
class CommentModel {
  final String id;
  final String userName;
  final String? userAvatar;
  final String? initials;
  final String content;
  final String timestamp;
  final int likeCount;
  final bool isLiked;
  final int replyCount;

  CommentModel({
    required this.id,
    required this.userName,
    this.userAvatar,
    this.initials,
    required this.content,
    required this.timestamp,
    required this.likeCount,
    required this.isLiked,
    required this.replyCount,
  });

  CommentModel copyWith({
    String? id,
    String? userName,
    String? userAvatar,
    String? initials,
    String? content,
    String? timestamp,
    int? likeCount,
    bool? isLiked,
    int? replyCount,
  }) {
    return CommentModel(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      userAvatar: userAvatar ?? this.userAvatar,
      initials: initials ?? this.initials,
      content: content ?? this.content,
      timestamp: timestamp ?? this.timestamp,
      likeCount: likeCount ?? this.likeCount,
      isLiked: isLiked ?? this.isLiked,
      replyCount: replyCount ?? this.replyCount,
    );
  }
}
