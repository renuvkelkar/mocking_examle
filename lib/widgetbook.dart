import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocking_examle/home.dart';
import 'package:mocking_examle/item_provider.dart';
import 'package:widgetbook/widgetbook.dart';

void main() {
  runApp(const WidgetbookApp());
}

class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp();

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      addons: [
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(
              name: 'Light',
              data: ThemeData.light(),
            ),
          ],
        ),
      ],
      directories: [
        WidgetbookComponent(
          name: 'Item Tile',
          useCases: [
            WidgetbookUseCase(
              name: 'Default',
              builder: (context) {
                return const ItemTile(
                  title: 'Item 1',
                );
              },
            ),
          ],
        ),
        WidgetbookComponent(
          name: 'Home Page',
          useCases: [
            WidgetbookUseCase(
              name: 'Default',
              builder: (context) {
                return ProviderScope(
                  overrides: [
                    itemProvider.overrideWith(
                      (ref) => MockItemProvider(),
                    ),
                  ],
                  child: const HomePage(),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}

class MockItemProvider extends ItemNotifier {
  List<String> get items => ['Mocked Item 1', 'Mocked Item 2'];
}

class ItemTile extends StatelessWidget {
  const ItemTile({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      tileColor: Colors.yellow,
    );
  }
}
