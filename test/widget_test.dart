// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:instagram_clone/features/presentation/page/home/home_page.dart';
import 'package:instagram_clone/features/presentation/page/main_screen/main_screen.dart';
import 'package:instagram_clone/features/presentation/page/post/upload_post_page.dart';
import 'package:instagram_clone/features/presentation/page/profile/profile_page.dart';
import 'package:instagram_clone/features/presentation/page/reels/reels_page.dart';
import 'package:instagram_clone/features/presentation/page/search/search_page.dart';
import 'package:instagram_clone/features/presentation/widgets/form_container_widget.dart';

import 'package:instagram_clone/main.dart';
import 'package:line_icons/line_icons.dart';

void main() {
  testWidgets('Test text box widget', (WidgetTester tester) async {
    // Construieste widget-ul de text box
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Form(
          child: FormContainerWidget(
            hintText: "Email",
          ),
        ),
      ),
    ));
    //emulăm o apăsare pe widget, pentru a pune cursorul în interiorul text box-ului.
    await tester.tap(find.byType(TextFormField));
    await tester.pumpAndSettle();

    // se introduce textul
    await tester.enterText(find.byType(TextFormField), 'example@mail.com');
    await tester.pumpAndSettle();

    // se verifica
    expect(find.text('example@mail.com'), findsOneWidget);
  });

  testWidgets('Test navigation between pages', (WidgetTester tester) async {
    // Construim widget-ul
    await tester.pumpWidget(MaterialApp(home: MainScreen()));

    // Verificăm dacă se afișează pagina principală
    expect(find.byType(HomePage), findsOneWidget);
    expect(find.byType(SearchPage), findsNothing);
    expect(find.byType(UploadPostPage), findsNothing);
    expect(find.byType(ReelsPage), findsNothing);
    expect(find.byType(ProfilePage), findsNothing);

    // Navigăm la pagina de căutare
    await tester.tap(find.byIcon(LineIcons.search));
    await tester.pumpAndSettle();

    // Verificăm dacă se afișează pagina de căutare
    expect(find.byType(HomePage), findsNothing);
    expect(find.byType(SearchPage), findsOneWidget);
    expect(find.byType(UploadPostPage), findsNothing);
    expect(find.byType(ReelsPage), findsNothing);
    expect(find.byType(ProfilePage), findsNothing);

    // Navigăm la pagina de încărcare a postării
    await tester.tap(find.byIcon(LineIcons.plusSquare));
    await tester.pumpAndSettle();

    // Verificăm dacă se afișează pagina de încărcare a postării
    expect(find.byType(HomePage), findsNothing);
    expect(find.byType(SearchPage), findsNothing);
    expect(find.byType(UploadPostPage), findsOneWidget);
    expect(find.byType(ReelsPage), findsNothing);
    expect(find.byType(ProfilePage), findsNothing);

    // Navigăm la pagina Reels
    await tester.tap(find.byIcon(LineIcons.playCircleAlt));
    await tester.pumpAndSettle();

    // Verificăm dacă se afișează pagina Reels
    expect(find.byType(HomePage), findsNothing);
    expect(find.byType(SearchPage), findsNothing);
    expect(find.byType(UploadPostPage), findsNothing);
    expect(find.byType(ReelsPage), findsOneWidget);
    expect(find.byType(ProfilePage), findsNothing);

    // Navigăm la pagina profilului
    await tester.tap(find.byIcon(LineIcons.userCircle));
    await tester.pumpAndSettle();

    // Verificăm dacă se afișează pagina profilului
    expect(find.byType(HomePage), findsNothing);
    expect(find.byType(SearchPage), findsNothing);
    expect(find.byType(UploadPostPage), findsNothing);
    expect(find.byType(ReelsPage), findsNothing);
    expect(find.byType(ProfilePage), findsOneWidget);
  });
}
