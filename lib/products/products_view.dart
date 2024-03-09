import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import '../drawer/my_drawer.dart';

class ProductsHome extends StatelessWidget {
  const ProductsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: Center(
          child: Text(
            'Jewelry     ',
            style: GoogleFonts.cairo(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.amber,
              letterSpacing: 3.0,
            ),
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection("products").snapshots(),
            builder: (context, snapshots) {
              if (snapshots.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshots.data!.docs.length,
                  itemBuilder: (context, index) {
                    final product = snapshots.data!.docs[index];
                    FirebaseFirestore.instance
                        .collection("products")
                        .doc(product.id)
                        .collection("comments")
                        .get();
                    return WhisperPost(
                      message: product['product_name'],
                      producttId: product.id,
                      likes: List<String>.from(product['likes'] ?? []),
                      // commentCount:
                      //     List<String>.from(product['comments'] ?? []),
                      image: product['product_image'],
                    );
                  },
                );
              } else {
                if (snapshots.hasError) {
                  return Center(
                    child: Text("Error ${snapshots.error}"),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }
            },
          ),
        ),
      ),
    );
  }
}

class WhisperPost extends StatefulWidget {
  const WhisperPost({
    Key? key,
    required this.image,
    required this.message,
    required this.producttId,
    required this.likes,
    // required this.commentCount,
  }) : super(key: key);
  final String image;

  final String message;
  final String producttId;
  // final List<String> commentCount;
  final List<String> likes;
  @override
  State<WhisperPost> createState() => _WhisperPostState();
}

class _WhisperPostState extends State<WhisperPost> {
  var name = '';
  Future<void> getCurrentUserName() async {
    final currentUser = FirebaseAuth.instance.currentUser;

    DocumentSnapshot<Map<String, dynamic>> userSnapshot =
        await FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser!.email)
            .get();

    // التحقق مما إذا كانت البيانات متوفرة قبل استخدامها
    if (userSnapshot.data() != null) {
      // استخدام القيمة "name" إذا كانت متاحة، وإلا فالقيمة الافتراضية
      name = userSnapshot.data()!['name'] ?? 'No Name';
    } else {
      // قيمة افتراضية إذا لم تكن البيانات متوفرة
      name = 'No Name';
    }
  }

  final currentUser = FirebaseAuth.instance.currentUser!;
  bool isLiked = false;
  final commentTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getCurrentUserName();
    name;
    isLiked = widget.likes.contains(currentUser.email);
  }

  Future<void> toggleLike() async {
    setState(
      () {
        isLiked = !isLiked;
      },
    );

    DocumentReference docRef = FirebaseFirestore.instance
        .collection('products')
        .doc(widget.producttId);

    if (isLiked) {
      docRef.update({
        'likes': FieldValue.arrayUnion([currentUser.email])
      });
    } else {
      docRef.update(
        {
          'likes': FieldValue.arrayRemove([currentUser.email])
        },
      );
    }
  }

  void addComment(String commentText) {
    FirebaseFirestore.instance
        .collection("products")
        .doc(widget.producttId)
        .collection("comments")
        .add(
      {
        "comment_text": commentText,
        "commenter_id": currentUser.email,
        "commenter_name": name,
        "comment_time": Timestamp.now(),
      },
    );

    DocumentReference docRef = FirebaseFirestore.instance
        .collection('products')
        .doc(widget.producttId);

    if (isLiked) {
      docRef.update(
        {
          'comments': FieldValue.arrayUnion([currentUser.email])
        },
      );
    } else {
      docRef.update(
        {
          'comments': FieldValue.arrayRemove([currentUser.email])
        },
      );
    }
  }

  void showCommentDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Add a comment"),
        content: TextField(
          controller: commentTextController,
          decoration: const InputDecoration(
            hintText: "Join this discussion",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              commentTextController.clear();
            },
            child: const Text(
              "C A N C E L",
              style: TextStyle(
                color: Colors.redAccent,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              addComment(commentTextController.text);
              commentTextController.clear();
              Navigator.pop(context);
            },
            child: const Text(
              "S U B M I T",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Card(
        margin: const EdgeInsets.all(5.0),
        elevation: 2.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.network(
                  width: double.infinity,
                  widget.image,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                widget.message,
                textAlign: TextAlign.right,
                overflow: TextOverflow.visible,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    " ${widget.likes.length}  اعجاب ",
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFFA2ACAC),
                    ),
                  ),
                  const SizedBox(width: 6),
                  // Text(
                  //   " ${widget.commentCount.length}  تعليقا ",
                  //   style: const TextStyle(
                  //     fontSize: 13,
                  //     color: Color(0xFFA2ACAC),
                  //   ),
                  // ),
                  const SizedBox(width: 10),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(right: 30, left: 30, top: 5),
                child: Divider(
                  height: 1,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 30),
                  GestureDetector(
                    child: Row(
                      children: [
                        LikeButton(
                          isLiked: isLiked,
                          onTap: toggleLike,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  CommentButton(
                    onTap: showCommentDialog,
                  ),
                  const SizedBox(width: 5),
                ],
              ),
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("products")
                    .doc(widget.producttId)
                    .collection("comments")
                    .orderBy("comment_time", descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: snapshot.data!.docs.map(
                      (doc) {
                        final commentData = doc.data() as Map<String, dynamic>;
                        return Comment(
                          user: commentData['commenter_id'],
                          userName: commentData['commenter_name'],
                          text: commentData['comment_text'],
                          time: formatTime(commentData['comment_time']),
                        );
                      },
                    ).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LikeButton extends StatelessWidget {
  const LikeButton({super.key, required this.isLiked, this.onTap});
  final bool isLiked;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          const Text(
            "اعجبني",
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFFA2ACAC),
            ),
          ),
          Icon(
            isLiked ? CupertinoIcons.heart_fill : CupertinoIcons.heart_fill,
            color: isLiked ? Colors.red : Colors.grey,
          ),
        ],
      ),
    );
  }
}

class CommentButton extends StatelessWidget {
  final void Function()? onTap;
  const CommentButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const Row(
        children: [
          Text(
            "تعليق",
            style: TextStyle(
              fontSize: 13,
              color: Colors.black,
            ),
          ),
          Icon(
            Icons.chat_bubble_outlined,
            color: Color(0xff004252),
          ),
        ],
      ),
    );
  }
}

class Comment extends StatelessWidget {
  final String text;
  final String user;
  final String time;
  final String userName;
  const Comment(
      {super.key,
      required this.text,
      required this.user,
      required this.time,
      required this.userName});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffeeeeee),
        borderRadius: BorderRadius.circular(4),
      ),
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                userName,
                style: const TextStyle(color: Color(0xff004252)),
              ),
              const Text(
                " • ",
                style: TextStyle(color: Color(0xff004252)),
              ),
              Text(
                time,
                style: const TextStyle(color: Color(0xff004252), fontSize: 10),
              ),
            ],
          ),
          Text(
            text,
            style: const TextStyle(color: CupertinoColors.black),
          ),
        ],
      ),
    );
  }
}

String formatTime(Timestamp timestamp) {
  DateTime dateTime = timestamp.toDate();

  String year = dateTime.year.toString();

  String month = dateTime.month.toString();

  String day = dateTime.day.toString();

  String formattedDate = "$day/$month/$year";

  return formattedDate;
}
