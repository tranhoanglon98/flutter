import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'post.dart';
import 'friend.dart';

void main() {
  runApp(const BasicLayoutApp());
}

class BasicLayoutApp extends StatelessWidget {
  const BasicLayoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppData(),
      child: MaterialApp(
        title: 'Basic layout App',
        theme: ThemeData(primaryColor: Colors.blue),
        home: const FaceBookApp(),
      ),
    );
  }
}

class AppData extends ChangeNotifier {
  final Map<String, Icon> naviagionItems = {
    'Avatar': const Icon(Icons.face),
    'News Feed': const Icon(Icons.newspaper),
    'Messenger': const Icon(Icons.message),
    'Saved': const Icon(Icons.flag),
    'Watch': const Icon(Icons.tv),
    'Marketplace': const Icon(Icons.shopping_bag),
    'Group': const Icon(Icons.group),
    'Events': const Icon(Icons.event),
    'Game': const Icon(Icons.gamepad)
  };

  final List<Friend> friendList = [
    Friend('Trần Văn A', 'images/posts/1.jpg', true),
    Friend('Trần Văn B', 'images/posts/2.jpg', false),
    Friend('Trần Văn C', 'images/posts/3.jpg', false),
    Friend('Trần Văn D', 'images/posts/4.jpg', true),
    Friend('Trần Văn E', 'images/posts/5.jpg', true),
    Friend('Trần Văn F', 'images/stories/1.jpg', false),
    Friend('Trần Văn G', 'images/stories/3.jpg', true),
    Friend('Trần Văn H', 'images/stories/4.jpg', true),
    Friend('Trần Văn I', 'images/stories/0.jpg', false),
    Friend('Trần Văn K', 'images/stories/7.jpg', true),
    Friend('Trần Văn L', 'images/posts/1.jpg', true),
    Friend('Trần Văn M', 'images/posts/4.jpg', false),
    Friend('Trần Văn N', 'images/posts/2.jpg', true),
    Friend('Trần Văn O', 'images/stories/6.jpg', true),
    Friend('Trần Văn P', 'images/posts/5.jpg', true),
    Friend('Trần Văn Q', 'images/stories/1.jpg', false),
  ];

  final List<Post> posts = [
    Post(
        'Trần Văn A',
        'images/stories/0.jpg',
        30,
        'Flutter is an open-source UI software development kit created by Google, used to build natively compiled applications for mobile, web, and desktop from a single codebase.',
        'images/posts/1.jpg',
        false),
    Post(
        'Trần Văn B',
        'images/stories/1.jpg',
        4,
        'Flutter is an open-source UI software development kit created by Google, used to build natively compiled applications for mobile, web, and desktop from a single codebase.',
        'images/posts/2.jpg',
        false),
    Post(
        'Trần Văn C',
        'images/stories/2.jpg',
        23,
        'Flutter is an open-source UI software development kit created by Google, used to build natively compiled applications for mobile, web, and desktop from a single codebase.',
        'images/posts/3.jpg',
        true),
    Post(
        'Trần Văn D',
        'images/stories/3.jpg',
        15,
        'Flutter is an open-source UI software development kit created by Google, used to build natively compiled applications for mobile, web, and desktop from a single codebase.',
        'images/posts/4.jpg',
        false),
    Post(
        'Trần Văn E',
        'images/stories/4.jpg',
        99,
        'Flutter is an open-source UI software development kit created by Google, used to build natively compiled applications for mobile, web, and desktop from a single codebase.',
        'images/posts/5.jpg',
        true),
  ];
}

class FaceBookApp extends StatelessWidget {
  const FaceBookApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 10,
          title: MediaQuery.of(context).size.width < 390
              ? null
              : Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.facebook),
                      onPressed: () {},
                      iconSize: 35,
                    ),
                    MediaQuery.of(context).size.width < 480
                        ? const Text('')
                        : const Text('FaceBook')
                  ],
                ),
          leading: MediaQuery.of(context).size.width < 550
              ? Builder(
                  builder: (appbarContext) => IconButton(
                      icon: const Icon(Icons.menu),
                      tooltip: 'Menu',
                      onPressed: () {
                        Scaffold.of(appbarContext).openDrawer();
                      }))
              : null,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.home),
              tooltip: 'Home',
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.group),
              tooltip: 'Group',
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
              tooltip: 'Notifications',
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.message),
              tooltip: 'Message',
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.info_rounded),
              tooltip: 'Infomation',
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_drop_down),
              tooltip: 'More',
            )
          ],
        ),
        drawer: MediaQuery.of(context).size.width < 550
            ? Drawer(
                backgroundColor: Theme.of(context).primaryColor,
                width: MediaQuery.of(context).size.width * 0.7,
                elevation: 30,
                child: const NavigationListView(),
              )
            : null,
        body: const PageBody(),
      ),
    );
  }
}

class NavigationListView extends StatelessWidget {
  const NavigationListView({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, Icon> naviagionItems = context.read<AppData>().naviagionItems;
    return ListView(
      padding: const EdgeInsets.only(top: 10),
      children: [
        for (var entry in naviagionItems.entries)
          Container(
            margin: const EdgeInsets.all(7),
            child: ElevatedButton.icon(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.all(18.0)),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    iconColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor),
                    alignment: Alignment.centerLeft),
                onPressed: () {},
                icon: entry.value,
                label: Text(
                  entry.key,
                  style: TextStyle(color: Theme.of(context).primaryColor),
                )),
          )
      ],
    );
  }
}

class PageBody extends StatelessWidget {
  const PageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double navigationBarWidth = MediaQuery.of(context).size.width * 0.35;
    navigationBarWidth = navigationBarWidth > 250 ? 250 : navigationBarWidth;
    return Container(
      child: MediaQuery.of(context).size.width < 550
          ? Container(
              color: Colors.white,
              child: const NewsFeed(),
            )
          : MediaQuery.of(context).size.width < 950
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: navigationBarWidth,
                      color: const Color.fromARGB(255, 200, 231, 236),
                      child: const NavigationListView(),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width -
                          navigationBarWidth,
                      color: Colors.white,
                      child: const NewsFeed(),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: navigationBarWidth,
                      color: const Color.fromARGB(255, 235, 235, 235),
                      child: const NavigationListView(),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width < 1100
                          ? MediaQuery.of(context).size.width -
                              2 * navigationBarWidth
                          : 600,
                      color: Colors.white,
                      child: const NewsFeed(),
                    ),
                    Container(
                      width: navigationBarWidth,
                      color: const Color.fromARGB(255, 235, 235, 235),
                      child: const FriendList(),
                    )
                  ],
                ),
    );
  }
}

class FriendList extends StatelessWidget {
  const FriendList({super.key});

  @override
  Widget build(BuildContext context) {
    List<Friend> friends = context.read<AppData>().friendList;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Friends',
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ListView.builder(
                itemCount: friends.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircleAvatar(
                              backgroundImage:
                                  NetworkImage(friends[index].avatarImgPath),
                              radius: 18),
                          SizedBox(
                              width: 100,
                              child: Text(
                                friends[index].name,
                                style: const TextStyle(color: Colors.blue),
                              )),
                          Icon(
                            Icons.circle,
                            size: 10,
                            color: friends[index].status
                                ? const Color.fromARGB(255, 33, 226, 40)
                                : const Color.fromARGB(255, 166, 167, 166),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NewsFeed extends StatelessWidget {
  const NewsFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MediaQuery.of(context).size.width < 950
          ? Stack(
              children: [
                Center(
                  child: ListView(
                    children: const [
                      NewPost(),
                      Stories(),
                      Posts(),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: FloatingActionButton(
                    onPressed: () {},
                    child: const Icon(Icons.message),
                  ),
                )
              ],
            )
          : ListView(
              children: const [
                NewPost(),
                Stories(),
                Posts(),
              ],
            ),
    );
  }
}

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  @override
  Widget build(BuildContext context) {
    List<Post> posts = context.read<AppData>().posts;
    void like(Post p) {
      setState(() {
        var index = posts.indexOf(p);
        posts[index].likes =
            p.liked ? posts[index].likes - 1 : posts[index].likes + 1;
        posts[index].liked = !p.liked;
      });
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            for (var p in posts)
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(p.avatarPath),
                            radius: 20,
                          ),
                          Positioned(left: 45, top: 10, child: Text(p.name)),
                          const Positioned(
                              right: 0, child: Icon(Icons.more_horiz))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(p.content),
                    ),
                    Image(
                      image: AssetImage(p.imgPath),
                      height: 400,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          const Icon(
                            Icons.thumb_up,
                            color: Colors.blue,
                            size: 20,
                          ),
                          const Positioned(
                              left: 20,
                              child: Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 20,
                              )),
                          Positioned(
                              left: 40,
                              child: Text(
                                p.likes.toString(),
                                style: const TextStyle(fontSize: 15),
                              )),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                      thickness: 1,
                      height: 20,
                      indent: 10,
                      endIndent: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 255, 255, 255)),
                            onPressed: () {
                              like(p);
                            },
                            icon: p.liked
                                ? const Icon(
                                    Icons.thumb_up_alt,
                                    color: Colors.blue,
                                  )
                                : const Icon(
                                    Icons.thumb_up_alt_outlined,
                                    color: Colors.blue,
                                  ),
                            label: const Text(
                              'Like',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 255, 255, 255)),
                            onPressed: () {},
                            icon: const Icon(
                              Icons.insert_comment,
                              color: Colors.blue,
                            ),
                            label: const Text(
                              'Comment',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 255, 255, 255)),
                            onPressed: () {},
                            icon: const Icon(
                              Icons.share,
                              color: Colors.blue,
                            ),
                            label: const Text(
                              'Share',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
          ].map((child) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: child,
            );
          }).toList(),
        ),
      ),
    );
  }
}

class Stories extends StatelessWidget {
  const Stories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 300,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Stories',
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.fromLTRB(0, 5, 10, 10),
                      child: Stack(children: [
                        Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image(
                              image: AssetImage('images/stories/$index.jpg'),
                              height: 220,
                              width: 140,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          left: 10,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.blue, width: 3),
                            ),
                            child: const CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://th.bing.com/th/id/R.711530bb80c16506a9587182c0987996?rik=7bQLMBGpfBKFQQ&pid=ImgRaw&r=0'),
                                radius: 18),
                          ),
                        )
                      ]),
                    );
                  },
                  itemCount: 8,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ],
          ),
        ));
  }
}

class NewPost extends StatelessWidget {
  const NewPost({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: Card(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        color: const Color.fromARGB(255, 255, 255, 255),
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
          child: Column(
            children: [
              const Text(
                'Create post',
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'What\'s in your mind?',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: MediaQuery.of(context).size.width > 580
                          ? ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.camera_alt,
                              ),
                              label: const Text('Camera'),
                            )
                          : IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.camera_alt),
                              color: Colors.blue),
                    ),
                    MediaQuery.of(context).size.width > 580
                        ? ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.photo_camera_front,
                            ),
                            label: const Text('Live'),
                          )
                        : IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.photo_camera_front),
                            color: Colors.blue),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.emoji_emotions),
                        color: Colors.blue),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.photo_size_select_actual),
                      color: Colors.blue,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                        color: Colors.blue),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
