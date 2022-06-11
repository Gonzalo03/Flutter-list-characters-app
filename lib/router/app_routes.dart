import 'package:gotobun_app/screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static final routes = {
    'home': (context) => const HomeScreen(),
    'character': (context) => const CharacterDetailScreen(),
  };
}
