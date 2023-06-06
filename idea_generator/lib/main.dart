import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(IdeaGeneratorApp());
}

/* Main widget for the app rendering */
class IdeaGeneratorApp extends StatelessWidget {
  const IdeaGeneratorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'La mejor app de la historia',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

/* This things works as a context provider for all the widgets */
class AppState extends ChangeNotifier {
  var current = WordPair.random(); // Get the current pair of words generated
  var favorites = <WordPair>[];
  var history = <WordPair>[];

  GlobalKey? historyListKey; // Identifies the history list

  void generatePair() {
    history.insert(0, current);
    var animatedList = historyListKey?.currentState as AnimatedListState?;
    animatedList?.insertItem(0); // Insert the pair at the start of the list
    current = WordPair.random();
    notifyListeners();
  }

  void toggleFavorite([WordPair? pair]) {
    pair = pair ?? current; // If no pair is provided, use the current one
    if (favorites.contains(pair)) {
      favorites.remove(pair); // If the pair is already a favorite, remove it
    } else {
      favorites.add(pair); // If the pair is not a favorite, add it
    }
    notifyListeners();
  }

  void deleteFavorite(WordPair pair) {
    favorites.remove(pair);
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    String pageName;

    final theme = Theme.of(context);

    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
        pageName = "Generador de ideas";
        break;
      case 1:
        page = FavoritesPage();
        pageName = "Favoritos";
        break;
      default:
        throw Exception('Invalid index: $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          title: Text(pageName),
          backgroundColor: Theme.of(context).colorScheme.primary,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 24),
        ),
        body: Row(children: [
          SafeArea(
              child: NavigationRail(
            extended: constraints.maxWidth >=
                768, // NavigationRailDestination labels are displayed when the screen is wider than 768px
            selectedIndex: selectedIndex,
            destinations: [
              NavigationRailDestination(
                  icon: Icon(Icons.home_outlined), label: Text('Inicio')),
              NavigationRailDestination(
                  icon: Icon(Icons.favorite_outline), label: Text('Favoritos'))
            ],
            selectedLabelTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onBackground),
            unselectedLabelTextStyle: TextStyle(
                fontWeight: FontWeight.normal,
                color: theme.colorScheme.onBackground),
            onDestinationSelected: (value) =>
                setState(() => selectedIndex = value),
          )),
          Expanded(
              child: Container(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: page,
          ))
        ]),
      );
    });
  }
}

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    var pair = appState.current;
    IconData icon;
    String favIconLabel;

    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
      favIconLabel = "Eliminar de favoritos";
    } else {
      icon = Icons.favorite_border;
      favIconLabel = "Agregar a favoritos";
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(flex: 3, child: HistoryListView()),
          SizedBox(height: 20),
          RandomPair(pair: pair),
          SizedBox(height: 20),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: appState.generatePair,
                icon: Icon(Icons.refresh),
                color: Theme.of(context).colorScheme.primary,
              ),
              SizedBox(width: 20),
              IconButton(
                onPressed: appState.toggleFavorite,
                icon: Icon(icon, semanticLabel: favIconLabel),
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
          Spacer(flex: 2)
        ],
      ),
    );
  }
}

class RandomPair extends StatelessWidget {
  const RandomPair({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: AnimatedSize(
          duration: Duration(milliseconds: 200),
          child: Text(
            pair.asPascalCase,
            style: style,
            semanticsLabel: "${pair.first} ${pair.second}",
          ),
        ),
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    var favorites = appState.favorites;

    final theme = Theme.of(context);
    final emptyMessageStyle = theme.textTheme.displaySmall!
        .copyWith(color: Colors.black38, fontWeight: FontWeight.w700);

    if (favorites.isEmpty) {
      return Center(
        child: Text('Nada por aquí.', style: emptyMessageStyle),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              '${appState.favorites.length} favoritos encontrados:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            )),
        Expanded(
          child: GridView(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 400,
                childAspectRatio: 400 / 80,
                crossAxisSpacing: 80),
            children: [
              for (var pair in appState.favorites)
                ListTile(
                  title: Text(pair.asPascalCase),
                  trailing: IconButton(
                    onPressed: () {
                      appState.deleteFavorite(pair);
                    },
                    icon: Icon(Icons.delete_outline,
                        semanticLabel:
                            "Eliminar la idea ${pair.first} ${pair.second}"),
                    hoverColor: theme.colorScheme.primary.withOpacity(0.1),
                  ),
                )
            ],
          ),
        ),
      ],
    );
  }
}

class HistoryListView extends StatefulWidget {
  const HistoryListView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HistoryListViewState();
}

class _HistoryListViewState extends State<HistoryListView> {
  // This key is needeed to access the list from the app state, so that the app can tell the AnimatedList to animate new items.
  final _key = GlobalKey();

  // This gradient is used to create a fading effect when the list is scrolled.
  static const Gradient _maskingGradient = LinearGradient(
      colors: [Colors.transparent, Colors.black],
      stops: [0.0, 0.5],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    appState.historyListKey = _key;

    return ShaderMask(
        shaderCallback: (bounds) =>
            _maskingGradient.createShader(bounds), // Generates a shader
        blendMode:
            BlendMode.dstIn, // Applies the shader to the child (AnimatedList)
        child: AnimatedList(
            key: _key,
            reverse: true,
            padding: EdgeInsets.only(top: 20),
            initialItemCount: appState.history.length,
            itemBuilder: (context, index, animation) {
              final pair = appState.history[index];

              return SizeTransition(
                sizeFactor: animation,
                child: Center(
                    child: TextButton.icon(
                        onPressed: () {
                          appState.toggleFavorite(pair);
                        },
                        icon: appState.favorites.contains(pair)
                            ? Icon(Icons.favorite, size: 12)
                            : SizedBox(),
                        label: Text(pair.asPascalCase,
                            semanticsLabel: "${pair.first} ${pair.second}"))),
              );
            }));
  }
}
