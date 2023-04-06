import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My First App',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const MyPage(),
    );
  }
}

class AppState extends ChangeNotifier {
  var word = WordPair.random();
  var favoriteList = <WordPair>[];
  var _icon = const Icon(Icons.favorite_border);
  void changeWord() {
    word = WordPair.random();
    if (!favoriteList.contains(word)) {
      _icon = const Icon(Icons.favorite_border);
    }
    ;
    notifyListeners();
  }

  void isFavorite() {
    if (favoriteList.contains(word)) {
      favoriteList.remove(word);
      _icon = const Icon(Icons.favorite_border);
    } else {
      favoriteList.add(word);
      _icon = const Icon(Icons.favorite);
    }
    notifyListeners();
  }

  void dislike(WordPair pair) {
    favoriteList.remove(pair);
    if (word == pair) {
      _icon = const Icon(Icons.favorite_border);
    }
    notifyListeners();
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<StatefulWidget> createState() => MyPageState();
}

class MyPageState extends State<MyPage> {
  int selectedIndex = 0;
  Widget page = HomePage();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Random Word App'),
            backgroundColor: Colors.green,
          ),
          body: Row(
            children: [
              SafeArea(
                  child: NavigationRail(
                extended: false,
                destinations: const [
                  NavigationRailDestination(
                      icon: Icon(Icons.home), label: Text('Home')),
                  NavigationRailDestination(
                      icon: Icon(Icons.favorite), label: Text('Favorite')),
                ],
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
                    page = selectedIndex == 0 ? HomePage() : FavoritePage();
                  });
                },
              )),
              Expanded(
                  child: Container(
                color: Colors.green[300],
                child: page,
              ))
            ],
          )),
    );
  }
}

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    if (appState.favoriteList.length == 0) {
      return Center(
        child: Text('No favorites yet'),
      );
    }
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (var word in appState.favoriteList)
            ElevatedButton.icon(
              onPressed: () {
                appState.dislike(word);
              },
              label: Text(word.asPascalCase),
              icon: Icon(Icons.favorite),
            )
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    var word = appState.word;
    var icon = appState._icon;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(word.asPascalCase),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: appState.isFavorite,
                label: const Text('like'),
                icon: icon,
              ),
              ElevatedButton(
                  onPressed: appState.changeWord, child: const Text('Random'))
            ],
          )
        ],
      ),
    );
  }
}
