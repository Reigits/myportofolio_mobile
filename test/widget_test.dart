import 'package:material_ui/material_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:myportofolio_mobile/main.dart';
import 'package:myportofolio_mobile/services/api_client.dart';

void main() {
  testWidgets('App renders home screen smoke test', (
    WidgetTester tester,
  ) async {
    final mockHttpClient = MockClient((request) async {
      return http.Response('[]', 200);
    });
    final apiClient = ApiClient(client: mockHttpClient);

    await tester.pumpWidget(MyApp(apiClient: apiClient));
    await tester.pumpAndSettle();

    expect(find.byType(Scaffold), findsOneWidget);
  });
}
